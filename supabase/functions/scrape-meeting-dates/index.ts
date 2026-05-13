import { serve } from "https://deno.land/std@0.177.0/http/server.ts";

const ANTHROPIC_API_KEY = Deno.env.get("ANTHROPIC_API_KEY");

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Headers": "authorization, x-client-info, apikey, content-type",
};

interface MeetingInput {
  id: string;
  name: string;
  source_url: string;
}

interface ScrapedResult {
  id: string;
  name: string;
  meetings: Array<{
    meeting_name: string;
    start_date: string | null;
    end_date: string | null;
    city: string | null;
    state_country: string | null;
  }>;
  status: "found" | "not_found" | "error";
  error?: string;
}

const EVENT_KEYWORDS = /event|conference|meeting|annual|summit|congress|symposium|expo/i;
const STANDARD_SUBPATHS = ["/events", "/conferences", "/meetings", "/education/events"];
const BROWSER_UA = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36";

async function fetchPage(url: string): Promise<{ html: string; text: string } | null> {
  try {
    const resp = await fetch(url, {
      headers: { "User-Agent": BROWSER_UA, "Accept": "text/html,application/xhtml+xml" },
      redirect: "follow",
    });
    if (!resp.ok) return null;
    const html = await resp.text();
    const text = html
      .replace(/<script[\s\S]*?<\/script>/gi, "")
      .replace(/<style[\s\S]*?<\/style>/gi, "")
      .replace(/<[^>]+>/g, " ")
      .replace(/\s+/g, " ")
      .trim();
    return { html, text };
  } catch {
    return null;
  }
}

function extractEventLinks(html: string, baseUrl: string): string[] {
  const base = new URL(baseUrl);
  const linkRegex = /<a[^>]+href=["']([^"']+)["'][^>]*>([\s\S]*?)<\/a>/gi;
  const found = new Set<string>();
  let match;

  while ((match = linkRegex.exec(html)) !== null) {
    const href = match[1];
    const linkText = match[2].replace(/<[^>]+>/g, "").trim();

    // Check if link text or href contains event-related keywords
    if (EVENT_KEYWORDS.test(linkText) || EVENT_KEYWORDS.test(href)) {
      try {
        const resolved = new URL(href, baseUrl);
        // Only follow links on the same domain
        if (resolved.hostname === base.hostname || resolved.hostname.endsWith("." + base.hostname)) {
          found.add(resolved.href);
        }
      } catch {
        // Skip invalid URLs
      }
    }
  }

  return Array.from(found).slice(0, 3);
}

interface GatherResult {
  text: string;
  debug: { homepage_chars: number; event_links: string[]; subpaths_tried: string[]; pages_fetched: number; total_chars: number };
}

async function gatherEventText(sourceUrl: string): Promise<GatherResult> {
  // Step 1: Fetch homepage
  const homepage = await fetchPage(sourceUrl);
  if (!homepage) return { text: "", debug: { homepage_chars: 0, event_links: [], subpaths_tried: [], pages_fetched: 0, total_chars: 0 } };

  const texts: string[] = [homepage.text.slice(0, 2000)];

  // Step 2: Find event-related links from homepage HTML
  const eventLinks = extractEventLinks(homepage.html, sourceUrl);

  // Step 3: Also build standard subpath URLs as fallbacks
  const base = sourceUrl.replace(/\/+$/, "");
  const subpathUrls = STANDARD_SUBPATHS.map((p) => base + p);

  // Combine discovered links + standard subpaths, deduplicate
  const allUrls = new Set<string>([...eventLinks, ...subpathUrls]);
  allUrls.delete(sourceUrl);
  allUrls.delete(sourceUrl + "/");

  // Step 4: Fetch top event pages in parallel (max 4)
  const urlsToTry = Array.from(allUrls).slice(0, 4);
  const fetches = await Promise.allSettled(
    urlsToTry.map((url) => fetchPage(url))
  );

  let pagesFetched = 0;
  for (const result of fetches) {
    if (result.status === "fulfilled" && result.value) {
      texts.push(result.value.text.slice(0, 6000));
      pagesFetched++;
    }
  }

  const combined = texts.join("\n\n---\n\n").slice(0, 20000);
  return {
    text: combined,
    debug: {
      homepage_chars: homepage.text.length,
      event_links: eventLinks,
      subpaths_tried: urlsToTry,
      pages_fetched: pagesFetched,
      total_chars: combined.length,
    },
  };
}

async function extractDates(
  name: string,
  pageText: string
): Promise<{ extracted: Array<{ meeting_name: string; start_date: string; end_date: string; city: string; state_country: string }>; claudeRaw: string }> {
  if (!ANTHROPIC_API_KEY) throw new Error("ANTHROPIC_API_KEY not set");

  const resp = await fetch("https://api.anthropic.com/v1/messages", {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
      "x-api-key": ANTHROPIC_API_KEY,
      "anthropic-version": "2023-06-01",
    },
    body: JSON.stringify({
      model: "claude-haiku-4-5-20251001",
      max_tokens: 1024,
      messages: [
        {
          role: "user",
          content: `Extract ALL upcoming conferences, annual meetings, and events for "${name}" from this webpage text. Return ONLY valid JSON array (no markdown, no explanation):
[{"meeting_name":"Full Event Name","start_date":"YYYY-MM-DD","end_date":"YYYY-MM-DD","city":"CityName","state_country":"XX"}]

If multiple events exist (e.g. spring conference, annual meeting, leadership summit), include ALL of them.
If you cannot find any dates, return: []

Use 2-letter US state codes (TX, CA) or 2-letter country codes (DE, NL) for international events.

Webpage text:
${pageText}`,
        },
      ],
    }),
  });

  if (!resp.ok) {
    const err = await resp.text();
    throw new Error(`Claude API error: ${err}`);
  }

  const data = await resp.json();
  const text = data.content?.[0]?.text ?? "";
  console.log("Claude raw response:", text.slice(0, 500));
  try {
    // Strip markdown code fences if present
    const cleaned = text.replace(/^```(?:json)?\s*/i, "").replace(/\s*```$/i, "").trim();
    const parsed = JSON.parse(cleaned);
    if (!Array.isArray(parsed)) return { extracted: [], claudeRaw: text };
    return { extracted: parsed.filter((entry: Record<string, unknown>) => entry.start_date), claudeRaw: text };
  } catch (e) {
    console.log("JSON parse failed:", (e as Error).message, "Raw:", text.slice(0, 200));
    return { extracted: [], claudeRaw: text };
  }
}

serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { headers: corsHeaders });
  }

  try {
    const { meetings } = (await req.json()) as {
      meetings: MeetingInput[];
    };

    const results: ScrapedResult[] = [];

    for (const m of meetings) {
      try {
        const gathered = await gatherEventText(m.source_url);
        if (!gathered.text) {
          results.push({ id: m.id, name: m.name, meetings: [], status: "not_found", error: `No text gathered. Debug: ${JSON.stringify(gathered.debug)}` });
          continue;
        }
        const { extracted, claudeRaw } = await extractDates(m.name, gathered.text);
        if (extracted.length > 0) {
          results.push({ id: m.id, name: m.name, meetings: extracted, status: "found" });
        } else {
          results.push({ id: m.id, name: m.name, meetings: [], status: "not_found", error: `Claude returned: ${claudeRaw.slice(0, 300)}. Debug: ${JSON.stringify(gathered.debug)}` });
        }
      } catch (e) {
        results.push({
          id: m.id,
          name: m.name,
          meetings: [],
          status: "error",
          error: (e as Error).message,
        });
      }
      await new Promise((r) => setTimeout(r, 200));
    }

    return new Response(JSON.stringify({ results }), {
      headers: { ...corsHeaders, "Content-Type": "application/json" },
    });
  } catch (e) {
    return new Response(
      JSON.stringify({ error: (e as Error).message }),
      {
        status: 500,
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      }
    );
  }
});

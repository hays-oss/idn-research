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

async function fetchPageText(url: string): Promise<string> {
  try {
    const resp = await fetch(url, {
      headers: { "User-Agent": "IDNResearch-CalendarBot/1.0" },
      redirect: "follow",
    });
    if (!resp.ok) throw new Error(`HTTP ${resp.status}`);
    const html = await resp.text();
    return html
      .replace(/<script[\s\S]*?<\/script>/gi, "")
      .replace(/<style[\s\S]*?<\/style>/gi, "")
      .replace(/<[^>]+>/g, " ")
      .replace(/\s+/g, " ")
      .trim()
      .slice(0, 8000);
  } catch (e) {
    throw new Error(`Failed to fetch ${url}: ${(e as Error).message}`);
  }
}

async function extractDates(
  name: string,
  pageText: string
): Promise<Array<{ meeting_name: string; start_date: string; end_date: string; city: string; state_country: string }>> {
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
  try {
    const parsed = JSON.parse(text);
    if (!Array.isArray(parsed)) return [];
    return parsed.filter((entry: Record<string, unknown>) => entry.start_date);
  } catch {
    return [];
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
        const text = await fetchPageText(m.source_url);
        const extracted = await extractDates(m.name, text);
        if (extracted.length > 0) {
          results.push({
            id: m.id,
            name: m.name,
            meetings: extracted,
            status: "found",
          });
        } else {
          results.push({
            id: m.id,
            name: m.name,
            meetings: [],
            status: "not_found",
          });
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
      await new Promise((r) => setTimeout(r, 500));
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

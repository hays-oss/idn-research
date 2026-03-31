import { CategoryTaxonomy, TaxonomySubcategory } from "./types";

export interface ClassificationResult {
  suggestedSubcategoryId: number | null;
  confidence: number;
  matchedTags: { tagId: number; tagName: string; score: number }[];
  status: "ready" | "needs_review" | "no_match";
}

// Normalize company text: lowercase, strip legal suffixes, remove special chars
function normalizeText(text: string): string {
  return text
    .toLowerCase()
    .replace(
      /\b(inc|llc|corp|ltd|lp|plc|co|company|incorporated|corporation|limited|group|holdings)\b\.?/gi,
      ""
    )
    .replace(/[^a-z0-9\s]/g, " ")
    .replace(/\s+/g, " ")
    .trim();
}

// Domain fallback heuristics for company names
const DOMAIN_HINTS: { pattern: RegExp; domainKeyword: string }[] = [
  { pattern: /pharma|rx|drug/i, domainKeyword: "pharmacy" },
  { pattern: /diagnos|lab|pathol/i, domainKeyword: "diagnostics" },
  { pattern: /medical|surgical|device/i, domainKeyword: "medical devices" },
  { pattern: /imaging|radiol|mri|ct scan/i, domainKeyword: "imaging" },
  {
    pattern: /health\s?it|ehr|emr|software/i,
    domainKeyword: "digital health",
  },
  { pattern: /staffing|recruit|workforce/i, domainKeyword: "staffing" },
  { pattern: /consult|advisory/i, domainKeyword: "consulting" },
  { pattern: /insurance|payer|health\s?plan/i, domainKeyword: "payer" },
  { pattern: /supply|distribut|logistics/i, domainKeyword: "supply chain" },
  { pattern: /biotech|genomic|research/i, domainKeyword: "life sciences" },
];

export function classifyCompany(
  companyName: string,
  description: string | null,
  tags: CategoryTaxonomy[],
  subcategories: TaxonomySubcategory[]
): ClassificationResult {
  const nameNorm = normalizeText(companyName);
  const descNorm = description ? normalizeText(description) : "";
  const fullText = `${nameNorm} ${descNorm}`;

  const tagScores: Map<
    number,
    { tagId: number; tagName: string; score: number }
  > = new Map();

  for (const tag of tags) {
    if (!tag.is_active) continue;
    let score = 0;

    // Pass 1: keyword_rules_json matching
    const rules = tag.keyword_rules_json;
    if (rules && typeof rules === "object") {
      const keywords = Object.values(rules).flat();
      for (const kw of keywords) {
        if (typeof kw !== "string") continue;
        const kwLower = kw.toLowerCase();
        if (nameNorm.includes(kwLower)) score += 2;
        else if (descNorm.includes(kwLower)) score += 1;
      }
    }

    // Pass 2: synonyms_json matching (0.5x weight)
    const synonyms = tag.synonyms_json;
    if (Array.isArray(synonyms) && score === 0) {
      for (const syn of synonyms) {
        if (typeof syn !== "string") continue;
        const synLower = syn.toLowerCase();
        if (nameNorm.includes(synLower)) score += 1;
        else if (descNorm.includes(synLower)) score += 0.5;
      }
    }

    // Pass 3: tag name direct match (fallback)
    if (score === 0) {
      const tagNameLower = tag.level_3_tag.toLowerCase();
      if (fullText.includes(tagNameLower) && tagNameLower.length > 3) {
        score += 0.5;
      }
    }

    if (score > 0) {
      tagScores.set(tag.id, {
        tagId: tag.id,
        tagName: tag.level_3_tag,
        score,
      });
    }
  }

  // Group by subcategory, sum scores
  const subcategoryScores: Map<number, number> = new Map();
  for (const [, match] of tagScores) {
    const tag = tags.find((t) => t.id === match.tagId);
    if (!tag) continue;
    const current = subcategoryScores.get(tag.subcategory_id) || 0;
    subcategoryScores.set(tag.subcategory_id, current + match.score);
  }

  // Find best subcategory
  let bestSubcategoryId: number | null = null;
  let bestScore = 0;
  for (const [subId, score] of subcategoryScores) {
    if (score > bestScore) {
      bestScore = score;
      bestSubcategoryId = subId;
    }
  }

  // Domain fallback heuristics
  if (!bestSubcategoryId) {
    for (const hint of DOMAIN_HINTS) {
      if (hint.pattern.test(fullText)) {
        const matchingSub = subcategories.find((s) => {
          const domainName = tags.find(
            (t) => t.subcategory_id === s.id
          )?.level_1_category;
          return domainName?.toLowerCase().includes(hint.domainKeyword);
        });
        if (matchingSub) {
          bestSubcategoryId = matchingSub.id;
          bestScore = 0.3;
          break;
        }
      }
    }
  }

  // Normalize confidence to 0-1
  const maxPossibleScore = 10;
  const confidence = Math.min(bestScore / maxPossibleScore, 1);

  // Determine status
  let status: ClassificationResult["status"];
  if (confidence >= 0.7) status = "ready";
  else if (confidence >= 0.3) status = "needs_review";
  else status = "no_match";

  const matchedTags = Array.from(tagScores.values())
    .sort((a, b) => b.score - a.score)
    .slice(0, 10);

  return {
    suggestedSubcategoryId: bestSubcategoryId,
    confidence,
    matchedTags,
    status,
  };
}

// Batch classify an array of rows
export function classifyBatch(
  rows: { companyName: string; description: string | null }[],
  tags: CategoryTaxonomy[],
  subcategories: TaxonomySubcategory[]
): ClassificationResult[] {
  return rows.map((row) =>
    classifyCompany(row.companyName, row.description, tags, subcategories)
  );
}

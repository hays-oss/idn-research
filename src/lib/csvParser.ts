import Papa from "papaparse";

export interface ParsedCSV {
  headers: string[];
  rows: Record<string, string>[];
  rowCount: number;
  errors: Papa.ParseError[];
}

export function parseCSVFile(file: File): Promise<ParsedCSV> {
  return new Promise((resolve, reject) => {
    Papa.parse(file, {
      header: true,
      skipEmptyLines: true,
      transformHeader: (h: string) => h.trim(),
      complete: (results) => {
        resolve({
          headers: results.meta.fields || [],
          rows: results.data as Record<string, string>[],
          rowCount: results.data.length,
          errors: results.errors,
        });
      },
      error: (err: Error) => reject(err),
    });
  });
}

export function parseCSVText(text: string): ParsedCSV {
  const results = Papa.parse(text, {
    header: true,
    skipEmptyLines: true,
    transformHeader: (h: string) => h.trim(),
  });
  return {
    headers: results.meta.fields || [],
    rows: results.data as Record<string, string>[],
    rowCount: results.data.length,
    errors: results.errors,
  };
}

// Target database fields that can be mapped
export const MAPPABLE_FIELDS = [
  { key: "company_name", label: "Company Name", required: true },
  { key: "website", label: "Website" },
  { key: "linkedin_url", label: "LinkedIn URL" },
  { key: "description", label: "Description" },
  { key: "company_type", label: "Company Type" },
  { key: "headquarters_city", label: "HQ City" },
  { key: "headquarters_state", label: "HQ State" },
  { key: "primary_subcategory_id", label: "Primary Subcategory ID" },
  { key: "secondary_subcategory_id", label: "Secondary Subcategory ID" },
  { key: "notes", label: "Notes" },
] as const;

export type MappableFieldKey = (typeof MAPPABLE_FIELDS)[number]["key"];

// Auto-detect mapping from CSV headers to database fields
const HEADER_ALIASES: Record<MappableFieldKey, string[]> = {
  company_name: [
    "name",
    "company",
    "company name",
    "company_name",
    "companyname",
    "organization",
    "org",
  ],
  website: [
    "website",
    "url",
    "site",
    "web",
    "homepage",
    "company url",
    "company_url",
  ],
  linkedin_url: [
    "linkedin",
    "linkedin url",
    "linkedin_url",
    "linkedinurl",
    "li url",
  ],
  description: [
    "description",
    "about",
    "summary",
    "desc",
    "overview",
    "bio",
  ],
  company_type: [
    "type",
    "company type",
    "company_type",
    "companytype",
    "category type",
  ],
  headquarters_city: [
    "city",
    "hq city",
    "headquarters city",
    "headquarters_city",
    "hq_city",
    "location",
  ],
  headquarters_state: [
    "state",
    "hq state",
    "headquarters state",
    "headquarters_state",
    "hq_state",
  ],
  primary_subcategory_id: [
    "subcategory",
    "subcategory id",
    "subcategory_id",
    "primary subcategory",
    "primary_subcategory_id",
    "subcat",
    "category",
  ],
  secondary_subcategory_id: [
    "secondary subcategory",
    "secondary_subcategory_id",
    "secondary subcategory id",
  ],
  notes: ["notes", "note", "comments", "comment", "remarks"],
};

export function autoDetectMapping(
  headers: string[]
): Record<string, MappableFieldKey | "skip"> {
  const mapping: Record<string, MappableFieldKey | "skip"> = {};
  const usedFields = new Set<MappableFieldKey>();

  for (const header of headers) {
    const normalized = header
      .toLowerCase()
      .trim()
      .replace(/[_\-]/g, " ");
    let matched = false;

    for (const [field, aliases] of Object.entries(HEADER_ALIASES) as [
      MappableFieldKey,
      string[],
    ][]) {
      if (usedFields.has(field)) continue;
      if (
        aliases.some(
          (alias) =>
            alias === normalized ||
            normalized === alias.replace(/[_]/g, " ")
        )
      ) {
        mapping[header] = field;
        usedFields.add(field);
        matched = true;
        break;
      }
    }

    if (!matched) {
      mapping[header] = "skip";
    }
  }

  return mapping;
}

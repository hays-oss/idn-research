# Phase 3: Imports & Classification — Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Add a CSV import wizard with keyword-based auto-classification, smart duplicate merging, and review queue integration to the IDN Research admin panel.

**Architecture:** New `ImportWizard.tsx` component with 4-step wizard flow (Upload → Map → Preview → Import). Classification engine in `classificationEngine.ts` matches company text against `category_taxonomy` keyword rules. PapaParse for client-side CSV parsing. All data written via existing Supabase client. No schema changes — uses existing `ingestion_runs`, `source_records`, and `company_review_queue` tables.

**Tech Stack:** React 19, TypeScript, PapaParse, Supabase, Tailwind CSS v4

---

### Task 1: Install PapaParse and Add Types

**Files:**
- Modify: `package.json`

**Step 1: Install papaparse**

Run: `cd C:\Users\Hays\idn-research && npm install papaparse && npm install -D @types/papaparse`

Expected: Both packages added to package.json

**Step 2: Verify installation**

Run: `cd C:\Users\Hays\idn-research && node -e "require('papaparse'); console.log('OK')"`

Expected: `OK`

**Step 3: Commit**

```bash
git add package.json package-lock.json
git commit -m "Add papaparse dependency for CSV import"
```

---

### Task 2: Create the Classification Engine

**Files:**
- Create: `src/lib/classificationEngine.ts`

**Step 1: Create the classification engine**

Create `src/lib/classificationEngine.ts` with this implementation:

```typescript
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
    .replace(/\b(inc|llc|corp|ltd|lp|plc|co|company|incorporated|corporation|limited|group|holdings)\b\.?/gi, "")
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
  { pattern: /health\s?it|ehr|emr|software/i, domainKeyword: "digital health" },
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

  const tagScores: Map<number, { tagId: number; tagName: string; score: number }> = new Map();

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
  const maxPossibleScore = 10; // rough ceiling
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
```

**Step 2: Commit**

```bash
git add src/lib/classificationEngine.ts
git commit -m "Add keyword-based classification engine for company import"
```

---

### Task 3: Create the CSV Parser Utility

**Files:**
- Create: `src/lib/csvParser.ts`

**Step 1: Create the CSV parser wrapper**

Create `src/lib/csvParser.ts`:

```typescript
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

export type MappableFieldKey = typeof MAPPABLE_FIELDS[number]["key"];

// Auto-detect mapping from CSV headers to database fields
const HEADER_ALIASES: Record<MappableFieldKey, string[]> = {
  company_name: ["name", "company", "company name", "company_name", "companyname", "organization", "org"],
  website: ["website", "url", "site", "web", "homepage", "company url", "company_url"],
  linkedin_url: ["linkedin", "linkedin url", "linkedin_url", "linkedinurl", "li url"],
  description: ["description", "about", "summary", "desc", "overview", "bio"],
  company_type: ["type", "company type", "company_type", "companytype", "category type"],
  headquarters_city: ["city", "hq city", "headquarters city", "headquarters_city", "hq_city", "location"],
  headquarters_state: ["state", "hq state", "headquarters state", "headquarters_state", "hq_state"],
  primary_subcategory_id: ["subcategory", "subcategory id", "subcategory_id", "primary subcategory", "primary_subcategory_id", "subcat", "category"],
  secondary_subcategory_id: ["secondary subcategory", "secondary_subcategory_id", "secondary subcategory id"],
  notes: ["notes", "note", "comments", "comment", "remarks"],
};

export function autoDetectMapping(headers: string[]): Record<string, MappableFieldKey | "skip"> {
  const mapping: Record<string, MappableFieldKey | "skip"> = {};
  const usedFields = new Set<MappableFieldKey>();

  for (const header of headers) {
    const normalized = header.toLowerCase().trim().replace(/[_\-]/g, " ");
    let matched = false;

    for (const [field, aliases] of Object.entries(HEADER_ALIASES) as [MappableFieldKey, string[]][]) {
      if (usedFields.has(field)) continue;
      if (aliases.some((alias) => alias === normalized || normalized === alias.replace(/[_]/g, " "))) {
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
```

**Step 2: Commit**

```bash
git add src/lib/csvParser.ts
git commit -m "Add CSV parser utility with auto-detect column mapping"
```

---

### Task 4: Create ImportWizard Component — Step 1 (Upload & Parse)

**Files:**
- Create: `src/components/admin/ImportWizard.tsx`

**Step 1: Create the wizard shell with Step 1 (Upload)**

Create `src/components/admin/ImportWizard.tsx`. This is a large component — build it incrementally. Start with the wizard shell and Step 1:

```typescript
"use client";

import { useState, useRef, useCallback } from "react";
import {
  Company,
  TaxonomyDomain,
  TaxonomySubcategory,
  CategoryTaxonomy,
} from "@/lib/types";
import { supabase } from "@/lib/supabase";
import {
  ParsedCSV,
  parseCSVFile,
  parseCSVText,
  MAPPABLE_FIELDS,
  MappableFieldKey,
  autoDetectMapping,
} from "@/lib/csvParser";
import {
  classifyCompany,
  ClassificationResult,
} from "@/lib/classificationEngine";

interface ImportWizardProps {
  companies: Company[];
  domains: TaxonomyDomain[];
  subcategories: TaxonomySubcategory[];
  tags: CategoryTaxonomy[];
  onRefresh: () => void;
}

type WizardStep = 1 | 2 | 3 | 4;

interface ImportRow {
  raw: Record<string, string>;
  mapped: Record<string, string>;
  classification: ClassificationResult | null;
  duplicateOf: Company | null;
  mergeFields: string[];
  status: "ready" | "needs_review" | "no_match" | "duplicate" | "error";
  error?: string;
  overrideSubcategoryId?: number;
}

interface ImportSummary {
  created: number;
  merged: number;
  queued: number;
  errors: number;
  skipped: number;
}

const STEPS = [
  { num: 1, label: "Upload" },
  { num: 2, label: "Map Columns" },
  { num: 3, label: "Preview & Classify" },
  { num: 4, label: "Import" },
];

export default function ImportWizard({
  companies,
  domains,
  subcategories,
  tags,
  onRefresh,
}: ImportWizardProps) {
  const [step, setStep] = useState<WizardStep>(1);
  const [parsedCSV, setParsedCSV] = useState<ParsedCSV | null>(null);
  const [fileName, setFileName] = useState<string>("");
  const [columnMapping, setColumnMapping] = useState<Record<string, MappableFieldKey | "skip">>({});
  const [importRows, setImportRows] = useState<ImportRow[]>([]);
  const [importing, setImporting] = useState(false);
  const [summary, setSummary] = useState<ImportSummary | null>(null);
  const [pasteText, setPasteText] = useState("");
  const [dragOver, setDragOver] = useState(false);
  const fileInputRef = useRef<HTMLInputElement>(null);

  // --- Step 1: Upload & Parse ---

  const handleFile = useCallback(async (file: File) => {
    try {
      const result = await parseCSVFile(file);
      setParsedCSV(result);
      setFileName(file.name);
      // Auto-detect column mapping
      const detected = autoDetectMapping(result.headers);
      setColumnMapping(detected);
    } catch {
      alert("Failed to parse file. Please check the format.");
    }
  }, []);

  const handlePaste = useCallback(() => {
    if (!pasteText.trim()) return;
    const result = parseCSVText(pasteText);
    if (result.rowCount === 0) {
      alert("No rows found. Check your pasted data.");
      return;
    }
    setParsedCSV(result);
    setFileName("pasted-data.csv");
    const detected = autoDetectMapping(result.headers);
    setColumnMapping(detected);
  }, [pasteText]);

  const handleDrop = useCallback(
    (e: React.DragEvent) => {
      e.preventDefault();
      setDragOver(false);
      const file = e.dataTransfer.files[0];
      if (file) handleFile(file);
    },
    [handleFile]
  );

  // --- Step 2: Column Mapping ---

  const handleMappingChange = (header: string, value: MappableFieldKey | "skip") => {
    setColumnMapping((prev) => ({ ...prev, [header]: value }));
  };

  const isMappingValid = Object.values(columnMapping).includes("company_name");

  // Save mapping fingerprint to localStorage
  const saveMappingToStorage = useCallback(() => {
    if (!parsedCSV) return;
    const key = `import-mapping-${parsedCSV.headers.sort().join(",")}`;
    localStorage.setItem(key, JSON.stringify(columnMapping));
  }, [parsedCSV, columnMapping]);

  const loadMappingFromStorage = useCallback(() => {
    if (!parsedCSV) return;
    const key = `import-mapping-${parsedCSV.headers.sort().join(",")}`;
    const saved = localStorage.getItem(key);
    if (saved) {
      try {
        setColumnMapping(JSON.parse(saved));
      } catch { /* ignore */ }
    }
  }, [parsedCSV]);

  // --- Step 3: Preview & Classify ---

  const runClassification = useCallback(() => {
    if (!parsedCSV) return;

    // Build a normalized name map of existing companies for dedup
    const existingMap = new Map<string, Company>();
    for (const c of companies) {
      const norm = c.normalized_company_name || c.company_name.toLowerCase()
        .replace(/\b(inc|llc|corp|ltd|lp|plc|co|company|incorporated|corporation|limited|group|holdings)\b\.?/gi, "")
        .replace(/[^a-z0-9\s]/g, " ")
        .replace(/\s+/g, " ")
        .trim();
      existingMap.set(norm, c);
    }

    const rows: ImportRow[] = parsedCSV.rows.map((raw) => {
      // Map raw CSV columns to database fields
      const mapped: Record<string, string> = {};
      for (const [header, field] of Object.entries(columnMapping)) {
        if (field !== "skip" && raw[header]) {
          mapped[field] = raw[header].trim();
        }
      }

      const companyName = mapped.company_name || "";
      if (!companyName) {
        return {
          raw,
          mapped,
          classification: null,
          duplicateOf: null,
          mergeFields: [],
          status: "error" as const,
          error: "Missing company name",
        };
      }

      // Check for duplicate
      const normName = companyName.toLowerCase()
        .replace(/\b(inc|llc|corp|ltd|lp|plc|co|company|incorporated|corporation|limited|group|holdings)\b\.?/gi, "")
        .replace(/[^a-z0-9\s]/g, " ")
        .replace(/\s+/g, " ")
        .trim();

      const existing = existingMap.get(normName);

      if (existing) {
        // Smart merge: find which fields would be filled
        const mergeFields: string[] = [];
        if (!existing.website && mapped.website) mergeFields.push("website");
        if (!existing.linkedin_url && mapped.linkedin_url) mergeFields.push("linkedin_url");
        if (!existing.description && mapped.description) mergeFields.push("description");
        if (!existing.headquarters_city && mapped.headquarters_city) mergeFields.push("headquarters_city");
        if (!existing.headquarters_state && mapped.headquarters_state) mergeFields.push("headquarters_state");
        if (!existing.notes && mapped.notes) mergeFields.push("notes");

        return {
          raw,
          mapped,
          classification: null,
          duplicateOf: existing,
          mergeFields,
          status: "duplicate" as const,
        };
      }

      // Run classification if no subcategory provided
      let classification: ClassificationResult | null = null;
      const csvSubId = mapped.primary_subcategory_id
        ? parseInt(mapped.primary_subcategory_id)
        : null;

      if (csvSubId && subcategories.some((s) => s.id === csvSubId)) {
        // Subcategory provided in CSV — trust it
        classification = {
          suggestedSubcategoryId: csvSubId,
          confidence: 1.0,
          matchedTags: [],
          status: "ready",
        };
      } else {
        classification = classifyCompany(
          companyName,
          mapped.description || null,
          tags,
          subcategories
        );
      }

      return {
        raw,
        mapped,
        classification,
        duplicateOf: null,
        mergeFields: [],
        status: classification.status,
      };
    });

    setImportRows(rows);
  }, [parsedCSV, columnMapping, companies, tags, subcategories]);

  // --- Step 4: Import ---

  const runImport = useCallback(async () => {
    setImporting(true);
    const result: ImportSummary = {
      created: 0,
      merged: 0,
      queued: 0,
      errors: 0,
      skipped: 0,
    };

    // Create ingestion_run record
    const { data: runData } = await supabase
      .from("ingestion_runs")
      .insert({
        source_name: fileName,
        run_type: "csv_import",
        status: "started",
        records_seen: importRows.length,
      })
      .select("id")
      .single();

    const batchId = runData?.id || null;

    for (const row of importRows) {
      if (row.status === "error") {
        result.errors++;
        continue;
      }

      try {
        if (row.status === "duplicate" && row.duplicateOf) {
          // Smart merge: only update null fields
          if (row.mergeFields.length > 0) {
            const updates: Record<string, string> = {};
            for (const field of row.mergeFields) {
              if (row.mapped[field]) {
                updates[field] = row.mapped[field];
              }
            }
            if (Object.keys(updates).length > 0) {
              await supabase
                .from("companies")
                .update(updates)
                .eq("id", row.duplicateOf.id);
              result.merged++;
            } else {
              result.skipped++;
            }
          } else {
            result.skipped++;
          }

          // Store source record
          if (batchId) {
            await supabase.from("source_records").insert({
              company_id: row.duplicateOf.id,
              source_name: fileName,
              raw_payload_json: row.raw,
            });
          }
          continue;
        }

        // Insert new company
        const subcategoryId =
          row.overrideSubcategoryId ||
          row.classification?.suggestedSubcategoryId ||
          null;

        const isApproved =
          row.status === "ready" || row.overrideSubcategoryId;

        const { data: newCompany, error: insertError } = await supabase
          .from("companies")
          .insert({
            company_name: row.mapped.company_name,
            website: row.mapped.website || null,
            linkedin_url: row.mapped.linkedin_url || null,
            description: row.mapped.description || null,
            company_type: row.mapped.company_type || "vendor",
            headquarters_city: row.mapped.headquarters_city || null,
            headquarters_state: row.mapped.headquarters_state || null,
            primary_subcategory_id: subcategoryId,
            review_status: isApproved ? "approved" : "pending",
            source_system: "csv_import",
            import_batch_id: batchId,
            confidence_score: row.classification?.confidence || null,
            notes: row.mapped.notes || null,
          })
          .select("id")
          .single();

        if (insertError || !newCompany) {
          result.errors++;
          continue;
        }

        // Store source record
        if (batchId) {
          await supabase.from("source_records").insert({
            company_id: newCompany.id,
            source_name: fileName,
            raw_payload_json: row.raw,
          });
        }

        // Queue for review if unclassified
        if (!isApproved) {
          await supabase.from("company_review_queue").insert({
            company_id: newCompany.id,
            reason: "missing_category",
            suggested_subcategory_id: subcategoryId,
            status: "open",
          });
          result.queued++;
        }

        result.created++;
      } catch {
        result.errors++;
      }
    }

    // Update ingestion_run with final counts
    if (batchId) {
      await supabase
        .from("ingestion_runs")
        .update({
          status: "completed",
          records_created: result.created,
          records_updated: result.merged,
          records_queued: result.queued,
          errors_count: result.errors,
          finished_at: new Date().toISOString(),
        })
        .eq("id", batchId);
    }

    setSummary(result);
    setImporting(false);
    onRefresh();
  }, [importRows, fileName, onRefresh]);

  // --- Helpers ---

  const statusCounts = {
    ready: importRows.filter((r) => r.status === "ready").length,
    needs_review: importRows.filter((r) => r.status === "needs_review").length,
    no_match: importRows.filter((r) => r.status === "no_match").length,
    duplicate: importRows.filter((r) => r.status === "duplicate").length,
    error: importRows.filter((r) => r.status === "error").length,
  };

  const getSubcategoryName = (id: number | null) => {
    if (!id) return "—";
    const sub = subcategories.find((s) => s.id === id);
    return sub?.name || `ID ${id}`;
  };

  const getDomainForSubcategory = (subId: number | null) => {
    if (!subId) return null;
    const sub = subcategories.find((s) => s.id === subId);
    if (!sub) return null;
    return domains.find((d) => d.id === sub.domain_id) || null;
  };

  const approveAllSuggestions = () => {
    setImportRows((prev) =>
      prev.map((row) => {
        if (
          row.status === "needs_review" &&
          row.classification?.suggestedSubcategoryId
        ) {
          return {
            ...row,
            overrideSubcategoryId: row.classification.suggestedSubcategoryId,
            status: "ready",
          };
        }
        return row;
      })
    );
  };

  const handleRowSubcategoryChange = (index: number, subcategoryId: number) => {
    setImportRows((prev) =>
      prev.map((row, i) => {
        if (i !== index) return row;
        return {
          ...row,
          overrideSubcategoryId: subcategoryId,
          status: "ready",
        };
      })
    );
  };

  // --- Render ---

  return (
    <div>
      {/* Step Indicator */}
      <div className="flex items-center gap-2 mb-6">
        {STEPS.map((s, i) => (
          <div key={s.num} className="flex items-center gap-2">
            <div
              className={`flex items-center gap-2 px-3 py-1.5 rounded-full text-xs font-medium ${
                step === s.num
                  ? "bg-[var(--primary)] text-white"
                  : step > s.num
                  ? "bg-green-100 text-green-700"
                  : "bg-[var(--surface)] text-[var(--muted)]"
              }`}
            >
              {step > s.num ? (
                <svg className="w-3.5 h-3.5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M5 13l4 4L19 7" />
                </svg>
              ) : (
                <span>{s.num}</span>
              )}
              {s.label}
            </div>
            {i < STEPS.length - 1 && (
              <div className={`w-8 h-px ${step > s.num ? "bg-green-300" : "bg-[var(--border)]"}`} />
            )}
          </div>
        ))}
      </div>

      {/* Step 1: Upload & Parse */}
      {step === 1 && (
        <div>
          <h3 className="text-sm font-semibold text-[var(--foreground)] mb-4">
            Upload CSV File
          </h3>

          {/* Drag & drop zone */}
          <div
            onDragOver={(e) => {
              e.preventDefault();
              setDragOver(true);
            }}
            onDragLeave={() => setDragOver(false)}
            onDrop={handleDrop}
            onClick={() => fileInputRef.current?.click()}
            className={`border-2 border-dashed rounded-xl p-8 text-center cursor-pointer transition-colors ${
              dragOver
                ? "border-[var(--primary)] bg-[var(--primary)]/5"
                : "border-[var(--border)] hover:border-[var(--primary)]/50"
            }`}
          >
            <svg
              className="w-10 h-10 mx-auto mb-3 text-[var(--muted)]"
              fill="none"
              stroke="currentColor"
              viewBox="0 0 24 24"
            >
              <path
                strokeLinecap="round"
                strokeLinejoin="round"
                strokeWidth={1.5}
                d="M7 16a4 4 0 01-.88-7.903A5 5 0 1115.9 6L16 6a5 5 0 011 9.9M15 13l-3-3m0 0l-3 3m3-3v12"
              />
            </svg>
            <p className="text-sm text-[var(--foreground)] font-medium">
              Drop a CSV file here or click to browse
            </p>
            <p className="text-xs text-[var(--muted)] mt-1">
              Supports .csv, .tsv, .txt files
            </p>
            <input
              ref={fileInputRef}
              type="file"
              accept=".csv,.tsv,.txt"
              className="hidden"
              onChange={(e) => {
                const file = e.target.files?.[0];
                if (file) handleFile(file);
              }}
            />
          </div>

          {/* Divider */}
          <div className="flex items-center gap-3 my-4">
            <div className="flex-1 h-px bg-[var(--border)]" />
            <span className="text-xs text-[var(--muted)]">or paste data</span>
            <div className="flex-1 h-px bg-[var(--border)]" />
          </div>

          {/* Paste area */}
          <textarea
            value={pasteText}
            onChange={(e) => setPasteText(e.target.value)}
            placeholder="Paste CSV or tab-delimited data here..."
            rows={6}
            className="w-full rounded-lg border border-[var(--border)] bg-white px-3 py-2 text-sm text-[var(--foreground)] focus:border-[var(--primary)] focus:outline-none focus:ring-1 focus:ring-[var(--primary)] font-mono"
          />
          {pasteText.trim() && (
            <button
              onClick={handlePaste}
              className="mt-2 rounded-lg bg-[var(--primary)] px-4 py-2 text-sm font-medium text-white hover:bg-[var(--primary-light)] transition-colors"
            >
              Parse Pasted Data
            </button>
          )}

          {/* Preview */}
          {parsedCSV && (
            <div className="mt-6">
              <div className="flex items-center justify-between mb-3">
                <div className="flex items-center gap-3">
                  <span className="text-sm font-medium text-[var(--foreground)]">
                    {fileName}
                  </span>
                  <span className="rounded-full bg-green-100 text-green-700 px-2 py-0.5 text-xs font-medium">
                    {parsedCSV.rowCount} rows &middot; {parsedCSV.headers.length} columns
                  </span>
                </div>
                <button
                  onClick={() => {
                    setParsedCSV(null);
                    setFileName("");
                    setPasteText("");
                  }}
                  className="text-xs text-[var(--muted)] hover:text-red-600 transition-colors"
                >
                  Clear
                </button>
              </div>

              {/* Preview table (first 5 rows) */}
              <div className="overflow-x-auto rounded-lg border border-[var(--border)]">
                <table className="w-full text-xs">
                  <thead>
                    <tr className="bg-[var(--surface)]">
                      {parsedCSV.headers.map((h) => (
                        <th
                          key={h}
                          className="px-3 py-2 text-left font-medium text-[var(--muted)] whitespace-nowrap"
                        >
                          {h}
                        </th>
                      ))}
                    </tr>
                  </thead>
                  <tbody>
                    {parsedCSV.rows.slice(0, 5).map((row, i) => (
                      <tr
                        key={i}
                        className="border-t border-[var(--border)]"
                      >
                        {parsedCSV.headers.map((h) => (
                          <td
                            key={h}
                            className="px-3 py-2 text-[var(--foreground)] whitespace-nowrap max-w-[200px] truncate"
                          >
                            {row[h] || ""}
                          </td>
                        ))}
                      </tr>
                    ))}
                  </tbody>
                </table>
              </div>
              {parsedCSV.rowCount > 5 && (
                <p className="text-xs text-[var(--muted)] mt-1">
                  Showing 5 of {parsedCSV.rowCount} rows
                </p>
              )}

              <button
                onClick={() => setStep(2)}
                className="mt-4 rounded-lg bg-[var(--primary)] px-4 py-2 text-sm font-medium text-white hover:bg-[var(--primary-light)] transition-colors"
              >
                Next: Map Columns &rarr;
              </button>
            </div>
          )}
        </div>
      )}

      {/* Step 2: Column Mapping */}
      {step === 2 && parsedCSV && (
        <div>
          <div className="flex items-center justify-between mb-4">
            <h3 className="text-sm font-semibold text-[var(--foreground)]">
              Map CSV Columns to Fields
            </h3>
            <button
              onClick={loadMappingFromStorage}
              className="text-xs text-[var(--primary)] hover:underline"
            >
              Load saved mapping
            </button>
          </div>

          <div className="space-y-2">
            {parsedCSV.headers.map((header) => {
              const sampleValues = parsedCSV.rows
                .slice(0, 3)
                .map((r) => r[header])
                .filter(Boolean)
                .join(", ");

              return (
                <div
                  key={header}
                  className="flex items-center gap-3 p-3 rounded-lg border border-[var(--border)] bg-white"
                >
                  <div className="flex-1 min-w-0">
                    <div className="text-sm font-medium text-[var(--foreground)]">
                      {header}
                    </div>
                    <div className="text-xs text-[var(--muted)] truncate">
                      {sampleValues || "(empty)"}
                    </div>
                  </div>
                  <svg
                    className="w-4 h-4 text-[var(--muted)] shrink-0"
                    fill="none"
                    stroke="currentColor"
                    viewBox="0 0 24 24"
                  >
                    <path
                      strokeLinecap="round"
                      strokeLinejoin="round"
                      strokeWidth={2}
                      d="M14 5l7 7m0 0l-7 7m7-7H3"
                    />
                  </svg>
                  <select
                    value={columnMapping[header] || "skip"}
                    onChange={(e) =>
                      handleMappingChange(
                        header,
                        e.target.value as MappableFieldKey | "skip"
                      )
                    }
                    className="rounded-lg border border-[var(--border)] bg-white px-3 py-1.5 text-sm text-[var(--foreground)] focus:border-[var(--primary)] focus:outline-none focus:ring-1 focus:ring-[var(--primary)] w-48"
                  >
                    <option value="skip">— Skip —</option>
                    {MAPPABLE_FIELDS.map((f) => (
                      <option key={f.key} value={f.key}>
                        {f.label}
                        {f.required ? " *" : ""}
                      </option>
                    ))}
                  </select>
                </div>
              );
            })}
          </div>

          {!isMappingValid && (
            <p className="text-xs text-red-600 mt-3">
              &ldquo;Company Name&rdquo; must be mapped to proceed.
            </p>
          )}

          <div className="flex items-center gap-3 mt-4">
            <button
              onClick={() => setStep(1)}
              className="rounded-lg px-4 py-2 text-sm font-medium text-[var(--muted)] hover:bg-[var(--surface)] transition-colors"
            >
              &larr; Back
            </button>
            <button
              onClick={() => {
                saveMappingToStorage();
                runClassification();
                setStep(3);
              }}
              disabled={!isMappingValid}
              className="rounded-lg bg-[var(--primary)] px-4 py-2 text-sm font-medium text-white hover:bg-[var(--primary-light)] transition-colors disabled:opacity-50"
            >
              Next: Preview & Classify &rarr;
            </button>
          </div>
        </div>
      )}

      {/* Step 3: Preview & Classify */}
      {step === 3 && (
        <div>
          <div className="flex items-center justify-between mb-4">
            <h3 className="text-sm font-semibold text-[var(--foreground)]">
              Preview & Classify
            </h3>
            <div className="flex items-center gap-2">
              <button
                onClick={approveAllSuggestions}
                className="rounded-lg px-3 py-1.5 text-xs font-medium text-[var(--primary)] hover:bg-[var(--surface)] transition-colors border border-[var(--border)]"
              >
                Approve All Suggestions
              </button>
            </div>
          </div>

          {/* Summary bar */}
          <div className="flex items-center gap-3 mb-4 p-3 rounded-lg bg-[var(--surface)] border border-[var(--border)]">
            <span className="flex items-center gap-1.5 text-xs">
              <span className="w-2 h-2 rounded-full bg-green-500" />
              <span className="font-medium">{statusCounts.ready}</span> ready
            </span>
            <span className="flex items-center gap-1.5 text-xs">
              <span className="w-2 h-2 rounded-full bg-yellow-500" />
              <span className="font-medium">{statusCounts.needs_review}</span> needs review
            </span>
            <span className="flex items-center gap-1.5 text-xs">
              <span className="w-2 h-2 rounded-full bg-red-500" />
              <span className="font-medium">{statusCounts.no_match}</span> no match
            </span>
            <span className="flex items-center gap-1.5 text-xs">
              <span className="w-2 h-2 rounded-full bg-blue-500" />
              <span className="font-medium">{statusCounts.duplicate}</span> duplicates
            </span>
            {statusCounts.error > 0 && (
              <span className="flex items-center gap-1.5 text-xs">
                <span className="w-2 h-2 rounded-full bg-gray-400" />
                <span className="font-medium">{statusCounts.error}</span> errors
              </span>
            )}
          </div>

          {/* Rows table */}
          <div className="overflow-x-auto rounded-lg border border-[var(--border)]">
            <table className="w-full text-xs">
              <thead>
                <tr className="bg-[var(--surface)]">
                  <th className="px-3 py-2 text-left font-medium text-[var(--muted)] w-8">#</th>
                  <th className="px-3 py-2 text-left font-medium text-[var(--muted)]">Status</th>
                  <th className="px-3 py-2 text-left font-medium text-[var(--muted)]">Company</th>
                  <th className="px-3 py-2 text-left font-medium text-[var(--muted)]">Subcategory</th>
                  <th className="px-3 py-2 text-left font-medium text-[var(--muted)]">Confidence</th>
                  <th className="px-3 py-2 text-left font-medium text-[var(--muted)]">Details</th>
                </tr>
              </thead>
              <tbody>
                {importRows.map((row, i) => {
                  const subId =
                    row.overrideSubcategoryId ||
                    row.classification?.suggestedSubcategoryId ||
                    null;
                  const domain = getDomainForSubcategory(subId);
                  const confidencePercent = row.classification
                    ? Math.round(row.classification.confidence * 100)
                    : null;

                  return (
                    <tr
                      key={i}
                      className="border-t border-[var(--border)] hover:bg-[var(--surface)]/50"
                    >
                      <td className="px-3 py-2 text-[var(--muted)]">{i + 1}</td>
                      <td className="px-3 py-2">
                        <span
                          className={`inline-flex items-center gap-1 rounded-full px-2 py-0.5 text-xs font-medium ${
                            row.status === "ready"
                              ? "bg-green-50 text-green-700"
                              : row.status === "needs_review"
                              ? "bg-yellow-50 text-yellow-700"
                              : row.status === "no_match"
                              ? "bg-red-50 text-red-700"
                              : row.status === "duplicate"
                              ? "bg-blue-50 text-blue-700"
                              : "bg-gray-100 text-gray-600"
                          }`}
                        >
                          {row.status === "ready" && "Ready"}
                          {row.status === "needs_review" && "Review"}
                          {row.status === "no_match" && "No Match"}
                          {row.status === "duplicate" && "Duplicate"}
                          {row.status === "error" && "Error"}
                        </span>
                      </td>
                      <td className="px-3 py-2 font-medium text-[var(--foreground)] max-w-[200px] truncate">
                        {row.mapped.company_name || "(no name)"}
                      </td>
                      <td className="px-3 py-2">
                        {row.status === "duplicate" ? (
                          <span className="text-[var(--muted)]">
                            Exists — merge {row.mergeFields.length} field{row.mergeFields.length !== 1 ? "s" : ""}
                          </span>
                        ) : row.status === "error" ? (
                          <span className="text-red-500">{row.error}</span>
                        ) : (
                          <select
                            value={subId || ""}
                            onChange={(e) =>
                              handleRowSubcategoryChange(
                                i,
                                parseInt(e.target.value)
                              )
                            }
                            className="rounded border border-[var(--border)] bg-white px-2 py-1 text-xs text-[var(--foreground)] focus:border-[var(--primary)] focus:outline-none w-48"
                          >
                            <option value="">— Select —</option>
                            {domains.map((d) => (
                              <optgroup key={d.id} label={d.name}>
                                {subcategories
                                  .filter((s) => s.domain_id === d.id)
                                  .map((s) => (
                                    <option key={s.id} value={s.id}>
                                      {s.name}
                                    </option>
                                  ))}
                              </optgroup>
                            ))}
                          </select>
                        )}
                      </td>
                      <td className="px-3 py-2">
                        {confidencePercent !== null && (
                          <span
                            className={`text-xs font-medium ${
                              confidencePercent >= 70
                                ? "text-green-600"
                                : confidencePercent >= 30
                                ? "text-yellow-600"
                                : "text-red-500"
                            }`}
                          >
                            {confidencePercent}%
                          </span>
                        )}
                      </td>
                      <td className="px-3 py-2 text-[var(--muted)]">
                        {row.status === "duplicate" && row.mergeFields.length > 0 && (
                          <span>Will fill: {row.mergeFields.join(", ")}</span>
                        )}
                        {row.status === "duplicate" && row.mergeFields.length === 0 && (
                          <span>No new data — skip</span>
                        )}
                        {domain && <span>{domain.name}</span>}
                      </td>
                    </tr>
                  );
                })}
              </tbody>
            </table>
          </div>

          <div className="flex items-center gap-3 mt-4">
            <button
              onClick={() => setStep(2)}
              className="rounded-lg px-4 py-2 text-sm font-medium text-[var(--muted)] hover:bg-[var(--surface)] transition-colors"
            >
              &larr; Back
            </button>
            <button
              onClick={() => setStep(4)}
              className="rounded-lg bg-[var(--primary)] px-4 py-2 text-sm font-medium text-white hover:bg-[var(--primary-light)] transition-colors"
            >
              Next: Import &rarr;
            </button>
          </div>
        </div>
      )}

      {/* Step 4: Import */}
      {step === 4 && (
        <div>
          <h3 className="text-sm font-semibold text-[var(--foreground)] mb-4">
            Import Companies
          </h3>

          {!summary && !importing && (
            <div>
              <div className="p-4 rounded-lg bg-[var(--surface)] border border-[var(--border)] mb-4">
                <p className="text-sm text-[var(--foreground)]">
                  Ready to import <strong>{importRows.filter((r) => r.status !== "error").length}</strong> companies:
                </p>
                <ul className="mt-2 space-y-1 text-xs text-[var(--muted)]">
                  <li>&bull; {statusCounts.ready} will be created as approved</li>
                  <li>&bull; {statusCounts.needs_review + statusCounts.no_match} will be created and queued for review</li>
                  <li>&bull; {statusCounts.duplicate} duplicates will be smart-merged</li>
                  {statusCounts.error > 0 && (
                    <li className="text-red-500">&bull; {statusCounts.error} rows with errors will be skipped</li>
                  )}
                </ul>
              </div>

              <div className="flex items-center gap-3">
                <button
                  onClick={() => setStep(3)}
                  className="rounded-lg px-4 py-2 text-sm font-medium text-[var(--muted)] hover:bg-[var(--surface)] transition-colors"
                >
                  &larr; Back
                </button>
                <button
                  onClick={runImport}
                  className="rounded-lg bg-green-600 px-6 py-2 text-sm font-medium text-white hover:bg-green-700 transition-colors"
                >
                  Start Import
                </button>
              </div>
            </div>
          )}

          {importing && (
            <div className="flex flex-col items-center justify-center py-12">
              <div className="h-8 w-8 animate-spin rounded-full border-2 border-[var(--primary)] border-t-transparent mb-3" />
              <p className="text-sm text-[var(--muted)]">
                Importing companies...
              </p>
            </div>
          )}

          {summary && (
            <div>
              <div className="p-6 rounded-xl bg-green-50 border border-green-200 mb-4">
                <div className="flex items-center gap-2 mb-3">
                  <svg className="w-5 h-5 text-green-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M5 13l4 4L19 7" />
                  </svg>
                  <h4 className="text-sm font-semibold text-green-800">
                    Import Complete
                  </h4>
                </div>
                <div className="grid grid-cols-2 sm:grid-cols-5 gap-3">
                  <div className="text-center p-2 rounded-lg bg-white">
                    <div className="text-lg font-bold text-green-700">{summary.created}</div>
                    <div className="text-xs text-[var(--muted)]">Created</div>
                  </div>
                  <div className="text-center p-2 rounded-lg bg-white">
                    <div className="text-lg font-bold text-blue-700">{summary.merged}</div>
                    <div className="text-xs text-[var(--muted)]">Merged</div>
                  </div>
                  <div className="text-center p-2 rounded-lg bg-white">
                    <div className="text-lg font-bold text-yellow-700">{summary.queued}</div>
                    <div className="text-xs text-[var(--muted)]">Queued</div>
                  </div>
                  <div className="text-center p-2 rounded-lg bg-white">
                    <div className="text-lg font-bold text-gray-500">{summary.skipped}</div>
                    <div className="text-xs text-[var(--muted)]">Skipped</div>
                  </div>
                  <div className="text-center p-2 rounded-lg bg-white">
                    <div className="text-lg font-bold text-red-600">{summary.errors}</div>
                    <div className="text-xs text-[var(--muted)]">Errors</div>
                  </div>
                </div>
              </div>

              <div className="flex items-center gap-3">
                {summary.queued > 0 && (
                  <button
                    onClick={onRefresh}
                    className="rounded-lg bg-[var(--primary)] px-4 py-2 text-sm font-medium text-white hover:bg-[var(--primary-light)] transition-colors"
                  >
                    Go to Review Queue
                  </button>
                )}
                <button
                  onClick={() => {
                    setStep(1);
                    setParsedCSV(null);
                    setFileName("");
                    setPasteText("");
                    setImportRows([]);
                    setSummary(null);
                    setColumnMapping({});
                  }}
                  className="rounded-lg px-4 py-2 text-sm font-medium text-[var(--muted)] hover:bg-[var(--surface)] transition-colors border border-[var(--border)]"
                >
                  Import Another File
                </button>
              </div>
            </div>
          )}
        </div>
      )}
    </div>
  );
}
```

**Step 2: Commit**

```bash
git add src/components/admin/ImportWizard.tsx
git commit -m "Add ImportWizard component with 4-step CSV import flow"
```

---

### Task 5: Wire ImportWizard into AdminDashboard

**Files:**
- Modify: `src/components/admin/AdminDashboard.tsx:24` (Tab type)
- Modify: `src/components/admin/AdminDashboard.tsx:22` (Import component)
- Modify: `src/components/admin/AdminDashboard.tsx:104-111` (tabs array)
- Modify: `src/components/admin/AdminDashboard.tsx:219-260` (tab content rendering)

**Step 1: Add import to AdminDashboard**

At the top of AdminDashboard.tsx (after line 22), add:

```typescript
import ImportWizard from "./ImportWizard";
```

**Step 2: Update Tab type**

Change line 24 from:
```typescript
type Tab = "companies" | "taxonomy" | "review" | "resources" | "categories" | "influencers";
```
to:
```typescript
type Tab = "companies" | "taxonomy" | "review" | "import" | "resources" | "categories" | "influencers";
```

**Step 3: Add Import tab to tabs array**

In the tabs array (around line 104-111), add the Import tab after Review Queue:

```typescript
const tabs: { key: Tab; label: string; count: number; section?: string }[] = [
  { key: "companies", label: "Companies", count: companies.length, section: "directory" },
  { key: "taxonomy", label: "Taxonomy", count: tags.length, section: "directory" },
  { key: "review", label: "Review Queue", count: openQueueCount, section: "directory" },
  { key: "import", label: "Import", count: 0, section: "directory" },
  { key: "resources", label: "Resources", count: resources.length, section: "legacy" },
  { key: "categories", label: "Categories", count: categories.length, section: "legacy" },
  { key: "influencers", label: "Influencers", count: influencers.length, section: "legacy" },
];
```

**Step 4: Add ImportWizard rendering**

After the ReviewQueueAdmin conditional render (around line 246), add:

```typescript
{activeTab === "import" && (
  <ImportWizard
    companies={companies}
    domains={domains}
    subcategories={subcategories}
    tags={tags}
    onRefresh={fetchData}
  />
)}
```

**Step 5: Commit**

```bash
git add src/components/admin/AdminDashboard.tsx
git commit -m "Wire ImportWizard tab into AdminDashboard"
```

---

### Task 6: Add RLS Policy for ingestion_runs and source_records

**Files:**
- Create: `sql/010_rls_import_tables.sql`

**Step 1: Write the RLS SQL**

These tables need RLS policies so the authenticated admin can write to them. Create `sql/010_rls_import_tables.sql`:

```sql
-- Enable RLS on import-related tables
ALTER TABLE ingestion_runs ENABLE ROW LEVEL SECURITY;
ALTER TABLE source_records ENABLE ROW LEVEL SECURITY;

-- Allow authenticated users full access to ingestion_runs
CREATE POLICY "authenticated_ingestion_runs_select" ON ingestion_runs
  FOR SELECT TO authenticated USING (true);
CREATE POLICY "authenticated_ingestion_runs_insert" ON ingestion_runs
  FOR INSERT TO authenticated WITH CHECK (true);
CREATE POLICY "authenticated_ingestion_runs_update" ON ingestion_runs
  FOR UPDATE TO authenticated USING (true) WITH CHECK (true);

-- Allow authenticated users full access to source_records
CREATE POLICY "authenticated_source_records_select" ON source_records
  FOR SELECT TO authenticated USING (true);
CREATE POLICY "authenticated_source_records_insert" ON source_records
  FOR INSERT TO authenticated WITH CHECK (true);

-- Allow anon read on ingestion_runs (optional, for public stats)
-- CREATE POLICY "anon_ingestion_runs_select" ON ingestion_runs
--   FOR SELECT TO anon USING (true);
```

**Step 2: Run this SQL in the Supabase SQL Editor**

The user must run this manually in Supabase dashboard.

**Step 3: Commit**

```bash
git add sql/010_rls_import_tables.sql
git commit -m "Add RLS policies for ingestion_runs and source_records tables"
```

---

### Task 7: Test End-to-End with Sample CSV

**Files:** None (manual testing)

**Step 1: Create a test CSV file**

Create a file `test-import.csv` in the project root:

```csv
company_name,website,description,headquarters_city,headquarters_state
TestCo Alpha,https://testalpha.com,Surgical robotics manufacturer,Boston,MA
TestCo Beta,https://testbeta.com,Digital health EHR platform,Austin,TX
TestCo Gamma,,Pharmacy automation solutions,Chicago,IL
Medtronic,https://medtronic.com,Already exists - should merge,Minneapolis,MN
```

**Step 2: Run the dev server and navigate to admin**

Run: `cd C:\Users\Hays\idn-research && npm run dev`

Navigate to `http://localhost:3001/admin`, click the "Import" tab.

**Step 3: Upload the test CSV and verify each step**

- Step 1: Upload `test-import.csv` → verify preview shows 4 rows, 5 columns
- Step 2: Verify auto-mapping detected all 5 columns correctly
- Step 3: Verify classification:
  - TestCo Alpha → should suggest a Medical Devices subcategory (keyword: "surgical robotics")
  - TestCo Beta → should suggest Digital Health subcategory (keyword: "ehr")
  - TestCo Gamma → should suggest Pharmacy subcategory (keyword: "pharmacy automation")
  - Medtronic → should show as "Duplicate" (already exists in DB)
- Step 4: Run import → verify summary shows 3 created, 1 merged (or skipped)

**Step 4: Verify in production**

Deploy and check idn-research.vercel.app/admin → Import tab works.

**Step 5: Clean up test data**

Delete the 3 TestCo companies from the admin Companies tab.

**Step 6: Commit**

```bash
git commit -m "Phase 3 complete: CSV import wizard with classification engine"
```

---

## Summary

| Task | Description | Files |
|------|-------------|-------|
| 1 | Install PapaParse | `package.json` |
| 2 | Classification engine | `src/lib/classificationEngine.ts` |
| 3 | CSV parser utility | `src/lib/csvParser.ts` |
| 4 | ImportWizard component | `src/components/admin/ImportWizard.tsx` |
| 5 | Wire into AdminDashboard | `src/components/admin/AdminDashboard.tsx` |
| 6 | RLS policies for import tables | `sql/010_rls_import_tables.sql` |
| 7 | End-to-end testing | Manual testing |

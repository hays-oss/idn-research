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
  const [columnMapping, setColumnMapping] = useState<
    Record<string, MappableFieldKey | "skip">
  >({});
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

  const handleMappingChange = (
    header: string,
    value: MappableFieldKey | "skip"
  ) => {
    setColumnMapping((prev) => ({ ...prev, [header]: value }));
  };

  const isMappingValid = Object.values(columnMapping).includes("company_name");

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
      } catch {
        /* ignore */
      }
    }
  }, [parsedCSV]);

  // --- Step 3: Preview & Classify ---

  const runClassification = useCallback(() => {
    if (!parsedCSV) return;

    const existingMap = new Map<string, Company>();
    for (const c of companies) {
      const norm =
        c.normalized_company_name ||
        c.company_name
          .toLowerCase()
          .replace(
            /\b(inc|llc|corp|ltd|lp|plc|co|company|incorporated|corporation|limited|group|holdings)\b\.?/gi,
            ""
          )
          .replace(/[^a-z0-9\s]/g, " ")
          .replace(/\s+/g, " ")
          .trim();
      existingMap.set(norm, c);
    }

    const rows: ImportRow[] = parsedCSV.rows.map((raw) => {
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
      const normName = companyName
        .toLowerCase()
        .replace(
          /\b(inc|llc|corp|ltd|lp|plc|co|company|incorporated|corporation|limited|group|holdings)\b\.?/gi,
          ""
        )
        .replace(/[^a-z0-9\s]/g, " ")
        .replace(/\s+/g, " ")
        .trim();

      const existing = existingMap.get(normName);

      if (existing) {
        const mergeFields: string[] = [];
        if (!existing.website && mapped.website) mergeFields.push("website");
        if (!existing.linkedin_url && mapped.linkedin_url)
          mergeFields.push("linkedin_url");
        if (!existing.description && mapped.description)
          mergeFields.push("description");
        if (!existing.headquarters_city && mapped.headquarters_city)
          mergeFields.push("headquarters_city");
        if (!existing.headquarters_state && mapped.headquarters_state)
          mergeFields.push("headquarters_state");
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
          row.status === "ready" || !!row.overrideSubcategoryId;

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

  const handleRowSubcategoryChange = (
    index: number,
    subcategoryId: number
  ) => {
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
                <svg
                  className="w-3.5 h-3.5"
                  fill="none"
                  stroke="currentColor"
                  viewBox="0 0 24 24"
                >
                  <path
                    strokeLinecap="round"
                    strokeLinejoin="round"
                    strokeWidth={2}
                    d="M5 13l4 4L19 7"
                  />
                </svg>
              ) : (
                <span>{s.num}</span>
              )}
              {s.label}
            </div>
            {i < STEPS.length - 1 && (
              <div
                className={`w-8 h-px ${step > s.num ? "bg-green-300" : "bg-[var(--border)]"}`}
              />
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
                ? "border-[var(--primary)] bg-blue-50/50"
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
                    {parsedCSV.rowCount} rows &middot;{" "}
                    {parsedCSV.headers.length} columns
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
                      <tr key={i} className="border-t border-[var(--border)]">
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
                    <option value="skip">&mdash; Skip &mdash;</option>
                    {MAPPABLE_FIELDS.map((f) => (
                      <option key={f.key} value={f.key}>
                        {f.label}
                        {"required" in f && f.required ? " *" : ""}
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
              <span className="font-medium">
                {statusCounts.needs_review}
              </span>{" "}
              needs review
            </span>
            <span className="flex items-center gap-1.5 text-xs">
              <span className="w-2 h-2 rounded-full bg-red-500" />
              <span className="font-medium">{statusCounts.no_match}</span> no
              match
            </span>
            <span className="flex items-center gap-1.5 text-xs">
              <span className="w-2 h-2 rounded-full bg-blue-500" />
              <span className="font-medium">{statusCounts.duplicate}</span>{" "}
              duplicates
            </span>
            {statusCounts.error > 0 && (
              <span className="flex items-center gap-1.5 text-xs">
                <span className="w-2 h-2 rounded-full bg-gray-400" />
                <span className="font-medium">{statusCounts.error}</span>{" "}
                errors
              </span>
            )}
          </div>

          {/* Rows table */}
          <div className="overflow-x-auto rounded-lg border border-[var(--border)]">
            <table className="w-full text-xs">
              <thead>
                <tr className="bg-[var(--surface)]">
                  <th className="px-3 py-2 text-left font-medium text-[var(--muted)] w-8">
                    #
                  </th>
                  <th className="px-3 py-2 text-left font-medium text-[var(--muted)]">
                    Status
                  </th>
                  <th className="px-3 py-2 text-left font-medium text-[var(--muted)]">
                    Company
                  </th>
                  <th className="px-3 py-2 text-left font-medium text-[var(--muted)]">
                    Subcategory
                  </th>
                  <th className="px-3 py-2 text-left font-medium text-[var(--muted)]">
                    Confidence
                  </th>
                  <th className="px-3 py-2 text-left font-medium text-[var(--muted)]">
                    Details
                  </th>
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
                      className="border-t border-[var(--border)] hover:bg-gray-50/50"
                    >
                      <td className="px-3 py-2 text-[var(--muted)]">
                        {i + 1}
                      </td>
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
                            Exists &mdash; merge {row.mergeFields.length} field
                            {row.mergeFields.length !== 1 ? "s" : ""}
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
                            <option value="">&mdash; Select &mdash;</option>
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
                        {row.status === "duplicate" &&
                          row.mergeFields.length > 0 && (
                            <span>
                              Will fill: {row.mergeFields.join(", ")}
                            </span>
                          )}
                        {row.status === "duplicate" &&
                          row.mergeFields.length === 0 && (
                            <span>No new data &mdash; skip</span>
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
                  Ready to import{" "}
                  <strong>
                    {
                      importRows.filter((r) => r.status !== "error")
                        .length
                    }
                  </strong>{" "}
                  companies:
                </p>
                <ul className="mt-2 space-y-1 text-xs text-[var(--muted)]">
                  <li>
                    &bull; {statusCounts.ready} will be created as approved
                  </li>
                  <li>
                    &bull;{" "}
                    {statusCounts.needs_review + statusCounts.no_match} will
                    be created and queued for review
                  </li>
                  <li>
                    &bull; {statusCounts.duplicate} duplicates will be
                    smart-merged
                  </li>
                  {statusCounts.error > 0 && (
                    <li className="text-red-500">
                      &bull; {statusCounts.error} rows with errors will be
                      skipped
                    </li>
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
                  <svg
                    className="w-5 h-5 text-green-600"
                    fill="none"
                    stroke="currentColor"
                    viewBox="0 0 24 24"
                  >
                    <path
                      strokeLinecap="round"
                      strokeLinejoin="round"
                      strokeWidth={2}
                      d="M5 13l4 4L19 7"
                    />
                  </svg>
                  <h4 className="text-sm font-semibold text-green-800">
                    Import Complete
                  </h4>
                </div>
                <div className="grid grid-cols-2 sm:grid-cols-5 gap-3">
                  <div className="text-center p-2 rounded-lg bg-white">
                    <div className="text-lg font-bold text-green-700">
                      {summary.created}
                    </div>
                    <div className="text-xs text-[var(--muted)]">Created</div>
                  </div>
                  <div className="text-center p-2 rounded-lg bg-white">
                    <div className="text-lg font-bold text-blue-700">
                      {summary.merged}
                    </div>
                    <div className="text-xs text-[var(--muted)]">Merged</div>
                  </div>
                  <div className="text-center p-2 rounded-lg bg-white">
                    <div className="text-lg font-bold text-yellow-700">
                      {summary.queued}
                    </div>
                    <div className="text-xs text-[var(--muted)]">Queued</div>
                  </div>
                  <div className="text-center p-2 rounded-lg bg-white">
                    <div className="text-lg font-bold text-gray-500">
                      {summary.skipped}
                    </div>
                    <div className="text-xs text-[var(--muted)]">Skipped</div>
                  </div>
                  <div className="text-center p-2 rounded-lg bg-white">
                    <div className="text-lg font-bold text-red-600">
                      {summary.errors}
                    </div>
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

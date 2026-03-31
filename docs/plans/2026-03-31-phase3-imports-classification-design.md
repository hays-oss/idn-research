# Phase 3: Imports & Classification — Design Doc

**Date:** 2026-03-31
**Status:** Approved

## Overview

Add a CSV import wizard and keyword-based classification engine to the IDN Research admin panel. Supports both bulk onboarding (50-500 companies) and incremental additions (5-20 companies) with automatic subcategory suggestion, smart duplicate merging, and review queue integration.

## Decisions

| Decision | Choice | Rationale |
|----------|--------|-----------|
| Import UX | Single-page wizard (4 steps) | Handles both bulk and incremental; matches existing admin patterns |
| Classification | Keyword matching only | Deterministic, no API cost; AI can be layered on later |
| Duplicate handling | Smart merge | Fill empty fields on existing records; don't overwrite |
| CSV format | Column mapping UI | Flexible for messy data from various sources |

## Architecture

### New Files

| File | Purpose |
|------|---------|
| `src/components/admin/ImportWizard.tsx` | 4-step wizard UI (Upload → Map → Preview → Import) |
| `src/lib/classificationEngine.ts` | Keyword matching against `category_taxonomy` rules |
| `src/lib/csvParser.ts` | PapaParse wrapper with header detection |

### Modified Files

| File | Change |
|------|--------|
| `AdminDashboard.tsx` | Add "Import" tab, pass domains/subcategories/tags to wizard |

### Dependencies

- Add `papaparse` npm package (client-side CSV parsing, ~14KB)
- No other new dependencies

### Database

No schema changes. Uses existing tables:
- `ingestion_runs` — tracks each import batch
- `source_records` — stores raw CSV rows for provenance
- `company_review_queue` — queues unclassified companies for triage

## Wizard Flow

### Step 1: Upload & Parse

- Three input methods: drag-and-drop zone, file picker, paste textarea
- Accepts `.csv`, `.tsv`, `.txt` files
- PapaParse auto-detects delimiter (comma, tab, pipe)
- Preview table shows first 10 rows with detected headers
- Displays: "Found 247 rows with 8 columns"

### Step 2: Column Mapping

Each detected CSV header gets a dropdown to map to a database field.

**Auto-detect rules** (case-insensitive, fuzzy):
- "name", "company", "company name" → `company_name`
- "url", "website", "site" → `website`
- "linkedin", "linkedin url" → `linkedin_url`
- "description", "about", "summary" → `description`
- "type", "company type" → `company_type`
- "city", "hq city" → `headquarters_city`
- "state", "hq state" → `headquarters_state`
- "subcategory", "subcategory id", "primary subcategory" → `primary_subcategory_id`
- "notes" → `notes`

Unmapped columns default to "— Skip —". `company_name` mapping is required to proceed.

Mapping saved to localStorage keyed by column header fingerprint for repeat imports.

### Step 3: Preview & Classify

Full scrollable table of all rows mapped to target fields. Classification engine runs on each row.

**Row status badges:**
- 🟢 **Ready** — has name + subcategory (from CSV or high-confidence keyword match)
- 🟡 **Needs Review** — low-confidence match; suggested subcategory shown with inline override dropdown
- 🔴 **No Match** — no classification found; inline subcategory picker for manual assignment
- 🔵 **Duplicate** — matches existing company by normalized name; shows fields that would be merged

**Bulk actions:**
- "Approve all suggestions" — accept all yellow-row suggestions
- "Set subcategory for selected rows" — batch assign

**Summary bar:** "142 ready, 38 needs review, 12 no match, 15 duplicates"

### Step 4: Import & Report

Creates `ingestion_run` record (source_name from filename, run_type: `csv_import`).

**Processing rules:**
- **New + classified** → INSERT with `review_status: 'approved'`
- **New + unclassified** → INSERT with `review_status: 'pending'`, add to `company_review_queue`
- **Duplicates** → UPDATE only NULL/empty fields on existing record (smart merge)
- **Each row** → raw CSV data stored in `source_records.raw_payload_json`

Progress bar during import. Final summary: "Created 142 | Merged 15 | Queued 38 for review | Skipped 5 errors"

Link to Review Queue for any queued items.

## Classification Engine

### Algorithm

Two-pass keyword matching against `category_taxonomy` table:

**Pass 1 — Direct keyword match:**
1. Normalize company name + description (lowercase, strip Inc/LLC/Corp/Ltd)
2. For each taxonomy tag with `keyword_rules_json`, check for keyword presence
3. Score: keyword hits × weight (name matches = 2x, description = 1x)

**Pass 2 — Synonym expansion:**
1. If Pass 1 found no strong match, check `synonyms_json` arrays
2. Lower confidence (0.5x multiplier vs direct keywords)

**Subcategory assignment:**
1. Group tag matches by parent `subcategory_id`
2. Highest aggregate score → `suggested_primary_subcategory_id`
3. Confidence thresholds: ≥0.7 green (auto-assign), 0.3–0.7 yellow (suggest), <0.3 red (no match)

**Fallback — Name heuristics:**
- Common suffixes: "Pharma" → Pharmacy domain, "Diagnostics" → Diagnostics domain, "Medical" → Medical Devices domain
- Low confidence (0.3) suggestions as last resort

### Graceful Degradation

Tags without `keyword_rules_json` populated fall back to matching the `level_3_tag` name directly against company text. Keyword rules can be incrementally populated through TaxonomyAdmin.

## UI Patterns

- Follows existing admin conventions: `EditModal`, `FormField`, `inputClass`/`selectClass`
- Step indicator bar at top (Step 1 of 4, Step 2 of 4, etc.)
- Back/Next navigation between steps
- All CSS in `App.css` following existing patterns
- Responsive table with horizontal scroll for wide CSVs

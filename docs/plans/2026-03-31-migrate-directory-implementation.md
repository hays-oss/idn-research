# Migrate Legacy Directory to New Taxonomy — Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Migrate ~205 legacy directory companies from `resources` table into the new `companies` table, and rewire the public homepage to display them using the new taxonomy (domains > subcategories hierarchy).

**Architecture:** SQL migration copies legacy resources into companies with mapped subcategory IDs, converts text[] affiliations to junction rows. Frontend changes swap data sources in HomePage.tsx, add hierarchical sidebar navigation in Sidebar.tsx, and update DirectorySection.tsx to render domain-grouped subcategory accordions. Legacy data is deactivated, not deleted.

**Tech Stack:** PostgreSQL (Supabase), Next.js 16, React 19, Tailwind CSS v4, TypeScript

---

### Task 1: Write Migration SQL

**Files:**
- Create: `sql/008_migrate_directory_to_companies.sql`

**Step 1: Write the migration SQL**

This SQL does three things: (a) inserts legacy resources into companies, (b) converts affiliations to junction rows, (c) deactivates legacy directory data.

```sql
-- Migration: Legacy directory resources -> new companies table
-- Safe: uses ON CONFLICT DO NOTHING, does not delete anything

-- Step 1: Map legacy directory categories to new taxonomy subcategories
-- and insert resources as companies
DO $$
DECLARE
  cat_record RECORD;
  res_record RECORD;
  new_company_id uuid;
  org_record RECORD;
  subcat_map jsonb := '{
    "orthopedic-spine-biologics": 1,
    "cardiac-cardiovascular": 2,
    "surgical-robotics": 3,
    "diagnostics-imaging": 15,
    "wound-care-infection-prevention": 12,
    "infusion-iv-therapy": 31,
    "respiratory-anesthesia": 5,
    "diabetes-patient-monitoring": 18,
    "endoscopy-gi": 9,
    "distribution-med-surg-supply": 45
  }';
  mapped_subcat_id bigint;
BEGIN
  -- Loop through all directory-type categories
  FOR cat_record IN
    SELECT id, slug FROM resource_categories
    WHERE category_type = 'directory' AND is_active = true
  LOOP
    -- Get mapped subcategory ID
    mapped_subcat_id := (subcat_map ->> cat_record.slug)::bigint;

    IF mapped_subcat_id IS NULL THEN
      RAISE NOTICE 'No mapping for category slug: %', cat_record.slug;
      CONTINUE;
    END IF;

    -- Loop through all active resources in this category
    FOR res_record IN
      SELECT * FROM resources
      WHERE category_id = cat_record.id AND is_active = true
    LOOP
      -- Insert into companies (skip if name already exists)
      INSERT INTO companies (
        company_name,
        website,
        linkedin_url,
        description,
        company_type,
        primary_subcategory_id,
        review_status,
        confidence_score,
        is_active,
        is_featured,
        source_system,
        notes
      ) VALUES (
        res_record.name,
        res_record.url,
        res_record.linkedin_url,
        res_record.description,
        'vendor',
        mapped_subcat_id,
        'approved',
        1.0000,
        true,
        res_record.is_featured,
        'legacy_migration',
        'Migrated from legacy directory resource ID: ' || res_record.id
      )
      ON CONFLICT (slug) DO NOTHING
      RETURNING id INTO new_company_id;

      -- If insert succeeded (not a duplicate), create affiliation rows
      IF new_company_id IS NOT NULL AND res_record.affiliations IS NOT NULL THEN
        FOREACH org_record IN ARRAY res_record.affiliations
        LOOP
          -- Look up organization by code
          INSERT INTO company_affiliations (company_id, organization_id, membership_type, is_active)
          SELECT new_company_id, o.id, 'member', true
          FROM organizations o
          WHERE o.code = org_record
          ON CONFLICT (company_id, organization_id) DO NOTHING;
        END LOOP;
      END IF;
    END LOOP;
  END LOOP;
END $$;

-- Step 2: Deactivate legacy directory resources (not deleted)
UPDATE resources
SET is_active = false
WHERE category_id IN (
  SELECT id FROM resource_categories WHERE category_type = 'directory'
);

-- Step 3: Deactivate legacy directory categories (not deleted)
UPDATE resource_categories
SET is_active = false
WHERE category_type = 'directory';
```

**Step 2: Verify the SQL logic**

Before running, double-check the slug-to-subcategory mapping by reading the actual category slugs from the database. The slugs in the map above are inferred from category names — they may differ slightly. We'll verify in Task 2.

**Step 3: Commit**

```bash
git add sql/008_migrate_directory_to_companies.sql
git commit -m "feat: add migration SQL for legacy directory to companies table"
```

---

### Task 2: Verify Slugs and Run Migration

**Step 1: Query actual category slugs**

Run in Supabase SQL Editor:
```sql
SELECT slug, name FROM resource_categories WHERE category_type = 'directory' ORDER BY display_order;
```

Compare output to the `subcat_map` keys in the migration SQL. Fix any mismatches.

**Step 2: Also verify subcategory IDs exist**

```sql
SELECT id, name FROM taxonomy_subcategories WHERE id IN (1, 2, 3, 5, 9, 12, 15, 18, 31, 45) ORDER BY id;
```

**Step 3: Run the migration SQL**

Paste `sql/008_migrate_directory_to_companies.sql` into Supabase SQL Editor and execute.

**Step 4: Verify results**

```sql
-- Should show ~205 rows
SELECT COUNT(*) as company_count FROM companies WHERE source_system = 'legacy_migration';

-- Should show affiliation rows
SELECT COUNT(*) as affiliation_count FROM company_affiliations;

-- Should show 0 active directory resources
SELECT COUNT(*) FROM resources r
JOIN resource_categories rc ON r.category_id = rc.id
WHERE rc.category_type = 'directory' AND r.is_active = true;

-- Should show 0 active directory categories
SELECT COUNT(*) FROM resource_categories WHERE category_type = 'directory' AND is_active = true;

-- Spot check a few companies
SELECT company_name, website, primary_subcategory_id, review_status, source_system
FROM companies WHERE source_system = 'legacy_migration' LIMIT 10;
```

---

### Task 3: Add New Types for Public Directory Data

**Files:**
- Modify: `src/lib/types.ts`

**Step 1: Add types for the public directory grouped data**

Add these interfaces after the existing Company Directory types in `types.ts`:

```typescript
// Public directory display types
export interface DirectoryCompany {
  id: string
  company_name: string
  slug: string | null
  website: string | null
  linkedin_url: string | null
  description: string | null
  is_featured: boolean
  affiliations: { code: string; name: string }[]
}

export interface DirectorySubcategory {
  id: number
  name: string
  domain_id: number
  companies: DirectoryCompany[]
}

export interface DirectoryDomain {
  id: number
  name: string
  subcategories: DirectorySubcategory[]
  totalCompanies: number
}
```

**Step 2: Commit**

```bash
git add src/lib/types.ts
git commit -m "feat: add public directory display types"
```

---

### Task 4: Update HomePage.tsx Data Fetching

**Files:**
- Modify: `src/components/HomePage.tsx`

**Step 1: Add imports for new types**

Add to the import block:
```typescript
import {
  ResourceCategory,
  Resource,
  LinkedInInfluencer,
  CategoryWithResources,
  TaxonomyDomain,
  TaxonomySubcategory,
  DirectoryCompany,
  DirectoryDomain,
  DirectorySubcategory,
} from "@/lib/types";
```

**Step 2: Add state for new directory data**

After the existing state declarations, add:
```typescript
const [directoryDomains, setDirectoryDomains] = useState<DirectoryDomain[]>([]);
```

**Step 3: Add new data fetches**

In the `fetchData` function, add four more parallel fetches to the existing Promise.all:
```typescript
supabase.from("taxonomy_domains").select("*").eq("is_active", true).order("display_order"),
supabase.from("taxonomy_subcategories").select("*").eq("is_active", true).order("display_order"),
supabase.from("companies").select("id, company_name, slug, website, linkedin_url, description, is_featured, primary_subcategory_id").eq("is_active", true).eq("review_status", "approved").order("company_name"),
supabase.from("company_affiliations").select("organization_id, company_id, organizations(code, name)").eq("is_active", true),
```

Destructure the new results and build the grouped domain structure:
```typescript
// Build directory domains grouped structure
if (domData && subData && compData) {
  const affMap = new Map<string, { code: string; name: string }[]>();
  if (affData) {
    for (const a of affData) {
      const org = a.organizations as { code: string; name: string } | null;
      if (!org) continue;
      const list = affMap.get(a.company_id) || [];
      list.push({ code: org.code, name: org.name });
      affMap.set(a.company_id, list);
    }
  }

  const domainList: DirectoryDomain[] = domData
    .map((domain: TaxonomyDomain) => {
      const subs: DirectorySubcategory[] = subData
        .filter((s: TaxonomySubcategory) => s.domain_id === domain.id)
        .map((sub: TaxonomySubcategory) => ({
          id: sub.id,
          name: sub.name,
          domain_id: sub.domain_id,
          companies: compData
            .filter((c: any) => c.primary_subcategory_id === sub.id)
            .map((c: any) => ({
              id: c.id,
              company_name: c.company_name,
              slug: c.slug,
              website: c.website,
              linkedin_url: c.linkedin_url,
              description: c.description,
              is_featured: c.is_featured,
              affiliations: affMap.get(c.id) || [],
            })),
        }))
        .filter((sub: DirectorySubcategory) => sub.companies.length > 0);

      return {
        id: domain.id,
        name: domain.name,
        subcategories: subs,
        totalCompanies: subs.reduce((sum, s) => sum + s.companies.length, 0),
      };
    })
    .filter((d: DirectoryDomain) => d.totalCompanies > 0);

  setDirectoryDomains(domainList);
}
```

**Step 4: Add search filtering for directory companies**

Add a new `useMemo` for filtered directory domains (after `filteredDirectoryCategories`):
```typescript
const filteredDirectoryDomains = useMemo<DirectoryDomain[]>(() => {
  const q = searchQuery.toLowerCase().trim();
  if (!q) return directoryDomains;

  return directoryDomains
    .map((domain) => {
      const filteredSubs = domain.subcategories
        .map((sub) => ({
          ...sub,
          companies: sub.companies.filter((c) =>
            c.company_name.toLowerCase().includes(q) ||
            (c.description && c.description.toLowerCase().includes(q)) ||
            sub.name.toLowerCase().includes(q) ||
            domain.name.toLowerCase().includes(q)
          ),
        }))
        .filter((sub) => sub.companies.length > 0);

      return {
        ...domain,
        subcategories: filteredSubs,
        totalCompanies: filteredSubs.reduce((sum, s) => sum + s.companies.length, 0),
      };
    })
    .filter((d) => d.totalCompanies > 0);
}, [directoryDomains, searchQuery]);
```

**Step 5: Update Sidebar props**

Replace the `directoryCategories` prop with the new data:
```tsx
<Sidebar
  categories={resourceCategories}
  directoryDomains={filteredDirectoryDomains}
  resourceCounts={resourceCounts}
  influencerCount={influencers.length}
  activeSlug={activeSlug}
  isOpen={sidebarOpen}
  onClose={() => setSidebarOpen(false)}
/>
```

**Step 6: Update DirectorySection rendering**

Replace the old `filteredDirectoryCategories` rendering with:
```tsx
{filteredDirectoryDomains.length > 0 && (
  <div className="mt-12 pt-8 border-t border-border">
    <DirectorySection
      domains={filteredDirectoryDomains}
      onTrackClick={trackClick}
    />
  </div>
)}
```

**Step 7: Update search results count and no-results conditions**

Replace references to `filteredDirectoryCategories` with `filteredDirectoryDomains`:
- Search count: `filteredDirectoryDomains.reduce((sum, d) => sum + d.totalCompanies, 0)`
- No results: `filteredDirectoryDomains.length === 0`

**Step 8: Remove old directory category logic**

Remove or comment out:
- `directoryCategories` useMemo
- `filteredDirectoryCategories` useMemo
- The old `directoryCategories` prop to Sidebar

**Step 9: Commit**

```bash
git add src/components/HomePage.tsx
git commit -m "feat: wire homepage to new companies/taxonomy tables"
```

---

### Task 5: Update Sidebar.tsx for Hierarchical Directory

**Files:**
- Modify: `src/components/Sidebar.tsx`

**Step 1: Update props interface**

Replace `directoryCategories: ResourceCategory[]` with:
```typescript
import { ResourceCategory, DirectoryDomain } from "@/lib/types";

// In the props:
directoryDomains: DirectoryDomain[];
```

Remove `directoryCategories` from the destructured props.

**Step 2: Replace the Company Directory section**

Replace the flat `directoryCategories.map` block (lines ~244-290) with a two-level collapsible tree:

```tsx
{/* ====== COMPANY DIRECTORY SECTION ====== */}
{directoryDomains.length > 0 && (
  <>
    <div className="mt-6 mb-2 flex items-center justify-between px-3">
      <div className="text-[10px] font-semibold uppercase tracking-wider text-muted/60">
        Company Directory
      </div>
      <button
        onClick={() => setDirectoryExpanded(!directoryExpanded)}
        className="text-muted/40 hover:text-muted transition-colors"
      >
        <svg
          className={`h-3 w-3 transition-transform ${
            directoryExpanded ? "rotate-90" : ""
          }`}
          fill="none"
          stroke="currentColor"
          viewBox="0 0 24 24"
        >
          <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 5l7 7-7 7" />
        </svg>
      </button>
    </div>

    {directoryExpanded && (
      <nav className="space-y-0.5">
        {directoryDomains.map((domain) => (
          <DomainNavGroup
            key={domain.id}
            domain={domain}
            activeSlug={activeSlug}
            onNavigate={handleClick}
          />
        ))}
      </nav>
    )}
  </>
)}
```

**Step 3: Create the DomainNavGroup component**

Add this component inside Sidebar.tsx (before the default export):

```tsx
function DomainNavGroup({
  domain,
  activeSlug,
  onNavigate,
}: {
  domain: DirectoryDomain;
  activeSlug: string | null;
  onNavigate: (slug: string) => void;
}) {
  const [expanded, setExpanded] = useState(false);

  // Check if any child subcategory is active
  const hasActiveChild = domain.subcategories.some(
    (sub) => activeSlug === `directory-sub-${sub.id}`
  );

  return (
    <div>
      <button
        onClick={() => setExpanded(!expanded)}
        className={`flex w-full items-center justify-between rounded-md px-3 py-2 text-left text-sm transition-colors ${
          hasActiveChild && !expanded
            ? "bg-primary/10 text-primary font-semibold"
            : "text-foreground/80 hover:bg-surface hover:text-foreground"
        }`}
      >
        <div className="flex items-center gap-1.5">
          <svg
            className={`h-3 w-3 shrink-0 text-muted transition-transform ${
              expanded ? "rotate-90" : ""
            }`}
            fill="none"
            stroke="currentColor"
            viewBox="0 0 24 24"
          >
            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 5l7 7-7 7" />
          </svg>
          <span className="truncate">{domain.name}</span>
        </div>
        <span className="shrink-0 ml-2 rounded-full bg-surface px-1.5 py-0.5 text-[10px] font-medium text-muted">
          {domain.totalCompanies}
        </span>
      </button>

      {expanded && (
        <div className="ml-4 mt-0.5 space-y-0.5 border-l border-border pl-2">
          {domain.subcategories.map((sub) => {
            const slug = `directory-sub-${sub.id}`;
            const isActive = activeSlug === slug;
            return (
              <button
                key={sub.id}
                onClick={() => onNavigate(slug)}
                className={`flex w-full items-center justify-between rounded-md px-2.5 py-1.5 text-left text-xs transition-colors ${
                  isActive
                    ? "bg-primary/10 text-primary font-semibold"
                    : "text-foreground/60 hover:bg-surface hover:text-foreground"
                }`}
              >
                <span className="truncate">{sub.name}</span>
                <span
                  className={`shrink-0 ml-2 rounded-full px-1.5 py-0.5 text-[10px] font-medium ${
                    isActive ? "bg-primary/20 text-primary" : "bg-surface text-muted"
                  }`}
                >
                  {sub.companies.length}
                </span>
              </button>
            );
          })}
        </div>
      )}
    </div>
  );
}
```

**Step 4: Commit**

```bash
git add src/components/Sidebar.tsx
git commit -m "feat: hierarchical domain/subcategory sidebar for company directory"
```

---

### Task 6: Update DirectorySection.tsx for New Data Shape

**Files:**
- Modify: `src/components/DirectorySection.tsx`

**Step 1: Rewrite component for domain-grouped data**

Replace the entire component with:

```tsx
"use client";

import { useState } from "react";
import { DirectoryDomain } from "@/lib/types";
import CompanyCard from "./CompanyCard";

export default function DirectorySection({
  domains,
  onTrackClick,
}: {
  domains: DirectoryDomain[];
  onTrackClick: (id: string) => void;
}) {
  const [expandedSlug, setExpandedSlug] = useState<string | null>(null);

  const totalCompanies = domains.reduce((sum, d) => sum + d.totalCompanies, 0);
  const totalSubcategories = domains.reduce((sum, d) => sum + d.subcategories.length, 0);

  function toggleSubcategory(slug: string) {
    setExpandedSlug((prev) => (prev === slug ? null : slug));
  }

  if (domains.length === 0) return null;

  return (
    <div id="company-directory" className="scroll-mt-20">
      <div className="mb-6">
        <h2 className="text-xl font-bold text-foreground">Company Directory</h2>
        <p className="text-sm text-muted mt-1">
          {totalCompanies} companies across {totalSubcategories} market segments
        </p>
      </div>

      <div className="space-y-8">
        {domains.map((domain) => (
          <div key={domain.id}>
            {/* Domain heading */}
            <div className="mb-3 flex items-center gap-3">
              <h3 className="text-sm font-semibold text-foreground/70 uppercase tracking-wide">
                {domain.name}
              </h3>
              <span className="rounded-full bg-surface px-2 py-0.5 text-[10px] font-medium text-muted">
                {domain.totalCompanies}
              </span>
            </div>

            {/* Subcategory accordions */}
            <div className="space-y-2">
              {domain.subcategories.map((sub) => {
                const slug = `directory-sub-${sub.id}`;
                const isExpanded = expandedSlug === slug;
                return (
                  <div
                    key={sub.id}
                    id={slug}
                    className="scroll-mt-20 rounded-lg border border-border bg-white overflow-hidden"
                  >
                    <button
                      onClick={() => toggleSubcategory(slug)}
                      className="flex w-full items-center justify-between px-5 py-3.5 text-left transition-colors hover:bg-surface/50"
                    >
                      <div className="flex items-center gap-3">
                        <svg
                          className={`h-4 w-4 shrink-0 text-muted transition-transform duration-200 ${
                            isExpanded ? "rotate-90" : ""
                          }`}
                          fill="none"
                          stroke="currentColor"
                          viewBox="0 0 24 24"
                        >
                          <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 5l7 7-7 7" />
                        </svg>
                        <span className="text-sm font-semibold text-foreground">
                          {sub.name}
                        </span>
                      </div>
                      <span className="rounded-full bg-surface px-2.5 py-0.5 text-xs font-medium text-muted">
                        {sub.companies.length}
                      </span>
                    </button>

                    {isExpanded && (
                      <div className="border-t border-border px-5 py-4 bg-background/50">
                        <div className="grid gap-2 sm:grid-cols-2 lg:grid-cols-3">
                          {sub.companies.map((company) => (
                            <CompanyCard
                              key={company.id}
                              company={company}
                              onTrackClick={onTrackClick}
                            />
                          ))}
                        </div>
                      </div>
                    )}
                  </div>
                );
              })}
            </div>
          </div>
        ))}
      </div>
    </div>
  );
}
```

**Step 2: Commit**

```bash
git add src/components/DirectorySection.tsx
git commit -m "feat: update DirectorySection for domain-grouped taxonomy data"
```

---

### Task 7: Create CompanyCard Component

**Files:**
- Create: `src/components/CompanyCard.tsx`

**Step 1: Create the component**

This mirrors ResourceCard's layout but uses the DirectoryCompany type:

```tsx
"use client";

import { DirectoryCompany } from "@/lib/types";

const AFFILIATION_STYLES: Record<string, { bg: string; text: string }> = {
  IHES: { bg: "bg-[#1a5632]", text: "text-white" },
  CPES: { bg: "bg-[#1a2b5f]", text: "text-white" },
  CSCE: { bg: "bg-[#c45a1a]", text: "text-white" },
  MUIA: { bg: "bg-[#1a1a2e]", text: "text-white" },
};

export default function CompanyCard({
  company,
  onTrackClick,
}: {
  company: DirectoryCompany;
  onTrackClick: (id: string) => void;
}) {
  const hasAffiliations = company.affiliations && company.affiliations.length > 0;
  const hasLinkedIn = !!company.linkedin_url;

  return (
    <div className="group rounded-lg border border-border bg-white px-4 py-2.5 transition-all hover:border-primary/30 hover:shadow-sm">
      <div className="flex items-center justify-between">
        <a
          href={company.website || "#"}
          target="_blank"
          rel="noopener noreferrer"
          onClick={() => onTrackClick(company.id)}
          className="min-w-0 flex-1"
        >
          <div className="flex items-center gap-2">
            <span className="text-sm font-medium text-foreground group-hover:text-primary truncate">
              {company.company_name}
            </span>
            {hasAffiliations && (
              <div className="flex gap-1 shrink-0">
                {company.affiliations.map((aff) => {
                  const style = AFFILIATION_STYLES[aff.code];
                  if (!style) return null;
                  return (
                    <span
                      key={aff.code}
                      className={`inline-flex items-center rounded px-1.5 py-0.5 text-[9px] font-bold tracking-wide ${style.bg} ${style.text}`}
                      title={aff.name}
                    >
                      {aff.code}
                    </span>
                  );
                })}
              </div>
            )}
          </div>
          {company.description && (
            <p className="text-xs text-muted truncate mt-0.5">
              {company.description}
            </p>
          )}
        </a>
        <div className="flex items-center gap-2 shrink-0 ml-3">
          {hasLinkedIn && (
            <a
              href={company.linkedin_url!}
              target="_blank"
              rel="noopener noreferrer"
              onClick={(e) => e.stopPropagation()}
              className="text-[#0A66C2] hover:text-[#004182] transition-colors"
              title="View on LinkedIn"
            >
              <svg className="h-4 w-4" fill="currentColor" viewBox="0 0 24 24">
                <path d="M20.447 20.452h-3.554v-5.569c0-1.328-.027-3.037-1.852-3.037-1.853 0-2.136 1.445-2.136 2.939v5.667H9.351V9h3.414v1.561h.046c.477-.9 1.637-1.85 3.37-1.85 3.601 0 4.267 2.37 4.267 5.455v6.286zM5.337 7.433a2.062 2.062 0 01-2.063-2.065 2.064 2.064 0 112.063 2.065zm1.782 13.019H3.555V9h3.564v11.452zM22.225 0H1.771C.792 0 0 .774 0 1.729v20.542C0 23.227.792 24 1.771 24h20.451C23.2 24 24 23.227 24 22.271V1.729C24 .774 23.2 0 22.222 0h.003z" />
              </svg>
            </a>
          )}
          {company.website && (
            <a
              href={company.website}
              target="_blank"
              rel="noopener noreferrer"
              onClick={() => onTrackClick(company.id)}
            >
              <svg
                className="h-3.5 w-3.5 text-muted/50 group-hover:text-primary transition-colors"
                fill="none"
                stroke="currentColor"
                viewBox="0 0 24 24"
              >
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14" />
              </svg>
            </a>
          )}
        </div>
      </div>
    </div>
  );
}
```

**Step 2: Commit**

```bash
git add src/components/CompanyCard.tsx
git commit -m "feat: add CompanyCard component for new directory"
```

---

### Task 8: Build, Test Locally, Deploy

**Step 1: Build**

```bash
cd /c/Users/Hays/idn-research && npx next build
```

Expected: Clean build, no TypeScript errors.

**Step 2: Test locally**

```bash
npm start
```

Verify:
- Homepage loads without errors
- Sidebar shows hierarchical Company Directory (domains > subcategories)
- Clicking a subcategory scrolls to its accordion
- Expanding an accordion shows company cards
- Affiliation badges appear on company cards
- LinkedIn icons work
- Search filters both resources and directory companies
- Resource sections and LinkedIn Influencers still work

**Step 3: Deploy**

```bash
npx vercel --prod
```

**Step 4: Final commit**

```bash
git add -A
git commit -m "feat: migrate legacy directory to new taxonomy - complete"
```

---

### Task Summary

| Task | Description | Estimated Time |
|------|-------------|---------------|
| 1 | Write migration SQL | 5 min |
| 2 | Verify slugs and run migration in Supabase | 5 min |
| 3 | Add new TypeScript types | 2 min |
| 4 | Update HomePage.tsx data fetching | 10 min |
| 5 | Update Sidebar.tsx for hierarchy | 10 min |
| 6 | Update DirectorySection.tsx | 5 min |
| 7 | Create CompanyCard component | 5 min |
| 8 | Build, test, deploy | 5 min |

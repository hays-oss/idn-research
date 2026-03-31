# Migrate Legacy Directory to New Taxonomy

## Context

The public-facing Company Directory on hayswaldrop.com currently reads from the legacy `resources` and `resource_categories` tables (10 directory categories, ~205 companies stored as resources). A new normalized taxonomy (14 domains, 84 subcategories, 351 tags) and `companies` table have been built and are live in the admin panel, but the public site doesn't use them yet.

## Goal

Migrate the ~205 existing directory companies into the new `companies` table, rewire the public homepage to read from the new tables, and present a two-level sidebar (domains > subcategories) instead of a flat list.

## Data Migration

### Category Mapping

Map each of the 10 legacy directory categories to one new taxonomy subcategory (best-fit):

| Legacy Category | New Subcategory (approx) |
|---|---|
| Orthopedic / Spine / Biologics | Orthopedic |
| Cardiac / Cardiovascular | Cardiovascular |
| Surgical / Robotics | Surgical |
| Diagnostics / Imaging | Core Lab & Diagnostics (or Imaging) |
| Wound Care / Infection Prevention | Wound Care |
| Infusion / IV Therapy | IV Therapy & Infusion |
| Respiratory / Anesthesia | Respiratory |
| Diabetes / Patient Monitoring | Patient Monitoring |
| Endoscopy / GI | Endoscopy / GI |
| Distribution / Med-Surg Supply | Distributors |

Exact subcategory IDs to be resolved from `taxonomy_subcategories` at migration time.

### Company Migration

For each legacy resource where `category_type = 'directory'`:

- `name` → `company_name`
- `url` → `website`
- `description` → `description`
- `linkedin_url` → `linkedin_url`
- `is_active` → `is_active`
- `is_featured` → `is_featured`
- `tags` text[] → `company_tags` junction rows where matching L3 tags exist
- `affiliations` text[] → `company_affiliations` junction rows (match org code to `organizations.code`)
- Set `review_status = 'approved'`
- Set `source_system = 'legacy_migration'`
- Set `company_type = 'vendor'` (default; can be refined later)
- Set `confidence_score = 1.0` (manually curated data)

### Legacy Data Handling

- Set `is_active = false` on all directory-type resources (not deleted)
- Set `is_active = false` on all directory-type resource_categories (not deleted)
- Legacy resource-type categories and resources remain untouched

## Frontend Changes

### HomePage.tsx

- Add fetches for `taxonomy_domains`, `taxonomy_subcategories`, `companies` (where `is_active = true` and `review_status = 'approved'`), `company_affiliations`, and `organizations`
- Build grouped data structure: domains → subcategories → companies
- Pass new data to Sidebar and DirectorySection
- Resource sections and LinkedIn Influencers remain unchanged

### Sidebar.tsx

- Replace flat `directoryCategories` list with two-level collapsible tree
- Level 1: Domain names (collapsible, with total company count)
- Level 2: Subcategory names (clickable, with company count)
- Only show domains/subcategories that have at least one company
- Maintain existing expand/collapse UX pattern

### DirectorySection.tsx

- Accept new data shape: domains with nested subcategories with nested companies
- Render domain headings as visual separators
- Render subcategory accordions underneath each domain (same expand/collapse pattern)
- Company cards remain the same (name, URL, description, tags, affiliation badges)

### Components That Stay the Same

- ResourceCard (already displays all needed fields)
- CategorySection (resource-type content)
- InfluencerCard
- SubmitResourceForm
- Header
- Admin panel (already wired to new tables)

## Future (Phase 4)

- Dedicated `/directory` route with advanced filtering (domain, type, affiliation, state, search)
- Separate from homepage to reduce crowding as company count grows

## Verification

1. Run migration SQL — confirm ~205 rows in `companies`, affiliations created, old resources deactivated
2. Public homepage loads with two-level sidebar showing domains > subcategories
3. Clicking a subcategory scrolls to its accordion section
4. Company cards show name, URL, description, affiliation badges
5. Search still works across both resources and companies
6. Resource sections and LinkedIn Influencers unaffected
7. Admin panel still shows all companies with correct data

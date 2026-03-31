# Phase 4: Dedicated /directory Page — Design

## Overview

A dedicated `/directory` route with a two-panel layout for browsing 572+ healthcare companies across 14 domains and 57 subcategories. Replaces the current homepage-embedded directory with a full-featured, filterable, shareable directory page.

## Architecture

### New Route
- `src/app/directory/page.tsx` — Server component wrapper

### New Components
- `src/components/directory/DirectoryPage.tsx` — Main client component (state, fetching, filter logic)
- `src/components/directory/FilterSidebar.tsx` — Left panel with all filter controls
- `src/components/directory/CompanyGrid.tsx` — Grouped company card grid
- `src/components/directory/ExpandableCompanyCard.tsx` — Click-to-expand card

### Modified Components
- `src/components/HomePage.tsx` — Replace full directory section with compact preview + link

## Layout

Two-panel, responsive:
- **Left filter sidebar** (280px, sticky, scrollable) — collapses to top bar on mobile
- **Main content area** (flex-1) — company cards in single-column list grouped by domain/subcategory

## Filter System

All filters compose with AND logic.

| Filter | Type | URL Param | Example |
|--------|------|-----------|---------|
| Text search | Debounced input (300ms) | `q` | `?q=medtronic` |
| Domain | Single select accordion | `domain` | `?domain=3` |
| Subcategory | Multi-select checkboxes | `sub` | `?sub=2,5` |
| Organization | Multi-select checkboxes (4) | `org` | `?org=IHES,CPES` |
| Tags | Search-to-filter chip picker | `tag` | `?tag=12,45` |

### URL Sync
- `useSearchParams` syncs filter state to URL query params
- Every filter change does `router.replace()` (no history pollution)
- Page loads with filters pre-applied from URL — shareable/bookmarkable
- "Clear all filters" resets to `/directory`

### Filter Sidebar UX
- Search box at top
- "Organizations" section: 4 checkboxes with colored badges
- "Domains" section: Accordion — click to expand, shows subcategory checkboxes with counts
- "Tags" section: Search-to-filter chip picker (type to search 351 tags, click to add)
- Active filter count badges on section headers
- Sticky result count at bottom

## Company Cards

### Collapsed (default)
- Company name (bold), one-line truncated description
- Org affiliation badges (colored pills)
- LinkedIn + website icons (right-aligned)

### Expanded (click to toggle)
- Full description
- All L3 tags as muted chips
- Company type, headquarters city/state
- LinkedIn and website as full links
- Smooth CSS max-height transition
- Only one card expanded at a time

## Grid Layout
- Cards grouped under domain → subcategory headings
- Filtered views show only matching groups
- Unfiltered: domains collapsed with subcategory count, click to expand
- Subcategory headings show company count badges
- Single-column list within subcategories

## Homepage Change
- Replace full directory section with compact preview
- Show 3-4 featured companies + domain/company counts
- "Explore Full Directory →" link to `/directory`

## Data Fetching
- Same Supabase queries as current HomePage directory fetch
- Additionally fetch `company_tags` for tag display on expanded cards
- Fetch `category_taxonomy` for tag filter options

## Reuses
- Existing Supabase client
- Existing types (DirectoryDomain, DirectorySubcategory, DirectoryCompany)
- AFFILIATION_STYLES branding colors
- Tailwind CSS styling patterns

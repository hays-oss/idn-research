# Meeting Calendar — Design Document

**Date:** 2026-05-12
**Status:** Approved

## Summary

Add a public Meeting Calendar page to IDN Research that aggregates conference dates and locations from 45+ healthcare industry meeting organizations into a filterable, searchable calendar view. Includes admin tools for editing meetings and an AI-powered scraper to populate dates from org websites.

## Data Model

New Supabase table: `meeting_dates`

| Column | Type | Purpose |
|--------|------|---------|
| `id` | uuid (PK) | Primary key, default gen_random_uuid() |
| `resource_id` | uuid (FK → resources) | Links to existing directory entry, nullable |
| `name` | text NOT NULL | Meeting name |
| `org_short` | text | Organization abbreviation |
| `start_date` | date | Conference start date |
| `end_date` | date | Conference end date |
| `city` | text | City name |
| `state_country` | text | State abbreviation or country code |
| `category` | text | Primary category (pharmacy, supply-chain, c-suite, technology, clinical, revenue-cycle, facilities, nursing, workforce) |
| `tags` | text[] | Additional topic tags |
| `website_url` | text | Direct link to conference page |
| `source_url` | text | URL the scraper checks |
| `last_verified` | timestamptz | When data was last confirmed |
| `notes` | text | Admin notes |
| `created_at` | timestamptz | Default now() |
| `updated_at` | timestamptz | Default now(), auto-updated |

RLS policy: public SELECT, authenticated INSERT/UPDATE/DELETE.

Standalone table (not columns on `resources`) because: meetings can have multiple events per year, new meetings can be added that aren't in the directory, and date data has a different refresh lifecycle.

## Public Calendar Page

Route: `/calendar`

### Architecture
- Server component fetches all `meeting_dates` from Supabase, ordered by start_date
- Client component `CalendarView` handles interactivity (filters, search, view switching)
- ISR revalidation every 3600 seconds
- SEO metadata for discoverability

### Views
1. **Timeline** (default) — events grouped by month, each card showing: date block, color-coded category bar, meeting name + org, topic tags, location chip with pin icon, days-until countdown
2. **Grid** — card layout with category badge, date range, location chip, duration
3. **Map** — placeholder for future (US map with conference location pins)

### Filtering & Search
- Category filter chips: All, Pharmacy, Supply Chain, C-Suite/Executive, Technology, Clinical, Revenue Cycle, Facilities, Nursing
- Each category has a distinct color (pharmacy=purple, supply-chain=teal, c-suite=green, technology=blue, clinical=red, revenue-cycle=amber, facilities=emerald, nursing=pink)
- Search box filters across meeting name, org, city, state, and tags

### Sidebar
- "Next Up" panel showing nearest 6 upcoming events with countdowns
- Sticky on desktop, hidden on mobile

### Cross-links
- Meeting cards link to conference website (website_url)
- If resource_id set, secondary link to IDN Research directory entry
- Existing /category/industry-meetings page gets a "View the Meeting Calendar →" banner

### Navigation
- Add "Meeting Calendar" to site navbar between "Directory" and "Company Directory"

## Admin Dashboard

New section in existing `/admin` route.

### Meeting List
- Table: name, dates, city, category, last verified
- Sortable columns
- "Add Meeting" button
- Per-row Edit and Delete actions
- "Refresh All Dates" button to trigger scraper

### Add/Edit Form
- All fields from data model
- Category as dropdown
- Optional resource_id linking (dropdown of Industry Meetings resources)
- Save/Cancel

### Scraper ("Refresh All Dates")
1. Button triggers Supabase Edge Function
2. Edge Function fetches each meeting's source_url
3. Page text sent to Claude API for date/location extraction
4. If dates not found on homepage, AI follows "Events"/"Conference"/"Annual Meeting" links (up to 2 levels deep)
5. Results returned to admin UI as a review table
6. Shows current vs. scraped values with diffs highlighted
7. Admin approves/rejects per row, then saves
8. Meetings where scraper failed get flagged "needs manual entry"

Scraper never auto-saves — always human-in-the-loop review.

## Styling

- Tailwind CSS matching existing IDN Research design system
- Dark navy (#1a1a2e) + gold (#c5a84c) branding
- Inter font family
- Responsive: sidebar hidden on mobile, cards stack single-column

## Technical Decisions

- **Standalone table vs. columns on resources**: Standalone — different lifecycle, supports adding meetings not in directory, supports multiple events per org per year
- **Client vs. server filtering**: Client-side — 45-100 meetings is small enough, avoids round-trips for filter/search
- **Scraper as Edge Function**: Runs server-side with API key, avoids CORS issues, can follow links
- **Review before save**: Prevents bad data from site redesigns or scraper failures

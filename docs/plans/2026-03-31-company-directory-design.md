# Company Directory Feature

## Problem
IDN Research is a link directory. To become a real industry intelligence platform, it needs a company directory organized by medical device/healthcare market segments.

## Solution
Add a "Company Directory" section with accordion-style categories. Uses the same tables as resources but distinguished by a `category_type` column. Populated initially via web research, enriched later from Mission Control supplier data.

## Data Model
- Add `category_type` column to `resource_categories`: 'resource' (default) or 'directory'
- Directory entries use the same `resources` table (name, url, tags, etc.)
- No new tables needed

## Initial Categories (10)
1. Orthopedic / Spine / Biologics
2. Cardiac / Cardiovascular
3. Surgical / Robotics
4. Diagnostics / Imaging
5. Wound Care / Infection Prevention
6. Infusion / IV Therapy
7. Respiratory / Anesthesia
8. Diabetes / Patient Monitoring
9. Endoscopy / GI
10. Distribution / Med-Surg Supply

## UI Design
- Sidebar split: RESOURCES header (existing) + COMPANY DIRECTORY header (new)
- Main area: accordion sections, one expanded at a time
- Expanded category shows 3-column grid of company cards
- Alphabetical within each category
- Search works across both resources and directory

## Future
- Sync tagged suppliers from Mission Control
- Expand to 50+ categories (services, solutions, consulting, etc.)

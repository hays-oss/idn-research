# Meeting Calendar Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Add a public `/calendar` page to IDN Research showing all 45+ healthcare industry meetings with dates, locations, category filters, and an admin interface for managing entries and running a date-scraping tool.

**Architecture:** New `meeting_dates` Supabase table (standalone from `resources`), server-fetched and client-filtered calendar page with Timeline/Grid views, new admin tab for CRUD + scraper review UI. Scraper is a Supabase Edge Function that uses Claude API to extract dates from org websites.

**Tech Stack:** Next.js 16 App Router, Supabase PostgreSQL + Edge Functions, Tailwind CSS 4, TypeScript 5, Anthropic Claude API (for scraper)

**Project Root:** `C:\Users\Hays\idn-research`

---

## Task 1: Database Migration — Create `meeting_dates` Table

**Files:**
- Create: `sql/011_meeting_dates.sql`

**Step 1: Write the migration SQL**

```sql
-- Meeting Calendar — Conference dates and locations
-- Run in Supabase SQL Editor

CREATE TABLE meeting_dates (
  id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  resource_id uuid REFERENCES resources(id) ON DELETE SET NULL,
  name text NOT NULL,
  org_short text,
  start_date date,
  end_date date,
  city text,
  state_country text,
  category text CHECK (category IN (
    'pharmacy', 'supply-chain', 'c-suite', 'technology',
    'clinical', 'revenue-cycle', 'facilities', 'nursing', 'workforce'
  )),
  tags text[] DEFAULT '{}',
  website_url text,
  source_url text,
  last_verified timestamptz,
  notes text,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);

-- Indexes
CREATE INDEX idx_meeting_dates_start ON meeting_dates(start_date);
CREATE INDEX idx_meeting_dates_category ON meeting_dates(category);
CREATE INDEX idx_meeting_dates_resource ON meeting_dates(resource_id);

-- Updated_at trigger (reuses existing function from 001)
CREATE TRIGGER trg_meeting_dates_updated
  BEFORE UPDATE ON meeting_dates
  FOR EACH ROW EXECUTE FUNCTION update_updated_at();

-- RLS
ALTER TABLE meeting_dates ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Public read meeting_dates" ON meeting_dates
  FOR SELECT USING (true);

CREATE POLICY "Admin write meeting_dates" ON meeting_dates
  FOR ALL USING (auth.role() = 'authenticated')
  WITH CHECK (auth.role() = 'authenticated');
```

**Step 2: Run migration in Supabase SQL Editor**

Copy the SQL above and execute it in the Supabase dashboard SQL Editor for project `aszhjzseobgadbgxaosq`.

**Step 3: Commit**

```bash
git add sql/011_meeting_dates.sql
git commit -m "feat: add meeting_dates table migration"
```

---

## Task 2: Seed Initial Meeting Data

**Files:**
- Create: `sql/012_seed_meeting_dates.sql`

**Step 1: Write seed data**

Seed the 45 meetings from the Industry Meetings directory with their names, orgs, categories, tags, and website URLs. Dates will be left null initially (populated by scraper or manual entry). Link to existing `resources` rows where possible.

```sql
-- Seed meeting_dates from existing Industry Meetings resources
-- Dates are null — will be populated by scraper or manual entry

INSERT INTO meeting_dates (name, org_short, category, tags, website_url, source_url) VALUES
  ('AACP Pharmacy Education Conference', 'AACP', 'pharmacy', '{"PHARMACY","EDUCATION"}', 'https://www.aacp.org', 'https://www.aacp.org'),
  ('AAMI Annual Conference', 'AAMI', 'technology', '{"TECHNOLOGY","MEDICAL DEVICES"}', 'https://www.aami.org', 'https://www.aami.org'),
  ('AAOS Annual Meeting', 'AAOS', 'clinical', '{"ORTHOPEDIC","CLINICAL"}', 'https://www.aaos.org', 'https://www.aaos.org'),
  ('AAPPR Conference', 'AAPPR', 'workforce', '{"PHYSICIAN RECRUITMENT","WORKFORCE"}', 'https://aappr.org', 'https://aappr.org'),
  ('ACHE Congress on Healthcare Leadership', 'ACHE', 'c-suite', '{"LEADERSHIP","C-SUITE"}', 'https://congress.ache.org', 'https://congress.ache.org'),
  ('ACOG Annual Meeting', 'ACOG', 'clinical', '{"OB/GYN","CLINICAL"}', 'https://www.acog.org', 'https://www.acog.org'),
  ('AHIMA Annual Conference', 'AHIMA', 'technology', '{"DATA ANALYTICS","HIM"}', 'https://www.ahima.org', 'https://www.ahima.org'),
  ('AHRMM Annual Conference', 'AHRMM', 'supply-chain', '{"SUPPLY CHAIN","MATERIALS"}', 'https://www.ahrmm.org', 'https://www.ahrmm.org'),
  ('AHVAP Annual Conference', 'AHVAP', 'supply-chain', '{"VALUE ANALYSIS","SUPPLY CHAIN"}', 'https://www.ahvap.org', 'https://www.ahvap.org'),
  ('ANAE Annual Conference', 'ANAE', 'supply-chain', '{"NATIONAL ACCOUNTS","SUPPLY CHAIN"}', 'https://www.naesales.org', 'https://www.naesales.org'),
  ('AONL Conference', 'AONL', 'nursing', '{"NURSING","LEADERSHIP"}', 'https://www.aonl.org', 'https://www.aonl.org'),
  ('AORN Global Surgical Conference', 'AORN', 'nursing', '{"PERIOPERATIVE","NURSING"}', 'https://www.aorn.org', 'https://www.aorn.org'),
  ('APIC Annual Conference', 'APIC', 'clinical', '{"INFECTION PREVENTION","CLINICAL"}', 'https://www.apic.org', 'https://www.apic.org'),
  ('ASCA Annual Meeting', 'ASCA', 'clinical', '{"AMBULATORY","ASC"}', 'https://www.ascassociation.org', 'https://www.ascassociation.org'),
  ('ASCP Annual Meeting', 'ASCP', 'clinical', '{"PATHOLOGY","CLINICAL"}', 'https://www.ascp.org', 'https://www.ascp.org'),
  ('Asembia Specialty Pharmacy Summit', 'Asembia', 'pharmacy', '{"SPECIALTY PHARMACY"}', 'https://www.asembia.com', 'https://www.asembia.com'),
  ('ASH Annual Meeting', 'ASH', 'clinical', '{"HEMATOLOGY","CLINICAL"}', 'https://www.hematology.org', 'https://www.hematology.org'),
  ('ASHHRA Annual Conference', 'ASHHRA', 'workforce', '{"HR","WORKFORCE"}', 'https://www.ashhra.org', 'https://www.ashhra.org'),
  ('ASHP Midyear Clinical Meeting', 'ASHP', 'pharmacy', '{"PHARMACY","CLINICAL"}', 'https://midyear.ashp.org', 'https://midyear.ashp.org'),
  ('BRINetwork OR Management Summit', 'BRINetwork', 'clinical', '{"OR MANAGEMENT","HOSPITAL"}', 'https://www.brinetwork.com', 'https://www.brinetwork.com'),
  ('CPES Annual Meeting', 'CPES', 'pharmacy', '{"PHARMACY","EXECUTIVES"}', 'https://www.cpesllc.com', 'https://www.cpesllc.com'),
  ('CSCE Annual Meeting', 'CSCE', 'supply-chain', '{"SUPPLY CHAIN","EXECUTIVES"}', 'https://www.cscellc.com', 'https://www.cscellc.com'),
  ('Federation of American Hospitals', 'FAH', 'c-suite', '{"HOSPITAL","POLICY"}', 'https://www.fah.org', 'https://www.fah.org'),
  ('FIME Trade Show', 'FIME', 'technology', '{"INTERNATIONAL","MED TECH"}', 'https://www.fimeshow.com', 'https://www.fimeshow.com'),
  ('HCP Health Connect Partners', 'HCP', 'supply-chain', '{"SUPPLY CHAIN","HEALTHCARE"}', 'https://www.healthconnectpartners.com', 'https://www.healthconnectpartners.com'),
  ('Healthcare Facilities Symposium', 'HFS', 'facilities', '{"FACILITIES","DESIGN"}', 'https://www.hcarefacilities.com', 'https://www.hcarefacilities.com'),
  ('HFMA Annual Conference', 'HFMA', 'revenue-cycle', '{"FINANCE","REVENUE CYCLE"}', 'https://www.hfma.org', 'https://www.hfma.org'),
  ('HIDA Streamlining Healthcare Conference', 'HIDA', 'supply-chain', '{"DISTRIBUTION","SUPPLY CHAIN"}', 'https://www.hida.org', 'https://www.hida.org'),
  ('HIMSS Global Conference', 'HIMSS', 'technology', '{"HEALTH IT","DIGITAL HEALTH"}', 'https://www.himss.org', 'https://www.himss.org'),
  ('HLTH USA', 'HLTH', 'technology', '{"INNOVATION","DIGITAL HEALTH"}', 'https://www.hlth.com', 'https://www.hlth.com'),
  ('IDN Summit & Reverse Expo', 'IDN Summit', 'supply-chain', '{"IDN","C-SUITE"}', 'https://www.idnsummit.com', 'https://www.idnsummit.com'),
  ('IHES Spring Summit', 'IHES', 'c-suite', '{"C-SUITE","EXECUTIVE"}', 'https://www.ihesllc.com', 'https://www.ihesllc.com'),
  ('IHES Fall Summit', 'IHES', 'c-suite', '{"C-SUITE","EXECUTIVE"}', 'https://www.ihesllc.com', 'https://www.ihesllc.com'),
  ('J.P. Morgan Healthcare Conference', 'J.P. Morgan', 'c-suite', '{"STRATEGY","HEALTHCARE"}', 'https://www.jpmorgan.com/about/healthcareconference', 'https://www.jpmorgan.com/about/healthcareconference'),
  ('Medica World Forum', 'Medica', 'technology', '{"INTERNATIONAL","MED TECH"}', 'https://www.medica-tradefair.com', 'https://www.medica-tradefair.com'),
  ('MGMA Annual Conference', 'MGMA', 'c-suite', '{"PHYSICIAN","PRACTICE MGMT"}', 'https://www.mgma.com', 'https://www.mgma.com'),
  ('MUIA Annual Summit', 'MUIA', 'pharmacy', '{"AI","PHARMACY AUTOMATION"}', 'https://www.muiallc.com', 'https://www.muiallc.com'),
  ('NAHAM Annual Conference', 'NAHAM', 'revenue-cycle', '{"ACCESS MANAGEMENT","REVENUE CYCLE"}', 'https://www.naham.org', 'https://www.naham.org'),
  ('NASP Annual Meeting', 'NASP', 'pharmacy', '{"SPECIALTY PHARMACY"}', 'https://www.naspnet.org', 'https://www.naspnet.org'),
  ('Professional Women in Healthcare Summit', 'PWIH', 'c-suite', '{"LEADERSHIP","HEALTHCARE"}', 'https://www.pwih.org', 'https://www.pwih.org'),
  ('RSNA Annual Meeting', 'RSNA', 'clinical', '{"RADIOLOGY","IMAGING"}', 'https://www.rsna.org', 'https://www.rsna.org'),
  ('SCCM Critical Care Congress', 'SCCM', 'clinical', '{"CRITICAL CARE","CLINICAL"}', 'https://www.sccm.org', 'https://www.sccm.org'),
  ('SHEA Annual Scientific Meeting', 'SHEA', 'clinical', '{"EPIDEMIOLOGY","INFECTION"}', 'https://www.shea-online.org', 'https://www.shea-online.org'),
  ('SMI Annual Conference', 'SMI', 'supply-chain', '{"MARKETPLACE","SUPPLY CHAIN"}', 'https://www.smisupplychain.com', 'https://www.smisupplychain.com'),
  ('SRS Annual Meeting', 'SRS', 'technology', '{"ROBOTIC SURGERY","TECHNOLOGY"}', 'https://www.srs.org', 'https://www.srs.org'),
  ('VA Healthcare Summit', 'VA/IDGA', 'c-suite', '{"GOVERNMENT","HEALTHCARE"}', 'https://www.idga.org', 'https://www.idga.org'),
  ('ViVE', 'HLTH/CHIME', 'technology', '{"DIGITAL HEALTH","INNOVATION"}', 'https://www.viveevent.com', 'https://www.viveevent.com'),
  ('World Hospital at Home Congress', 'WHAHC', 'clinical', '{"HOSPITAL AT HOME","INNOVATION"}', 'https://www.hospitaladhomecongress.com', 'https://www.hospitaladhomecongress.com');

-- Link to existing resources where org_short matches
UPDATE meeting_dates md
SET resource_id = r.id
FROM resources r
WHERE r.category_id = (
  SELECT id FROM resource_categories WHERE slug = 'industry-meetings'
)
AND r.is_active = true
AND (
  md.name ILIKE '%' || split_part(r.name, '(', 1) || '%'
  OR r.name ILIKE '%' || md.org_short || '%'
);
```

**Step 2: Run seed in Supabase SQL Editor**

**Step 3: Commit**

```bash
git add sql/012_seed_meeting_dates.sql
git commit -m "feat: seed meeting_dates with 48 industry meetings"
```

---

## Task 3: TypeScript Type + Server Query

**Files:**
- Modify: `src/lib/types.ts` (add MeetingDate interface at end)
- Modify: `src/lib/resourceQueries.ts` (add getAllMeetingDates query)

**Step 1: Add MeetingDate type to `src/lib/types.ts`**

Append after the last interface:

```typescript
export interface MeetingDate {
  id: string
  resource_id: string | null
  name: string
  org_short: string | null
  start_date: string | null
  end_date: string | null
  city: string | null
  state_country: string | null
  category: string | null
  tags: string[]
  website_url: string | null
  source_url: string | null
  last_verified: string | null
  notes: string | null
  created_at: string
  updated_at: string
}
```

**Step 2: Add query to `src/lib/resourceQueries.ts`**

Add import of `MeetingDate` to the existing import block, then append:

```typescript
export const getAllMeetingDates = cache(async (): Promise<MeetingDate[]> => {
  const { data } = await supabase
    .from("meeting_dates")
    .select("*")
    .order("start_date", { ascending: true, nullsFirst: false });
  return (data ?? []) as MeetingDate[];
});
```

**Step 3: Commit**

```bash
git add src/lib/types.ts src/lib/resourceQueries.ts
git commit -m "feat: add MeetingDate type and server query"
```

---

## Task 4: Calendar Page — Server Component

**Files:**
- Create: `src/app/calendar/page.tsx`

**Step 1: Create the server component**

```tsx
import { Metadata } from "next";
import { getAllMeetingDates } from "@/lib/resourceQueries";
import CalendarView from "@/components/CalendarView";

export const revalidate = 3600;

export const metadata: Metadata = {
  title: "Industry Meeting Calendar — IDN Research",
  description:
    "Every major healthcare industry meeting in one place — dates, locations, and categories. Pharmacy, supply chain, technology, and executive conferences tracked and updated quarterly.",
  openGraph: {
    title: "Industry Meeting Calendar — IDN Research",
    description:
      "Every major healthcare industry meeting in one place — dates, locations, and categories.",
  },
};

export default async function CalendarPage() {
  const meetings = await getAllMeetingDates();

  return (
    <main className="min-h-screen bg-cream">
      <CalendarView meetings={meetings} />
    </main>
  );
}
```

**Step 2: Commit**

```bash
git add src/app/calendar/page.tsx
git commit -m "feat: add /calendar server page"
```

---

## Task 5: CalendarView Client Component — Filters & Timeline

**Files:**
- Create: `src/components/CalendarView.tsx`

This is the largest task. The component handles filtering, searching, and rendering Timeline + Grid views. Match the mockup design using Tailwind CSS with the existing IDN Research color tokens (ink, cream, oxblood, gold).

**Step 1: Create `src/components/CalendarView.tsx`**

```tsx
"use client";

import { useState, useMemo } from "react";
import { MeetingDate } from "@/lib/types";

const CATEGORIES = [
  { key: "all", label: "All Meetings", color: "bg-ink" },
  { key: "pharmacy", label: "Pharmacy", color: "bg-purple-600" },
  { key: "supply-chain", label: "Supply Chain", color: "bg-cyan-700" },
  { key: "c-suite", label: "C-Suite / Executive", color: "bg-emerald-800" },
  { key: "technology", label: "Technology", color: "bg-blue-600" },
  { key: "clinical", label: "Clinical", color: "bg-red-600" },
  { key: "revenue-cycle", label: "Revenue Cycle", color: "bg-amber-600" },
  { key: "facilities", label: "Facilities", color: "bg-emerald-600" },
  { key: "nursing", label: "Nursing", color: "bg-pink-600" },
  { key: "workforce", label: "Workforce", color: "bg-violet-600" },
] as const;

const CAT_BAR_COLORS: Record<string, string> = {
  pharmacy: "bg-purple-600",
  "supply-chain": "bg-cyan-700",
  "c-suite": "bg-emerald-800",
  technology: "bg-blue-600",
  clinical: "bg-red-600",
  "revenue-cycle": "bg-amber-600",
  facilities: "bg-emerald-600",
  nursing: "bg-pink-600",
  workforce: "bg-violet-600",
};

const MONTH_NAMES = [
  "January", "February", "March", "April", "May", "June",
  "July", "August", "September", "October", "November", "December",
];

const MONTH_ABBR = [
  "JAN", "FEB", "MAR", "APR", "MAY", "JUN",
  "JUL", "AUG", "SEP", "OCT", "NOV", "DEC",
];

function daysUntil(dateStr: string): string {
  const diff = Math.ceil(
    (new Date(dateStr + "T00:00:00").getTime() - Date.now()) / 86400000
  );
  if (diff < 0) return "Completed";
  if (diff === 0) return "Today";
  return `${diff} days away`;
}

function daysBetween(start: string, end: string): number {
  return Math.ceil(
    (new Date(end + "T00:00:00").getTime() -
      new Date(start + "T00:00:00").getTime()) /
      86400000
  );
}

export default function CalendarView({
  meetings,
}: {
  meetings: MeetingDate[];
}) {
  const [activeFilter, setActiveFilter] = useState("all");
  const [search, setSearch] = useState("");
  const [view, setView] = useState<"timeline" | "grid">("timeline");

  const filtered = useMemo(() => {
    return meetings.filter((m) => {
      if (activeFilter !== "all" && m.category !== activeFilter) return false;
      if (search) {
        const s = search.toLowerCase();
        return (
          m.name.toLowerCase().includes(s) ||
          (m.org_short ?? "").toLowerCase().includes(s) ||
          (m.city ?? "").toLowerCase().includes(s) ||
          (m.state_country ?? "").toLowerCase().includes(s) ||
          m.tags.some((t) => t.toLowerCase().includes(s))
        );
      }
      return true;
    });
  }, [meetings, activeFilter, search]);

  const grouped = useMemo(() => {
    const map: Record<string, MeetingDate[]> = {};
    filtered.forEach((m) => {
      if (!m.start_date) return;
      const d = new Date(m.start_date + "T00:00:00");
      const key = `${d.getFullYear()}-${String(d.getMonth()).padStart(2, "0")}`;
      (map[key] ??= []).push(m);
    });
    return Object.entries(map).sort(([a], [b]) => a.localeCompare(b));
  }, [filtered]);

  const upcoming = useMemo(() => {
    const today = new Date().toISOString().split("T")[0];
    return meetings
      .filter((m) => m.start_date && m.start_date >= today)
      .sort((a, b) => (a.start_date ?? "").localeCompare(b.start_date ?? ""))
      .slice(0, 6);
  }, [meetings]);

  const withDates = filtered.filter((m) => m.start_date);
  const withoutDates = filtered.filter((m) => !m.start_date);

  const totalCities = new Set(meetings.filter((m) => m.city).map((m) => m.city)).size;

  return (
    <>
      {/* Hero */}
      <div className="bg-ink px-4 sm:px-8 lg:px-12 py-12">
        <p className="text-gold text-[11px] uppercase tracking-[0.2em] font-semibold mb-2">
          Industry Meeting Calendar
        </p>
        <h1 className="font-serif text-3xl sm:text-4xl text-cream font-bold mb-2">
          Healthcare Conferences & Events
        </h1>
        <p className="text-cream/60 text-sm max-w-lg leading-relaxed">
          Every major healthcare industry meeting in one place — dates,
          locations, and categories. Updated quarterly.
        </p>
        <div className="flex gap-10 mt-6">
          {[
            [meetings.length, "Meetings"],
            [12, "Months"],
            [totalCities, "Cities"],
            [Object.keys(CAT_BAR_COLORS).length, "Categories"],
          ].map(([num, label]) => (
            <div key={String(label)} className="text-center">
              <div className="text-gold text-2xl font-bold">{num}</div>
              <div className="text-cream/40 text-[10px] uppercase tracking-widest">
                {label}
              </div>
            </div>
          ))}
        </div>
      </div>

      {/* Controls (sticky) */}
      <div className="sticky top-0 z-40 bg-cream border-b border-rule px-4 sm:px-8 lg:px-12 py-4">
        <div className="flex items-center justify-between mb-3">
          <div className="flex gap-1 bg-cream-2 rounded-md p-0.5">
            {(["timeline", "grid"] as const).map((v) => (
              <button
                key={v}
                onClick={() => setView(v)}
                className={`px-4 py-1.5 text-xs font-medium rounded-[3px] capitalize transition-colors ${
                  view === v
                    ? "bg-ink text-cream"
                    : "text-ink-2 hover:text-ink"
                }`}
              >
                {v}
              </button>
            ))}
          </div>
          <input
            type="text"
            placeholder="Search meetings, cities, organizations..."
            value={search}
            onChange={(e) => setSearch(e.target.value)}
            className="w-64 rounded-[3px] border border-rule bg-white py-2 px-3 text-sm text-ink placeholder:text-ink-muted focus:border-ink focus:outline-none focus:ring-1 focus:ring-ink"
          />
        </div>
        <div className="flex gap-2 flex-wrap items-center">
          <span className="text-[10px] text-ink-muted uppercase tracking-widest font-semibold mr-1">
            Filter:
          </span>
          {CATEGORIES.map((c) => (
            <button
              key={c.key}
              onClick={() => setActiveFilter(c.key)}
              className={`px-3 py-1 text-xs font-medium rounded-full border transition-colors ${
                activeFilter === c.key
                  ? `${c.color} text-white border-transparent`
                  : "bg-white text-ink-2 border-rule hover:border-ink-muted"
              }`}
            >
              {c.label}
            </button>
          ))}
        </div>
      </div>

      {/* Content */}
      <div className="px-4 sm:px-8 lg:px-12 pb-16">
        <div className="flex gap-8">
          {/* Main */}
          <div className="flex-1 min-w-0">
            {view === "timeline" ? (
              <div>
                {grouped.map(([key, items]) => {
                  const [yr, mo] = key.split("-");
                  return (
                    <div key={key} className="mt-8">
                      <div className="flex items-center gap-3 mb-4 pb-2 border-b-2 border-rule">
                        <span className="font-serif text-xl font-bold text-ink">
                          {MONTH_NAMES[parseInt(mo)]}
                        </span>
                        <span className="text-sm text-ink-muted">{yr}</span>
                        <span className="bg-ink text-gold text-[10px] font-bold px-2.5 py-0.5 rounded-full">
                          {items.length} event{items.length > 1 ? "s" : ""}
                        </span>
                      </div>
                      <div className="flex flex-col gap-2.5">
                        {items.map((m) => {
                          const s = new Date(m.start_date! + "T00:00:00");
                          const e = m.end_date
                            ? new Date(m.end_date + "T00:00:00")
                            : s;
                          const days = m.end_date
                            ? daysBetween(m.start_date!, m.end_date)
                            : 1;
                          return (
                            <a
                              key={m.id}
                              href={m.website_url ?? "#"}
                              target="_blank"
                              rel="noopener noreferrer"
                              className="flex items-center gap-5 bg-white rounded-xl px-5 py-4 border border-rule hover:border-gold hover:shadow-sm transition-all group"
                            >
                              <div className="text-center min-w-[56px]">
                                <div className="text-[10px] font-bold uppercase tracking-widest text-ink-muted">
                                  {MONTH_ABBR[s.getMonth()]}
                                </div>
                                <div className="text-xl font-bold text-ink leading-tight">
                                  {s.getDate()}–{e.getDate()}
                                </div>
                              </div>
                              <div
                                className={`w-1 h-12 rounded-full ${
                                  CAT_BAR_COLORS[m.category ?? ""] ?? "bg-ink"
                                }`}
                              />
                              <div className="flex-1 min-w-0">
                                <div className="text-sm font-bold text-ink group-hover:text-oxblood transition-colors">
                                  {m.name}
                                </div>
                                <div className="text-xs text-ink-muted">
                                  {m.org_short}
                                </div>
                                <div className="flex gap-1.5 mt-1 flex-wrap">
                                  {m.tags.slice(0, 3).map((t) => (
                                    <span
                                      key={t}
                                      className="text-[9px] font-semibold uppercase tracking-wide px-2 py-0.5 rounded bg-cream-2 text-ink-2"
                                    >
                                      {t}
                                    </span>
                                  ))}
                                </div>
                              </div>
                              <div className="flex flex-col items-end gap-1.5 shrink-0">
                                {m.city && (
                                  <span className="inline-flex items-center gap-1 px-2.5 py-1 bg-cream-2 rounded-full text-xs text-ink-2">
                                    <svg
                                      className="w-3 h-3 text-gold"
                                      viewBox="0 0 24 24"
                                      fill="none"
                                      stroke="currentColor"
                                      strokeWidth="2"
                                    >
                                      <path d="M12 2C8.13 2 5 5.13 5 9c0 5.25 7 13 7 13s7-7.75 7-13c0-3.87-3.13-7-7-7z" />
                                      <circle cx="12" cy="9" r="2.5" />
                                    </svg>
                                    {m.city}, {m.state_country}
                                  </span>
                                )}
                                <span className="text-[10px] text-ink-muted">
                                  {days} day{days > 1 ? "s" : ""} ·{" "}
                                  {daysUntil(m.start_date!)}
                                </span>
                              </div>
                            </a>
                          );
                        })}
                      </div>
                    </div>
                  );
                })}

                {withoutDates.length > 0 && (
                  <div className="mt-8">
                    <div className="flex items-center gap-3 mb-4 pb-2 border-b-2 border-rule">
                      <span className="font-serif text-xl font-bold text-ink">
                        Dates TBD
                      </span>
                      <span className="bg-ink text-gold text-[10px] font-bold px-2.5 py-0.5 rounded-full">
                        {withoutDates.length}
                      </span>
                    </div>
                    <div className="flex flex-col gap-2.5">
                      {withoutDates.map((m) => (
                        <a
                          key={m.id}
                          href={m.website_url ?? "#"}
                          target="_blank"
                          rel="noopener noreferrer"
                          className="flex items-center gap-5 bg-white rounded-xl px-5 py-4 border border-rule hover:border-gold hover:shadow-sm transition-all group"
                        >
                          <div className="text-center min-w-[56px]">
                            <div className="text-[10px] font-bold uppercase tracking-widest text-ink-muted">
                              TBD
                            </div>
                          </div>
                          <div
                            className={`w-1 h-12 rounded-full ${
                              CAT_BAR_COLORS[m.category ?? ""] ?? "bg-ink"
                            }`}
                          />
                          <div className="flex-1 min-w-0">
                            <div className="text-sm font-bold text-ink group-hover:text-oxblood transition-colors">
                              {m.name}
                            </div>
                            <div className="text-xs text-ink-muted">
                              {m.org_short}
                            </div>
                            <div className="flex gap-1.5 mt-1 flex-wrap">
                              {m.tags.slice(0, 3).map((t) => (
                                <span
                                  key={t}
                                  className="text-[9px] font-semibold uppercase tracking-wide px-2 py-0.5 rounded bg-cream-2 text-ink-2"
                                >
                                  {t}
                                </span>
                              ))}
                            </div>
                          </div>
                        </a>
                      ))}
                    </div>
                  </div>
                )}

                {grouped.length === 0 && withoutDates.length === 0 && (
                  <div className="text-center py-16 text-ink-muted">
                    <p className="font-serif text-lg text-ink mb-1">
                      No meetings match your filters
                    </p>
                    <p className="text-sm">
                      Try adjusting your category or search term.
                    </p>
                  </div>
                )}
              </div>
            ) : (
              /* Grid View */
              <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4 mt-8">
                {withDates.map((m) => {
                  const s = new Date(m.start_date! + "T00:00:00");
                  const e = m.end_date
                    ? new Date(m.end_date + "T00:00:00")
                    : s;
                  const days = m.end_date
                    ? daysBetween(m.start_date!, m.end_date)
                    : 1;
                  return (
                    <a
                      key={m.id}
                      href={m.website_url ?? "#"}
                      target="_blank"
                      rel="noopener noreferrer"
                      className="bg-white rounded-xl p-5 border border-rule hover:border-gold hover:shadow-sm transition-all"
                    >
                      <div className="flex justify-between items-start mb-3">
                        <span className="text-xs font-bold text-gold">
                          {MONTH_ABBR[s.getMonth()]} {s.getDate()}–
                          {e.getDate()}, {s.getFullYear()}
                        </span>
                        {m.category && (
                          <span
                            className={`text-[9px] font-bold uppercase tracking-wide px-2 py-0.5 rounded text-white ${
                              CAT_BAR_COLORS[m.category] ?? "bg-ink"
                            }`}
                          >
                            {m.category.replace("-", " ")}
                          </span>
                        )}
                      </div>
                      <div className="text-sm font-bold text-ink mb-0.5">
                        {m.name}
                      </div>
                      <div className="text-xs text-ink-muted mb-3">
                        {m.org_short} · {days} day{days > 1 ? "s" : ""}
                      </div>
                      <div className="flex justify-between items-center">
                        {m.city && (
                          <span className="inline-flex items-center gap-1 px-2.5 py-1 bg-cream-2 rounded-full text-xs text-ink-2">
                            <svg
                              className="w-3 h-3 text-gold"
                              viewBox="0 0 24 24"
                              fill="none"
                              stroke="currentColor"
                              strokeWidth="2"
                            >
                              <path d="M12 2C8.13 2 5 5.13 5 9c0 5.25 7 13 7 13s7-7.75 7-13c0-3.87-3.13-7-7-7z" />
                              <circle cx="12" cy="9" r="2.5" />
                            </svg>
                            {m.city}, {m.state_country}
                          </span>
                        )}
                        <span className="text-[10px] text-ink-muted">
                          {daysUntil(m.start_date!)}
                        </span>
                      </div>
                    </a>
                  );
                })}
              </div>
            )}
          </div>

          {/* Sidebar — Next Up */}
          <div className="hidden xl:block w-72 shrink-0 mt-8">
            <div className="sticky top-[120px] bg-ink rounded-xl p-6">
              <h3 className="text-gold text-[10px] uppercase tracking-[0.2em] font-bold mb-4">
                Next Up
              </h3>
              {upcoming.map((m) => {
                const s = new Date(m.start_date! + "T00:00:00");
                return (
                  <div
                    key={m.id}
                    className="py-3 border-b border-white/10 last:border-0"
                  >
                    <div className="text-cream text-xs font-semibold">
                      {m.name}
                    </div>
                    <div className="text-cream/50 text-[11px] mt-0.5">
                      {MONTH_ABBR[s.getMonth()]} {s.getDate()} · {m.city},{" "}
                      {m.state_country}
                    </div>
                    <div className="text-gold text-[11px] font-semibold mt-0.5">
                      {daysUntil(m.start_date!)}
                    </div>
                  </div>
                );
              })}
            </div>
          </div>
        </div>
      </div>
    </>
  );
}
```

**Step 2: Verify the page loads**

Run: `npm run dev` and visit `http://localhost:3000/calendar`

Expected: Hero section, filter chips, meetings listed (with "Dates TBD" section since dates haven't been populated yet). Filters and search should be interactive.

**Step 3: Commit**

```bash
git add src/components/CalendarView.tsx
git commit -m "feat: add CalendarView client component with timeline/grid views"
```

---

## Task 6: Navigation Updates

**Files:**
- Modify: `src/components/Header.tsx` (add Meeting Calendar nav link)

**Step 1: Add nav link**

In `src/components/Header.tsx`, inside the `<nav>` element (line 105), add a "Meeting Calendar" link before the existing "Directory" link:

```tsx
<Link
  href="/calendar"
  className="font-serif italic text-oxblood hover:text-oxblood-deep transition-colors"
>
  Meeting Calendar
</Link>
```

**Step 2: Verify**

Navigate the site — "Meeting Calendar" should appear in the navbar and link to `/calendar`.

**Step 3: Commit**

```bash
git add src/components/Header.tsx
git commit -m "feat: add Meeting Calendar to site navigation"
```

---

## Task 7: Admin — MeetingDatesAdmin Component

**Files:**
- Create: `src/components/admin/MeetingDatesAdmin.tsx`
- Modify: `src/components/admin/AdminDashboard.tsx` (add tab + wire up)

**Step 1: Create `src/components/admin/MeetingDatesAdmin.tsx`**

Follow the exact pattern from `ResourcesAdmin.tsx`: toolbar with search + category filter + Add button, table with rows, edit/delete actions, modal form.

```tsx
"use client";

import { useState } from "react";
import { supabase } from "@/lib/supabase";
import { MeetingDate } from "@/lib/types";

const CATEGORIES = [
  "pharmacy", "supply-chain", "c-suite", "technology",
  "clinical", "revenue-cycle", "facilities", "nursing", "workforce",
];

const inputClass =
  "w-full rounded-md border border-[var(--border)] bg-white px-3 py-2 text-sm focus:border-[var(--primary)] focus:outline-none focus:ring-1 focus:ring-[var(--primary)]";
const selectClass = inputClass;

interface Props {
  meetings: MeetingDate[];
  onRefresh: () => void;
}

export default function MeetingDatesAdmin({ meetings, onRefresh }: Props) {
  const [search, setSearch] = useState("");
  const [catFilter, setCatFilter] = useState("");
  const [editing, setEditing] = useState<MeetingDate | null>(null);
  const [isNew, setIsNew] = useState(false);
  const [saving, setSaving] = useState(false);

  const [form, setForm] = useState({
    name: "",
    org_short: "",
    start_date: "",
    end_date: "",
    city: "",
    state_country: "",
    category: "",
    tags: "",
    website_url: "",
    source_url: "",
    notes: "",
  });

  const filtered = meetings.filter((m) => {
    if (catFilter && m.category !== catFilter) return false;
    if (search) {
      const s = search.toLowerCase();
      return (
        m.name.toLowerCase().includes(s) ||
        (m.org_short ?? "").toLowerCase().includes(s) ||
        (m.city ?? "").toLowerCase().includes(s)
      );
    }
    return true;
  });

  function openEdit(m: MeetingDate) {
    setEditing(m);
    setIsNew(false);
    setForm({
      name: m.name,
      org_short: m.org_short ?? "",
      start_date: m.start_date ?? "",
      end_date: m.end_date ?? "",
      city: m.city ?? "",
      state_country: m.state_country ?? "",
      category: m.category ?? "",
      tags: m.tags.join(", "),
      website_url: m.website_url ?? "",
      source_url: m.source_url ?? "",
      notes: m.notes ?? "",
    });
  }

  function openNew() {
    setEditing({} as MeetingDate);
    setIsNew(true);
    setForm({
      name: "",
      org_short: "",
      start_date: "",
      end_date: "",
      city: "",
      state_country: "",
      category: "",
      tags: "",
      website_url: "",
      source_url: "",
      notes: "",
    });
  }

  async function handleSave() {
    setSaving(true);
    const payload = {
      name: form.name,
      org_short: form.org_short || null,
      start_date: form.start_date || null,
      end_date: form.end_date || null,
      city: form.city || null,
      state_country: form.state_country || null,
      category: form.category || null,
      tags: form.tags
        ? form.tags.split(",").map((t) => t.trim().toUpperCase()).filter(Boolean)
        : [],
      website_url: form.website_url || null,
      source_url: form.source_url || null,
      notes: form.notes || null,
    };

    if (isNew) {
      await supabase.from("meeting_dates").insert(payload);
    } else {
      await supabase
        .from("meeting_dates")
        .update(payload)
        .eq("id", editing!.id);
    }
    setSaving(false);
    setEditing(null);
    onRefresh();
  }

  async function handleDelete(id: string) {
    if (!confirm("Delete this meeting?")) return;
    await supabase.from("meeting_dates").delete().eq("id", id);
    onRefresh();
  }

  return (
    <div>
      {/* Toolbar */}
      <div className="flex items-center gap-3 mb-4">
        <input
          type="text"
          placeholder="Search meetings..."
          value={search}
          onChange={(e) => setSearch(e.target.value)}
          className={`${inputClass} max-w-xs`}
        />
        <select
          value={catFilter}
          onChange={(e) => setCatFilter(e.target.value)}
          className={`${selectClass} max-w-[200px]`}
        >
          <option value="">All Categories</option>
          {CATEGORIES.map((c) => (
            <option key={c} value={c}>
              {c.replace("-", " ")}
            </option>
          ))}
        </select>
        <div className="flex-1" />
        <button
          onClick={openNew}
          className="rounded-md bg-[var(--primary)] px-4 py-2 text-sm font-medium text-white hover:opacity-90"
        >
          + Add Meeting
        </button>
      </div>

      {/* Table */}
      <div className="overflow-x-auto rounded-lg border border-[var(--border)] bg-white">
        <table className="w-full text-sm">
          <thead className="bg-[var(--surface)] text-left">
            <tr>
              <th className="px-4 py-3 font-medium">Meeting</th>
              <th className="px-4 py-3 font-medium">Dates</th>
              <th className="px-4 py-3 font-medium">Location</th>
              <th className="px-4 py-3 font-medium">Category</th>
              <th className="px-4 py-3 font-medium">Verified</th>
              <th className="px-4 py-3 font-medium w-24">Actions</th>
            </tr>
          </thead>
          <tbody className="divide-y divide-[var(--border)]">
            {filtered.map((m) => (
              <tr key={m.id} className="hover:bg-[var(--surface)]/50">
                <td className="px-4 py-3">
                  <div className="font-medium">{m.name}</div>
                  <div className="text-xs text-[var(--muted)]">
                    {m.org_short}
                  </div>
                </td>
                <td className="px-4 py-3 whitespace-nowrap">
                  {m.start_date ? (
                    <>
                      {m.start_date}
                      {m.end_date && m.end_date !== m.start_date
                        ? ` → ${m.end_date}`
                        : ""}
                    </>
                  ) : (
                    <span className="text-amber-600 text-xs font-medium">
                      Not set
                    </span>
                  )}
                </td>
                <td className="px-4 py-3 whitespace-nowrap">
                  {m.city
                    ? `${m.city}, ${m.state_country}`
                    : "—"}
                </td>
                <td className="px-4 py-3">
                  {m.category && (
                    <span className="text-xs capitalize px-2 py-0.5 rounded bg-[var(--surface)]">
                      {m.category.replace("-", " ")}
                    </span>
                  )}
                </td>
                <td className="px-4 py-3 text-xs text-[var(--muted)]">
                  {m.last_verified
                    ? new Date(m.last_verified).toLocaleDateString()
                    : "Never"}
                </td>
                <td className="px-4 py-3">
                  <div className="flex gap-2">
                    <button
                      onClick={() => openEdit(m)}
                      className="text-xs text-[var(--primary)] hover:underline"
                    >
                      Edit
                    </button>
                    <button
                      onClick={() => handleDelete(m.id)}
                      className="text-xs text-red-600 hover:underline"
                    >
                      Delete
                    </button>
                  </div>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>

      {/* Edit/Add Modal */}
      {editing && (
        <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/40">
          <div className="bg-white rounded-xl shadow-xl p-6 w-full max-w-lg max-h-[90vh] overflow-y-auto">
            <h3 className="text-lg font-semibold mb-4">
              {isNew ? "Add Meeting" : "Edit Meeting"}
            </h3>
            <div className="space-y-3">
              <div>
                <label className="text-xs font-medium text-[var(--muted)] mb-1 block">
                  Meeting Name *
                </label>
                <input
                  className={inputClass}
                  value={form.name}
                  onChange={(e) =>
                    setForm({ ...form, name: e.target.value })
                  }
                />
              </div>
              <div>
                <label className="text-xs font-medium text-[var(--muted)] mb-1 block">
                  Org Abbreviation
                </label>
                <input
                  className={inputClass}
                  value={form.org_short}
                  onChange={(e) =>
                    setForm({ ...form, org_short: e.target.value })
                  }
                  placeholder="e.g. ACHE"
                />
              </div>
              <div className="grid grid-cols-2 gap-3">
                <div>
                  <label className="text-xs font-medium text-[var(--muted)] mb-1 block">
                    Start Date
                  </label>
                  <input
                    type="date"
                    className={inputClass}
                    value={form.start_date}
                    onChange={(e) =>
                      setForm({ ...form, start_date: e.target.value })
                    }
                  />
                </div>
                <div>
                  <label className="text-xs font-medium text-[var(--muted)] mb-1 block">
                    End Date
                  </label>
                  <input
                    type="date"
                    className={inputClass}
                    value={form.end_date}
                    onChange={(e) =>
                      setForm({ ...form, end_date: e.target.value })
                    }
                  />
                </div>
              </div>
              <div className="grid grid-cols-2 gap-3">
                <div>
                  <label className="text-xs font-medium text-[var(--muted)] mb-1 block">
                    City
                  </label>
                  <input
                    className={inputClass}
                    value={form.city}
                    onChange={(e) =>
                      setForm({ ...form, city: e.target.value })
                    }
                  />
                </div>
                <div>
                  <label className="text-xs font-medium text-[var(--muted)] mb-1 block">
                    State / Country
                  </label>
                  <input
                    className={inputClass}
                    value={form.state_country}
                    onChange={(e) =>
                      setForm({ ...form, state_country: e.target.value })
                    }
                    placeholder="e.g. TX or DE"
                  />
                </div>
              </div>
              <div>
                <label className="text-xs font-medium text-[var(--muted)] mb-1 block">
                  Category
                </label>
                <select
                  className={selectClass}
                  value={form.category}
                  onChange={(e) =>
                    setForm({ ...form, category: e.target.value })
                  }
                >
                  <option value="">Select...</option>
                  {CATEGORIES.map((c) => (
                    <option key={c} value={c}>
                      {c.replace("-", " ")}
                    </option>
                  ))}
                </select>
              </div>
              <div>
                <label className="text-xs font-medium text-[var(--muted)] mb-1 block">
                  Tags (comma-separated)
                </label>
                <input
                  className={inputClass}
                  value={form.tags}
                  onChange={(e) =>
                    setForm({ ...form, tags: e.target.value })
                  }
                  placeholder="SUPPLY CHAIN, C-SUITE"
                />
              </div>
              <div>
                <label className="text-xs font-medium text-[var(--muted)] mb-1 block">
                  Website URL
                </label>
                <input
                  className={inputClass}
                  value={form.website_url}
                  onChange={(e) =>
                    setForm({ ...form, website_url: e.target.value })
                  }
                />
              </div>
              <div>
                <label className="text-xs font-medium text-[var(--muted)] mb-1 block">
                  Source URL (for scraper)
                </label>
                <input
                  className={inputClass}
                  value={form.source_url}
                  onChange={(e) =>
                    setForm({ ...form, source_url: e.target.value })
                  }
                />
              </div>
              <div>
                <label className="text-xs font-medium text-[var(--muted)] mb-1 block">
                  Notes
                </label>
                <textarea
                  className={inputClass}
                  rows={2}
                  value={form.notes}
                  onChange={(e) =>
                    setForm({ ...form, notes: e.target.value })
                  }
                />
              </div>
            </div>
            <div className="flex justify-end gap-3 mt-6">
              <button
                onClick={() => setEditing(null)}
                className="px-4 py-2 text-sm text-[var(--muted)] hover:text-[var(--foreground)]"
              >
                Cancel
              </button>
              <button
                onClick={handleSave}
                disabled={saving || !form.name}
                className="px-4 py-2 text-sm font-medium bg-[var(--primary)] text-white rounded-md hover:opacity-90 disabled:opacity-50"
              >
                {saving ? "Saving..." : "Save"}
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}
```

**Step 2: Wire into AdminDashboard**

In `src/components/admin/AdminDashboard.tsx`:

a) Add import at top:
```typescript
import MeetingDatesAdmin from "./MeetingDatesAdmin";
import { MeetingDate } from "@/lib/types";
```

b) Add state (after line ~42, with other state declarations):
```typescript
const [meetingDates, setMeetingDates] = useState<MeetingDate[]>([]);
```

c) Add to `fetchData` Promise.all array (after the affiliations query):
```typescript
supabase.from("meeting_dates").select("*").order("start_date"),
```

d) Add the setter in fetchData results (match variable name from Promise.all):
```typescript
if (meetRes.data) setMeetingDates(meetRes.data);
```

e) Add tab to the `tabs` array (as a new section or in the "legacy" section):
```typescript
{ key: "meetings", label: "Meeting Calendar", count: meetingDates.length, section: "legacy" },
```

f) Add the Tab type: update the `Tab` union to include `"meetings"`.

g) Add render block in the tab content area:
```tsx
{activeTab === "meetings" && (
  <MeetingDatesAdmin meetings={meetingDates} onRefresh={fetchData} />
)}
```

**Step 3: Verify**

Visit `/admin`, log in, and confirm the "Meeting Calendar" tab appears and shows the seeded meetings.

**Step 4: Commit**

```bash
git add src/components/admin/MeetingDatesAdmin.tsx src/components/admin/AdminDashboard.tsx
git commit -m "feat: add Meeting Calendar admin tab with CRUD"
```

---

## Task 8: Scraper Edge Function

**Files:**
- Create: `supabase/functions/scrape-meeting-dates/index.ts`

**Step 1: Create the Edge Function**

This function fetches each meeting's source_url, extracts page text, sends it to Claude API for structured date/location extraction, and returns results for admin review.

```typescript
import { serve } from "https://deno.land/std@0.177.0/http/server.ts";

const ANTHROPIC_API_KEY = Deno.env.get("ANTHROPIC_API_KEY");

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Headers": "authorization, x-client-info, apikey, content-type",
};

interface MeetingInput {
  id: string;
  name: string;
  source_url: string;
}

interface ScrapedResult {
  id: string;
  name: string;
  start_date: string | null;
  end_date: string | null;
  city: string | null;
  state_country: string | null;
  status: "found" | "not_found" | "error";
  error?: string;
}

async function fetchPageText(url: string): Promise<string> {
  try {
    const resp = await fetch(url, {
      headers: { "User-Agent": "IDNResearch-CalendarBot/1.0" },
      redirect: "follow",
    });
    if (!resp.ok) throw new Error(`HTTP ${resp.status}`);
    const html = await resp.text();
    // Strip HTML tags, scripts, styles — keep text content
    return html
      .replace(/<script[\s\S]*?<\/script>/gi, "")
      .replace(/<style[\s\S]*?<\/style>/gi, "")
      .replace(/<[^>]+>/g, " ")
      .replace(/\s+/g, " ")
      .trim()
      .slice(0, 8000); // Limit to ~8k chars for Claude context
  } catch (e) {
    throw new Error(`Failed to fetch ${url}: ${(e as Error).message}`);
  }
}

async function extractDates(
  name: string,
  pageText: string
): Promise<{ start_date: string; end_date: string; city: string; state_country: string } | null> {
  if (!ANTHROPIC_API_KEY) throw new Error("ANTHROPIC_API_KEY not set");

  const resp = await fetch("https://api.anthropic.com/v1/messages", {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
      "x-api-key": ANTHROPIC_API_KEY,
      "anthropic-version": "2023-06-01",
    },
    body: JSON.stringify({
      model: "claude-haiku-4-5-20251001",
      max_tokens: 256,
      messages: [
        {
          role: "user",
          content: `Extract the next upcoming conference/annual meeting dates and location for "${name}" from this webpage text. Return ONLY valid JSON with these exact fields (no markdown, no explanation):
{"start_date":"YYYY-MM-DD","end_date":"YYYY-MM-DD","city":"CityName","state_country":"XX"}

If you cannot find the dates, return: {"start_date":null,"end_date":null,"city":null,"state_country":null}

Use 2-letter US state codes (TX, CA) or 2-letter country codes (DE, NL) for international events.

Webpage text:
${pageText}`,
        },
      ],
    }),
  });

  if (!resp.ok) {
    const err = await resp.text();
    throw new Error(`Claude API error: ${err}`);
  }

  const data = await resp.json();
  const text = data.content?.[0]?.text ?? "";
  try {
    const parsed = JSON.parse(text);
    if (!parsed.start_date) return null;
    return parsed;
  } catch {
    return null;
  }
}

serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { headers: corsHeaders });
  }

  try {
    const { meetings } = (await req.json()) as {
      meetings: MeetingInput[];
    };

    const results: ScrapedResult[] = [];

    for (const m of meetings) {
      try {
        const text = await fetchPageText(m.source_url);
        const extracted = await extractDates(m.name, text);
        if (extracted) {
          results.push({
            id: m.id,
            name: m.name,
            ...extracted,
            status: "found",
          });
        } else {
          results.push({
            id: m.id,
            name: m.name,
            start_date: null,
            end_date: null,
            city: null,
            state_country: null,
            status: "not_found",
          });
        }
      } catch (e) {
        results.push({
          id: m.id,
          name: m.name,
          start_date: null,
          end_date: null,
          city: null,
          state_country: null,
          status: "error",
          error: (e as Error).message,
        });
      }
      // Small delay between requests to be polite
      await new Promise((r) => setTimeout(r, 500));
    }

    return new Response(JSON.stringify({ results }), {
      headers: { ...corsHeaders, "Content-Type": "application/json" },
    });
  } catch (e) {
    return new Response(
      JSON.stringify({ error: (e as Error).message }),
      {
        status: 500,
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      }
    );
  }
});
```

**Step 2: Deploy the Edge Function**

```bash
supabase functions deploy scrape-meeting-dates
supabase secrets set ANTHROPIC_API_KEY=sk-ant-...your-key...
```

**Step 3: Commit**

```bash
git add supabase/functions/scrape-meeting-dates/index.ts
git commit -m "feat: add scraper Edge Function for meeting date extraction"
```

---

## Task 9: Admin — Scraper Review UI

**Files:**
- Modify: `src/components/admin/MeetingDatesAdmin.tsx` (add scraper button + review table)

**Step 1: Add scraper state and handler**

Add to MeetingDatesAdmin, after existing state declarations:

```typescript
const [scraping, setScraping] = useState(false);
const [scrapeResults, setScrapeResults] = useState<Array<{
  id: string;
  name: string;
  start_date: string | null;
  end_date: string | null;
  city: string | null;
  state_country: string | null;
  status: string;
  approved: boolean;
}> | null>(null);

async function handleScrape() {
  setScraping(true);
  const toScrape = meetings
    .filter((m) => m.source_url)
    .map((m) => ({ id: m.id, name: m.name, source_url: m.source_url! }));

  try {
    const resp = await fetch(
      `https://aszhjzseobgadbgxaosq.supabase.co/functions/v1/scrape-meeting-dates`,
      {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          Authorization: `Bearer ${(await supabase.auth.getSession()).data.session?.access_token}`,
        },
        body: JSON.stringify({ meetings: toScrape }),
      }
    );
    const data = await resp.json();
    setScrapeResults(
      data.results.map((r: Record<string, unknown>) => ({ ...r, approved: r.status === "found" }))
    );
  } catch (e) {
    alert("Scraper failed: " + (e as Error).message);
  }
  setScraping(false);
}

async function applyScrapeResults() {
  const approved = scrapeResults?.filter((r) => r.approved && r.start_date);
  if (!approved?.length) return;
  for (const r of approved) {
    await supabase
      .from("meeting_dates")
      .update({
        start_date: r.start_date,
        end_date: r.end_date,
        city: r.city,
        state_country: r.state_country,
        last_verified: new Date().toISOString(),
      })
      .eq("id", r.id);
  }
  setScrapeResults(null);
  onRefresh();
}
```

**Step 2: Add scraper button to toolbar**

Add before the "+ Add Meeting" button:

```tsx
<button
  onClick={handleScrape}
  disabled={scraping}
  className="rounded-md border border-[var(--primary)] px-4 py-2 text-sm font-medium text-[var(--primary)] hover:bg-[var(--primary)] hover:text-white disabled:opacity-50 transition-colors"
>
  {scraping ? "Scraping..." : "Refresh All Dates"}
</button>
```

**Step 3: Add review results table**

Add after the toolbar, before the main table — renders only when `scrapeResults` is not null:

```tsx
{scrapeResults && (
  <div className="mb-6 p-4 bg-blue-50 rounded-lg border border-blue-200">
    <div className="flex items-center justify-between mb-3">
      <h4 className="font-semibold text-sm">
        Scraper Results — Review & Approve
      </h4>
      <div className="flex gap-2">
        <button
          onClick={() => setScrapeResults(null)}
          className="text-xs text-[var(--muted)] hover:underline"
        >
          Dismiss
        </button>
        <button
          onClick={applyScrapeResults}
          className="text-xs bg-[var(--primary)] text-white px-3 py-1 rounded hover:opacity-90"
        >
          Apply Approved ({scrapeResults.filter((r) => r.approved).length})
        </button>
      </div>
    </div>
    <table className="w-full text-xs">
      <thead>
        <tr className="text-left">
          <th className="px-2 py-1">Approve</th>
          <th className="px-2 py-1">Meeting</th>
          <th className="px-2 py-1">Scraped Dates</th>
          <th className="px-2 py-1">Location</th>
          <th className="px-2 py-1">Status</th>
        </tr>
      </thead>
      <tbody>
        {scrapeResults.map((r, i) => (
          <tr
            key={r.id}
            className={
              r.status === "found"
                ? "bg-green-50"
                : r.status === "error"
                ? "bg-red-50"
                : "bg-amber-50"
            }
          >
            <td className="px-2 py-1.5">
              <input
                type="checkbox"
                checked={r.approved}
                onChange={(e) => {
                  const updated = [...scrapeResults];
                  updated[i] = { ...r, approved: e.target.checked };
                  setScrapeResults(updated);
                }}
              />
            </td>
            <td className="px-2 py-1.5 font-medium">{r.name}</td>
            <td className="px-2 py-1.5">
              {r.start_date
                ? `${r.start_date} → ${r.end_date}`
                : "Not found"}
            </td>
            <td className="px-2 py-1.5">
              {r.city ? `${r.city}, ${r.state_country}` : "—"}
            </td>
            <td className="px-2 py-1.5 capitalize">{r.status}</td>
          </tr>
        ))}
      </tbody>
    </table>
  </div>
)}
```

**Step 4: Verify**

Log into admin → Meeting Calendar tab → click "Refresh All Dates" → review results table appears → approve/reject → click "Apply Approved" → dates saved.

**Step 5: Commit**

```bash
git add src/components/admin/MeetingDatesAdmin.tsx
git commit -m "feat: add scraper review UI to Meeting Calendar admin"
```

---

## Task 10: Cross-Links & Polish

**Files:**
- Modify: `src/app/category/[slug]/page.tsx` (add calendar banner for industry-meetings)

**Step 1: Add calendar banner**

In `src/app/category/[slug]/page.tsx`, after the category heading/description area, add a conditional banner when the slug is `industry-meetings`:

```tsx
{category.slug === "industry-meetings" && (
  <a
    href="/calendar"
    className="flex items-center justify-between mt-4 mb-6 p-4 rounded-lg bg-ink text-cream hover:bg-ink/90 transition-colors"
  >
    <div>
      <div className="text-gold text-[10px] uppercase tracking-widest font-semibold">
        New
      </div>
      <div className="font-serif text-lg">
        View the Meeting Calendar →
      </div>
      <div className="text-cream/60 text-xs">
        All conference dates, locations, and categories in one place
      </div>
    </div>
    <svg
      className="w-6 h-6 text-gold"
      fill="none"
      stroke="currentColor"
      viewBox="0 0 24 24"
    >
      <path
        strokeLinecap="round"
        strokeLinejoin="round"
        strokeWidth={2}
        d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"
      />
    </svg>
  </a>
)}
```

**Step 2: Verify**

Visit `/category/industry-meetings` — should see the calendar banner at the top.

**Step 3: Commit**

```bash
git add src/app/category/\[slug\]/page.tsx
git commit -m "feat: add calendar banner to industry-meetings category page"
```

---

## Task 11: Final Integration Test

**Step 1: Run dev server and verify all pages**

```bash
npm run dev
```

Verify:
- [ ] `/calendar` loads with hero, filters, and meetings (Dates TBD section for unseeded dates)
- [ ] Filter chips work (click Pharmacy → only pharmacy meetings)
- [ ] Search works (type "Nashville" → shows Nashville meetings)
- [ ] Grid view toggle works
- [ ] "Next Up" sidebar shows upcoming events (once dates are populated)
- [ ] Navbar shows "Meeting Calendar" link
- [ ] `/category/industry-meetings` shows calendar banner
- [ ] `/admin` → "Meeting Calendar" tab shows meeting list
- [ ] Can add/edit/delete a meeting from admin
- [ ] "Refresh All Dates" triggers scraper (requires Edge Function deployment)

**Step 2: Run build to verify no TypeScript errors**

```bash
npm run build
```

Expected: Clean build with no errors.

**Step 3: Commit any remaining fixes**

```bash
git add -A
git commit -m "feat: meeting calendar integration complete"
```

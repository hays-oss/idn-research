"use client";

import { useState, useMemo } from "react";
import dynamic from "next/dynamic";
import { MeetingDate } from "@/lib/types";

const CalendarMap = dynamic(() => import("./CalendarMap"), { ssr: false });

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

function isFeatured(m: MeetingDate): boolean {
  return m.featured === true;
}

export default function CalendarView({
  meetings,
}: {
  meetings: MeetingDate[];
}) {
  const [activeFilter, setActiveFilter] = useState("all");
  const [search, setSearch] = useState("");
  const [view, setView] = useState<"timeline" | "grid" | "map">("timeline");

  const today = useMemo(() => new Date().toISOString().split("T")[0], []);

  const filtered = useMemo(() => {
    return meetings.filter((m) => {
      // Exclude past events (end_date or start_date before today)
      if (m.start_date) {
        const endOrStart = m.end_date ?? m.start_date;
        if (endOrStart < today) return false;
      }
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
  }, [meetings, activeFilter, search, today]);

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
          Healthcare Conferences &amp; Events
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
            {(["timeline", "grid", "map"] as const).map((v) => (
              <button
                key={v}
                onClick={() => setView(v)}
                className={`px-4 py-1.5 text-xs font-medium rounded-[3px] capitalize transition-colors ${
                  view === v
                    ? "bg-ink text-cream"
                    : "text-ink-2 hover:text-ink"
                }`}
              >
                {v === "map" ? (
                  <span className="flex items-center gap-1">
                    <svg className="w-3.5 h-3.5" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
                      <path d="M12 2C8.13 2 5 5.13 5 9c0 5.25 7 13 7 13s7-7.75 7-13c0-3.87-3.13-7-7-7z" />
                      <circle cx="12" cy="9" r="2.5" />
                    </svg>
                    Map
                  </span>
                ) : v}
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
            {view === "map" ? (
              <div className="mt-8">
                <CalendarMap meetings={filtered} />
                <p className="text-xs text-ink-muted mt-3 text-center">
                  Showing {filtered.filter((m) => m.city && m.state_country).length} of{" "}
                  {filtered.length} meetings with known locations
                </p>
              </div>
            ) : view === "timeline" ? (
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
                              className={`flex items-center gap-5 rounded-xl px-5 py-4 border hover:shadow-sm transition-all group ${
                                isFeatured(m)
                                  ? "bg-amber-50/50 border-gold/40 border-l-4 border-l-gold"
                                  : "bg-white border-rule hover:border-gold"
                              }`}
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
                                <div className="flex items-center gap-2">
                                  <span className="text-sm font-bold text-ink group-hover:text-oxblood transition-colors">
                                    {m.name}
                                  </span>
                                  {isFeatured(m) && (
                                    <span className="inline-flex items-center gap-0.5 text-[9px] font-bold uppercase tracking-wide px-2 py-0.5 rounded-full bg-gold/15 text-amber-700">
                                      ★ Featured
                                    </span>
                                  )}
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
                          className={`flex items-center gap-5 rounded-xl px-5 py-4 border hover:shadow-sm transition-all group ${
                            isFeatured(m)
                              ? "bg-amber-50/50 border-gold/40 border-l-4 border-l-gold"
                              : "bg-white border-rule hover:border-gold"
                          }`}
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
                            <div className="flex items-center gap-2">
                              <span className="text-sm font-bold text-ink group-hover:text-oxblood transition-colors">
                                {m.name}
                              </span>
                              {isFeatured(m) && (
                                <span className="inline-flex items-center gap-0.5 text-[9px] font-bold uppercase tracking-wide px-2 py-0.5 rounded-full bg-gold/15 text-amber-700">
                                  ★ Featured
                                </span>
                              )}
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
                      className={`rounded-xl p-5 border hover:shadow-sm transition-all ${
                        isFeatured(m)
                          ? "bg-amber-50/50 border-gold/40 border-l-4 border-l-gold"
                          : "bg-white border-rule hover:border-gold"
                      }`}
                    >
                      <div className="flex justify-between items-start mb-3">
                        <span className="text-xs font-bold text-gold">
                          {MONTH_ABBR[s.getMonth()]} {s.getDate()}–
                          {e.getDate()}, {s.getFullYear()}
                        </span>
                        <div className="flex items-center gap-1.5">
                          {isFeatured(m) && (
                            <span className="inline-flex items-center gap-0.5 text-[9px] font-bold uppercase tracking-wide px-2 py-0.5 rounded-full bg-gold/15 text-amber-700">
                              ★ Featured
                            </span>
                          )}
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
                {withoutDates.map((m) => (
                  <a
                    key={m.id}
                    href={m.website_url ?? "#"}
                    target="_blank"
                    rel="noopener noreferrer"
                    className={`rounded-xl p-5 border border-dashed transition-all ${
                      isFeatured(m)
                        ? "bg-amber-50/50 border-gold/40 border-l-4 border-l-solid border-l-gold"
                        : "bg-white border-rule hover:border-gold"
                    }`}
                  >
                    <div className="flex justify-between items-start mb-3">
                      <span className="text-xs font-bold text-amber-500">Dates TBD</span>
                      <div className="flex items-center gap-1.5">
                        {isFeatured(m) && (
                          <span className="inline-flex items-center gap-0.5 text-[9px] font-bold uppercase tracking-wide px-2 py-0.5 rounded-full bg-gold/15 text-amber-700">
                            ★ Featured
                          </span>
                        )}
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
                    </div>
                    <div className="text-sm font-bold text-ink mb-0.5">
                      {m.name}
                    </div>
                    <div className="text-xs text-ink-muted">
                      {m.org_short}
                    </div>
                  </a>
                ))}
              </div>
            )}
          </div>

          {/* Sidebar — Next Up */}
          <div className="hidden xl:block w-72 shrink-0 mt-8">
            <div className="sticky top-[120px] bg-ink rounded-xl p-6">
              <h3 className="text-gold text-[10px] uppercase tracking-[0.2em] font-bold mb-4">
                Next Up
              </h3>
              {upcoming.length === 0 && (
                <p className="text-cream/40 text-xs">No upcoming events with dates set.</p>
              )}
              {upcoming.map((m) => {
                const s = new Date(m.start_date! + "T00:00:00");
                return (
                  <div
                    key={m.id}
                    className="py-3 border-b border-white/10 last:border-0"
                  >
                    <div className="flex items-center gap-1.5">
                      <span className="text-cream text-xs font-semibold">
                        {m.name}
                      </span>
                      {isFeatured(m) && (
                        <span className="text-gold text-[9px]">★</span>
                      )}
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

"use client";

import { useState } from "react";
import { supabase } from "@/lib/supabase";
import { MeetingDate } from "@/lib/types";
import EditModal, { FormField, inputClass, selectClass } from "./EditModal";

const CATEGORIES = [
  "pharmacy", "supply-chain", "c-suite", "technology",
  "clinical", "revenue-cycle", "facilities", "nursing", "workforce",
];

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
  const [scraping, setScraping] = useState(false);
  const [scrapeProgress, setScrapeProgress] = useState("");
  const [scrapeResults, setScrapeResults] = useState<Array<{
    id: string;
    org_name: string;
    meeting_name: string;
    start_date: string | null;
    end_date: string | null;
    city: string | null;
    state_country: string | null;
    status: string;
    is_new: boolean;
    approved: boolean;
  }> | null>(null);

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
    featured: false,
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
      featured: m.featured ?? false,
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
      featured: false,
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
      featured: form.featured,
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

  async function handleScrape() {
    setScraping(true);
    setScrapeProgress("");
    const toScrape = meetings
      .filter((m) => m.source_url)
      .map((m) => ({ id: m.id, name: m.name, source_url: m.source_url! }));

    const BATCH_SIZE = 3;
    const allResults: Array<Record<string, unknown>> = [];
    const token = (await supabase.auth.getSession()).data.session?.access_token;

    try {
      for (let i = 0; i < toScrape.length; i += BATCH_SIZE) {
        const batch = toScrape.slice(i, i + BATCH_SIZE);
        setScrapeProgress(`Scraping ${i + 1}–${Math.min(i + BATCH_SIZE, toScrape.length)} of ${toScrape.length}...`);

        const resp = await fetch(
          `https://aszhjzseobgadbgxaosq.supabase.co/functions/v1/scrape-meeting-dates`,
          {
            method: "POST",
            headers: {
              "Content-Type": "application/json",
              Authorization: `Bearer ${token}`,
            },
            body: JSON.stringify({ meetings: batch }),
          }
        );

        if (!resp.ok) {
          const errText = await resp.text();
          throw new Error(`HTTP ${resp.status}: ${errText.slice(0, 300)}`);
        }

        const data = await resp.json();
        if (!data.results || !Array.isArray(data.results)) {
          throw new Error(`Unexpected response: ${JSON.stringify(data).slice(0, 300)}`);
        }

        allResults.push(...data.results);
      }

      // Flatten multi-meeting results into individual review rows
      const rows: NonNullable<typeof scrapeResults> = [];
      for (const r of allResults) {
        const meetingsArr = r.meetings as Array<Record<string, unknown>> | undefined;
        if (r.status === "found" && meetingsArr?.length) {
          let first = true;
          for (const m of meetingsArr) {
            rows.push({
              id: r.id as string,
              org_name: r.name as string,
              meeting_name: (m.meeting_name as string) || (r.name as string),
              start_date: m.start_date as string | null,
              end_date: m.end_date as string | null,
              city: m.city as string | null,
              state_country: m.state_country as string | null,
              status: "found",
              is_new: !first,
              approved: true,
            });
            first = false;
          }
        } else {
          rows.push({
            id: r.id as string,
            org_name: r.name as string,
            meeting_name: r.name as string,
            start_date: null,
            end_date: null,
            city: null,
            state_country: null,
            status: r.status as string,
            is_new: false,
            approved: false,
          });
        }
      }
      setScrapeResults(rows);

      // Log first 3 raw results for debugging
      const notFound = allResults.filter((r) => r.status !== "found").slice(0, 3);
      if (notFound.length > 0) {
        console.log("Scraper debug (first 3 not_found):", notFound.map((r) => ({ name: r.name, status: r.status, error: r.error })));
      }
    } catch (e) {
      alert("Scraper failed: " + (e as Error).message);
    }
    setScraping(false);
    setScrapeProgress("");
  }

  async function applyScrapeResults() {
    const approved = scrapeResults?.filter((r) => r.approved && r.start_date);
    if (!approved?.length) return;
    for (const r of approved) {
      if (r.is_new) {
        // New meeting discovered — check for duplicates first, then insert
        const source = meetings.find((m) => m.id === r.id);
        const { data: existing } = await supabase
          .from("meeting_dates")
          .select("id")
          .eq("name", r.meeting_name)
          .eq("start_date", r.start_date)
          .limit(1);
        if (existing && existing.length > 0) continue; // skip duplicate
        await supabase.from("meeting_dates").insert({
          name: r.meeting_name,
          org_short: source?.org_short ?? null,
          category: source?.category ?? null,
          tags: source?.tags ?? [],
          website_url: source?.website_url ?? null,
          source_url: source?.source_url ?? null,
          start_date: r.start_date,
          end_date: r.end_date,
          city: r.city,
          state_country: r.state_country,
          last_verified: new Date().toISOString(),
        });
      } else {
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
    }
    setScrapeResults(null);
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
          onClick={handleScrape}
          disabled={scraping}
          className="rounded-md border border-[var(--primary)] px-4 py-2 text-sm font-medium text-[var(--primary)] hover:bg-[var(--primary)] hover:text-white disabled:opacity-50 transition-colors"
        >
          {scraping ? (scrapeProgress || "Scraping...") : "Refresh All Dates"}
        </button>
        <button
          onClick={openNew}
          className="rounded-md bg-[var(--primary)] px-4 py-2 text-sm font-medium text-white hover:opacity-90"
        >
          + Add Meeting
        </button>
      </div>

      {/* Scraper Review Results */}
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
                <th className="px-2 py-1">Organization</th>
                <th className="px-2 py-1">Meeting</th>
                <th className="px-2 py-1">Scraped Dates</th>
                <th className="px-2 py-1">Location</th>
                <th className="px-2 py-1">Status</th>
              </tr>
            </thead>
            <tbody>
              {scrapeResults.map((r, i) => (
                <tr
                  key={`${r.id}-${i}`}
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
                  <td className="px-2 py-1.5 text-[var(--muted)]">{r.org_name}</td>
                  <td className="px-2 py-1.5 font-medium">
                    {r.meeting_name}
                    {r.is_new && (
                      <span className="ml-1 text-[10px] bg-blue-100 text-blue-700 px-1.5 py-0.5 rounded">
                        New
                      </span>
                    )}
                  </td>
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
                  <div className="font-medium">
                    {m.featured && <span className="text-amber-500 mr-1" title="Featured">★</span>}
                    {m.name}
                  </div>
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

      <EditModal
        title={isNew ? "Add Meeting" : "Edit Meeting"}
        isOpen={!!editing}
        onClose={() => setEditing(null)}
        onSubmit={(e) => { e.preventDefault(); handleSave(); }}
        isSubmitting={saving}
      >
        <FormField label="Meeting Name" required>
          <input
            className={inputClass}
            value={form.name}
            onChange={(e) => setForm({ ...form, name: e.target.value })}
            required
          />
        </FormField>
        <FormField label="Org Abbreviation">
          <input
            className={inputClass}
            value={form.org_short}
            onChange={(e) => setForm({ ...form, org_short: e.target.value })}
            placeholder="e.g. ACHE"
          />
        </FormField>
        <div className="grid grid-cols-2 gap-3">
          <FormField label="Start Date">
            <input
              type="date"
              className={inputClass}
              value={form.start_date}
              onChange={(e) => setForm({ ...form, start_date: e.target.value })}
            />
          </FormField>
          <FormField label="End Date">
            <input
              type="date"
              className={inputClass}
              value={form.end_date}
              onChange={(e) => setForm({ ...form, end_date: e.target.value })}
            />
          </FormField>
        </div>
        <div className="grid grid-cols-2 gap-3">
          <FormField label="City">
            <input
              className={inputClass}
              value={form.city}
              onChange={(e) => setForm({ ...form, city: e.target.value })}
            />
          </FormField>
          <FormField label="State / Country">
            <input
              className={inputClass}
              value={form.state_country}
              onChange={(e) => setForm({ ...form, state_country: e.target.value })}
              placeholder="e.g. TX or DE"
            />
          </FormField>
        </div>
        <FormField label="Category">
          <select
            className={selectClass}
            value={form.category}
            onChange={(e) => setForm({ ...form, category: e.target.value })}
          >
            <option value="">Select...</option>
            {CATEGORIES.map((c) => (
              <option key={c} value={c}>
                {c.replace("-", " ")}
              </option>
            ))}
          </select>
        </FormField>
        <FormField label="Tags (comma-separated)">
          <input
            className={inputClass}
            value={form.tags}
            onChange={(e) => setForm({ ...form, tags: e.target.value })}
            placeholder="SUPPLY CHAIN, C-SUITE"
          />
        </FormField>
        <FormField label="Website URL">
          <input
            className={inputClass}
            value={form.website_url}
            onChange={(e) => setForm({ ...form, website_url: e.target.value })}
          />
        </FormField>
        <FormField label="Source URL (for scraper)">
          <input
            className={inputClass}
            value={form.source_url}
            onChange={(e) => setForm({ ...form, source_url: e.target.value })}
          />
        </FormField>
        <FormField label="Notes">
          <textarea
            className={inputClass}
            rows={2}
            value={form.notes}
            onChange={(e) => setForm({ ...form, notes: e.target.value })}
          />
        </FormField>
        <label className="flex items-center gap-2 cursor-pointer">
          <input
            type="checkbox"
            checked={form.featured}
            onChange={(e) => setForm({ ...form, featured: e.target.checked })}
            className="rounded border-gray-300"
          />
          <span className="text-sm font-medium">★ Featured Meeting</span>
          <span className="text-xs text-[var(--muted)]">Highlighted on public calendar</span>
        </label>
      </EditModal>
    </div>
  );
}

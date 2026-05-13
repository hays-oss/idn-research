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

"use client";

import { useState } from "react";
import { LinkedInInfluencer } from "@/lib/types";
import { supabase } from "@/lib/supabase";
import EditModal, { FormField, inputClass } from "./EditModal";

interface InfluencersAdminProps {
  influencers: LinkedInInfluencer[];
  onRefresh: () => void;
}

const emptyForm = {
  name: "",
  linkedin_url: "",
  title: "",
  organization: "",
  bio: "",
  display_order: 0,
  is_active: true,
};

export default function InfluencersAdmin({
  influencers,
  onRefresh,
}: InfluencersAdminProps) {
  const [search, setSearch] = useState("");
  const [modalOpen, setModalOpen] = useState(false);
  const [editingId, setEditingId] = useState<string | null>(null);
  const [form, setForm] = useState(emptyForm);
  const [isSubmitting, setIsSubmitting] = useState(false);

  const filtered = influencers.filter((i) => {
    const q = search.toLowerCase();
    return (
      i.name.toLowerCase().includes(q) ||
      (i.title ?? "").toLowerCase().includes(q) ||
      (i.organization ?? "").toLowerCase().includes(q)
    );
  });

  function openAdd() {
    setEditingId(null);
    setForm(emptyForm);
    setModalOpen(true);
  }

  function openEdit(inf: LinkedInInfluencer) {
    setEditingId(inf.id);
    setForm({
      name: inf.name,
      linkedin_url: inf.linkedin_url,
      title: inf.title ?? "",
      organization: inf.organization ?? "",
      bio: inf.bio ?? "",
      display_order: inf.display_order,
      is_active: inf.is_active,
    });
    setModalOpen(true);
  }

  async function handleSubmit(e: React.FormEvent) {
    e.preventDefault();
    setIsSubmitting(true);

    const payload = {
      name: form.name,
      linkedin_url: form.linkedin_url,
      title: form.title || null,
      organization: form.organization || null,
      bio: form.bio || null,
      display_order: form.display_order,
      is_active: form.is_active,
    };

    if (editingId) {
      await supabase
        .from("linkedin_influencers")
        .update(payload)
        .eq("id", editingId);
    } else {
      await supabase.from("linkedin_influencers").insert(payload);
    }

    setIsSubmitting(false);
    setModalOpen(false);
    onRefresh();
  }

  async function handleDelete(id: string, name: string) {
    if (!window.confirm(`Delete influencer "${name}"? This cannot be undone.`))
      return;

    await supabase.from("linkedin_influencers").delete().eq("id", id);
    onRefresh();
  }

  async function toggleActive(id: string, current: boolean) {
    await supabase
      .from("linkedin_influencers")
      .update({ is_active: !current })
      .eq("id", id);
    onRefresh();
  }

  function truncateUrl(url: string, max = 35) {
    const clean = url.replace(/^https?:\/\/(www\.)?/, "");
    return clean.length > max ? clean.slice(0, max) + "..." : clean;
  }

  return (
    <div>
      {/* Header */}
      <div className="flex items-center justify-between gap-4 mb-6">
        <input
          type="text"
          placeholder="Search influencers..."
          value={search}
          onChange={(e) => setSearch(e.target.value)}
          className={inputClass + " max-w-sm"}
        />
        <button
          onClick={openAdd}
          className="rounded-lg bg-[var(--primary)] px-4 py-2 text-sm font-medium text-white hover:bg-[var(--primary-light)] whitespace-nowrap"
        >
          Add Influencer
        </button>
      </div>

      {/* Table */}
      <div className="overflow-x-auto rounded-lg border border-[var(--border)]">
        <table className="w-full text-sm">
          <thead>
            <tr className="border-b border-[var(--border)] bg-[var(--surface)]">
              <th className="text-xs font-medium text-[var(--muted)] uppercase px-4 py-3 text-left">
                Name
              </th>
              <th className="text-xs font-medium text-[var(--muted)] uppercase px-4 py-3 text-left">
                Title
              </th>
              <th className="text-xs font-medium text-[var(--muted)] uppercase px-4 py-3 text-left">
                Organization
              </th>
              <th className="text-xs font-medium text-[var(--muted)] uppercase px-4 py-3 text-left">
                LinkedIn URL
              </th>
              <th className="text-xs font-medium text-[var(--muted)] uppercase px-4 py-3 text-center">
                Active
              </th>
              <th className="text-xs font-medium text-[var(--muted)] uppercase px-4 py-3 text-center">
                Order
              </th>
              <th className="text-xs font-medium text-[var(--muted)] uppercase px-4 py-3 text-right">
                Actions
              </th>
            </tr>
          </thead>
          <tbody>
            {filtered.length === 0 ? (
              <tr>
                <td
                  colSpan={7}
                  className="px-4 py-8 text-center text-[var(--muted)]"
                >
                  {search
                    ? "No influencers match your search."
                    : "No influencers yet. Add one to get started."}
                </td>
              </tr>
            ) : (
              filtered.map((inf) => (
                <tr
                  key={inf.id}
                  className="border-b border-[var(--border)] hover:bg-[var(--surface)] transition-colors"
                >
                  <td className="px-4 py-3 font-medium text-[var(--foreground)]">
                    {inf.name}
                  </td>
                  <td className="px-4 py-3 text-[var(--muted)]">
                    {inf.title ?? "—"}
                  </td>
                  <td className="px-4 py-3 text-[var(--muted)]">
                    {inf.organization ?? "—"}
                  </td>
                  <td className="px-4 py-3">
                    <a
                      href={inf.linkedin_url}
                      target="_blank"
                      rel="noopener noreferrer"
                      className="text-[var(--primary)] hover:underline"
                    >
                      {truncateUrl(inf.linkedin_url)}
                    </a>
                  </td>
                  <td className="px-4 py-3 text-center">
                    <button
                      onClick={() => toggleActive(inf.id, inf.is_active)}
                      className={`inline-flex h-5 w-9 items-center rounded-full transition-colors ${
                        inf.is_active
                          ? "bg-[var(--primary)]"
                          : "bg-[var(--border)]"
                      }`}
                    >
                      <span
                        className={`inline-block h-3.5 w-3.5 rounded-full bg-white shadow transform transition-transform ${
                          inf.is_active ? "translate-x-4" : "translate-x-0.5"
                        }`}
                      />
                    </button>
                  </td>
                  <td className="px-4 py-3 text-center text-[var(--muted)]">
                    {inf.display_order}
                  </td>
                  <td className="px-4 py-3 text-right">
                    <div className="flex items-center justify-end gap-2">
                      <button
                        onClick={() => openEdit(inf)}
                        className="text-[var(--muted)] hover:text-[var(--foreground)] transition-colors"
                        title="Edit"
                      >
                        <svg
                          className="h-4 w-4"
                          fill="none"
                          stroke="currentColor"
                          viewBox="0 0 24 24"
                        >
                          <path
                            strokeLinecap="round"
                            strokeLinejoin="round"
                            strokeWidth={2}
                            d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"
                          />
                        </svg>
                      </button>
                      <button
                        onClick={() => handleDelete(inf.id, inf.name)}
                        className="text-[var(--muted)] hover:text-red-600 transition-colors"
                        title="Delete"
                      >
                        <svg
                          className="h-4 w-4"
                          fill="none"
                          stroke="currentColor"
                          viewBox="0 0 24 24"
                        >
                          <path
                            strokeLinecap="round"
                            strokeLinejoin="round"
                            strokeWidth={2}
                            d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"
                          />
                        </svg>
                      </button>
                    </div>
                  </td>
                </tr>
              ))
            )}
          </tbody>
        </table>
      </div>

      {/* Edit / Add Modal */}
      <EditModal
        title={editingId ? "Edit Influencer" : "Add Influencer"}
        isOpen={modalOpen}
        onClose={() => setModalOpen(false)}
        onSubmit={handleSubmit}
        isSubmitting={isSubmitting}
      >
        <FormField label="Name" required>
          <input
            type="text"
            required
            value={form.name}
            onChange={(e) => setForm({ ...form, name: e.target.value })}
            className={inputClass}
          />
        </FormField>

        <FormField label="LinkedIn URL" required>
          <input
            type="url"
            required
            value={form.linkedin_url}
            onChange={(e) => setForm({ ...form, linkedin_url: e.target.value })}
            placeholder="https://linkedin.com/in/..."
            className={inputClass}
          />
        </FormField>

        <FormField label="Title">
          <input
            type="text"
            value={form.title}
            onChange={(e) => setForm({ ...form, title: e.target.value })}
            className={inputClass}
          />
        </FormField>

        <FormField label="Organization">
          <input
            type="text"
            value={form.organization}
            onChange={(e) => setForm({ ...form, organization: e.target.value })}
            className={inputClass}
          />
        </FormField>

        <FormField label="Bio">
          <textarea
            value={form.bio}
            onChange={(e) => setForm({ ...form, bio: e.target.value })}
            rows={3}
            className={inputClass}
          />
        </FormField>

        <div className="grid grid-cols-2 gap-4">
          <FormField label="Display Order">
            <input
              type="number"
              value={form.display_order}
              onChange={(e) =>
                setForm({ ...form, display_order: parseInt(e.target.value) || 0 })
              }
              className={inputClass}
            />
          </FormField>

          <FormField label="Active">
            <div className="flex items-center h-[38px]">
              <button
                type="button"
                onClick={() => setForm({ ...form, is_active: !form.is_active })}
                className={`inline-flex h-5 w-9 items-center rounded-full transition-colors ${
                  form.is_active
                    ? "bg-[var(--primary)]"
                    : "bg-[var(--border)]"
                }`}
              >
                <span
                  className={`inline-block h-3.5 w-3.5 rounded-full bg-white shadow transform transition-transform ${
                    form.is_active ? "translate-x-4" : "translate-x-0.5"
                  }`}
                />
              </button>
              <span className="ml-2 text-sm text-[var(--muted)]">
                {form.is_active ? "Yes" : "No"}
              </span>
            </div>
          </FormField>
        </div>
      </EditModal>
    </div>
  );
}

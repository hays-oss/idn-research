"use client";

import { useState } from "react";
import { Resource, ResourceCategory } from "@/lib/types";
import { supabase } from "@/lib/supabase";
import EditModal, { FormField, inputClass, selectClass } from "./EditModal";

interface ResourcesAdminProps {
  resources: Resource[];
  categories: ResourceCategory[];
  onRefresh: () => void;
}

const ORGS = ["IHES", "CPES", "CSCE", "MUAI"] as const;

interface ResourceForm {
  name: string;
  url: string;
  category_id: string;
  description: string;
  tags: string;
  display_order: number;
  is_active: boolean;
  is_featured: boolean;
  affiliations: string[];
}

const emptyForm: ResourceForm = {
  name: "",
  url: "",
  category_id: "",
  description: "",
  tags: "",
  display_order: 0,
  is_active: true,
  is_featured: false,
  affiliations: [],
};

export default function ResourcesAdmin({
  resources,
  categories,
  onRefresh,
}: ResourcesAdminProps) {
  const [search, setSearch] = useState("");
  const [categoryFilter, setCategoryFilter] = useState("");
  const [modalOpen, setModalOpen] = useState(false);
  const [editingId, setEditingId] = useState<string | null>(null);
  const [form, setForm] = useState<ResourceForm>(emptyForm);
  const [isSubmitting, setIsSubmitting] = useState(false);

  const filtered = resources.filter((r) => {
    const matchesSearch = r.name.toLowerCase().includes(search.toLowerCase());
    const matchesCategory = !categoryFilter || r.category_id === categoryFilter;
    return matchesSearch && matchesCategory;
  });

  function getCategoryName(categoryId: string): string {
    const cat = categories.find((c) => c.id === categoryId);
    return cat ? cat.name : "—";
  }

  function openAdd() {
    setEditingId(null);
    setForm(emptyForm);
    setModalOpen(true);
  }

  function openEdit(resource: Resource) {
    setEditingId(resource.id);
    setForm({
      name: resource.name,
      url: resource.url,
      category_id: resource.category_id,
      description: resource.description ?? "",
      tags: (resource.tags ?? []).join(", "),
      display_order: resource.display_order,
      is_active: resource.is_active,
      is_featured: resource.is_featured,
      affiliations: resource.affiliations ?? [],
    });
    setModalOpen(true);
  }

  async function handleSubmit(e: React.FormEvent) {
    e.preventDefault();
    setIsSubmitting(true);

    const payload = {
      name: form.name,
      url: form.url,
      category_id: form.category_id,
      description: form.description || null,
      tags: form.tags
        .split(",")
        .map((t) => t.trim())
        .filter(Boolean),
      display_order: form.display_order,
      is_active: form.is_active,
      is_featured: form.is_featured,
      affiliations: form.affiliations,
    };

    if (editingId) {
      await supabase.from("resources").update(payload).eq("id", editingId);
    } else {
      await supabase.from("resources").insert(payload);
    }

    setIsSubmitting(false);
    setModalOpen(false);
    onRefresh();
  }

  async function handleDelete(resource: Resource) {
    if (!window.confirm(`Delete "${resource.name}"? This cannot be undone.`)) return;
    await supabase.from("resources").delete().eq("id", resource.id);
    onRefresh();
  }

  async function toggleActive(resource: Resource) {
    await supabase
      .from("resources")
      .update({ is_active: !resource.is_active })
      .eq("id", resource.id);
    onRefresh();
  }

  return (
    <div>
      {/* Toolbar */}
      <div className="mb-4 flex flex-col gap-3 sm:flex-row sm:items-center sm:justify-between">
        <div className="flex flex-1 gap-3">
          <input
            type="text"
            placeholder="Search resources..."
            value={search}
            onChange={(e) => setSearch(e.target.value)}
            className={inputClass + " max-w-xs"}
          />
          <select
            value={categoryFilter}
            onChange={(e) => setCategoryFilter(e.target.value)}
            className={selectClass + " max-w-[200px]"}
          >
            <option value="">All Categories</option>
            {categories.map((c) => (
              <option key={c.id} value={c.id}>
                {c.name}
              </option>
            ))}
          </select>
        </div>
        <button
          onClick={openAdd}
          className="rounded-lg bg-[var(--primary)] px-4 py-2 text-sm font-medium text-white hover:bg-[var(--primary-light)] transition-colors"
        >
          Add Resource
        </button>
      </div>

      {/* Table */}
      <div className="overflow-x-auto rounded-lg border border-[var(--border)]">
        <table className="w-full text-sm">
          <thead>
            <tr className="border-b border-[var(--border)] bg-[var(--surface)]">
              <th className="px-4 py-3 text-left font-medium text-[var(--muted)]">Name</th>
              <th className="px-4 py-3 text-left font-medium text-[var(--muted)]">Category</th>
              <th className="px-4 py-3 text-left font-medium text-[var(--muted)]">URL</th>
              <th className="px-4 py-3 text-center font-medium text-[var(--muted)]">Active</th>
              <th className="px-4 py-3 text-center font-medium text-[var(--muted)]">Order</th>
              <th className="px-4 py-3 text-right font-medium text-[var(--muted)]">Actions</th>
            </tr>
          </thead>
          <tbody>
            {filtered.length === 0 ? (
              <tr>
                <td colSpan={6} className="px-4 py-8 text-center text-[var(--muted)]">
                  No resources found.
                </td>
              </tr>
            ) : (
              filtered.map((resource) => (
                <tr
                  key={resource.id}
                  className="border-b border-[var(--border)] last:border-0 hover:bg-[var(--surface)] transition-colors"
                >
                  <td className="px-4 py-3 font-medium text-[var(--foreground)]">
                    {resource.name.length > 40
                      ? resource.name.slice(0, 40) + "..."
                      : resource.name}
                  </td>
                  <td className="px-4 py-3 text-[var(--muted)]">
                    {getCategoryName(resource.category_id)}
                  </td>
                  <td className="px-4 py-3">
                    <a
                      href={resource.url}
                      target="_blank"
                      rel="noopener noreferrer"
                      className="text-[var(--primary)] hover:underline"
                    >
                      {resource.url.length > 50
                        ? resource.url.slice(0, 50) + "..."
                        : resource.url}
                    </a>
                  </td>
                  <td className="px-4 py-3 text-center">
                    <button
                      onClick={() => toggleActive(resource)}
                      className={`inline-flex h-5 w-9 items-center rounded-full transition-colors ${
                        resource.is_active ? "bg-[var(--primary)]" : "bg-gray-300"
                      }`}
                    >
                      <span
                        className={`inline-block h-4 w-4 transform rounded-full bg-white shadow transition-transform ${
                          resource.is_active ? "translate-x-4" : "translate-x-0.5"
                        }`}
                      />
                    </button>
                  </td>
                  <td className="px-4 py-3 text-center text-[var(--muted)]">
                    {resource.display_order}
                  </td>
                  <td className="px-4 py-3 text-right">
                    <div className="flex items-center justify-end gap-2">
                      <button
                        onClick={() => openEdit(resource)}
                        className="rounded-md px-2 py-1 text-xs font-medium text-[var(--primary)] hover:bg-[var(--primary)]/10 transition-colors"
                      >
                        Edit
                      </button>
                      <button
                        onClick={() => handleDelete(resource)}
                        className="rounded-md px-2 py-1 text-xs font-medium text-red-600 hover:bg-red-50 transition-colors"
                      >
                        Delete
                      </button>
                    </div>
                  </td>
                </tr>
              ))
            )}
          </tbody>
        </table>
      </div>

      {/* Add / Edit Modal */}
      <EditModal
        title={editingId ? "Edit Resource" : "Add Resource"}
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

        <FormField label="URL" required>
          <input
            type="url"
            required
            value={form.url}
            onChange={(e) => setForm({ ...form, url: e.target.value })}
            className={inputClass}
            placeholder="https://..."
          />
        </FormField>

        <FormField label="Category" required>
          <select
            required
            value={form.category_id}
            onChange={(e) => setForm({ ...form, category_id: e.target.value })}
            className={selectClass}
          >
            <option value="">Select a category</option>
            {categories.map((c) => (
              <option key={c.id} value={c.id}>
                {c.name}
              </option>
            ))}
          </select>
        </FormField>

        <FormField label="Description">
          <textarea
            value={form.description}
            onChange={(e) => setForm({ ...form, description: e.target.value })}
            className={inputClass}
            rows={3}
          />
        </FormField>

        <FormField label="Tags (comma-separated)">
          <input
            type="text"
            value={form.tags}
            onChange={(e) => setForm({ ...form, tags: e.target.value })}
            className={inputClass}
            placeholder="e.g. ai, research, tools"
          />
        </FormField>

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

        <div className="flex items-center gap-6">
          <label className="flex items-center gap-2 text-sm text-[var(--foreground)]">
            <input
              type="checkbox"
              checked={form.is_active}
              onChange={(e) => setForm({ ...form, is_active: e.target.checked })}
              className="rounded border-[var(--border)] text-[var(--primary)] focus:ring-[var(--primary)]"
            />
            Active
          </label>
          <label className="flex items-center gap-2 text-sm text-[var(--foreground)]">
            <input
              type="checkbox"
              checked={form.is_featured}
              onChange={(e) => setForm({ ...form, is_featured: e.target.checked })}
              className="rounded border-[var(--border)] text-[var(--primary)] focus:ring-[var(--primary)]"
            />
            Featured
          </label>
        </div>

        {/* Affiliations */}
        <FormField label="Organization Affiliations">
          <div className="flex flex-wrap gap-3">
            {ORGS.map((org) => (
              <label key={org} className="flex items-center gap-2 text-sm text-[var(--foreground)]">
                <input
                  type="checkbox"
                  checked={form.affiliations.includes(org)}
                  onChange={(e) => {
                    const next = e.target.checked
                      ? [...form.affiliations, org]
                      : form.affiliations.filter((a) => a !== org);
                    setForm({ ...form, affiliations: next });
                  }}
                  className="rounded border-[var(--border)] text-[var(--primary)] focus:ring-[var(--primary)]"
                />
                <span className="font-semibold">{org}</span>
              </label>
            ))}
          </div>
        </FormField>
      </EditModal>
    </div>
  );
}

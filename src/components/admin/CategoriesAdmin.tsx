"use client";

import { useState } from "react";
import { ResourceCategory } from "@/lib/types";
import { supabase } from "@/lib/supabase";
import EditModal, { FormField, inputClass } from "./EditModal";

interface CategoriesAdminProps {
  categories: ResourceCategory[];
  onRefresh: () => void;
}

const emptyForm = {
  name: "",
  slug: "",
  description: "",
  display_order: 0,
  is_active: true,
};

function generateSlug(name: string): string {
  return name
    .toLowerCase()
    .replace(/[^a-z0-9]+/g, "-")
    .replace(/(^-|-$)/g, "");
}

export default function CategoriesAdmin({
  categories,
  onRefresh,
}: CategoriesAdminProps) {
  const [search, setSearch] = useState("");
  const [modalOpen, setModalOpen] = useState(false);
  const [editingId, setEditingId] = useState<string | null>(null);
  const [form, setForm] = useState(emptyForm);
  const [isSubmitting, setIsSubmitting] = useState(false);
  const [deleteConfirmId, setDeleteConfirmId] = useState<string | null>(null);
  const [deleteError, setDeleteError] = useState<string | null>(null);

  const filtered = categories.filter((c) =>
    c.name.toLowerCase().includes(search.toLowerCase())
  );

  // --- Modal helpers ---

  function openAdd() {
    setEditingId(null);
    setForm(emptyForm);
    setModalOpen(true);
  }

  function openEdit(cat: ResourceCategory) {
    setEditingId(cat.id);
    setForm({
      name: cat.name,
      slug: cat.slug,
      description: cat.description ?? "",
      display_order: cat.display_order,
      is_active: cat.is_active,
    });
    setModalOpen(true);
  }

  function closeModal() {
    setModalOpen(false);
    setEditingId(null);
    setForm(emptyForm);
  }

  function handleNameChange(name: string) {
    setForm((prev) => ({
      ...prev,
      name,
      slug: editingId ? prev.slug : generateSlug(name),
    }));
  }

  // --- Mutations ---

  async function handleSubmit(e: React.FormEvent) {
    e.preventDefault();
    setIsSubmitting(true);

    const payload = {
      name: form.name.trim(),
      slug: form.slug.trim(),
      description: form.description.trim() || null,
      display_order: form.display_order,
      is_active: form.is_active,
    };

    if (editingId) {
      const { error } = await supabase
        .from("resource_categories")
        .update(payload)
        .eq("id", editingId);
      if (!error) {
        closeModal();
        onRefresh();
      }
    } else {
      const { error } = await supabase
        .from("resource_categories")
        .insert(payload);
      if (!error) {
        closeModal();
        onRefresh();
      }
    }

    setIsSubmitting(false);
  }

  async function handleToggleActive(cat: ResourceCategory) {
    const { error } = await supabase
      .from("resource_categories")
      .update({ is_active: !cat.is_active })
      .eq("id", cat.id);
    if (!error) onRefresh();
  }

  async function handleDeleteClick(id: string) {
    setDeleteError(null);

    // Check if category has resources
    const { count, error } = await supabase
      .from("resources")
      .select("id", { count: "exact", head: true })
      .eq("category_id", id);

    if (error) {
      setDeleteError("Failed to check resources.");
      setDeleteConfirmId(id);
      return;
    }

    if (count && count > 0) {
      setDeleteError(
        `Cannot delete: this category has ${count} resource${count > 1 ? "s" : ""}. Remove them first.`
      );
      setDeleteConfirmId(id);
      return;
    }

    setDeleteConfirmId(id);
  }

  async function confirmDelete() {
    if (!deleteConfirmId || deleteError) return;

    const { error } = await supabase
      .from("resource_categories")
      .delete()
      .eq("id", deleteConfirmId);
    if (!error) {
      setDeleteConfirmId(null);
      onRefresh();
    }
  }

  // --- Render ---

  return (
    <div>
      {/* Header row */}
      <div className="mb-4 flex items-center gap-3">
        <input
          type="text"
          placeholder="Search categories..."
          value={search}
          onChange={(e) => setSearch(e.target.value)}
          className="w-full rounded-lg border border-[var(--border)] bg-white px-3 py-2 text-sm text-[var(--foreground)] focus:border-[var(--primary)] focus:outline-none focus:ring-1 focus:ring-[var(--primary)]"
        />
        <button
          onClick={openAdd}
          className="shrink-0 rounded-lg bg-[var(--primary)] px-4 py-2 text-sm font-medium text-white hover:bg-[var(--primary-light)] transition-colors"
        >
          Add Category
        </button>
      </div>

      {/* Table */}
      <div className="overflow-x-auto rounded-lg border border-[var(--border)]">
        <table className="w-full text-sm">
          <thead>
            <tr className="bg-[var(--surface)]">
              <th className="px-4 py-3 text-left text-xs font-medium text-[var(--muted)] uppercase">
                Name
              </th>
              <th className="px-4 py-3 text-left text-xs font-medium text-[var(--muted)] uppercase">
                Slug
              </th>
              <th className="px-4 py-3 text-left text-xs font-medium text-[var(--muted)] uppercase">
                Display Order
              </th>
              <th className="px-4 py-3 text-left text-xs font-medium text-[var(--muted)] uppercase">
                Active
              </th>
              <th className="px-4 py-3 text-right text-xs font-medium text-[var(--muted)] uppercase">
                Actions
              </th>
            </tr>
          </thead>
          <tbody>
            {filtered.length === 0 ? (
              <tr>
                <td
                  colSpan={5}
                  className="px-4 py-8 text-center text-sm text-[var(--muted)]"
                >
                  {search ? "No categories match your search." : "No categories yet."}
                </td>
              </tr>
            ) : (
              filtered.map((cat) => (
                <tr key={cat.id} className="border-b border-[var(--border)]">
                  <td className="px-4 py-3 font-medium text-[var(--foreground)]">
                    {cat.name}
                  </td>
                  <td className="px-4 py-3 text-[var(--muted)]">{cat.slug}</td>
                  <td className="px-4 py-3 text-[var(--muted)]">
                    {cat.display_order}
                  </td>
                  <td className="px-4 py-3">
                    <button
                      onClick={() => handleToggleActive(cat)}
                      className={`relative inline-flex h-5 w-9 shrink-0 cursor-pointer rounded-full border-2 border-transparent transition-colors ${
                        cat.is_active
                          ? "bg-[var(--primary)]"
                          : "bg-[var(--border)]"
                      }`}
                      role="switch"
                      aria-checked={cat.is_active}
                    >
                      <span
                        className={`pointer-events-none inline-block h-4 w-4 transform rounded-full bg-white shadow ring-0 transition-transform ${
                          cat.is_active ? "translate-x-4" : "translate-x-0"
                        }`}
                      />
                    </button>
                  </td>
                  <td className="px-4 py-3 text-right">
                    <div className="flex items-center justify-end gap-2">
                      <button
                        onClick={() => openEdit(cat)}
                        className="rounded px-2 py-1 text-xs font-medium text-[var(--primary)] hover:bg-[var(--surface)] transition-colors"
                      >
                        Edit
                      </button>
                      <button
                        onClick={() => handleDeleteClick(cat.id)}
                        className="rounded px-2 py-1 text-xs font-medium text-red-600 hover:bg-red-50 transition-colors"
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

      {/* Delete confirmation */}
      {deleteConfirmId && (
        <div className="fixed inset-0 z-[100] flex items-center justify-center">
          <div
            className="absolute inset-0 bg-black/50"
            onClick={() => {
              setDeleteConfirmId(null);
              setDeleteError(null);
            }}
          />
          <div className="relative bg-white rounded-xl shadow-xl w-full max-w-sm mx-4 p-6">
            {deleteError ? (
              <>
                <p className="text-sm text-red-600 mb-4">{deleteError}</p>
                <div className="flex justify-end">
                  <button
                    onClick={() => {
                      setDeleteConfirmId(null);
                      setDeleteError(null);
                    }}
                    className="rounded-lg px-4 py-2 text-sm font-medium text-[var(--muted)] hover:bg-[var(--surface)] transition-colors"
                  >
                    Close
                  </button>
                </div>
              </>
            ) : (
              <>
                <p className="text-sm text-[var(--foreground)] mb-4">
                  Are you sure you want to delete this category? This action
                  cannot be undone.
                </p>
                <div className="flex justify-end gap-3">
                  <button
                    onClick={() => setDeleteConfirmId(null)}
                    className="rounded-lg px-4 py-2 text-sm font-medium text-[var(--muted)] hover:bg-[var(--surface)] transition-colors"
                  >
                    Cancel
                  </button>
                  <button
                    onClick={confirmDelete}
                    className="rounded-lg bg-red-600 px-4 py-2 text-sm font-medium text-white hover:bg-red-700 transition-colors"
                  >
                    Delete
                  </button>
                </div>
              </>
            )}
          </div>
        </div>
      )}

      {/* Add / Edit modal */}
      <EditModal
        title={editingId ? "Edit Category" : "Add Category"}
        isOpen={modalOpen}
        onClose={closeModal}
        onSubmit={handleSubmit}
        isSubmitting={isSubmitting}
      >
        <FormField label="Name" required>
          <input
            type="text"
            required
            value={form.name}
            onChange={(e) => handleNameChange(e.target.value)}
            className={inputClass}
          />
        </FormField>

        <FormField label="Slug" required>
          <input
            type="text"
            required
            value={form.slug}
            onChange={(e) =>
              setForm((prev) => ({ ...prev, slug: e.target.value }))
            }
            className={inputClass}
          />
        </FormField>

        <FormField label="Description">
          <textarea
            value={form.description}
            onChange={(e) =>
              setForm((prev) => ({ ...prev, description: e.target.value }))
            }
            rows={3}
            className={inputClass}
          />
        </FormField>

        <FormField label="Display Order">
          <input
            type="number"
            value={form.display_order}
            onChange={(e) =>
              setForm((prev) => ({
                ...prev,
                display_order: parseInt(e.target.value, 10) || 0,
              }))
            }
            className={inputClass}
          />
        </FormField>

        <FormField label="Active">
          <label className="flex items-center gap-2 cursor-pointer">
            <input
              type="checkbox"
              checked={form.is_active}
              onChange={(e) =>
                setForm((prev) => ({ ...prev, is_active: e.target.checked }))
              }
              className="h-4 w-4 rounded border-[var(--border)] text-[var(--primary)] focus:ring-[var(--primary)]"
            />
            <span className="text-sm text-[var(--foreground)]">
              Category is visible to users
            </span>
          </label>
        </FormField>
      </EditModal>
    </div>
  );
}

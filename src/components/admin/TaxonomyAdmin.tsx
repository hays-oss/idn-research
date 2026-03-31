"use client";

import { useState, useMemo } from "react";
import { TaxonomyDomain, TaxonomySubcategory, CategoryTaxonomy } from "@/lib/types";
import { supabase } from "@/lib/supabase";
import EditModal, { FormField, inputClass } from "./EditModal";

interface TaxonomyAdminProps {
  domains: TaxonomyDomain[];
  subcategories: TaxonomySubcategory[];
  tags: CategoryTaxonomy[];
  onRefresh: () => void;
}

type ModalMode =
  | { type: "add-domain" }
  | { type: "edit-domain"; domain: TaxonomyDomain }
  | { type: "add-subcategory"; domainId: number }
  | { type: "edit-subcategory"; subcategory: TaxonomySubcategory }
  | { type: "add-tag"; subcategoryId: number }
  | { type: "edit-tag"; tag: CategoryTaxonomy }
  | null;

// ── Chevron icon ──────────────────────────────────────────────
function ChevronIcon({ expanded }: { expanded: boolean }) {
  return (
    <svg
      className={`h-4 w-4 shrink-0 transition-transform ${expanded ? "rotate-90" : ""}`}
      fill="none"
      stroke="currentColor"
      viewBox="0 0 24 24"
    >
      <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 5l7 7-7 7" />
    </svg>
  );
}

// ── Small icon buttons ────────────────────────────────────────
function PlusButton({ onClick }: { onClick: () => void }) {
  return (
    <button
      onClick={(e) => { e.stopPropagation(); onClick(); }}
      className="rounded p-1 text-[var(--primary)] hover:bg-[var(--surface)] transition-colors"
      title="Add"
    >
      <svg className="h-4 w-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M12 4v16m8-8H4" />
      </svg>
    </button>
  );
}

function EditButton({ onClick }: { onClick: () => void }) {
  return (
    <button
      onClick={(e) => { e.stopPropagation(); onClick(); }}
      className="rounded px-2 py-1 text-xs font-medium text-[var(--primary)] hover:bg-[var(--surface)] transition-colors"
    >
      Edit
    </button>
  );
}

function ToggleActiveButton({
  isActive,
  onClick,
}: {
  isActive: boolean;
  onClick: () => void;
}) {
  return (
    <button
      onClick={(e) => { e.stopPropagation(); onClick(); }}
      className={`relative inline-flex h-5 w-9 shrink-0 cursor-pointer rounded-full border-2 border-transparent transition-colors ${
        isActive ? "bg-[var(--primary)]" : "bg-[var(--border)]"
      }`}
      role="switch"
      aria-checked={isActive}
      title={isActive ? "Deactivate" : "Activate"}
    >
      <span
        className={`pointer-events-none inline-block h-4 w-4 transform rounded-full bg-white shadow ring-0 transition-transform ${
          isActive ? "translate-x-4" : "translate-x-0"
        }`}
      />
    </button>
  );
}

// ── Badge chip ────────────────────────────────────────────────
function CountBadge({ count, label }: { count: number; label: string }) {
  return (
    <span className="inline-flex items-center rounded-full bg-[var(--surface)] px-2 py-0.5 text-xs text-[var(--muted)]">
      {count} {label}
    </span>
  );
}

// ════════════════════════════════════════════════════════════════
// Main component
// ════════════════════════════════════════════════════════════════

export default function TaxonomyAdmin({
  domains,
  subcategories,
  tags,
  onRefresh,
}: TaxonomyAdminProps) {
  const [search, setSearch] = useState("");
  const [expandedDomains, setExpandedDomains] = useState<Set<number>>(new Set());
  const [expandedSubcategories, setExpandedSubcategories] = useState<Set<number>>(new Set());
  const [modal, setModal] = useState<ModalMode>(null);
  const [isSubmitting, setIsSubmitting] = useState(false);

  // Form state
  const [domainForm, setDomainForm] = useState({ name: "", display_order: 0 });
  const [subcatForm, setSubcatForm] = useState({ domain_id: 0, name: "", display_order: 0 });
  const [tagForm, setTagForm] = useState({ subcategory_id: 0, level_3_tag: "", synonyms: "" });

  // ── Lookup maps ───────────────────────────────────────────
  const subcatsByDomain = useMemo(() => {
    const map = new Map<number, TaxonomySubcategory[]>();
    for (const sc of subcategories) {
      const list = map.get(sc.domain_id) || [];
      list.push(sc);
      map.set(sc.domain_id, list);
    }
    // Sort each group by display_order
    for (const list of map.values()) {
      list.sort((a, b) => a.display_order - b.display_order);
    }
    return map;
  }, [subcategories]);

  const tagsBySubcat = useMemo(() => {
    const map = new Map<number, CategoryTaxonomy[]>();
    for (const t of tags) {
      const list = map.get(t.subcategory_id) || [];
      list.push(t);
      map.set(t.subcategory_id, list);
    }
    for (const list of map.values()) {
      list.sort((a, b) => a.level_3_tag.localeCompare(b.level_3_tag));
    }
    return map;
  }, [tags]);

  // ── Search filter ─────────────────────────────────────────
  const searchLower = search.toLowerCase();

  const filteredDomains = useMemo(() => {
    if (!searchLower) return [...domains].sort((a, b) => a.display_order - b.display_order);

    return domains
      .filter((d) => {
        if (d.name.toLowerCase().includes(searchLower)) return true;
        const subs = subcatsByDomain.get(d.id) || [];
        for (const sc of subs) {
          if (sc.name.toLowerCase().includes(searchLower)) return true;
          const t = tagsBySubcat.get(sc.id) || [];
          for (const tag of t) {
            if (tag.level_3_tag.toLowerCase().includes(searchLower)) return true;
            if (tag.synonyms_json?.some((s) => s.toLowerCase().includes(searchLower))) return true;
          }
        }
        return false;
      })
      .sort((a, b) => a.display_order - b.display_order);
  }, [domains, searchLower, subcatsByDomain, tagsBySubcat]);

  function filteredSubcats(domainId: number) {
    const subs = subcatsByDomain.get(domainId) || [];
    if (!searchLower) return subs;
    return subs.filter((sc) => {
      if (sc.name.toLowerCase().includes(searchLower)) return true;
      const t = tagsBySubcat.get(sc.id) || [];
      for (const tag of t) {
        if (tag.level_3_tag.toLowerCase().includes(searchLower)) return true;
        if (tag.synonyms_json?.some((s) => s.toLowerCase().includes(searchLower))) return true;
      }
      return false;
    });
  }

  function filteredTags(subcatId: number) {
    const t = tagsBySubcat.get(subcatId) || [];
    if (!searchLower) return t;
    return t.filter(
      (tag) =>
        tag.level_3_tag.toLowerCase().includes(searchLower) ||
        tag.synonyms_json?.some((s) => s.toLowerCase().includes(searchLower))
    );
  }

  // ── Expand / collapse ─────────────────────────────────────
  function toggleDomain(id: number) {
    setExpandedDomains((prev) => {
      const next = new Set(prev);
      if (next.has(id)) next.delete(id);
      else next.add(id);
      return next;
    });
  }

  function toggleSubcategory(id: number) {
    setExpandedSubcategories((prev) => {
      const next = new Set(prev);
      if (next.has(id)) next.delete(id);
      else next.add(id);
      return next;
    });
  }

  // ── Modal openers ─────────────────────────────────────────
  function openAddDomain() {
    setDomainForm({ name: "", display_order: 0 });
    setModal({ type: "add-domain" });
  }

  function openEditDomain(d: TaxonomyDomain) {
    setDomainForm({ name: d.name, display_order: d.display_order });
    setModal({ type: "edit-domain", domain: d });
  }

  function openAddSubcategory(domainId: number) {
    setSubcatForm({ domain_id: domainId, name: "", display_order: 0 });
    setModal({ type: "add-subcategory", domainId });
  }

  function openEditSubcategory(sc: TaxonomySubcategory) {
    setSubcatForm({ domain_id: sc.domain_id, name: sc.name, display_order: sc.display_order });
    setModal({ type: "edit-subcategory", subcategory: sc });
  }

  function openAddTag(subcategoryId: number) {
    setTagForm({ subcategory_id: subcategoryId, level_3_tag: "", synonyms: "" });
    setModal({ type: "add-tag", subcategoryId });
  }

  function openEditTag(tag: CategoryTaxonomy) {
    setTagForm({
      subcategory_id: tag.subcategory_id,
      level_3_tag: tag.level_3_tag,
      synonyms: (tag.synonyms_json || []).join(", "),
    });
    setModal({ type: "edit-tag", tag });
  }

  function closeModal() {
    setModal(null);
  }

  // ── Helper: get next ID ───────────────────────────────────
  async function getNextId(table: string): Promise<number> {
    const { data } = await supabase
      .from(table)
      .select("id")
      .order("id", { ascending: false })
      .limit(1);
    const maxId = data && data.length > 0 ? (data[0].id as number) : 0;
    return maxId + 1;
  }

  // ── Mutations ─────────────────────────────────────────────
  async function handleSubmit(e: React.FormEvent) {
    e.preventDefault();
    setIsSubmitting(true);

    try {
      if (modal?.type === "add-domain") {
        const nextId = await getNextId("taxonomy_domains");
        const { error } = await supabase.from("taxonomy_domains").insert({
          id: nextId,
          name: domainForm.name.trim(),
          display_order: domainForm.display_order,
          is_active: true,
        });
        if (!error) { closeModal(); onRefresh(); }
      } else if (modal?.type === "edit-domain") {
        const { error } = await supabase
          .from("taxonomy_domains")
          .update({
            name: domainForm.name.trim(),
            display_order: domainForm.display_order,
          })
          .eq("id", modal.domain.id);
        if (!error) { closeModal(); onRefresh(); }
      } else if (modal?.type === "add-subcategory") {
        const nextId = await getNextId("taxonomy_subcategories");
        // Look up the domain name for level_1_category equivalent
        const { error } = await supabase.from("taxonomy_subcategories").insert({
          id: nextId,
          domain_id: subcatForm.domain_id,
          name: subcatForm.name.trim(),
          display_order: subcatForm.display_order,
          is_active: true,
        });
        if (!error) { closeModal(); onRefresh(); }
      } else if (modal?.type === "edit-subcategory") {
        const { error } = await supabase
          .from("taxonomy_subcategories")
          .update({
            name: subcatForm.name.trim(),
            display_order: subcatForm.display_order,
          })
          .eq("id", modal.subcategory.id);
        if (!error) { closeModal(); onRefresh(); }
      } else if (modal?.type === "add-tag") {
        const nextId = await getNextId("category_taxonomy");
        // Resolve the parent chain for denormalized columns
        const subcat = subcategories.find((s) => s.id === tagForm.subcategory_id);
        const domain = subcat ? domains.find((d) => d.id === subcat.domain_id) : null;
        const synonymsArr = tagForm.synonyms
          .split(",")
          .map((s) => s.trim())
          .filter(Boolean);

        const { error } = await supabase.from("category_taxonomy").insert({
          id: nextId,
          subcategory_id: tagForm.subcategory_id,
          level_1_category: domain?.name ?? "",
          level_2_subcategory: subcat?.name ?? "",
          level_3_tag: tagForm.level_3_tag.trim(),
          synonyms_json: synonymsArr,
          keyword_rules_json: {},
          is_active: true,
        });
        if (!error) { closeModal(); onRefresh(); }
      } else if (modal?.type === "edit-tag") {
        const synonymsArr = tagForm.synonyms
          .split(",")
          .map((s) => s.trim())
          .filter(Boolean);
        const { error } = await supabase
          .from("category_taxonomy")
          .update({
            level_3_tag: tagForm.level_3_tag.trim(),
            synonyms_json: synonymsArr,
          })
          .eq("id", modal.tag.id);
        if (!error) { closeModal(); onRefresh(); }
      }
    } finally {
      setIsSubmitting(false);
    }
  }

  async function toggleDomainActive(d: TaxonomyDomain) {
    const { error } = await supabase
      .from("taxonomy_domains")
      .update({ is_active: !d.is_active })
      .eq("id", d.id);
    if (!error) onRefresh();
  }

  async function toggleSubcatActive(sc: TaxonomySubcategory) {
    const { error } = await supabase
      .from("taxonomy_subcategories")
      .update({ is_active: !sc.is_active })
      .eq("id", sc.id);
    if (!error) onRefresh();
  }

  async function toggleTagActive(tag: CategoryTaxonomy) {
    const { error } = await supabase
      .from("category_taxonomy")
      .update({ is_active: !tag.is_active })
      .eq("id", tag.id);
    if (!error) onRefresh();
  }

  // ── Modal title ───────────────────────────────────────────
  function modalTitle(): string {
    if (!modal) return "";
    switch (modal.type) {
      case "add-domain": return "Add Domain";
      case "edit-domain": return "Edit Domain";
      case "add-subcategory": return "Add Subcategory";
      case "edit-subcategory": return "Edit Subcategory";
      case "add-tag": return "Add Tag";
      case "edit-tag": return "Edit Tag";
    }
  }

  // ── Render ────────────────────────────────────────────────
  return (
    <div>
      {/* Header row */}
      <div className="mb-4 flex items-center gap-3">
        <input
          type="text"
          placeholder="Search domains, subcategories, tags..."
          value={search}
          onChange={(e) => setSearch(e.target.value)}
          className="w-full rounded-lg border border-[var(--border)] bg-white px-3 py-2 text-sm text-[var(--foreground)] focus:border-[var(--primary)] focus:outline-none focus:ring-1 focus:ring-[var(--primary)]"
        />
        <button
          onClick={openAddDomain}
          className="shrink-0 rounded-lg bg-[var(--primary)] px-4 py-2 text-sm font-medium text-white hover:bg-[var(--primary-light)] transition-colors"
        >
          Add Domain
        </button>
      </div>

      {/* Tree view */}
      <div className="space-y-1">
        {filteredDomains.length === 0 ? (
          <div className="rounded-lg border border-[var(--border)] px-4 py-8 text-center text-sm text-[var(--muted)]">
            {search ? "No taxonomy items match your search." : "No domains yet."}
          </div>
        ) : (
          filteredDomains.map((domain) => {
            const isDomainExpanded = expandedDomains.has(domain.id);
            const domainSubcats = filteredSubcats(domain.id);
            const allSubcats = subcatsByDomain.get(domain.id) || [];

            return (
              <div
                key={domain.id}
                className={`rounded-lg border border-[var(--border)] overflow-hidden ${
                  !domain.is_active ? "opacity-50" : ""
                }`}
                style={{
                  borderLeftWidth: isDomainExpanded ? "3px" : "1px",
                  borderLeftColor: isDomainExpanded ? "var(--primary)" : undefined,
                }}
              >
                {/* Domain row */}
                <div
                  className="flex items-center gap-2 px-3 py-2.5 cursor-pointer hover:bg-[var(--surface)] transition-colors"
                  onClick={() => toggleDomain(domain.id)}
                >
                  <ChevronIcon expanded={isDomainExpanded} />
                  <span className="font-medium text-sm text-[var(--foreground)] flex-1">
                    {domain.name}
                  </span>
                  <CountBadge count={allSubcats.length} label={allSubcats.length === 1 ? "subcategory" : "subcategories"} />
                  <PlusButton onClick={() => openAddSubcategory(domain.id)} />
                  <EditButton onClick={() => openEditDomain(domain)} />
                  <ToggleActiveButton isActive={domain.is_active} onClick={() => toggleDomainActive(domain)} />
                </div>

                {/* Subcategories */}
                {isDomainExpanded && (
                  <div className="border-t border-[var(--border)]">
                    {domainSubcats.length === 0 ? (
                      <div className="pl-10 pr-3 py-3 text-xs text-[var(--muted)]">
                        No subcategories yet.
                      </div>
                    ) : (
                      domainSubcats.map((sc) => {
                        const isSubcatExpanded = expandedSubcategories.has(sc.id);
                        const scTags = filteredTags(sc.id);
                        const allTags = tagsBySubcat.get(sc.id) || [];

                        return (
                          <div
                            key={sc.id}
                            className={`${!sc.is_active ? "opacity-50" : ""}`}
                          >
                            {/* Subcategory row */}
                            <div
                              className="flex items-center gap-2 pl-8 pr-3 py-2 cursor-pointer hover:bg-[var(--surface)] transition-colors border-t border-[var(--border)] first:border-t-0"
                              onClick={() => toggleSubcategory(sc.id)}
                            >
                              <ChevronIcon expanded={isSubcatExpanded} />
                              <span className="text-sm text-[var(--foreground)] flex-1">
                                {sc.name}
                              </span>
                              <CountBadge count={allTags.length} label={allTags.length === 1 ? "tag" : "tags"} />
                              <PlusButton onClick={() => openAddTag(sc.id)} />
                              <EditButton onClick={() => openEditSubcategory(sc)} />
                              <ToggleActiveButton isActive={sc.is_active} onClick={() => toggleSubcatActive(sc)} />
                            </div>

                            {/* Tags */}
                            {isSubcatExpanded && (
                              <div className="bg-[var(--surface)]/30">
                                {scTags.length === 0 ? (
                                  <div className="pl-16 pr-3 py-2 text-xs text-[var(--muted)]">
                                    No tags yet.
                                  </div>
                                ) : (
                                  scTags.map((tag) => (
                                    <div
                                      key={tag.id}
                                      className={`flex items-center gap-2 pl-16 pr-3 py-1.5 border-t border-[var(--border)]/50 ${
                                        !tag.is_active ? "opacity-50" : ""
                                      }`}
                                    >
                                      <span className="text-xs text-[var(--foreground)] flex-1">
                                        {tag.level_3_tag}
                                        {tag.synonyms_json && tag.synonyms_json.length > 0 && (
                                          <span className="ml-2 text-[var(--muted)]">
                                            ({tag.synonyms_json.join(", ")})
                                          </span>
                                        )}
                                      </span>
                                      <EditButton onClick={() => openEditTag(tag)} />
                                      <ToggleActiveButton isActive={tag.is_active} onClick={() => toggleTagActive(tag)} />
                                    </div>
                                  ))
                                )}
                              </div>
                            )}
                          </div>
                        );
                      })
                    )}
                  </div>
                )}
              </div>
            );
          })
        )}
      </div>

      {/* ── Modals ─────────────────────────────────────────── */}
      <EditModal
        title={modalTitle()}
        isOpen={modal !== null}
        onClose={closeModal}
        onSubmit={handleSubmit}
        isSubmitting={isSubmitting}
      >
        {/* Domain form */}
        {(modal?.type === "add-domain" || modal?.type === "edit-domain") && (
          <>
            <FormField label="Name" required>
              <input
                type="text"
                required
                value={domainForm.name}
                onChange={(e) => setDomainForm((p) => ({ ...p, name: e.target.value }))}
                className={inputClass}
              />
            </FormField>
            <FormField label="Display Order">
              <input
                type="number"
                value={domainForm.display_order}
                onChange={(e) =>
                  setDomainForm((p) => ({ ...p, display_order: parseInt(e.target.value, 10) || 0 }))
                }
                className={inputClass}
              />
            </FormField>
          </>
        )}

        {/* Subcategory form */}
        {(modal?.type === "add-subcategory" || modal?.type === "edit-subcategory") && (
          <>
            <FormField label="Domain">
              <input
                type="text"
                disabled
                value={domains.find((d) => d.id === subcatForm.domain_id)?.name ?? ""}
                className={`${inputClass} bg-[var(--surface)] cursor-not-allowed`}
              />
            </FormField>
            <FormField label="Name" required>
              <input
                type="text"
                required
                value={subcatForm.name}
                onChange={(e) => setSubcatForm((p) => ({ ...p, name: e.target.value }))}
                className={inputClass}
              />
            </FormField>
            <FormField label="Display Order">
              <input
                type="number"
                value={subcatForm.display_order}
                onChange={(e) =>
                  setSubcatForm((p) => ({ ...p, display_order: parseInt(e.target.value, 10) || 0 }))
                }
                className={inputClass}
              />
            </FormField>
          </>
        )}

        {/* Tag form */}
        {(modal?.type === "add-tag" || modal?.type === "edit-tag") && (
          <>
            <FormField label="Subcategory">
              <input
                type="text"
                disabled
                value={subcategories.find((s) => s.id === tagForm.subcategory_id)?.name ?? ""}
                className={`${inputClass} bg-[var(--surface)] cursor-not-allowed`}
              />
            </FormField>
            <FormField label="Tag Name" required>
              <input
                type="text"
                required
                value={tagForm.level_3_tag}
                onChange={(e) => setTagForm((p) => ({ ...p, level_3_tag: e.target.value }))}
                className={inputClass}
              />
            </FormField>
            <FormField label="Synonyms">
              <input
                type="text"
                value={tagForm.synonyms}
                onChange={(e) => setTagForm((p) => ({ ...p, synonyms: e.target.value }))}
                placeholder="Comma-separated, e.g. EHR, EMR, Electronic Health Records"
                className={inputClass}
              />
              <p className="mt-1 text-xs text-[var(--muted)]">
                Separate multiple synonyms with commas. These help match companies to this tag.
              </p>
            </FormField>
          </>
        )}
      </EditModal>
    </div>
  );
}

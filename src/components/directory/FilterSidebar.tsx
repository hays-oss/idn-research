"use client";

import { useState, useMemo } from "react";
import { TaxonomyDomain, TaxonomySubcategory } from "@/lib/types";

const ORG_OPTIONS = [
  { code: "IHES", name: "IHES", color: "#127046" },
  { code: "CPES", name: "CPES", color: "#1f2c8c" },
  { code: "CSCE", name: "CSCE", color: "#ed7d1a" },
  { code: "MUIA", name: "MUIA", color: "#5a4a8a" },
];

interface TagOption {
  id: number;
  name: string;
  subcategory_id: number;
}

interface FilterSidebarProps {
  domains: TaxonomyDomain[];
  subcategories: TaxonomySubcategory[];
  tags: TagOption[];
  // Current filter state
  searchQuery: string;
  selectedOrgs: string[];
  selectedDomainId: number | null;
  selectedSubIds: number[];
  selectedTagIds: number[];
  // Domain company counts for display
  domainCounts: Record<number, number>;
  subCounts: Record<number, number>;
  totalResults: number;
  // Callbacks
  onSearchChange: (q: string) => void;
  onOrgsChange: (orgs: string[]) => void;
  onDomainChange: (id: number | null) => void;
  onSubsChange: (ids: number[]) => void;
  onTagsChange: (ids: number[]) => void;
  onClearAll: () => void;
}

export default function FilterSidebar({
  domains,
  subcategories,
  tags,
  searchQuery,
  selectedOrgs,
  selectedDomainId,
  selectedSubIds,
  selectedTagIds,
  domainCounts,
  subCounts,
  totalResults,
  onSearchChange,
  onOrgsChange,
  onDomainChange,
  onSubsChange,
  onTagsChange,
  onClearAll,
}: FilterSidebarProps) {
  const [expandedDomainId, setExpandedDomainId] = useState<number | null>(selectedDomainId);
  const [tagSearch, setTagSearch] = useState("");

  const activeFilterCount =
    selectedOrgs.length +
    (selectedDomainId ? 1 : 0) +
    selectedSubIds.length +
    selectedTagIds.length +
    (searchQuery ? 1 : 0);

  // Subcategories for the expanded domain
  const domainSubs = useMemo(
    () =>
      expandedDomainId
        ? subcategories.filter((s) => s.domain_id === expandedDomainId)
        : [],
    [expandedDomainId, subcategories]
  );

  // Tag search results
  const filteredTags = useMemo(() => {
    if (tagSearch.length < 2) return [];
    const q = tagSearch.toLowerCase();
    return tags
      .filter((t) => t.name.toLowerCase().includes(q))
      .slice(0, 20);
  }, [tags, tagSearch]);

  // Selected tag objects for chip display
  const selectedTagObjects = useMemo(
    () => tags.filter((t) => selectedTagIds.includes(t.id)),
    [tags, selectedTagIds]
  );

  function toggleOrg(code: string) {
    onOrgsChange(
      selectedOrgs.includes(code)
        ? selectedOrgs.filter((o) => o !== code)
        : [...selectedOrgs, code]
    );
  }

  function toggleDomain(id: number) {
    if (selectedDomainId === id) {
      onDomainChange(null);
      setExpandedDomainId(null);
    } else {
      onDomainChange(id);
      setExpandedDomainId(id);
      onSubsChange([]); // Reset sub selections when changing domain
    }
  }

  function expandDomainOnly(id: number) {
    if (expandedDomainId === id) {
      setExpandedDomainId(null);
    } else {
      setExpandedDomainId(id);
    }
  }

  function toggleSub(id: number) {
    // If toggling off, just remove
    if (selectedSubIds.includes(id)) {
      const newSubs = selectedSubIds.filter((s) => s !== id);
      onSubsChange(newSubs);
      // If no subs left, clear domain too
      if (newSubs.length === 0) {
        onDomainChange(null);
      }
      return;
    }
    // Toggling on — always set parent domain + this sub
    const sub = subcategories.find((s) => s.id === id);
    if (sub) {
      onDomainChange(sub.domain_id);
      setExpandedDomainId(sub.domain_id);
      onSubsChange([id]);
    }
  }

  function toggleTag(id: number) {
    onTagsChange(
      selectedTagIds.includes(id)
        ? selectedTagIds.filter((t) => t !== id)
        : [...selectedTagIds, id]
    );
  }

  function removeTag(id: number) {
    onTagsChange(selectedTagIds.filter((t) => t !== id));
  }

  return (
    <aside className="shrink-0 bg-cream-2 overflow-y-auto">
      <div className="p-4 space-y-6">
        {/* Header */}
        <div className="flex items-center justify-between">
          <h2 className="text-[10px] uppercase tracking-[0.22em] font-semibold text-oxblood">
            Filters
          </h2>
          {activeFilterCount > 0 && (
            <button
              onClick={onClearAll}
              className="font-serif italic text-[12px] text-oxblood hover:text-oxblood-deep transition-colors"
            >
              Clear all ({activeFilterCount})
            </button>
          )}
        </div>

        {/* Search */}
        <div>
          <input
            type="text"
            placeholder="Search companies…"
            value={searchQuery}
            onChange={(e) => onSearchChange(e.target.value)}
            className="w-full rounded-[3px] border border-rule bg-card px-3 py-2 text-[14px] text-ink placeholder:text-ink-muted focus:outline-none focus:border-ink focus:ring-1 focus:ring-ink"
          />
        </div>

        {/* Organizations */}
        <div>
          <h3 className="text-[10px] uppercase tracking-[0.18em] font-semibold text-ink-2 mb-2.5">
            Organizations
            {selectedOrgs.length > 0 && (
              <span className="ml-1.5 inline-flex h-4 w-4 items-center justify-center rounded-[2px] bg-oxblood text-[9px] text-cream font-bold">
                {selectedOrgs.length}
              </span>
            )}
          </h3>
          <div className="space-y-1.5">
            {ORG_OPTIONS.map((org) => (
              <label
                key={org.code}
                className="flex items-center gap-2 cursor-pointer group"
              >
                <input
                  type="checkbox"
                  checked={selectedOrgs.includes(org.code)}
                  onChange={() => toggleOrg(org.code)}
                  className="h-3.5 w-3.5 rounded-[2px] border-rule text-ink focus:ring-ink/20"
                />
                <span
                  className="inline-flex items-center rounded-[2px] px-1.5 py-0.5 text-[10px] font-bold tracking-[0.08em] text-white"
                  style={{ backgroundColor: org.color }}
                >
                  {org.code}
                </span>
                <span className="text-[12px] text-ink-2 group-hover:text-ink transition-colors">
                  {org.name}
                </span>
              </label>
            ))}
          </div>
        </div>

        {/* Domains & Subcategories */}
        <div>
          <h3 className="text-[10px] uppercase tracking-[0.18em] font-semibold text-ink-2 mb-2.5">
            Domains
            {selectedDomainId && (
              <span className="ml-1.5 inline-flex h-4 w-4 items-center justify-center rounded-[2px] bg-oxblood text-[9px] text-cream font-bold">
                1
              </span>
            )}
          </h3>
          <div className="space-y-0.5 max-h-[300px] overflow-y-auto">
            {domains.map((domain) => {
              const isSelected = selectedDomainId === domain.id;
              const isExpanded = expandedDomainId === domain.id;
              const count = domainCounts[domain.id] || 0;
              const subs = subcategories.filter((s) => s.domain_id === domain.id);

              return (
                <div key={domain.id}>
                  <div className="flex items-center gap-1">
                    <button
                      onClick={() => expandDomainOnly(domain.id)}
                      className="p-0.5 text-ink-muted hover:text-ink"
                    >
                      <svg
                        className={`h-3 w-3 transition-transform duration-150 ${
                          isExpanded ? "rotate-90" : ""
                        }`}
                        fill="none"
                        stroke="currentColor"
                        viewBox="0 0 24 24"
                      >
                        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 5l7 7-7 7" />
                      </svg>
                    </button>
                    <button
                      onClick={() => toggleDomain(domain.id)}
                      className={`flex-1 flex items-center justify-between border-l-2 px-2 py-1.5 text-left text-[12px] transition-colors ${
                        isSelected
                          ? "border-oxblood bg-cream text-ink font-semibold"
                          : "border-transparent text-ink-2 hover:bg-cream hover:text-ink"
                      }`}
                    >
                      <span className="truncate">{domain.name}</span>
                      <span className="text-[10px] text-ink-muted shrink-0 ml-1">{count}</span>
                    </button>
                  </div>

                  {/* Subcategories */}
                  {isExpanded && subs.length > 0 && (
                    <div className="ml-5 mt-0.5 mb-1 space-y-0.5">
                      {subs.map((sub) => {
                        const subCount = subCounts[sub.id] || 0;
                        if (subCount === 0) return null;
                        const isSubSelected = selectedSubIds.includes(sub.id);
                        return (
                          <button
                            key={sub.id}
                            onClick={() => toggleSub(sub.id)}
                            className={`flex w-full items-center justify-between rounded-[2px] px-2 py-1 text-left text-[11px] transition-colors ${
                              isSubSelected
                                ? "bg-cream text-oxblood font-semibold"
                                : "text-ink-muted hover:text-ink hover:bg-cream"
                            }`}
                          >
                            <span className="truncate">{sub.name}</span>
                            <span className="text-[10px] shrink-0 ml-1">{subCount}</span>
                          </button>
                        );
                      })}
                    </div>
                  )}
                </div>
              );
            })}
          </div>
        </div>

        {/* Tags */}
        <div>
          <h3 className="text-[10px] uppercase tracking-[0.18em] font-semibold text-ink-2 mb-2.5">
            Tags
            {selectedTagIds.length > 0 && (
              <span className="ml-1.5 inline-flex h-4 w-4 items-center justify-center rounded-[2px] bg-oxblood text-[9px] text-cream font-bold">
                {selectedTagIds.length}
              </span>
            )}
          </h3>

          {/* Selected tag chips */}
          {selectedTagObjects.length > 0 && (
            <div className="flex flex-wrap gap-1 mb-2">
              {selectedTagObjects.map((tag) => (
                <span
                  key={tag.id}
                  className="inline-flex items-center gap-1 rounded-[2px] bg-ink/10 border border-ink/20 px-2 py-0.5 text-[11px] text-ink"
                >
                  {tag.name}
                  <button
                    onClick={() => removeTag(tag.id)}
                    className="hover:text-oxblood"
                  >
                    <svg className="h-2.5 w-2.5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M6 18L18 6M6 6l12 12" />
                    </svg>
                  </button>
                </span>
              ))}
            </div>
          )}

          {/* Tag search */}
          <input
            type="text"
            placeholder="Search tags…"
            value={tagSearch}
            onChange={(e) => setTagSearch(e.target.value)}
            className="w-full rounded-[3px] border border-rule bg-card px-3 py-1.5 text-[12px] text-ink placeholder:text-ink-muted focus:outline-none focus:border-ink focus:ring-1 focus:ring-ink"
          />
          {filteredTags.length > 0 && (
            <div className="mt-1.5 max-h-[150px] overflow-y-auto rounded-[3px] border border-rule bg-card">
              {filteredTags.map((tag) => {
                const isSelected = selectedTagIds.includes(tag.id);
                return (
                  <button
                    key={tag.id}
                    onClick={() => toggleTag(tag.id)}
                    className={`flex w-full items-center px-2.5 py-1.5 text-left text-[12px] transition-colors ${
                      isSelected
                        ? "bg-cream text-oxblood font-semibold"
                        : "text-ink-2 hover:bg-cream hover:text-ink"
                    }`}
                  >
                    {tag.name}
                  </button>
                );
              })}
            </div>
          )}
        </div>

        {/* Result count */}
        <div className="pt-4 border-t border-rule">
          <p className="text-[11px] uppercase tracking-[0.18em] text-ink-muted text-center font-semibold">
            <span className="font-serif text-[18px] text-ink tracking-tight font-normal block mb-0.5">
              {totalResults}
            </span>
            companies
          </p>
        </div>
      </div>
    </aside>
  );
}

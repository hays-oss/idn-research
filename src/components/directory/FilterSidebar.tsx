"use client";

import { useState, useMemo } from "react";
import { TaxonomyDomain, TaxonomySubcategory } from "@/lib/types";

const ORG_OPTIONS = [
  { code: "IHES", name: "IHES", color: "#1a5632" },
  { code: "CPES", name: "CPES", color: "#1a2b5f" },
  { code: "CSCE", name: "CSCE", color: "#c45a1a" },
  { code: "MUIA", name: "MUIA", color: "#1a1a2e" },
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
    setExpandedDomainId(expandedDomainId === id ? null : id);
  }

  function toggleSub(id: number) {
    onSubsChange(
      selectedSubIds.includes(id)
        ? selectedSubIds.filter((s) => s !== id)
        : [...selectedSubIds, id]
    );
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
    <aside className="shrink-0 bg-white overflow-y-auto">
      <div className="p-4 space-y-5">
        {/* Header */}
        <div className="flex items-center justify-between">
          <h2 className="text-sm font-semibold text-foreground">Filters</h2>
          {activeFilterCount > 0 && (
            <button
              onClick={onClearAll}
              className="text-xs text-primary hover:text-primary-light transition-colors"
            >
              Clear all ({activeFilterCount})
            </button>
          )}
        </div>

        {/* Search */}
        <div>
          <input
            type="text"
            placeholder="Search companies..."
            value={searchQuery}
            onChange={(e) => onSearchChange(e.target.value)}
            className="w-full rounded-lg border border-border bg-background px-3 py-2 text-sm text-foreground placeholder:text-muted focus:outline-none focus:ring-2 focus:ring-primary/20 focus:border-primary/30"
          />
        </div>

        {/* Organizations */}
        <div>
          <h3 className="text-xs font-semibold text-muted uppercase tracking-wide mb-2">
            Organizations
            {selectedOrgs.length > 0 && (
              <span className="ml-1.5 inline-flex h-4 w-4 items-center justify-center rounded-full bg-primary text-[10px] text-white font-bold">
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
                  className="h-3.5 w-3.5 rounded border-border text-primary focus:ring-primary/20"
                />
                <span
                  className="inline-flex items-center rounded px-1.5 py-0.5 text-[10px] font-bold tracking-wide text-white"
                  style={{ backgroundColor: org.color }}
                >
                  {org.code}
                </span>
                <span className="text-xs text-muted group-hover:text-foreground transition-colors">
                  {org.name}
                </span>
              </label>
            ))}
          </div>
        </div>

        {/* Domains & Subcategories */}
        <div>
          <h3 className="text-xs font-semibold text-muted uppercase tracking-wide mb-2">
            Domains
            {selectedDomainId && (
              <span className="ml-1.5 inline-flex h-4 w-4 items-center justify-center rounded-full bg-primary text-[10px] text-white font-bold">
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
                      className="p-0.5 text-muted hover:text-foreground"
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
                      className={`flex-1 flex items-center justify-between rounded px-2 py-1.5 text-left text-xs transition-colors ${
                        isSelected
                          ? "bg-primary/10 text-primary font-semibold"
                          : "text-foreground hover:bg-surface"
                      }`}
                    >
                      <span className="truncate">{domain.name}</span>
                      <span className="text-[10px] text-muted shrink-0 ml-1">{count}</span>
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
                            className={`flex w-full items-center justify-between rounded px-2 py-1 text-left text-xs transition-colors ${
                              isSubSelected
                                ? "bg-primary/10 text-primary font-medium"
                                : "text-muted hover:text-foreground hover:bg-surface"
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
          <h3 className="text-xs font-semibold text-muted uppercase tracking-wide mb-2">
            Tags
            {selectedTagIds.length > 0 && (
              <span className="ml-1.5 inline-flex h-4 w-4 items-center justify-center rounded-full bg-primary text-[10px] text-white font-bold">
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
                  className="inline-flex items-center gap-1 rounded-md bg-primary/10 px-2 py-0.5 text-[11px] text-primary"
                >
                  {tag.name}
                  <button
                    onClick={() => removeTag(tag.id)}
                    className="hover:text-primary/70"
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
            placeholder="Search tags..."
            value={tagSearch}
            onChange={(e) => setTagSearch(e.target.value)}
            className="w-full rounded-lg border border-border bg-background px-3 py-1.5 text-xs text-foreground placeholder:text-muted focus:outline-none focus:ring-2 focus:ring-primary/20 focus:border-primary/30"
          />
          {filteredTags.length > 0 && (
            <div className="mt-1.5 max-h-[150px] overflow-y-auto rounded-lg border border-border bg-white">
              {filteredTags.map((tag) => {
                const isSelected = selectedTagIds.includes(tag.id);
                return (
                  <button
                    key={tag.id}
                    onClick={() => toggleTag(tag.id)}
                    className={`flex w-full items-center px-2.5 py-1.5 text-left text-xs transition-colors ${
                      isSelected
                        ? "bg-primary/10 text-primary font-medium"
                        : "text-foreground hover:bg-surface"
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
        <div className="pt-3 border-t border-border">
          <p className="text-xs text-muted text-center">
            <span className="font-semibold text-foreground">{totalResults}</span> companies
          </p>
        </div>
      </div>
    </aside>
  );
}

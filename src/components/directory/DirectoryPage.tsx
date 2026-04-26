"use client";

import { useEffect, useState, useMemo, useCallback } from "react";
import { useSearchParams, useRouter } from "next/navigation";
import {
  TaxonomyDomain,
  TaxonomySubcategory,
} from "@/lib/types";
import { ExpandableCompany } from "./ExpandableCompanyCard";
import FilterSidebar from "./FilterSidebar";
import CompanyGrid from "./CompanyGrid";

interface TagOption {
  id: number;
  name: string;
  subcategory_id: number;
}

interface RawCompany {
  id: string;
  company_name: string;
  slug: string | null;
  website: string | null;
  linkedin_url: string | null;
  description: string | null;
  is_featured: boolean;
  primary_subcategory_id: number | null;
  company_type: string | null;
  headquarters_city: string | null;
  headquarters_state: string | null;
}

interface DomainGroup {
  id: number;
  name: string;
  subcategories: {
    id: number;
    name: string;
    domain_id: number;
    companies: ExpandableCompany[];
  }[];
  totalCompanies: number;
}

export interface DirectoryInitialData {
  domains: TaxonomyDomain[];
  subcategories: TaxonomySubcategory[];
  companies: RawCompany[];
  affiliations: Record<string, { code: string; name: string }[]>;
  allTags: TagOption[];
  companyTags: Record<string, { id: number; name: string }[]>;
}

export default function DirectoryPage({
  initialData,
}: {
  initialData: DirectoryInitialData;
}) {
  const router = useRouter();
  const searchParams = useSearchParams();

  const domains = initialData.domains;
  const subcategories = initialData.subcategories;
  const companies = initialData.companies;
  const allTags = initialData.allTags;
  // Convert from plain objects (server-serializable) into Maps for the
  // existing filter logic below to keep using `.get()`.
  const affiliations = useMemo(
    () => new Map(Object.entries(initialData.affiliations)),
    [initialData.affiliations]
  );
  const companyTags = useMemo(
    () => new Map(Object.entries(initialData.companyTags)),
    [initialData.companyTags]
  );

  // Filter state from URL
  const [searchQuery, setSearchQuery] = useState(searchParams.get("q") || "");
  const [selectedOrgs, setSelectedOrgs] = useState<string[]>(
    searchParams.get("org")?.split(",").filter(Boolean) || []
  );
  const [selectedDomainId, setSelectedDomainId] = useState<number | null>(
    searchParams.get("domain") ? Number(searchParams.get("domain")) : null
  );
  const [selectedSubIds, setSelectedSubIds] = useState<number[]>(
    searchParams.get("sub")?.split(",").filter(Boolean).map(Number) || []
  );
  const [selectedTagIds, setSelectedTagIds] = useState<number[]>(
    searchParams.get("tag")?.split(",").filter(Boolean).map(Number) || []
  );

  // Mobile filter toggle
  const [mobileFiltersOpen, setMobileFiltersOpen] = useState(false);

  // Debounced search for URL sync
  const [debouncedSearch, setDebouncedSearch] = useState(searchQuery);
  useEffect(() => {
    const timer = setTimeout(() => setDebouncedSearch(searchQuery), 300);
    return () => clearTimeout(timer);
  }, [searchQuery]);

  // Sync filters to URL
  useEffect(() => {
    const params = new URLSearchParams();
    if (debouncedSearch) params.set("q", debouncedSearch);
    if (selectedOrgs.length > 0) params.set("org", selectedOrgs.join(","));
    if (selectedDomainId) params.set("domain", String(selectedDomainId));
    if (selectedSubIds.length > 0) params.set("sub", selectedSubIds.join(","));
    if (selectedTagIds.length > 0) params.set("tag", selectedTagIds.join(","));

    const qs = params.toString();
    const newUrl = qs ? `/directory?${qs}` : "/directory";
    router.replace(newUrl, { scroll: false });
  }, [debouncedSearch, selectedOrgs, selectedDomainId, selectedSubIds, selectedTagIds, router]);

  // Build filtered company list
  const filteredCompanies = useMemo(() => {
    const q = searchQuery.toLowerCase().trim();

    return companies.filter((c) => {
      // Text search
      if (q) {
        const matches =
          c.company_name.toLowerCase().includes(q) ||
          (c.description && c.description.toLowerCase().includes(q));
        if (!matches) return false;
      }

      // Domain filter
      if (selectedDomainId) {
        const domainSubIds = subcategories
          .filter((s) => s.domain_id === selectedDomainId)
          .map((s) => s.id);
        if (!c.primary_subcategory_id || !domainSubIds.includes(c.primary_subcategory_id)) {
          return false;
        }
      }

      // Subcategory filter
      if (selectedSubIds.length > 0) {
        if (!c.primary_subcategory_id || !selectedSubIds.includes(c.primary_subcategory_id)) {
          return false;
        }
      }

      // Org filter
      if (selectedOrgs.length > 0) {
        const compAffs = affiliations.get(c.id) || [];
        const compOrgCodes = compAffs.map((a) => a.code);
        if (!selectedOrgs.some((org) => compOrgCodes.includes(org))) {
          return false;
        }
      }

      // Tag filter
      if (selectedTagIds.length > 0) {
        const compTags = companyTags.get(c.id) || [];
        const compTagIds = compTags.map((t) => t.id);
        if (!selectedTagIds.some((tagId) => compTagIds.includes(tagId))) {
          return false;
        }
      }

      return true;
    });
  }, [companies, searchQuery, selectedDomainId, selectedSubIds, selectedOrgs, selectedTagIds, subcategories, affiliations, companyTags]);

  // Build domain groups from filtered companies
  const domainGroups = useMemo<DomainGroup[]>(() => {
    return domains
      .map((domain) => {
        const subs = subcategories
          .filter((s) => s.domain_id === domain.id)
          .map((sub) => ({
            id: sub.id,
            name: sub.name,
            domain_id: sub.domain_id,
            companies: filteredCompanies
              .filter((c) => c.primary_subcategory_id === sub.id)
              .map((c): ExpandableCompany => ({
                id: c.id,
                company_name: c.company_name,
                slug: c.slug,
                website: c.website,
                linkedin_url: c.linkedin_url,
                description: c.description,
                is_featured: c.is_featured,
                affiliations: affiliations.get(c.id) || [],
                company_type: c.company_type,
                headquarters_city: c.headquarters_city,
                headquarters_state: c.headquarters_state,
                tags: companyTags.get(c.id) || [],
              })),
          }))
          .filter((sub) => sub.companies.length > 0);

        return {
          id: domain.id,
          name: domain.name,
          subcategories: subs,
          totalCompanies: subs.reduce((sum, s) => sum + s.companies.length, 0),
        };
      })
      .filter((d) => d.totalCompanies > 0);
  }, [domains, subcategories, filteredCompanies, affiliations, companyTags]);

  // Domain and subcategory counts (from filtered data)
  const domainCounts = useMemo(() => {
    const counts: Record<number, number> = {};
    for (const d of domainGroups) {
      counts[d.id] = d.totalCompanies;
    }
    // Include empty domains with 0
    for (const d of domains) {
      if (!(d.id in counts)) counts[d.id] = 0;
    }
    return counts;
  }, [domainGroups, domains]);

  const subCounts = useMemo(() => {
    const counts: Record<number, number> = {};
    for (const d of domainGroups) {
      for (const s of d.subcategories) {
        counts[s.id] = s.companies.length;
      }
    }
    return counts;
  }, [domainGroups]);

  const hasActiveFilters =
    searchQuery !== "" ||
    selectedOrgs.length > 0 ||
    selectedDomainId !== null ||
    selectedSubIds.length > 0 ||
    selectedTagIds.length > 0;

  const clearAll = useCallback(() => {
    setSearchQuery("");
    setSelectedOrgs([]);
    setSelectedDomainId(null);
    setSelectedSubIds([]);
    setSelectedTagIds([]);
  }, []);

  return (
    <div className="min-h-screen flex flex-col bg-background">
      {/* Header */}
      <header className="bg-header-bg text-white sticky top-0 z-30">
        <div className="flex items-center justify-between px-4 sm:px-6 h-14">
          <div className="flex items-center gap-3">
            <a href="/" className="flex items-center gap-2 hover:opacity-80 transition-opacity">
              <div className="flex h-7 w-7 items-center justify-center rounded bg-accent text-header-bg text-[10px] font-bold">
                IDN
              </div>
              <span className="text-sm font-semibold hidden sm:inline">Company Directory</span>
            </a>
          </div>
          <div className="flex items-center gap-3">
            {/* Mobile filter toggle */}
            <button
              onClick={() => setMobileFiltersOpen(!mobileFiltersOpen)}
              className="lg:hidden flex items-center gap-1.5 rounded-lg bg-white/10 px-3 py-1.5 text-xs font-medium hover:bg-white/20 transition-colors"
            >
              <svg className="h-4 w-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M3 4a1 1 0 011-1h16a1 1 0 011 1v2.586a1 1 0 01-.293.707l-6.414 6.414a1 1 0 00-.293.707V17l-4 4v-6.586a1 1 0 00-.293-.707L3.293 7.293A1 1 0 013 6.586V4z" />
              </svg>
              Filters
              {hasActiveFilters && (
                <span className="h-4 w-4 rounded-full bg-accent text-header-bg text-[10px] font-bold flex items-center justify-center">
                  !
                </span>
              )}
            </button>
            <a
              href="/"
              className="text-xs text-white/70 hover:text-white transition-colors"
            >
              ← Resources
            </a>
          </div>
        </div>
      </header>

      <div className="flex flex-1">
        {/* Filter sidebar — desktop */}
        <div className="hidden lg:block w-[280px] shrink-0 border-r border-border sticky top-14 h-[calc(100vh-3.5rem)]">
        <FilterSidebar
          domains={domains}
          subcategories={subcategories}
          tags={allTags}
          searchQuery={searchQuery}
          selectedOrgs={selectedOrgs}
          selectedDomainId={selectedDomainId}
          selectedSubIds={selectedSubIds}
          selectedTagIds={selectedTagIds}
          domainCounts={domainCounts}
          subCounts={subCounts}
          totalResults={filteredCompanies.length}
          onSearchChange={setSearchQuery}
          onOrgsChange={setSelectedOrgs}
          onDomainChange={setSelectedDomainId}
          onSubsChange={setSelectedSubIds}
          onTagsChange={setSelectedTagIds}
          onClearAll={clearAll}
        />
        </div>

        {/* Mobile filter panel */}
        {mobileFiltersOpen && (
          <div className="fixed inset-0 z-40 lg:hidden">
            <div
              className="absolute inset-0 bg-black/30"
              onClick={() => setMobileFiltersOpen(false)}
            />
            <div className="absolute left-0 top-0 bottom-0 w-[300px] bg-white shadow-xl overflow-y-auto">
              <div className="flex items-center justify-between p-4 border-b border-border">
                <span className="text-sm font-semibold">Filters</span>
                <button
                  onClick={() => setMobileFiltersOpen(false)}
                  className="p-1 text-muted hover:text-foreground"
                >
                  <svg className="h-5 w-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M6 18L18 6M6 6l12 12" />
                  </svg>
                </button>
              </div>
              <FilterSidebar
                domains={domains}
                subcategories={subcategories}
                tags={allTags}
                searchQuery={searchQuery}
                selectedOrgs={selectedOrgs}
                selectedDomainId={selectedDomainId}
                selectedSubIds={selectedSubIds}
                selectedTagIds={selectedTagIds}
                domainCounts={domainCounts}
                subCounts={subCounts}
                totalResults={filteredCompanies.length}
                onSearchChange={setSearchQuery}
                onOrgsChange={setSelectedOrgs}
                onDomainChange={setSelectedDomainId}
                onSubsChange={setSelectedSubIds}
                onTagsChange={setSelectedTagIds}
                onClearAll={clearAll}
              />
            </div>
          </div>
        )}

        {/* Main content */}
        <main className="flex-1 min-w-0">
          <div className="max-w-[960px] px-4 sm:px-6 lg:px-8 py-6">
            {/* Active filters bar */}
            {hasActiveFilters && (
              <div className="flex flex-wrap items-center gap-2 mb-4 pb-4 border-b border-border">
                {searchQuery && (
                  <span className="inline-flex items-center gap-1 rounded-md bg-surface px-2 py-1 text-xs text-foreground">
                    &ldquo;{searchQuery}&rdquo;
                    <button onClick={() => setSearchQuery("")} className="text-muted hover:text-foreground ml-0.5">
                      <svg className="h-3 w-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M6 18L18 6M6 6l12 12" />
                      </svg>
                    </button>
                  </span>
                )}
                {selectedOrgs.map((org) => (
                  <span key={org} className="inline-flex items-center gap-1 rounded-md bg-primary/10 px-2 py-1 text-xs text-primary font-medium">
                    {org}
                    <button onClick={() => setSelectedOrgs(selectedOrgs.filter((o) => o !== org))} className="hover:text-primary/70">
                      <svg className="h-3 w-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M6 18L18 6M6 6l12 12" />
                      </svg>
                    </button>
                  </span>
                ))}
                {selectedDomainId && (
                  <span className="inline-flex items-center gap-1 rounded-md bg-surface px-2 py-1 text-xs text-foreground">
                    {domains.find((d) => d.id === selectedDomainId)?.name || "Domain"}
                    <button onClick={() => { setSelectedDomainId(null); setSelectedSubIds([]); }} className="text-muted hover:text-foreground ml-0.5">
                      <svg className="h-3 w-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M6 18L18 6M6 6l12 12" />
                      </svg>
                    </button>
                  </span>
                )}
                <button
                  onClick={clearAll}
                  className="text-xs text-primary hover:text-primary-light transition-colors ml-auto"
                >
                  Clear all
                </button>
              </div>
            )}

            <CompanyGrid
              domains={domainGroups}
              hasActiveFilters={hasActiveFilters}
            />
          </div>
        </main>
      </div>

      {/* Footer */}
      <footer className="mt-auto bg-header-bg py-6">
        <div className="max-w-[1200px] px-4 sm:px-6 lg:px-8 mx-auto">
          <div className="flex flex-col sm:flex-row items-center justify-between gap-4 text-sm text-white/60">
            <div className="flex items-center gap-2">
              <div className="flex h-6 w-6 items-center justify-center rounded bg-accent text-header-bg text-[10px] font-bold">
                IDN
              </div>
              <span>IDN Research &mdash; A project by IHES</span>
            </div>
            <div className="flex gap-6">
              <a href="/" className="hover:text-white transition-colors">Resources</a>
              <a href="/about" className="hover:text-white transition-colors">About</a>
              <a href="https://www.ihesllc.com" target="_blank" rel="noopener noreferrer" className="hover:text-white transition-colors">IHES</a>
            </div>
          </div>
        </div>
      </footer>
    </div>
  );
}

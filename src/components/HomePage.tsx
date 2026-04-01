"use client";

import { useEffect, useState, useMemo, useCallback } from "react";
import { supabase } from "@/lib/supabase";
import {
  ResourceCategory,
  Resource,
  LinkedInInfluencer,
  CategoryWithResources,
  TaxonomyDomain,
  TaxonomySubcategory,
  DirectoryCompany,
  DirectoryDomain,
  DirectorySubcategory,
} from "@/lib/types";
import Header from "@/components/Header";
import Sidebar from "@/components/Sidebar";
import CategorySection from "@/components/CategorySection";
import DirectorySection from "@/components/DirectorySection";
import InfluencerCard from "@/components/InfluencerCard";
import CompanyCard from "@/components/CompanyCard";
import SubmitResourceForm from "@/components/SubmitResourceForm";
import HeroSection from "@/components/HeroSection";
import HowItWorks from "@/components/HowItWorks";

export default function Home() {
  const [allCategories, setAllCategories] = useState<ResourceCategory[]>([]);
  const [resources, setResources] = useState<Resource[]>([]);
  const [influencers, setInfluencers] = useState<LinkedInInfluencer[]>([]);
  const [searchQuery, setSearchQuery] = useState("");
  const [activeTag, setActiveTag] = useState<string | null>(null);
  const [activeSlug, setActiveSlug] = useState<string | null>(null);
  const [loading, setLoading] = useState(true);
  const [sidebarOpen, setSidebarOpen] = useState(false);
  const [directoryDomains, setDirectoryDomains] = useState<DirectoryDomain[]>([]);

  // Split categories by type
  const resourceCategories = useMemo(
    () => allCategories.filter((c) => (c.category_type || "resource") === "resource"),
    [allCategories]
  );
  // Fetch all data on mount
  useEffect(() => {
    async function fetchData() {
      // Core data (resources, categories, influencers)
      const [catRes, resRes, infRes] = await Promise.all([
        supabase
          .from("resource_categories")
          .select("*")
          .eq("is_active", true)
          .order("display_order"),
        supabase
          .from("resources")
          .select("*")
          .eq("is_active", true)
          .order("display_order"),
        supabase
          .from("linkedin_influencers")
          .select("*")
          .eq("is_active", true)
          .order("display_order"),
      ]);

      // New directory data (fetched separately so failures don't break the page)
      const [domRes, subRes, compRes, affRes] = await Promise.all([
        supabase.from("taxonomy_domains").select("*").eq("is_active", true).order("display_order"),
        supabase.from("taxonomy_subcategories").select("*").eq("is_active", true).order("display_order"),
        supabase.from("companies").select("id, company_name, slug, website, linkedin_url, description, is_featured, primary_subcategory_id").eq("is_active", true).eq("review_status", "approved").order("company_name"),
        supabase.from("company_affiliations").select("organization_id, company_id, organizations(code, name)").eq("is_active", true),
      ]).catch(() => [{ data: null }, { data: null }, { data: null }, { data: null }]);

      if (catRes.data) setAllCategories(catRes.data);
      if (resRes.data) setResources(resRes.data);
      if (infRes.data) setInfluencers(infRes.data);

      // Build directory domains grouped structure
      const domData = domRes.data;
      const subData = subRes.data;
      const compData = compRes.data;
      const affData = affRes.data;

      if (domData && subData && compData) {
        const affMap = new Map<string, { code: string; name: string }[]>();
        if (affData) {
          for (const a of affData as any[]) {
            const org = a.organizations as { code: string; name: string } | null;
            if (!org) continue;
            const list = affMap.get(a.company_id) || [];
            list.push({ code: org.code, name: org.name });
            affMap.set(a.company_id, list);
          }
        }

        const domainList: DirectoryDomain[] = (domData as TaxonomyDomain[])
          .map((domain) => {
            const subs: DirectorySubcategory[] = (subData as TaxonomySubcategory[])
              .filter((s) => s.domain_id === domain.id)
              .map((sub) => ({
                id: sub.id,
                name: sub.name,
                domain_id: sub.domain_id,
                companies: (compData as any[])
                  .filter((c) => c.primary_subcategory_id === sub.id)
                  .map((c) => ({
                    id: c.id,
                    company_name: c.company_name,
                    slug: c.slug,
                    website: c.website,
                    linkedin_url: c.linkedin_url,
                    description: c.description,
                    is_featured: c.is_featured,
                    affiliations: affMap.get(c.id) || [],
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

        setDirectoryDomains(domainList);
      }

      setLoading(false);
    }
    fetchData();
  }, []);

  // Intersection observer for active category
  useEffect(() => {
    if (allCategories.length === 0) return;
    const observer = new IntersectionObserver(
      (entries) => {
        for (const entry of entries) {
          if (entry.isIntersecting) {
            setActiveSlug(entry.target.id);
          }
        }
      },
      { rootMargin: "-80px 0px -70% 0px", threshold: 0 }
    );

    allCategories.forEach((cat) => {
      const el = document.getElementById(cat.slug);
      if (el) observer.observe(el);
    });
    const infEl = document.getElementById("linkedin-influencers");
    if (infEl) observer.observe(infEl);
    const dirEl = document.getElementById("company-directory");
    if (dirEl) observer.observe(dirEl);

    return () => observer.disconnect();
  }, [allCategories, loading]);

  // Handle tag click
  const handleTagClick = useCallback((tag: string) => {
    setActiveTag((prev) => (prev === tag ? null : tag));
  }, []);

  // Resource counts per category (unfiltered)
  const resourceCounts = useMemo(() => {
    const counts: Record<string, number> = {};
    for (const cat of allCategories) {
      counts[cat.id] = resources.filter(
        (r) => r.category_id === cat.id
      ).length;
    }
    return counts;
  }, [allCategories, resources]);

  // Build resource categories with resources, applying search + tag filter
  const filteredResourceCategories = useMemo<CategoryWithResources[]>(() => {
    const q = searchQuery.toLowerCase().trim();
    return resourceCategories
      .map((cat) => ({
        ...cat,
        resources: resources
          .filter((r) => {
            if (r.category_id !== cat.id) return false;
            if (activeTag && !(r.tags ?? []).includes(activeTag)) return false;
            if (!q) return true;
            return r.name.toLowerCase().includes(q);
          })
          .sort((a, b) => a.name.localeCompare(b.name)),
      }))
      .filter((cat) => cat.resources.length > 0);
  }, [resourceCategories, resources, searchQuery, activeTag]);

  // Filter directory domains by search query
  const filteredDirectoryDomains = useMemo<DirectoryDomain[]>(() => {
    const q = searchQuery.toLowerCase().trim();
    if (!q) return directoryDomains;

    return directoryDomains
      .map((domain) => {
        const filteredSubs = domain.subcategories
          .map((sub) => ({
            ...sub,
            companies: sub.companies.filter((c) =>
              c.company_name.toLowerCase().includes(q)
            ),
          }))
          .filter((sub) => sub.companies.length > 0);

        return {
          ...domain,
          subcategories: filteredSubs,
          totalCompanies: filteredSubs.reduce((sum, s) => sum + s.companies.length, 0),
        };
      })
      .filter((d) => d.totalCompanies > 0);
  }, [directoryDomains, searchQuery]);

  // Filter and sort influencers
  const filteredInfluencers = useMemo(() => {
    const q = searchQuery.toLowerCase().trim();
    if (activeTag) return [];
    const filtered = q
      ? influencers.filter(
          (i) =>
            i.name.toLowerCase().includes(q) ||
            (i.title && i.title.toLowerCase().includes(q)) ||
            (i.organization && i.organization.toLowerCase().includes(q))
        )
      : [...influencers];
    return filtered.sort((a, b) => a.name.localeCompare(b.name));
  }, [influencers, searchQuery, activeTag]);

  // Track clicks
  const trackClick = useCallback(async (resourceId: string) => {
    await supabase.rpc("increment_click_count", { resource_uuid: resourceId });
  }, []);

  // Total resource count
  const totalResources = resources.length + influencers.length;

  // Count filtered results for tag bar
  const tagFilteredCount = activeTag
    ? filteredResourceCategories.reduce((sum, c) => sum + c.resources.length, 0) +
      filteredDirectoryDomains.reduce((sum, d) => sum + d.totalCompanies, 0)
    : 0;

  // Tag count fetched from taxonomy (not the legacy resource tags)
  const [taxonomyTagCount, setTaxonomyTagCount] = useState(0);
  useEffect(() => {
    supabase
      .from("category_taxonomy")
      .select("id", { count: "exact", head: true })
      .eq("is_active", true)
      .then(({ count }) => { if (count) setTaxonomyTagCount(count); });
  }, []);

  const totalCompanyCount = useMemo(
    () => directoryDomains.reduce((sum, d) => sum + d.totalCompanies, 0),
    [directoryDomains]
  );

  if (loading) {
    return (
      <div className="flex flex-1 items-center justify-center min-h-screen">
        <div className="text-center">
          <div className="h-8 w-8 animate-spin rounded-full border-2 border-primary border-t-transparent mx-auto mb-3" />
          <p className="text-sm text-muted">Loading resources...</p>
        </div>
      </div>
    );
  }

  return (
    <div className="min-h-screen flex flex-col">
      <Header
        onSearch={setSearchQuery}
        onToggleSidebar={() => setSidebarOpen(!sidebarOpen)}
        searchQuery={searchQuery}
      />

      <div className="flex flex-1">
        <Sidebar
          categories={resourceCategories}
          directoryDomains={filteredDirectoryDomains}
          resourceCounts={resourceCounts}
          influencerCount={filteredInfluencers.length}
          activeSlug={activeSlug}
          isOpen={sidebarOpen}
          onClose={() => setSidebarOpen(false)}
        />

        {/* Main content */}
        <main className="flex-1 lg:ml-64 min-w-0">
          {/* Hero + How It Works — full-width, above content */}
          {!searchQuery && !activeTag && (
            <>
              <HeroSection
                companyCount={totalCompanyCount}
                domainCount={directoryDomains.length}
                tagCount={taxonomyTagCount}
                searchQuery={searchQuery}
                onSearch={setSearchQuery}
              />
              <HowItWorks />
            </>
          )}

          <div className="max-w-[1200px] px-4 sm:px-6 lg:px-8 py-8">
            {/* Active tag filter bar */}
            {activeTag && (
              <div className="mb-6 flex items-center gap-3">
                <p className="text-sm text-muted">
                  Filtered by tag:{" "}
                  <span className="inline-flex items-center gap-1.5 rounded-md bg-primary/10 px-2 py-0.5 text-sm font-medium text-primary">
                    {activeTag}
                    <button
                      onClick={() => setActiveTag(null)}
                      className="hover:text-primary/70 transition-colors"
                    >
                      <svg
                        className="h-3 w-3"
                        fill="none"
                        stroke="currentColor"
                        viewBox="0 0 24 24"
                      >
                        <path
                          strokeLinecap="round"
                          strokeLinejoin="round"
                          strokeWidth={2}
                          d="M6 18L18 6M6 6l12 12"
                        />
                      </svg>
                    </button>
                  </span>
                  <span className="ml-2 text-muted">
                    &mdash; {tagFilteredCount}{" "}
                    {tagFilteredCount === 1 ? "resource" : "resources"}
                  </span>
                </p>
              </div>
            )}

            {/* Search results header */}
            {searchQuery && !activeTag && (
              <div className="mb-6 flex items-center justify-between">
                <p className="text-sm text-muted">
                  Showing results for{" "}
                  <span className="font-medium text-foreground">
                    &ldquo;{searchQuery}&rdquo;
                  </span>{" "}
                  &mdash;{" "}
                  {filteredResourceCategories.reduce(
                    (sum, c) => sum + c.resources.length,
                    0
                  ) +
                    filteredDirectoryDomains.reduce(
                      (sum, d) => sum + d.totalCompanies,
                      0
                    ) +
                    filteredInfluencers.length}{" "}
                  matches
                </p>
                <button
                  onClick={() => setSearchQuery("")}
                  className="inline-flex items-center gap-1.5 rounded-lg bg-primary/10 px-3 py-1.5 text-sm font-medium text-primary hover:bg-primary/20 transition-colors"
                >
                  <svg className="h-3.5 w-3.5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M6 18L18 6M6 6l12 12" />
                  </svg>
                  Clear search
                </button>
              </div>
            )}

            {/* Resource category sections */}
            <div className="space-y-10">
              {filteredResourceCategories.map((cat) => (
                <CategorySection
                  key={cat.id}
                  category={cat}
                  onTrackClick={trackClick}
                  onTagClick={handleTagClick}
                  activeTag={activeTag}
                />
              ))}

              {/* LinkedIn Influencers */}
              {filteredInfluencers.length > 0 && (
                <section id="linkedin-influencers" className="scroll-mt-20">
                  <div className="flex items-center gap-3 mb-2">
                    <h2 className="text-lg font-semibold text-foreground">
                      LinkedIn Influencers
                    </h2>
                    <span className="rounded-full bg-surface px-2.5 py-0.5 text-xs font-medium text-muted">
                      {filteredInfluencers.length}
                    </span>
                  </div>
                  <p className="text-sm sm:text-base text-muted max-w-2xl mb-4">
                    Follow the voices shaping healthcare leadership — executives and thought leaders active on LinkedIn.
                  </p>
                  <div className="grid gap-2 sm:grid-cols-2 lg:grid-cols-3">
                    {filteredInfluencers.map((inf) => (
                      <InfluencerCard key={inf.id} influencer={inf} />
                    ))}
                  </div>
                </section>
              )}

              {/* Company Directory Preview */}
              {filteredDirectoryDomains.length > 0 && (
                <div className="mt-12 pt-8 border-t border-border" id="company-directory">
                  <div className="mb-4 flex items-center justify-between">
                    <div>
                      <h2 className="text-xl font-bold text-foreground">Company Directory</h2>
                      <p className="text-sm text-muted mt-1">
                        {searchQuery
                          ? `${filteredDirectoryDomains.reduce((s, d) => s + d.totalCompanies, 0)} matching companies`
                          : `Browse ${filteredDirectoryDomains.reduce((s, d) => s + d.totalCompanies, 0)} healthcare companies across ${filteredDirectoryDomains.length} domains — from medical devices to health IT.`
                        }
                      </p>
                    </div>
                    <a
                      href="/directory"
                      className="inline-flex items-center gap-1.5 rounded-lg bg-primary px-4 py-2 text-sm font-medium text-white hover:bg-primary-light transition-colors"
                    >
                      Explore Full Directory
                      <svg className="h-4 w-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M13 7l5 5m0 0l-5 5m5-5H6" />
                      </svg>
                    </a>
                  </div>

                  {/* When searching: show matching companies directly */}
                  {searchQuery ? (
                    <div className="grid gap-2 sm:grid-cols-2 lg:grid-cols-3">
                      {filteredDirectoryDomains.flatMap((domain) =>
                        domain.subcategories.flatMap((sub) =>
                          sub.companies.map((company) => (
                            <CompanyCard
                              key={company.id}
                              company={company}
                              onTrackClick={trackClick}
                            />
                          ))
                        )
                      )}
                    </div>
                  ) : (
                    <>
                      {/* Default: show domain summary cards */}
                      <div className="grid gap-3 sm:grid-cols-2 lg:grid-cols-3">
                        {filteredDirectoryDomains.slice(0, 6).map((domain) => (
                          <a
                            key={domain.id}
                            href={`/directory?domain=${domain.id}`}
                            className="rounded-xl border border-border bg-white px-4 py-3 hover:border-teal/30 hover:shadow-md hover:-translate-y-0.5 transition-all duration-200 ease-out group"
                          >
                            <div className="flex items-center justify-between">
                              <span className="text-sm font-semibold text-foreground group-hover:text-primary transition-colors">
                                {domain.name}
                              </span>
                              <span className="rounded-full bg-surface px-2 py-0.5 text-[10px] font-medium text-muted">
                                {domain.totalCompanies}
                              </span>
                            </div>
                            <p className="text-xs text-muted mt-1">
                              {domain.subcategories.length} market segments
                            </p>
                          </a>
                        ))}
                      </div>
                      {filteredDirectoryDomains.length > 6 && (
                        <div className="mt-3 text-center">
                          <a
                            href="/directory"
                            className="text-sm text-teal hover:text-teal-light transition-colors"
                          >
                            + {filteredDirectoryDomains.length - 6} more domains →
                          </a>
                        </div>
                      )}
                    </>
                  )}
                </div>
              )}

              {/* No results for tag filter */}
              {activeTag &&
                filteredResourceCategories.length === 0 &&
                filteredDirectoryDomains.length === 0 && (
                  <div className="text-center py-12">
                    <p className="text-muted">
                      No resources tagged with &ldquo;{activeTag}&rdquo;
                    </p>
                    <button
                      onClick={() => setActiveTag(null)}
                      className="mt-2 text-sm text-primary hover:text-primary-light transition-colors"
                    >
                      Clear filter
                    </button>
                  </div>
                )}

              {/* Submit form */}
              {!searchQuery && !activeTag && (
                <SubmitResourceForm categories={resourceCategories} />
              )}
            </div>
          </div>

          {/* Footer */}
          <footer className="mt-auto bg-header-bg py-8">
            <div className="max-w-[1200px] px-4 sm:px-6 lg:px-8">
              <div className="flex flex-col sm:flex-row items-center justify-between gap-4 text-sm text-white/60">
                <div className="flex items-center gap-2">
                  <div className="flex h-6 w-6 items-center justify-center rounded bg-accent text-header-bg text-[10px] font-bold">
                    IDN
                  </div>
                  <span>IDN Research &mdash; A project by IHES</span>
                </div>
                <div className="flex gap-6">
                  <a
                    href="/about"
                    className="hover:text-white transition-colors"
                  >
                    About
                  </a>
                  <a
                    href="#submit"
                    className="hover:text-white transition-colors"
                  >
                    Submit Resource
                  </a>
                  <a
                    href="https://www.ihesllc.com"
                    target="_blank"
                    rel="noopener noreferrer"
                    className="hover:text-white transition-colors"
                  >
                    IHES
                  </a>
                </div>
              </div>
            </div>
          </footer>
        </main>
      </div>
    </div>
  );
}

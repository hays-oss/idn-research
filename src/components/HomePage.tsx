"use client";

import { useEffect, useState, useMemo, useCallback } from "react";
import { supabase } from "@/lib/supabase";
import {
  ResourceCategory,
  Resource,
  LinkedInInfluencer,
  CategoryWithResources,
} from "@/lib/types";
import Header from "@/components/Header";
import Sidebar from "@/components/Sidebar";
import CategorySection from "@/components/CategorySection";
import DirectorySection from "@/components/DirectorySection";
import InfluencerCard from "@/components/InfluencerCard";
import SubmitResourceForm from "@/components/SubmitResourceForm";

export default function Home() {
  const [allCategories, setAllCategories] = useState<ResourceCategory[]>([]);
  const [resources, setResources] = useState<Resource[]>([]);
  const [influencers, setInfluencers] = useState<LinkedInInfluencer[]>([]);
  const [searchQuery, setSearchQuery] = useState("");
  const [activeTag, setActiveTag] = useState<string | null>(null);
  const [activeSlug, setActiveSlug] = useState<string | null>(null);
  const [loading, setLoading] = useState(true);
  const [sidebarOpen, setSidebarOpen] = useState(false);

  // Split categories by type
  const resourceCategories = useMemo(
    () => allCategories.filter((c) => (c.category_type || "resource") === "resource"),
    [allCategories]
  );
  const directoryCategories = useMemo(
    () => allCategories.filter((c) => c.category_type === "directory"),
    [allCategories]
  );

  // Fetch all data on mount
  useEffect(() => {
    async function fetchData() {
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

      if (catRes.data) setAllCategories(catRes.data);
      if (resRes.data) setResources(resRes.data);
      if (infRes.data) setInfluencers(infRes.data);
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
            return (
              r.name.toLowerCase().includes(q) ||
              (r.description && r.description.toLowerCase().includes(q)) ||
              r.tags.some((t) => t.toLowerCase().includes(q)) ||
              cat.name.toLowerCase().includes(q)
            );
          })
          .sort((a, b) => a.name.localeCompare(b.name)),
      }))
      .filter((cat) => cat.resources.length > 0);
  }, [resourceCategories, resources, searchQuery, activeTag]);

  // Build directory categories with resources
  const filteredDirectoryCategories = useMemo<CategoryWithResources[]>(() => {
    const q = searchQuery.toLowerCase().trim();
    return directoryCategories
      .map((cat) => ({
        ...cat,
        resources: resources
          .filter((r) => {
            if (r.category_id !== cat.id) return false;
            if (activeTag && !(r.tags ?? []).includes(activeTag)) return false;
            if (!q) return true;
            return (
              r.name.toLowerCase().includes(q) ||
              (r.description && r.description.toLowerCase().includes(q)) ||
              r.tags.some((t) => t.toLowerCase().includes(q)) ||
              cat.name.toLowerCase().includes(q)
            );
          })
          .sort((a, b) => a.name.localeCompare(b.name)),
      }))
      .filter((cat) => cat.resources.length > 0);
  }, [directoryCategories, resources, searchQuery, activeTag]);

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
      filteredDirectoryCategories.reduce((sum, c) => sum + c.resources.length, 0)
    : 0;

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
      />

      <div className="flex flex-1">
        <Sidebar
          categories={resourceCategories}
          directoryCategories={directoryCategories}
          resourceCounts={resourceCounts}
          influencerCount={influencers.length}
          activeSlug={activeSlug}
          isOpen={sidebarOpen}
          onClose={() => setSidebarOpen(false)}
        />

        {/* Main content */}
        <main className="flex-1 lg:ml-64 min-w-0">
          <div className="max-w-[1200px] px-4 sm:px-6 lg:px-8 py-8">
            {/* Hero stats */}
            {!searchQuery && !activeTag && (
              <div className="mb-10">
                <h1 className="text-2xl sm:text-3xl font-bold text-foreground mb-2">
                  Healthcare Resource Intelligence
                </h1>
                <p className="text-muted max-w-2xl">
                  {totalResources}+ curated resources across{" "}
                  {allCategories.length} categories — companies, meetings,
                  organizations, podcasts, influencers, and more.
                </p>
              </div>
            )}

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
              <div className="mb-6">
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
                    filteredDirectoryCategories.reduce(
                      (sum, c) => sum + c.resources.length,
                      0
                    ) +
                    filteredInfluencers.length}{" "}
                  matches
                </p>
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
                  <div className="flex items-center gap-3 mb-4">
                    <h2 className="text-lg font-semibold text-foreground">
                      LinkedIn Influencers
                    </h2>
                    <span className="rounded-full bg-surface px-2.5 py-0.5 text-xs font-medium text-muted">
                      {filteredInfluencers.length}
                    </span>
                  </div>
                  <div className="grid gap-2 sm:grid-cols-2 lg:grid-cols-3">
                    {filteredInfluencers.map((inf) => (
                      <InfluencerCard key={inf.id} influencer={inf} />
                    ))}
                  </div>
                </section>
              )}

              {/* Company Directory */}
              {filteredDirectoryCategories.length > 0 && (
                <div className="mt-12 pt-8 border-t border-border">
                  <DirectorySection
                    categories={filteredDirectoryCategories}
                    onTrackClick={trackClick}
                    onTagClick={handleTagClick}
                    activeTag={activeTag}
                  />
                </div>
              )}

              {/* No results for tag filter */}
              {activeTag &&
                filteredResourceCategories.length === 0 &&
                filteredDirectoryCategories.length === 0 && (
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

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
import CategoryNav from "@/components/CategoryNav";
import CategorySection from "@/components/CategorySection";
import InfluencerCard from "@/components/InfluencerCard";
import SubmitResourceForm from "@/components/SubmitResourceForm";

export default function Home() {
  const [categories, setCategories] = useState<ResourceCategory[]>([]);
  const [resources, setResources] = useState<Resource[]>([]);
  const [influencers, setInfluencers] = useState<LinkedInInfluencer[]>([]);
  const [searchQuery, setSearchQuery] = useState("");
  const [activeSlug, setActiveSlug] = useState<string | null>(null);
  const [loading, setLoading] = useState(true);

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

      if (catRes.data) setCategories(catRes.data);
      if (resRes.data) setResources(resRes.data);
      if (infRes.data) setInfluencers(infRes.data);
      setLoading(false);
    }
    fetchData();
  }, []);

  // Intersection observer for active category
  useEffect(() => {
    if (categories.length === 0) return;
    const observer = new IntersectionObserver(
      (entries) => {
        for (const entry of entries) {
          if (entry.isIntersecting) {
            setActiveSlug(entry.target.id);
          }
        }
      },
      { rootMargin: "-120px 0px -70% 0px", threshold: 0 }
    );

    categories.forEach((cat) => {
      const el = document.getElementById(cat.slug);
      if (el) observer.observe(el);
    });
    // Also observe the influencers section
    const infEl = document.getElementById("linkedin-influencers");
    if (infEl) observer.observe(infEl);

    return () => observer.disconnect();
  }, [categories, loading]);

  // Build categories with resources, applying search filter
  const filteredCategories = useMemo<CategoryWithResources[]>(() => {
    const q = searchQuery.toLowerCase().trim();
    return categories
      .map((cat) => ({
        ...cat,
        resources: resources.filter((r) => {
          if (r.category_id !== cat.id) return false;
          if (!q) return true;
          return (
            r.name.toLowerCase().includes(q) ||
            (r.description && r.description.toLowerCase().includes(q)) ||
            r.tags.some((t) => t.toLowerCase().includes(q)) ||
            cat.name.toLowerCase().includes(q)
          );
        }),
      }))
      .filter((cat) => cat.resources.length > 0);
  }, [categories, resources, searchQuery]);

  // Filter influencers
  const filteredInfluencers = useMemo(() => {
    const q = searchQuery.toLowerCase().trim();
    if (!q) return influencers;
    return influencers.filter(
      (i) =>
        i.name.toLowerCase().includes(q) ||
        (i.title && i.title.toLowerCase().includes(q)) ||
        (i.organization && i.organization.toLowerCase().includes(q))
    );
  }, [influencers, searchQuery]);

  // Track clicks
  const trackClick = useCallback(async (resourceId: string) => {
    await supabase.rpc("increment_click_count", { resource_uuid: resourceId });
  }, []);

  // Total resource count
  const totalResources = resources.length + influencers.length;

  if (loading) {
    return (
      <div className="flex flex-1 items-center justify-center">
        <div className="text-center">
          <div className="h-8 w-8 animate-spin rounded-full border-2 border-primary border-t-transparent mx-auto mb-3" />
          <p className="text-sm text-muted">Loading resources...</p>
        </div>
      </div>
    );
  }

  return (
    <>
      <Header onSearch={setSearchQuery} />
      <CategoryNav categories={categories} activeSlug={activeSlug} />

      <main className="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8 py-8">
        {/* Hero stats */}
        {!searchQuery && (
          <div className="mb-10 text-center">
            <h1 className="text-2xl sm:text-3xl font-bold text-foreground mb-2">
              Healthcare Resource Intelligence
            </h1>
            <p className="text-muted max-w-2xl mx-auto">
              {totalResources}+ curated resources across {categories.length}{" "}
              categories — companies, meetings, organizations, podcasts,
              influencers, and more.
            </p>
          </div>
        )}

        {/* Search results header */}
        {searchQuery && (
          <div className="mb-6">
            <p className="text-sm text-muted">
              Showing results for{" "}
              <span className="font-medium text-foreground">
                &ldquo;{searchQuery}&rdquo;
              </span>{" "}
              &mdash;{" "}
              {filteredCategories.reduce((sum, c) => sum + c.resources.length, 0) +
                filteredInfluencers.length}{" "}
              matches
            </p>
          </div>
        )}

        {/* Category sections */}
        <div className="space-y-10">
          {filteredCategories.map((cat) => (
            <CategorySection
              key={cat.id}
              category={cat}
              onTrackClick={trackClick}
            />
          ))}

          {/* LinkedIn Influencers */}
          {filteredInfluencers.length > 0 && (
            <section id="linkedin-influencers" className="scroll-mt-28">
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

          {/* Submit form */}
          {!searchQuery && <SubmitResourceForm categories={categories} />}
        </div>
      </main>

      {/* Footer */}
      <footer className="mt-auto border-t border-border bg-surface py-8">
        <div className="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
          <div className="flex flex-col sm:flex-row items-center justify-between gap-4 text-sm text-muted">
            <div className="flex items-center gap-2">
              <div className="flex h-6 w-6 items-center justify-center rounded bg-primary text-white text-[10px] font-bold">
                IDN
              </div>
              <span>IDN Research &mdash; A project by IHES</span>
            </div>
            <div className="flex gap-6">
              <a href="/about" className="hover:text-primary transition-colors">
                About
              </a>
              <a href="#submit" className="hover:text-primary transition-colors">
                Submit Resource
              </a>
              <a
                href="https://www.ihesllc.com"
                target="_blank"
                rel="noopener noreferrer"
                className="hover:text-primary transition-colors"
              >
                IHES
              </a>
            </div>
          </div>
        </div>
      </footer>
    </>
  );
}

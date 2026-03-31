"use client";

import { useEffect, useState, useCallback } from "react";
import { supabase } from "@/lib/supabase";
import {
  ResourceCategory,
  Resource,
  LinkedInInfluencer,
  Company,
  TaxonomyDomain,
  TaxonomySubcategory,
  CategoryTaxonomy,
  ReviewQueueItem,
  Organization,
  CompanyAffiliation,
} from "@/lib/types";
import CategoriesAdmin from "./CategoriesAdmin";
import ResourcesAdmin from "./ResourcesAdmin";
import InfluencersAdmin from "./InfluencersAdmin";
import CompaniesAdmin from "./CompaniesAdmin";
import TaxonomyAdmin from "./TaxonomyAdmin";
import ReviewQueueAdmin from "./ReviewQueueAdmin";

type Tab = "companies" | "taxonomy" | "review" | "resources" | "categories" | "influencers";

export default function AdminDashboard({ onLogout }: { onLogout: () => void }) {
  const [activeTab, setActiveTab] = useState<Tab>("companies");

  // Legacy data
  const [categories, setCategories] = useState<ResourceCategory[]>([]);
  const [resources, setResources] = useState<Resource[]>([]);
  const [influencers, setInfluencers] = useState<LinkedInInfluencer[]>([]);

  // New directory data
  const [companies, setCompanies] = useState<Company[]>([]);
  const [domains, setDomains] = useState<TaxonomyDomain[]>([]);
  const [subcategories, setSubcategories] = useState<TaxonomySubcategory[]>([]);
  const [tags, setTags] = useState<CategoryTaxonomy[]>([]);
  const [queueItems, setQueueItems] = useState<ReviewQueueItem[]>([]);
  const [organizations, setOrganizations] = useState<Organization[]>([]);
  const [affiliations, setAffiliations] = useState<CompanyAffiliation[]>([]);

  const [loading, setLoading] = useState(true);

  const fetchData = useCallback(async () => {
    const [catRes, resRes, infRes, compRes, domRes, subRes, tagRes, queueRes, orgRes, affRes] =
      await Promise.all([
        supabase.from("resource_categories").select("*").order("display_order"),
        supabase.from("resources").select("*").order("display_order"),
        supabase.from("linkedin_influencers").select("*").order("display_order"),
        supabase.from("companies").select("*").order("company_name"),
        supabase.from("taxonomy_domains").select("*").order("display_order"),
        supabase.from("taxonomy_subcategories").select("*").order("display_order"),
        supabase.from("category_taxonomy").select("*").order("level_1_category,level_2_subcategory,level_3_tag"),
        supabase.from("company_review_queue").select("*, companies(company_name, description, website, confidence_score, review_status, primary_subcategory_id)").eq("status", "open").order("created_at", { ascending: false }),
        supabase.from("organizations").select("*").order("code"),
        supabase.from("company_affiliations").select("*"),
      ]);
    if (catRes.data) setCategories(catRes.data);
    if (resRes.data) setResources(resRes.data);
    if (infRes.data) setInfluencers(infRes.data);
    if (compRes.data) setCompanies(compRes.data);
    if (domRes.data) setDomains(domRes.data);
    if (subRes.data) setSubcategories(subRes.data);
    if (tagRes.data) setTags(tagRes.data);
    if (orgRes.data) setOrganizations(orgRes.data);
    if (affRes.data) setAffiliations(affRes.data);
    if (queueRes.data) {
      // Transform queue data to match ReviewQueueItem interface
      const items: ReviewQueueItem[] = (queueRes.data || []).map((q: Record<string, unknown>) => {
        const c = q.companies as Record<string, unknown> | null;
        return {
          queue_id: q.id as string,
          reason: q.reason as string,
          status: q.status as string,
          assigned_to: q.assigned_to as string | null,
          resolution_notes: q.resolution_notes as string | null,
          queued_at: q.created_at as string,
          resolved_at: q.resolved_at as string | null,
          suggested_subcategory_id: q.suggested_subcategory_id as number | null,
          suggested_subcategory: null,
          suggested_domain: null,
          company_id: q.company_id as string,
          company_name: c?.company_name as string || "Unknown",
          description: c?.description as string | null || null,
          website: c?.website as string | null || null,
          confidence_score: c?.confidence_score as number | null || null,
          review_status: c?.review_status as string || "pending",
          current_primary_subcategory: null,
          current_primary_domain: null,
        };
      });
      setQueueItems(items);
    }
    setLoading(false);
  }, []);

  useEffect(() => {
    fetchData();
  }, [fetchData]);

  const openQueueCount = queueItems.filter((q) => q.status === "open").length;

  const tabs: { key: Tab; label: string; count: number; section?: string }[] = [
    { key: "companies", label: "Companies", count: companies.length, section: "directory" },
    { key: "taxonomy", label: "Taxonomy", count: tags.length, section: "directory" },
    { key: "review", label: "Review Queue", count: openQueueCount, section: "directory" },
    { key: "resources", label: "Resources", count: resources.length, section: "legacy" },
    { key: "categories", label: "Categories", count: categories.length, section: "legacy" },
    { key: "influencers", label: "Influencers", count: influencers.length, section: "legacy" },
  ];

  if (loading) {
    return (
      <div className="flex items-center justify-center min-h-screen">
        <div className="h-8 w-8 animate-spin rounded-full border-2 border-[var(--primary)] border-t-transparent" />
      </div>
    );
  }

  return (
    <div className="min-h-screen bg-[var(--background)]">
      {/* Admin Header */}
      <header className="bg-[var(--header-bg)] shadow-md">
        <div className="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
          <div className="flex h-14 items-center justify-between">
            <div className="flex items-center gap-3">
              <div className="flex h-8 w-8 items-center justify-center rounded-lg bg-[var(--accent)] text-[var(--header-bg)] font-bold text-xs">
                IDN
              </div>
              <div>
                <div className="text-sm font-semibold text-white">IDN Research Admin</div>
              </div>
            </div>
            <div className="flex items-center gap-4">
              <a
                href="/"
                target="_blank"
                className="text-xs text-white/60 hover:text-white transition-colors"
              >
                View Site &rarr;
              </a>
              <button
                onClick={onLogout}
                className="rounded-lg bg-white/10 px-3 py-1.5 text-xs font-medium text-white hover:bg-white/20 transition-colors"
              >
                Logout
              </button>
            </div>
          </div>
        </div>
      </header>

      {/* Tabs */}
      <div className="border-b border-[var(--border)] bg-white">
        <div className="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
          <div className="flex gap-1 overflow-x-auto">
            {/* Directory section */}
            {tabs
              .filter((t) => t.section === "directory")
              .map((tab) => (
                <button
                  key={tab.key}
                  onClick={() => setActiveTab(tab.key)}
                  className={`flex items-center gap-2 px-4 py-3 text-sm font-medium border-b-2 transition-colors whitespace-nowrap ${
                    activeTab === tab.key
                      ? "border-[var(--primary)] text-[var(--primary)]"
                      : "border-transparent text-[var(--muted)] hover:text-[var(--foreground)]"
                  }`}
                >
                  {tab.label}
                  <span
                    className={`rounded-full px-2 py-0.5 text-xs ${
                      activeTab === tab.key
                        ? "bg-[var(--primary)] text-white"
                        : tab.key === "review" && tab.count > 0
                        ? "bg-red-100 text-red-700"
                        : "bg-[var(--surface)] text-[var(--muted)]"
                    }`}
                  >
                    {tab.count}
                  </span>
                </button>
              ))}

            {/* Separator */}
            <div className="mx-2 self-center h-6 w-px bg-[var(--border)]" />

            {/* Legacy section */}
            {tabs
              .filter((t) => t.section === "legacy")
              .map((tab) => (
                <button
                  key={tab.key}
                  onClick={() => setActiveTab(tab.key)}
                  className={`flex items-center gap-2 px-4 py-3 text-sm font-medium border-b-2 transition-colors whitespace-nowrap ${
                    activeTab === tab.key
                      ? "border-[var(--primary)] text-[var(--primary)]"
                      : "border-transparent text-[var(--muted)] hover:text-[var(--foreground)]"
                  }`}
                >
                  {tab.label}
                  <span
                    className={`rounded-full px-2 py-0.5 text-xs ${
                      activeTab === tab.key
                        ? "bg-[var(--primary)] text-white"
                        : "bg-[var(--surface)] text-[var(--muted)]"
                    }`}
                  >
                    {tab.count}
                  </span>
                </button>
              ))}
          </div>
        </div>
      </div>

      {/* Tab Content */}
      <div className="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8 py-6">
        {activeTab === "companies" && (
          <CompaniesAdmin
            companies={companies}
            domains={domains}
            subcategories={subcategories}
            organizations={organizations}
            affiliations={affiliations}
            onRefresh={fetchData}
          />
        )}
        {activeTab === "taxonomy" && (
          <TaxonomyAdmin
            domains={domains}
            subcategories={subcategories}
            tags={tags}
            onRefresh={fetchData}
          />
        )}
        {activeTab === "review" && (
          <ReviewQueueAdmin
            queueItems={queueItems}
            subcategories={subcategories}
            domains={domains}
            onRefresh={fetchData}
          />
        )}
        {activeTab === "resources" && (
          <ResourcesAdmin
            resources={resources}
            categories={categories}
            onRefresh={fetchData}
          />
        )}
        {activeTab === "categories" && (
          <CategoriesAdmin categories={categories} onRefresh={fetchData} />
        )}
        {activeTab === "influencers" && (
          <InfluencersAdmin influencers={influencers} onRefresh={fetchData} />
        )}
      </div>
    </div>
  );
}

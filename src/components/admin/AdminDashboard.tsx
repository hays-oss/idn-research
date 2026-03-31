"use client";

import { useEffect, useState, useCallback } from "react";
import { supabase } from "@/lib/supabase";
import { ResourceCategory, Resource, LinkedInInfluencer } from "@/lib/types";
import CategoriesAdmin from "./CategoriesAdmin";
import ResourcesAdmin from "./ResourcesAdmin";
import InfluencersAdmin from "./InfluencersAdmin";

type Tab = "resources" | "categories" | "influencers";

export default function AdminDashboard({ onLogout }: { onLogout: () => void }) {
  const [activeTab, setActiveTab] = useState<Tab>("resources");
  const [categories, setCategories] = useState<ResourceCategory[]>([]);
  const [resources, setResources] = useState<Resource[]>([]);
  const [influencers, setInfluencers] = useState<LinkedInInfluencer[]>([]);
  const [loading, setLoading] = useState(true);

  const fetchData = useCallback(async () => {
    const [catRes, resRes, infRes] = await Promise.all([
      supabase.from("resource_categories").select("*").order("display_order"),
      supabase.from("resources").select("*").order("display_order"),
      supabase.from("linkedin_influencers").select("*").order("display_order"),
    ]);
    if (catRes.data) setCategories(catRes.data);
    if (resRes.data) setResources(resRes.data);
    if (infRes.data) setInfluencers(infRes.data);
    setLoading(false);
  }, []);

  useEffect(() => {
    fetchData();
  }, [fetchData]);

  const tabs: { key: Tab; label: string; count: number }[] = [
    { key: "resources", label: "Resources", count: resources.length },
    { key: "categories", label: "Categories", count: categories.length },
    { key: "influencers", label: "Influencers", count: influencers.length },
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
          <div className="flex gap-1">
            {tabs.map((tab) => (
              <button
                key={tab.key}
                onClick={() => setActiveTab(tab.key)}
                className={`flex items-center gap-2 px-4 py-3 text-sm font-medium border-b-2 transition-colors ${
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

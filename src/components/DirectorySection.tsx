"use client";

import { useState } from "react";
import { DirectoryDomain } from "@/lib/types";
import CompanyCard from "./CompanyCard";

export default function DirectorySection({
  domains,
  onTrackClick,
}: {
  domains: DirectoryDomain[];
  onTrackClick: (id: string) => void;
}) {
  const [expandedSlug, setExpandedSlug] = useState<string | null>(null);

  const totalCompanies = domains.reduce((sum, d) => sum + d.totalCompanies, 0);
  const totalSubcategories = domains.reduce((sum, d) => sum + d.subcategories.length, 0);

  function toggleSubcategory(slug: string) {
    setExpandedSlug((prev) => (prev === slug ? null : slug));
  }

  if (domains.length === 0) return null;

  return (
    <div id="company-directory" className="scroll-mt-20">
      <div className="mb-6">
        <h2 className="text-xl font-bold text-foreground">Company Directory</h2>
        <p className="text-sm text-muted mt-1">
          {totalCompanies} companies across {totalSubcategories} market segments
        </p>
      </div>

      <div className="space-y-8">
        {domains.map((domain) => (
          <div key={domain.id}>
            {/* Domain heading */}
            <div className="mb-3 flex items-center gap-3">
              <h3 className="text-sm font-semibold text-foreground/70 uppercase tracking-wide">
                {domain.name}
              </h3>
              <span className="rounded-full bg-surface px-2 py-0.5 text-[10px] font-medium text-muted">
                {domain.totalCompanies}
              </span>
            </div>

            {/* Subcategory accordions */}
            <div className="space-y-2">
              {domain.subcategories.map((sub) => {
                const slug = `directory-sub-${sub.id}`;
                const isExpanded = expandedSlug === slug;
                return (
                  <div
                    key={sub.id}
                    id={slug}
                    className="scroll-mt-20 rounded-lg border border-border bg-white overflow-hidden"
                  >
                    <button
                      onClick={() => toggleSubcategory(slug)}
                      className="flex w-full items-center justify-between px-5 py-3.5 text-left transition-colors hover:bg-surface/50"
                    >
                      <div className="flex items-center gap-3">
                        <svg
                          className={`h-4 w-4 shrink-0 text-muted transition-transform duration-200 ${
                            isExpanded ? "rotate-90" : ""
                          }`}
                          fill="none"
                          stroke="currentColor"
                          viewBox="0 0 24 24"
                        >
                          <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 5l7 7-7 7" />
                        </svg>
                        <span className="text-sm font-semibold text-foreground">
                          {sub.name}
                        </span>
                      </div>
                      <span className="rounded-full bg-surface px-2.5 py-0.5 text-xs font-medium text-muted">
                        {sub.companies.length}
                      </span>
                    </button>

                    {isExpanded && (
                      <div className="border-t border-border px-5 py-4 bg-background/50">
                        <div className="grid gap-2 sm:grid-cols-2 lg:grid-cols-3">
                          {sub.companies.map((company) => (
                            <CompanyCard
                              key={company.id}
                              company={company}
                              onTrackClick={onTrackClick}
                            />
                          ))}
                        </div>
                      </div>
                    )}
                  </div>
                );
              })}
            </div>
          </div>
        ))}
      </div>
    </div>
  );
}

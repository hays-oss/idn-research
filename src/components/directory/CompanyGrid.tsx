"use client";

import { useState } from "react";
import ExpandableCompanyCard, { ExpandableCompany } from "./ExpandableCompanyCard";

interface GridDomain {
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

export default function CompanyGrid({
  domains,
  hasActiveFilters,
}: {
  domains: GridDomain[];
  hasActiveFilters: boolean;
}) {
  const [expandedCardId, setExpandedCardId] = useState<string | null>(null);
  const [collapsedDomains, setCollapsedDomains] = useState<Set<number>>(
    // If no filters active, start all collapsed; if filters active, expand all
    hasActiveFilters ? new Set() : new Set(domains.map((d) => d.id))
  );

  function toggleDomainCollapse(domainId: number) {
    setCollapsedDomains((prev) => {
      const next = new Set(prev);
      if (next.has(domainId)) {
        next.delete(domainId);
      } else {
        next.add(domainId);
      }
      return next;
    });
  }

  function toggleCard(id: string) {
    setExpandedCardId((prev) => (prev === id ? null : id));
  }

  const totalCompanies = domains.reduce((sum, d) => sum + d.totalCompanies, 0);
  const totalSegments = domains.reduce((sum, d) => sum + d.subcategories.length, 0);

  if (domains.length === 0) {
    return (
      <div className="text-center py-16">
        <svg className="h-12 w-12 text-muted/30 mx-auto mb-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
          <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={1.5} d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
        </svg>
        <p className="text-muted text-sm">No companies match your filters</p>
        <p className="text-muted/60 text-xs mt-1">Try adjusting or clearing your filters</p>
      </div>
    );
  }

  return (
    <div>
      {/* Summary bar */}
      <div className="mb-6">
        <p className="text-sm text-muted">
          <span className="font-semibold text-foreground">{totalCompanies}</span> companies across{" "}
          <span className="font-semibold text-foreground">{totalSegments}</span> market segments
        </p>
      </div>

      {/* Domain groups */}
      <div className="space-y-6">
        {domains.map((domain) => {
          const isCollapsed = collapsedDomains.has(domain.id);
          return (
            <div key={domain.id}>
              {/* Domain heading */}
              <button
                onClick={() => toggleDomainCollapse(domain.id)}
                className="flex items-center gap-3 mb-3 w-full text-left group"
              >
                <svg
                  className={`h-4 w-4 text-muted transition-transform duration-200 ${
                    isCollapsed ? "" : "rotate-90"
                  }`}
                  fill="none"
                  stroke="currentColor"
                  viewBox="0 0 24 24"
                >
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 5l7 7-7 7" />
                </svg>
                <h2 className="text-sm font-semibold text-foreground/70 uppercase tracking-wide group-hover:text-foreground transition-colors">
                  {domain.name}
                </h2>
                <span className="rounded-full bg-surface px-2 py-0.5 text-[10px] font-medium text-muted">
                  {domain.totalCompanies}
                </span>
              </button>

              {/* Subcategories */}
              {!isCollapsed && (
                <div className="space-y-4 ml-7">
                  {domain.subcategories.map((sub) => (
                    <div key={sub.id} id={`dir-sub-${sub.id}`}>
                      <div className="flex items-center gap-2 mb-2">
                        <h3 className="text-xs font-semibold text-foreground">
                          {sub.name}
                        </h3>
                        <span className="rounded-full bg-surface px-2 py-0.5 text-[10px] font-medium text-muted">
                          {sub.companies.length}
                        </span>
                      </div>
                      <div className="space-y-1.5">
                        {sub.companies.map((company) => (
                          <ExpandableCompanyCard
                            key={company.id}
                            company={company}
                            isExpanded={expandedCardId === company.id}
                            onToggle={() => toggleCard(company.id)}
                          />
                        ))}
                      </div>
                    </div>
                  ))}
                </div>
              )}
            </div>
          );
        })}
      </div>
    </div>
  );
}

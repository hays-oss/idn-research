"use client";

import { useState, useEffect } from "react";
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

  // When filters become active, expand all domains; when cleared, collapse all
  useEffect(() => {
    if (hasActiveFilters) {
      setCollapsedDomains(new Set());
    } else {
      setCollapsedDomains(new Set(domains.map((d) => d.id)));
    }
  }, [hasActiveFilters, domains]);

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
        <p className="font-serif text-[20px] text-ink-2">No companies match your filters.</p>
        <p className="text-[13px] text-ink-muted mt-2">
          Try adjusting or clearing your filters.
        </p>
      </div>
    );
  }

  return (
    <div>
      {/* Summary bar */}
      <div className="mb-8 pb-4 border-b border-rule">
        <p className="text-[13px] text-ink-2">
          <span className="font-serif text-[18px] text-ink tracking-tight">
            {totalCompanies}
          </span>
          <span className="mx-2 text-ink-muted">companies across</span>
          <span className="font-serif text-[18px] text-ink tracking-tight">
            {totalSegments}
          </span>
          <span className="ml-2 text-ink-muted">market segments</span>
        </p>
      </div>

      {/* Domain groups */}
      <div className="space-y-10">
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
                  className={`h-3.5 w-3.5 text-ink-muted transition-transform duration-200 ${
                    isCollapsed ? "" : "rotate-90"
                  }`}
                  fill="none"
                  stroke="currentColor"
                  viewBox="0 0 24 24"
                >
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 5l7 7-7 7" />
                </svg>
                <div>
                  <div className="text-[10px] uppercase tracking-[0.22em] font-semibold text-oxblood mb-0.5">
                    {domain.totalCompanies} companies
                  </div>
                  <h2 className="font-serif text-[22px] tracking-[-0.01em] text-ink group-hover:text-oxblood transition-colors">
                    {domain.name}
                  </h2>
                </div>
              </button>

              {/* Subcategories */}
              {!isCollapsed && (
                <div className="space-y-6 ml-7">
                  {domain.subcategories.map((sub) => (
                    <div key={sub.id} id={`dir-sub-${sub.id}`}>
                      <div className="flex items-baseline gap-2 mb-2 border-b border-rule pb-1">
                        <h3 className="font-serif text-[16px] text-ink">
                          {sub.name}
                        </h3>
                        <span className="text-[10px] uppercase tracking-[0.16em] text-ink-muted">
                          {sub.companies.length}
                        </span>
                      </div>
                      <div>
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

"use client";

import Link from "next/link";
import { trackExternalLinkClick } from "@/lib/analytics";

const AFFILIATION_STYLES: Record<string, { bg: string }> = {
  IHES: { bg: "bg-ihes-green" },
  CPES: { bg: "bg-cpes-blue" },
  CSCE: { bg: "bg-csce-orange" },
  MUIA: { bg: "bg-muia-purple" },
};

export interface ExpandableCompany {
  id: string;
  company_name: string;
  slug: string | null;
  website: string | null;
  linkedin_url: string | null;
  description: string | null;
  is_featured: boolean;
  affiliations: { code: string; name: string }[];
  company_type?: string | null;
  headquarters_city?: string | null;
  headquarters_state?: string | null;
  tags?: { id: number; name: string }[];
}

const COMPANY_TYPE_LABELS: Record<string, string> = {
  gpo: "GPO",
  distributor: "Distributor",
  manufacturer: "Manufacturer",
  vendor: "Vendor",
  consultant: "Consultant",
  payer: "Payer",
  media: "Media",
  association: "Association",
  provider: "Provider",
  other: "Other",
};

export default function ExpandableCompanyCard({
  company,
  isExpanded,
  onToggle,
}: {
  company: ExpandableCompany;
  isExpanded: boolean;
  onToggle: () => void;
}) {
  const hasAffiliations = company.affiliations && company.affiliations.length > 0;
  const hasLinkedIn = !!company.linkedin_url;
  const hasTags = company.tags && company.tags.length > 0;
  const hasLocation = company.headquarters_city || company.headquarters_state;

  return (
    <div
      className={`border-b border-rule transition-colors ${
        isExpanded ? "bg-cream-2" : "hover:bg-cream-2/60"
      }`}
    >
      <button
        onClick={onToggle}
        className="flex w-full items-center justify-between px-1 py-3 text-left group"
      >
        <div className="min-w-0 flex-1">
          <div className="flex items-center gap-2 flex-wrap">
            <span className="font-serif text-[17px] leading-snug text-ink group-hover:text-oxblood transition-colors">
              {company.company_name}
            </span>
            {hasAffiliations && (
              <div className="flex gap-1 shrink-0">
                {company.affiliations.map((aff) => {
                  const style = AFFILIATION_STYLES[aff.code];
                  if (!style) return null;
                  return (
                    <span
                      key={aff.code}
                      className={`inline-flex items-center rounded-[2px] px-1.5 py-0.5 text-[9px] font-bold tracking-[0.08em] text-white ${style.bg}`}
                      title={aff.name}
                    >
                      {aff.code}
                    </span>
                  );
                })}
              </div>
            )}
          </div>
          {!isExpanded && company.description && (
            <p className="text-[13px] text-ink-2 truncate mt-0.5">
              {company.description}
            </p>
          )}
        </div>
        <svg
          className={`h-3.5 w-3.5 ml-3 shrink-0 text-ink-muted transition-transform duration-200 ${
            isExpanded ? "rotate-180" : ""
          }`}
          fill="none"
          stroke="currentColor"
          viewBox="0 0 24 24"
        >
          <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M19 9l-7 7-7-7" />
        </svg>
      </button>

      {/* Expanded details */}
      {isExpanded && (
        <div className="px-1 pb-4 space-y-3 border-t border-rule/50 pt-3">
          {company.description && (
            <p className="text-[14px] text-ink-2 leading-[1.6]">
              {company.description}
            </p>
          )}

          {/* Meta row */}
          <div className="flex flex-wrap items-center gap-3 text-[11px] uppercase tracking-[0.14em] text-ink-muted">
            {company.company_type && (
              <span className="rounded-[2px] bg-cream border border-rule px-2 py-0.5">
                {COMPANY_TYPE_LABELS[company.company_type] || company.company_type}
              </span>
            )}
            {hasLocation && (
              <span className="normal-case tracking-normal text-[12px]">
                {[company.headquarters_city, company.headquarters_state]
                  .filter(Boolean)
                  .join(", ")}
              </span>
            )}
          </div>

          {/* Tags */}
          {hasTags && (
            <div className="flex flex-wrap gap-1.5">
              {company.tags!.map((tag) => (
                <span
                  key={tag.id}
                  className="inline-flex items-center rounded-[2px] bg-cream border border-rule px-2 py-0.5 text-[10px] uppercase tracking-[0.1em] text-ink-2"
                >
                  {tag.name}
                </span>
              ))}
            </div>
          )}

          {/* Links */}
          <div className="flex items-center gap-5 pt-1">
            {company.slug && (
              <Link
                href={`/company/${company.slug}`}
                className="inline-flex items-center gap-1.5 font-serif italic text-[14px] text-oxblood hover:text-oxblood-deep transition-colors"
              >
                View full profile
                <svg className="h-3.5 w-3.5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M13 7l5 5m0 0l-5 5m5-5H6" />
                </svg>
              </Link>
            )}
            {company.website && (
              <a
                href={company.website}
                target="_blank"
                rel="noopener noreferrer"
                onClick={() =>
                  trackExternalLinkClick({
                    resourceId: company.id,
                    resourceName: company.company_name,
                    destinationUrl: company.website!,
                    source: "directory_card",
                  })
                }
                className="inline-flex items-center gap-1.5 font-serif italic text-[14px] text-ink-2 hover:text-oxblood transition-colors"
              >
                Website ↗
              </a>
            )}
            {hasLinkedIn && (
              <a
                href={company.linkedin_url!}
                target="_blank"
                rel="noopener noreferrer"
                className="inline-flex items-center gap-1.5 font-serif italic text-[14px] text-ink-2 hover:text-oxblood transition-colors"
              >
                LinkedIn ↗
              </a>
            )}
          </div>
        </div>
      )}
    </div>
  );
}

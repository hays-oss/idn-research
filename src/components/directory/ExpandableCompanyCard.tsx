"use client";

const AFFILIATION_STYLES: Record<string, { bg: string; text: string }> = {
  IHES: { bg: "bg-[#1a5632]", text: "text-white" },
  CPES: { bg: "bg-[#1a2b5f]", text: "text-white" },
  CSCE: { bg: "bg-[#c45a1a]", text: "text-white" },
  MUIA: { bg: "bg-[#1a1a2e]", text: "text-white" },
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
      className={`rounded-lg border bg-white transition-all ${
        isExpanded
          ? "border-primary/30 shadow-sm"
          : "border-border hover:border-primary/20 hover:shadow-sm"
      }`}
    >
      {/* Collapsed header — always visible */}
      <button
        onClick={onToggle}
        className="flex w-full items-center justify-between px-4 py-2.5 text-left group"
      >
        <div className="min-w-0 flex-1">
          <div className="flex items-center gap-2">
            <span className="text-sm font-medium text-foreground group-hover:text-primary truncate">
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
                      className={`inline-flex items-center rounded px-1.5 py-0.5 text-[9px] font-bold tracking-wide ${style.bg} ${style.text}`}
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
            <p className="text-xs text-muted truncate mt-0.5">
              {company.description}
            </p>
          )}
        </div>
        <div className="flex items-center gap-2 shrink-0 ml-3">
          {hasLinkedIn && !isExpanded && (
            <span className="text-[#0A66C2]">
              <svg className="h-4 w-4" fill="currentColor" viewBox="0 0 24 24">
                <path d="M20.447 20.452h-3.554v-5.569c0-1.328-.027-3.037-1.852-3.037-1.853 0-2.136 1.445-2.136 2.939v5.667H9.351V9h3.414v1.561h.046c.477-.9 1.637-1.85 3.37-1.85 3.601 0 4.267 2.37 4.267 5.455v6.286zM5.337 7.433a2.062 2.062 0 01-2.063-2.065 2.064 2.064 0 112.063 2.065zm1.782 13.019H3.555V9h3.564v11.452zM22.225 0H1.771C.792 0 0 .774 0 1.729v20.542C0 23.227.792 24 1.771 24h20.451C23.2 24 24 23.227 24 22.271V1.729C24 .774 23.2 0 22.222 0h.003z" />
              </svg>
            </span>
          )}
          {company.website && !isExpanded && (
            <svg
              className="h-3.5 w-3.5 text-muted/50 group-hover:text-primary transition-colors"
              fill="none"
              stroke="currentColor"
              viewBox="0 0 24 24"
            >
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14" />
            </svg>
          )}
          <svg
            className={`h-4 w-4 text-muted transition-transform duration-200 ${
              isExpanded ? "rotate-180" : ""
            }`}
            fill="none"
            stroke="currentColor"
            viewBox="0 0 24 24"
          >
            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M19 9l-7 7-7-7" />
          </svg>
        </div>
      </button>

      {/* Expanded details */}
      {isExpanded && (
        <div className="border-t border-border px-4 py-3 bg-background/30 space-y-3">
          {company.description && (
            <p className="text-sm text-foreground/80 leading-relaxed">
              {company.description}
            </p>
          )}

          {/* Meta row */}
          <div className="flex flex-wrap items-center gap-3 text-xs text-muted">
            {company.company_type && (
              <span className="rounded-full bg-surface px-2 py-0.5">
                {({ gpo: "GPO", distributor: "Distributor", manufacturer: "Manufacturer", vendor: "Vendor", consultant: "Consultant", payer: "Payer", media: "Media", association: "Association", provider: "Provider", other: "Other" } as Record<string, string>)[company.company_type] || company.company_type}
              </span>
            )}
            {hasLocation && (
              <span>
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
                  className="inline-flex items-center rounded-md bg-surface px-2 py-0.5 text-[11px] text-muted"
                >
                  {tag.name}
                </span>
              ))}
            </div>
          )}

          {/* Links */}
          <div className="flex items-center gap-4 pt-1">
            {company.website && (
              <a
                href={company.website}
                target="_blank"
                rel="noopener noreferrer"
                className="inline-flex items-center gap-1.5 text-xs text-primary hover:text-primary-light transition-colors"
              >
                <svg className="h-3.5 w-3.5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14" />
                </svg>
                Website
              </a>
            )}
            {hasLinkedIn && (
              <a
                href={company.linkedin_url!}
                target="_blank"
                rel="noopener noreferrer"
                className="inline-flex items-center gap-1.5 text-xs text-[#0A66C2] hover:text-[#004182] transition-colors"
              >
                <svg className="h-3.5 w-3.5" fill="currentColor" viewBox="0 0 24 24">
                  <path d="M20.447 20.452h-3.554v-5.569c0-1.328-.027-3.037-1.852-3.037-1.853 0-2.136 1.445-2.136 2.939v5.667H9.351V9h3.414v1.561h.046c.477-.9 1.637-1.85 3.37-1.85 3.601 0 4.267 2.37 4.267 5.455v6.286zM5.337 7.433a2.062 2.062 0 01-2.063-2.065 2.064 2.064 0 112.063 2.065zm1.782 13.019H3.555V9h3.564v11.452zM22.225 0H1.771C.792 0 0 .774 0 1.729v20.542C0 23.227.792 24 1.771 24h20.451C23.2 24 24 23.227 24 22.271V1.729C24 .774 23.2 0 22.222 0h.003z" />
                </svg>
                LinkedIn
              </a>
            )}
          </div>
        </div>
      )}
    </div>
  );
}

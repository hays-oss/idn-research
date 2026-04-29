"use client";

import Link from "next/link";
import { DirectoryCompany } from "@/lib/types";
import { trackExternalLinkClick } from "@/lib/analytics";

const AFFILIATION_STYLES: Record<string, { bg: string }> = {
  IHES: { bg: "bg-ihes-green" },
  CPES: { bg: "bg-cpes-blue" },
  CSCE: { bg: "bg-csce-orange" },
  MUIA: { bg: "bg-muia-purple" },
};

export default function CompanyCard({
  company,
  onTrackClick,
}: {
  company: DirectoryCompany;
  onTrackClick: (id: string) => void;
}) {
  const hasAffiliations = company.affiliations && company.affiliations.length > 0;
  const hasLinkedIn = !!company.linkedin_url;

  const inner = (
    <>
      <div className="flex items-center gap-2 flex-wrap">
        <span className="font-serif text-[18px] leading-snug text-ink group-hover:text-oxblood transition-colors">
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
      {company.description && (
        <p className="text-[14px] leading-[1.55] text-ink-2 mt-1 line-clamp-2">
          {company.description}
        </p>
      )}
    </>
  );

  return (
    <div className="group border-b border-rule hover:bg-cream-2/60 transition-colors py-3 px-1">
      <div className="flex items-start justify-between gap-4">
        {company.slug ? (
          <Link href={`/company/${company.slug}`} className="min-w-0 flex-1">
            {inner}
          </Link>
        ) : (
          <a
            href={company.website || "#"}
            target="_blank"
            rel="noopener noreferrer"
            onClick={() => onTrackClick(company.id)}
            className="min-w-0 flex-1"
          >
            {inner}
          </a>
        )}
        <div className="flex items-center gap-3 shrink-0 mt-1">
          {hasLinkedIn && (
            <a
              href={company.linkedin_url!}
              target="_blank"
              rel="noopener noreferrer"
              onClick={(e) => e.stopPropagation()}
              className="text-ink-muted hover:text-oxblood transition-colors"
              title="View on LinkedIn"
              aria-label={`${company.company_name} on LinkedIn`}
            >
              <svg className="h-4 w-4" fill="currentColor" viewBox="0 0 24 24">
                <path d="M20.447 20.452h-3.554v-5.569c0-1.328-.027-3.037-1.852-3.037-1.853 0-2.136 1.445-2.136 2.939v5.667H9.351V9h3.414v1.561h.046c.477-.9 1.637-1.85 3.37-1.85 3.601 0 4.267 2.37 4.267 5.455v6.286zM5.337 7.433a2.062 2.062 0 01-2.063-2.065 2.064 2.064 0 112.063 2.065zm1.782 13.019H3.555V9h3.564v11.452zM22.225 0H1.771C.792 0 0 .774 0 1.729v20.542C0 23.227.792 24 1.771 24h20.451C23.2 24 24 23.227 24 22.271V1.729C24 .774 23.2 0 22.222 0h.003z" />
              </svg>
            </a>
          )}
          {company.website && (
            <a
              href={company.website}
              target="_blank"
              rel="noopener noreferrer"
              onClick={() => {
                onTrackClick(company.id);
                trackExternalLinkClick({
                  resourceId: company.id,
                  resourceName: company.company_name,
                  destinationUrl: company.website!,
                  source: "homepage_company_card",
                });
              }}
              className="inline-flex items-center gap-1 font-serif italic text-[13px] text-oxblood hover:text-oxblood-deep transition-colors"
              aria-label={`Visit ${company.company_name} website`}
            >
              visit
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
                  d="M14 5l7 7m0 0l-7 7m7-7H3"
                />
              </svg>
            </a>
          )}
        </div>
      </div>
    </div>
  );
}

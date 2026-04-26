"use client";

import Link from "next/link";
import { DirectoryCompany } from "@/lib/types";

const AFFILIATION_STYLES: Record<string, { bg: string; text: string }> = {
  IHES: { bg: "bg-[#1a5632]", text: "text-white" },
  CPES: { bg: "bg-[#1a2b5f]", text: "text-white" },
  CSCE: { bg: "bg-[#c45a1a]", text: "text-white" },
  MUIA: { bg: "bg-[#1a1a2e]", text: "text-white" },
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

  return (
    <div className="group rounded-xl border border-border bg-white px-4 py-3 transition-all duration-200 ease-out hover:border-teal/30 hover:shadow-md hover:-translate-y-0.5">
      <div className="flex items-center justify-between">
        {company.slug ? (
          <Link href={`/company/${company.slug}`} className="min-w-0 flex-1">
            <div className="flex items-center gap-2">
              <span className="text-base font-bold text-foreground group-hover:text-primary truncate">
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
            {company.description && (
              <p className="text-xs text-muted truncate mt-0.5">
                {company.description}
              </p>
            )}
          </Link>
        ) : (
          <a
            href={company.website || "#"}
            target="_blank"
            rel="noopener noreferrer"
            onClick={() => onTrackClick(company.id)}
            className="min-w-0 flex-1"
          >
            <div className="flex items-center gap-2">
              <span className="text-base font-bold text-foreground group-hover:text-primary truncate">
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
            {company.description && (
              <p className="text-xs text-muted truncate mt-0.5">
                {company.description}
              </p>
            )}
          </a>
        )}
        <div className="flex items-center gap-2 shrink-0 ml-3">
          {hasLinkedIn && (
            <a
              href={company.linkedin_url!}
              target="_blank"
              rel="noopener noreferrer"
              onClick={(e) => e.stopPropagation()}
              className="text-[#0A66C2] hover:text-[#004182] transition-colors"
              title="View on LinkedIn"
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
              onClick={() => onTrackClick(company.id)}
            >
              <svg
                className="h-3.5 w-3.5 text-muted/50 group-hover:text-primary transition-colors"
                fill="none"
                stroke="currentColor"
                viewBox="0 0 24 24"
              >
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14" />
              </svg>
            </a>
          )}
        </div>
      </div>
    </div>
  );
}

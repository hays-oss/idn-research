"use client";

import Link from "next/link";
import { Resource } from "@/lib/types";
import { slugify } from "@/lib/slug";
import { trackExternalLinkClick } from "@/lib/analytics";

// Org branding colors matching IHES Mission Control config
const AFFILIATION_STYLES: Record<string, { bg: string; text: string; border: string }> = {
  IHES: { bg: "bg-[#1a5632]", text: "text-white", border: "border-[#1a5632]" },
  CPES: { bg: "bg-[#1a2b5f]", text: "text-white", border: "border-[#1a2b5f]" },
  CSCE: { bg: "bg-[#c45a1a]", text: "text-white", border: "border-[#c45a1a]" },
  MUIA: { bg: "bg-[#1a1a2e]", text: "text-white", border: "border-[#1a1a2e]" },
};

export default function ResourceCard({
  resource,
  onTrackClick,
  onTagClick,
  activeTag,
}: {
  resource: Resource;
  onTrackClick: (id: string) => void;
  onTagClick?: (tag: string) => void;
  activeTag?: string | null;
}) {
  const hasTags = resource.tags && resource.tags.length > 0;
  const hasAffiliations =
    resource.affiliations && resource.affiliations.length > 0;

  return (
    <div className="group rounded-xl border border-border bg-white pl-0 pr-4 py-2.5 transition-all duration-200 ease-out hover:border-teal/30 hover:shadow-md hover:-translate-y-0.5 flex">
      {/* Left accent bar */}
      <div className="w-1 shrink-0 rounded-l-xl bg-teal/60 group-hover:bg-teal transition-colors" />
      <div className="flex-1 min-w-0 pl-3">
      <div className="flex items-center justify-between">
        <Link
          href={`/resource/${slugify(resource.name)}`}
          className="min-w-0 flex-1"
        >
          <div className="flex items-center gap-2">
            <span className="text-sm font-medium text-foreground group-hover:text-primary truncate">
              {resource.name}
            </span>
            {hasAffiliations && (
              <div className="flex gap-1 shrink-0">
                {resource.affiliations.map((org) => {
                  const style = AFFILIATION_STYLES[org];
                  if (!style) return null;
                  return (
                    <span
                      key={org}
                      className={`inline-flex items-center rounded px-1.5 py-0.5 text-[9px] font-bold tracking-wide ${style.bg} ${style.text}`}
                      title={`${org} Member`}
                    >
                      {org}
                    </span>
                  );
                })}
              </div>
            )}
          </div>
          {resource.description && (
            <p className="text-xs text-muted truncate mt-0.5">
              {resource.description}
            </p>
          )}
        </Link>
        {resource.url && (
          <a
            href={resource.url}
            target="_blank"
            rel="noopener noreferrer"
            onClick={() => {
              onTrackClick(resource.id);
              trackExternalLinkClick({
                resourceId: resource.id,
                resourceName: resource.name,
                destinationUrl: resource.url,
                source: "homepage_card",
              });
            }}
            className="shrink-0 ml-3"
            title={`Visit ${resource.name} (external)`}
            aria-label={`Visit ${resource.name} website`}
          >
            <svg
              className="h-3.5 w-3.5 text-muted/50 group-hover:text-primary transition-colors"
              fill="none"
              stroke="currentColor"
              viewBox="0 0 24 24"
            >
              <path
                strokeLinecap="round"
                strokeLinejoin="round"
                strokeWidth={2}
                d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14"
              />
            </svg>
          </a>
        )}
      </div>
      {hasTags && (
        <div className="flex flex-wrap gap-1 mt-1.5">
          {resource.tags.slice(0, 3).map((tag) => (
            <button
              key={tag}
              onClick={(e) => {
                e.stopPropagation();
                onTagClick?.(tag);
              }}
              className={`rounded px-1.5 py-0.5 text-[10px] transition-colors ${
                activeTag === tag
                  ? "bg-primary text-white"
                  : "bg-surface/70 text-muted hover:bg-primary/10 hover:text-primary"
              }`}
            >
              {tag}
            </button>
          ))}
          {resource.tags.length > 3 && (
            <span className="rounded px-1.5 py-0.5 text-[10px] text-muted bg-surface/50">
              +{resource.tags.length - 3} more
            </span>
          )}
        </div>
      )}
      </div>
    </div>
  );
}

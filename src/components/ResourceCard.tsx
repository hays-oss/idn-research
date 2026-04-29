"use client";

import Link from "next/link";
import { Resource } from "@/lib/types";
import { slugify } from "@/lib/slug";
import { trackExternalLinkClick } from "@/lib/analytics";

const AFFILIATION_STYLES: Record<string, { bg: string }> = {
  IHES: { bg: "bg-ihes-green" },
  CPES: { bg: "bg-cpes-blue" },
  CSCE: { bg: "bg-csce-orange" },
  MUIA: { bg: "bg-muia-purple" },
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
    <div className="group border-b border-rule hover:bg-cream-2/60 transition-colors py-3 px-1">
      <div className="flex items-start justify-between gap-4">
        <Link
          href={`/resource/${slugify(resource.name)}`}
          className="min-w-0 flex-1"
        >
          <div className="flex items-center gap-2 flex-wrap">
            <span className="font-serif text-[18px] leading-snug text-ink group-hover:text-oxblood transition-colors">
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
                      className={`inline-flex items-center rounded-[2px] px-1.5 py-0.5 text-[9px] font-bold tracking-[0.08em] text-white ${style.bg}`}
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
            <p className="text-[14px] leading-[1.55] text-ink-2 mt-1 line-clamp-2">
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
            className="shrink-0 mt-1 inline-flex items-center gap-1 font-serif italic text-[13px] text-oxblood hover:text-oxblood-deep transition-colors"
            title={`Visit ${resource.name} (external)`}
            aria-label={`Visit ${resource.name} website`}
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
      {hasTags && (
        <div className="flex flex-wrap gap-1 mt-2">
          {resource.tags.slice(0, 3).map((tag) => (
            <button
              key={tag}
              onClick={(e) => {
                e.stopPropagation();
                onTagClick?.(tag);
              }}
              className={`rounded-[2px] px-2 py-0.5 text-[10px] uppercase tracking-[0.1em] transition-colors ${
                activeTag === tag
                  ? "bg-ink text-cream"
                  : "bg-cream-2 text-ink-2 border border-rule hover:border-oxblood hover:text-oxblood"
              }`}
            >
              {tag}
            </button>
          ))}
          {resource.tags.length > 3 && (
            <span className="rounded-[2px] px-2 py-0.5 text-[10px] uppercase tracking-[0.1em] text-ink-muted">
              +{resource.tags.length - 3} more
            </span>
          )}
        </div>
      )}
    </div>
  );
}

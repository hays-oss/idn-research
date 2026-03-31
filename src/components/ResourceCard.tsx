"use client";

import { Resource } from "@/lib/types";

function isNewlyAdded(dateStr: string): boolean {
  const added = new Date(dateStr);
  const thirtyDaysAgo = new Date();
  thirtyDaysAgo.setDate(thirtyDaysAgo.getDate() - 30);
  return added >= thirtyDaysAgo;
}

export default function ResourceCard({
  resource,
  onTrackClick,
}: {
  resource: Resource;
  onTrackClick: (id: string) => void;
}) {
  return (
    <a
      href={resource.url}
      target="_blank"
      rel="noopener noreferrer"
      onClick={() => onTrackClick(resource.id)}
      className="group flex items-center justify-between rounded-lg border border-border bg-white px-4 py-3 transition-all hover:border-primary/30 hover:shadow-sm"
    >
      <div className="flex items-center gap-3 min-w-0">
        <div className="flex h-8 w-8 shrink-0 items-center justify-center rounded-md bg-surface text-xs font-bold text-primary">
          {resource.name.charAt(0)}
        </div>
        <div className="min-w-0">
          <div className="flex items-center gap-2">
            <span className="text-sm font-medium text-foreground group-hover:text-primary truncate">
              {resource.name}
            </span>
            {isNewlyAdded(resource.added_date) && (
              <span className="shrink-0 rounded-full bg-emerald-100 px-2 py-0.5 text-[10px] font-semibold text-emerald-700">
                NEW
              </span>
            )}
          </div>
          {resource.description && (
            <p className="text-xs text-muted truncate">{resource.description}</p>
          )}
        </div>
      </div>
      <svg
        className="h-4 w-4 shrink-0 text-muted group-hover:text-primary transition-colors ml-2"
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
  );
}

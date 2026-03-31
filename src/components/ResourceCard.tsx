"use client";

import { Resource } from "@/lib/types";

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
      className="group flex items-center justify-between rounded-lg border border-border bg-white px-4 py-2.5 transition-all hover:border-primary/30 hover:shadow-sm"
    >
      <div className="min-w-0">
        <span className="text-sm font-medium text-foreground group-hover:text-primary truncate block">
          {resource.name}
        </span>
        {resource.description && (
          <p className="text-xs text-muted truncate mt-0.5">{resource.description}</p>
        )}
      </div>
      <svg
        className="h-3.5 w-3.5 shrink-0 text-muted/50 group-hover:text-primary transition-colors ml-3"
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

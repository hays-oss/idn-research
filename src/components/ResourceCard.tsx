"use client";

import { Resource } from "@/lib/types";

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

  return (
    <div className="group rounded-lg border border-border bg-white px-4 py-2.5 transition-all hover:border-primary/30 hover:shadow-sm">
      <div className="flex items-center justify-between">
        <a
          href={resource.url}
          target="_blank"
          rel="noopener noreferrer"
          onClick={() => onTrackClick(resource.id)}
          className="min-w-0 flex-1"
        >
          <span className="text-sm font-medium text-foreground group-hover:text-primary truncate block">
            {resource.name}
          </span>
          {resource.description && (
            <p className="text-xs text-muted truncate mt-0.5">
              {resource.description}
            </p>
          )}
        </a>
        <a
          href={resource.url}
          target="_blank"
          rel="noopener noreferrer"
          onClick={() => onTrackClick(resource.id)}
          className="shrink-0 ml-3"
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
      </div>
      {hasTags && (
        <div className="flex flex-wrap gap-1 mt-1.5">
          {resource.tags.map((tag) => (
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
        </div>
      )}
    </div>
  );
}

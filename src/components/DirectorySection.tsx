"use client";

import { useState } from "react";
import { CategoryWithResources } from "@/lib/types";
import ResourceCard from "./ResourceCard";

export default function DirectorySection({
  categories,
  onTrackClick,
  onTagClick,
  activeTag,
}: {
  categories: CategoryWithResources[];
  onTrackClick: (id: string) => void;
  onTagClick?: (tag: string) => void;
  activeTag?: string | null;
}) {
  const [expandedSlug, setExpandedSlug] = useState<string | null>(null);

  function toggleCategory(slug: string) {
    setExpandedSlug((prev) => (prev === slug ? null : slug));
  }

  if (categories.length === 0) return null;

  return (
    <div id="company-directory" className="scroll-mt-20">
      <div className="mb-6">
        <h2 className="text-xl font-bold text-foreground">Company Directory</h2>
        <p className="text-sm text-muted mt-1">
          {categories.reduce((sum, c) => sum + c.resources.length, 0)} companies
          across {categories.length} market segments
        </p>
      </div>

      <div className="space-y-2">
        {categories.map((cat) => {
          const isExpanded = expandedSlug === cat.slug;
          return (
            <div
              key={cat.id}
              id={cat.slug}
              className="scroll-mt-20 rounded-lg border border-border bg-white overflow-hidden"
            >
              {/* Accordion header */}
              <button
                onClick={() => toggleCategory(cat.slug)}
                className="flex w-full items-center justify-between px-5 py-3.5 text-left transition-colors hover:bg-surface/50"
              >
                <div className="flex items-center gap-3">
                  <svg
                    className={`h-4 w-4 shrink-0 text-muted transition-transform duration-200 ${
                      isExpanded ? "rotate-90" : ""
                    }`}
                    fill="none"
                    stroke="currentColor"
                    viewBox="0 0 24 24"
                  >
                    <path
                      strokeLinecap="round"
                      strokeLinejoin="round"
                      strokeWidth={2}
                      d="M9 5l7 7-7 7"
                    />
                  </svg>
                  <span className="text-sm font-semibold text-foreground">
                    {cat.name}
                  </span>
                </div>
                <span className="rounded-full bg-surface px-2.5 py-0.5 text-xs font-medium text-muted">
                  {cat.resources.length}
                </span>
              </button>

              {/* Expanded content */}
              {isExpanded && (
                <div className="border-t border-border px-5 py-4 bg-background/50">
                  {cat.description && (
                    <p className="text-xs text-muted mb-3">{cat.description}</p>
                  )}
                  <div className="grid gap-2 sm:grid-cols-2 lg:grid-cols-3">
                    {cat.resources.map((resource) => (
                      <ResourceCard
                        key={resource.id}
                        resource={resource}
                        onTrackClick={onTrackClick}
                        onTagClick={onTagClick}
                        activeTag={activeTag}
                      />
                    ))}
                  </div>
                </div>
              )}
            </div>
          );
        })}
      </div>
    </div>
  );
}

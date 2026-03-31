"use client";

import { ResourceCategory } from "@/lib/types";

export default function CategoryNav({
  categories,
  activeSlug,
}: {
  categories: ResourceCategory[];
  activeSlug: string | null;
}) {
  return (
    <nav className="sticky top-16 z-40 border-b border-border bg-white overflow-x-auto">
      <div className="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
        <div className="flex gap-1 py-2 min-w-max">
          {categories.map((cat) => (
            <a
              key={cat.slug}
              href={`#${cat.slug}`}
              className={`whitespace-nowrap rounded-md px-3 py-1.5 text-xs font-medium transition-colors ${
                activeSlug === cat.slug
                  ? "bg-primary text-white"
                  : "text-primary/70 hover:bg-surface hover:text-primary"
              }`}
            >
              {cat.name}
            </a>
          ))}
        </div>
      </div>
    </nav>
  );
}

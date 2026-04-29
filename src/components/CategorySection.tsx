"use client";

import { CategoryWithResources } from "@/lib/types";
import ResourceCard from "./ResourceCard";

export default function CategorySection({
  category,
  onTrackClick,
  onTagClick,
  activeTag,
}: {
  category: CategoryWithResources;
  onTrackClick: (id: string) => void;
  onTagClick?: (tag: string) => void;
  activeTag?: string | null;
}) {
  return (
    <section id={category.slug} className="scroll-mt-20">
      <div className="border-t border-rule-strong pt-6 mb-2">
        <div className="text-[10px] uppercase tracking-[0.22em] font-semibold text-oxblood mb-2">
          {category.name} · {category.resources.length} resources
        </div>
        <h2 className="font-serif text-[26px] leading-[1.2] tracking-[-0.015em] text-ink">
          {category.name}
        </h2>
        {category.description && (
          <p className="text-[14px] leading-[1.6] text-ink-2 mt-2 max-w-3xl">
            {category.description}
          </p>
        )}
      </div>
      <div>
        {category.resources.map((resource) => (
          <ResourceCard
            key={resource.id}
            resource={resource}
            onTrackClick={onTrackClick}
            onTagClick={onTagClick}
            activeTag={activeTag}
          />
        ))}
      </div>
    </section>
  );
}

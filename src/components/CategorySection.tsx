"use client";

import { CategoryWithResources } from "@/lib/types";
import ResourceCard from "./ResourceCard";

export default function CategorySection({
  category,
  onTrackClick,
}: {
  category: CategoryWithResources;
  onTrackClick: (id: string) => void;
}) {
  return (
    <section id={category.slug} className="scroll-mt-20">
      <div className="flex items-center gap-3 mb-4">
        <h2 className="text-lg font-semibold text-foreground">{category.name}</h2>
        <span className="rounded-full bg-surface px-2.5 py-0.5 text-xs font-medium text-muted">
          {category.resources.length}
        </span>
      </div>
      {category.description && (
        <p className="text-sm text-muted mb-4">{category.description}</p>
      )}
      <div className="grid gap-2 sm:grid-cols-2 lg:grid-cols-3">
        {category.resources.map((resource) => (
          <ResourceCard
            key={resource.id}
            resource={resource}
            onTrackClick={onTrackClick}
          />
        ))}
      </div>
    </section>
  );
}

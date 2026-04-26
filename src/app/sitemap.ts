import type { MetadataRoute } from "next";
import {
  getAllActiveResources,
  getAllActiveCompanies,
} from "@/lib/resourceQueries";
import { slugify } from "@/lib/slug";

const SITE_ORIGIN = "https://idnresearch.com";

export const revalidate = 3600;

export default async function sitemap(): Promise<MetadataRoute.Sitemap> {
  const now = new Date();

  const staticEntries: MetadataRoute.Sitemap = [
    { url: `${SITE_ORIGIN}/`, lastModified: now, changeFrequency: "weekly", priority: 1.0 },
    { url: `${SITE_ORIGIN}/about`, lastModified: now, changeFrequency: "monthly", priority: 0.7 },
    { url: `${SITE_ORIGIN}/directory`, lastModified: now, changeFrequency: "weekly", priority: 0.9 },
  ];

  const [resources, companies] = await Promise.all([
    getAllActiveResources(),
    getAllActiveCompanies(),
  ]);

  const seenResourceSlugs = new Set<string>();
  const resourceEntries: MetadataRoute.Sitemap = [];
  for (const r of resources) {
    const slug = slugify(r.name);
    if (!slug || seenResourceSlugs.has(slug)) continue;
    seenResourceSlugs.add(slug);
    resourceEntries.push({
      url: `${SITE_ORIGIN}/resource/${slug}`,
      lastModified: r.updated_at ? new Date(r.updated_at) : now,
      changeFrequency: "monthly",
      priority: 0.6,
    });
  }

  const companyEntries: MetadataRoute.Sitemap = companies
    .filter((c) => !!c.slug)
    .map((c) => ({
      url: `${SITE_ORIGIN}/company/${c.slug}`,
      lastModified: now,
      changeFrequency: "monthly",
      priority: 0.6,
    }));

  return [...staticEntries, ...resourceEntries, ...companyEntries];
}

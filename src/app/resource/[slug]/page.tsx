import type { Metadata } from "next";
import Link from "next/link";
import { notFound } from "next/navigation";
import {
  getAllActiveResources,
  getResourceBySlug,
} from "@/lib/resourceQueries";
import { slugify } from "@/lib/slug";
import Breadcrumbs, { breadcrumbJsonLd } from "@/components/Breadcrumbs";
import IhesPromoSidebar from "@/components/IhesPromoSidebar";
import SiteFooter from "@/components/SiteFooter";
import TrackedExternalLink from "@/components/TrackedExternalLink";

const SITE_ORIGIN = "https://idnresearch.com";

export const dynamicParams = true;
export const revalidate = 3600;

export async function generateStaticParams() {
  const resources = await getAllActiveResources();
  const seen = new Set<string>();
  const params: { slug: string }[] = [];
  for (const r of resources) {
    const slug = slugify(r.name);
    if (!slug || seen.has(slug)) continue;
    seen.add(slug);
    params.push({ slug });
  }
  return params;
}

export async function generateMetadata({
  params,
}: {
  params: Promise<{ slug: string }>;
}): Promise<Metadata> {
  const { slug } = await params;
  const data = await getResourceBySlug(slug);
  if (!data) return { title: "Resource Not Found — IDN Research" };

  const { resource } = data;
  const description =
    resource.description?.slice(0, 155) ??
    `${resource.name} — healthcare resource curated by IDN Research, a project of IHES.`;

  return {
    title: `${resource.name} — IDN Research`,
    description,
    alternates: { canonical: `${SITE_ORIGIN}/resource/${slug}` },
    openGraph: {
      title: `${resource.name} — IDN Research`,
      description,
      url: `${SITE_ORIGIN}/resource/${slug}`,
      type: "website",
    },
  };
}

function hostnameOf(url: string | null | undefined): string {
  if (!url) return "";
  try {
    return new URL(url).hostname.replace(/^www\./, "");
  } catch {
    return url;
  }
}

export default async function ResourcePage({
  params,
}: {
  params: Promise<{ slug: string }>;
}) {
  const { slug } = await params;
  const data = await getResourceBySlug(slug);
  if (!data) notFound();

  const { resource, category, related } = data;
  const domain = hostnameOf(resource.url);

  const breadcrumbs = [
    { label: "Home", href: "/" },
    { label: "Directory", href: "/directory" },
    ...(category
      ? [{ label: category.name, href: `/category/${category.slug}` }]
      : []),
    { label: resource.name },
  ];

  const orgJsonLd = JSON.stringify({
    "@context": "https://schema.org",
    "@type": "Organization",
    name: resource.name,
    ...(resource.url ? { url: resource.url } : {}),
    ...(resource.description ? { description: resource.description } : {}),
    ...(resource.linkedin_url ? { sameAs: [resource.linkedin_url] } : {}),
    parentOrganization: {
      "@type": "Organization",
      name: "IDN Research",
      url: SITE_ORIGIN,
    },
  });

  return (
    <main className="mx-auto max-w-5xl px-4 sm:px-6 lg:px-8 py-8">
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: orgJsonLd }}
      />
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{
          __html: breadcrumbJsonLd(breadcrumbs, SITE_ORIGIN),
        }}
      />

      <Breadcrumbs items={breadcrumbs} />

      <div className="mt-6 grid gap-8 lg:grid-cols-[1fr_280px]">
        <article>
          <h1 className="text-3xl font-bold text-foreground">{resource.name}</h1>

          {category && (
            <div className="mt-2 text-sm text-muted">
              <Link
                href={`/category/${category.slug}`}
                className="text-primary hover:underline"
              >
                {category.name}
              </Link>
            </div>
          )}

          {resource.tags && resource.tags.length > 0 && (
            <div className="mt-4 flex flex-wrap gap-1.5">
              {resource.tags.map((tag) => (
                <span
                  key={tag}
                  className="rounded bg-surface px-2 py-0.5 text-xs text-muted"
                >
                  {tag}
                </span>
              ))}
            </div>
          )}

          <div className="prose prose-sm mt-6 max-w-none text-foreground">
            {resource.description ? (
              <p>{resource.description}</p>
            ) : (
              <p className="text-muted">
                Description coming soon — visit{" "}
                {domain ? (
                  <a
                    href={resource.url}
                    target="_blank"
                    rel="noopener noreferrer"
                    className="text-primary hover:underline"
                  >
                    {domain}
                  </a>
                ) : (
                  "the source"
                )}{" "}
                for more information.
              </p>
            )}
          </div>

          <div className="mt-6 flex flex-wrap gap-3">
            {resource.url && (
              <TrackedExternalLink
                href={resource.url}
                resourceId={resource.id}
                resourceName={resource.name}
                source="resource_page"
                className="inline-flex items-center gap-2 rounded-lg bg-primary px-4 py-2 text-sm font-semibold text-white hover:bg-primary-light transition-colors"
              >
                Visit {domain || "Website"}
                <svg
                  className="h-4 w-4"
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
              </TrackedExternalLink>
            )}
            {resource.linkedin_url && (
              <a
                href={resource.linkedin_url}
                target="_blank"
                rel="noopener noreferrer"
                className="inline-flex items-center gap-2 rounded-lg border border-border bg-white px-4 py-2 text-sm font-medium text-foreground hover:border-primary/30 transition-colors"
              >
                <svg
                  className="h-4 w-4 text-[#0A66C2]"
                  fill="currentColor"
                  viewBox="0 0 24 24"
                >
                  <path d="M20.447 20.452h-3.554v-5.569c0-1.328-.027-3.037-1.852-3.037-1.853 0-2.136 1.445-2.136 2.939v5.667H9.351V9h3.414v1.561h.046c.477-.9 1.637-1.85 3.37-1.85 3.601 0 4.267 2.37 4.267 5.455v6.286zM5.337 7.433a2.062 2.062 0 01-2.063-2.065 2.064 2.064 0 112.063 2.065zm1.782 13.019H3.555V9h3.564v11.452zM22.225 0H1.771C.792 0 0 .774 0 1.729v20.542C0 23.227.792 24 1.771 24h20.451C23.2 24 24 23.227 24 22.271V1.729C24 .774 23.2 0 22.222 0h.003z" />
                </svg>
                LinkedIn
              </a>
            )}
          </div>
        </article>

        <aside className="space-y-6">
          <IhesPromoSidebar />

          {related.length > 0 && category && (
            <div className="rounded-xl border border-border bg-white p-5">
              <h3 className="text-sm font-bold uppercase tracking-wide text-muted">
                More in {category.name}
              </h3>
              <ul className="mt-3 space-y-2">
                {related.map((r) => (
                  <li key={r.id}>
                    <Link
                      href={`/resource/${slugify(r.name)}`}
                      className="text-sm text-foreground hover:text-primary transition-colors"
                    >
                      {r.name}
                    </Link>
                  </li>
                ))}
              </ul>
            </div>
          )}
        </aside>
      </div>

      <div className="mt-16 -mx-4 sm:-mx-6 lg:-mx-8">
        <SiteFooter />
      </div>
    </main>
  );
}

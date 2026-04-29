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
import AboutHeaderShim from "@/components/AboutHeaderShim";

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
    <>
      <AboutHeaderShim />

      <main className="mx-auto max-w-5xl px-6 sm:px-8 lg:px-12 py-12">
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

        <div className="mt-7 grid gap-12 lg:grid-cols-[1fr_280px]">
          <article>
            {category && (
              <div className="text-[11px] uppercase tracking-[0.22em] font-semibold text-oxblood mb-3">
                <Link
                  href={`/category/${category.slug}`}
                  className="hover:text-oxblood-deep transition-colors"
                >
                  {category.name}
                </Link>
              </div>
            )}

            <h1 className="font-serif text-[40px] sm:text-[48px] leading-[1.1] tracking-[-0.02em] text-ink">
              {resource.name}
            </h1>

            {resource.tags && resource.tags.length > 0 && (
              <div className="mt-5 flex flex-wrap gap-1.5">
                {resource.tags.map((tag) => (
                  <span
                    key={tag}
                    className="rounded-[2px] bg-cream-2 border border-rule px-2 py-0.5 text-[10px] uppercase tracking-[0.1em] text-ink-2"
                  >
                    {tag}
                  </span>
                ))}
              </div>
            )}

            <div className="mt-7 max-w-2xl">
              {resource.description ? (
                <p className="font-serif text-[19px] leading-[1.55] text-ink-2">
                  {resource.description}
                </p>
              ) : (
                <p className="font-serif text-[17px] leading-[1.55] text-ink-muted italic">
                  Description coming soon — visit{" "}
                  {domain ? (
                    <a
                      href={resource.url}
                      target="_blank"
                      rel="noopener noreferrer"
                      className="text-oxblood hover:text-oxblood-deep underline decoration-rule-strong underline-offset-4"
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

            <div className="mt-8 flex flex-wrap gap-3">
              {resource.url && (
                <TrackedExternalLink
                  href={resource.url}
                  resourceId={resource.id}
                  resourceName={resource.name}
                  source="resource_page"
                  className="inline-flex items-center gap-2 rounded-[3px] bg-ink px-5 py-2.5 text-[11px] font-semibold uppercase tracking-[0.16em] text-cream hover:bg-oxblood transition-colors"
                >
                  Visit {domain || "Website"}
                  <svg
                    className="h-3.5 w-3.5"
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
                </TrackedExternalLink>
              )}
              {resource.linkedin_url && (
                <a
                  href={resource.linkedin_url}
                  target="_blank"
                  rel="noopener noreferrer"
                  className="inline-flex items-center gap-2 rounded-[3px] border border-rule bg-card px-5 py-2.5 text-[11px] font-semibold uppercase tracking-[0.16em] text-ink-2 hover:border-ink hover:text-ink transition-colors"
                >
                  <svg
                    className="h-3.5 w-3.5"
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
              <div className="rounded-[4px] border border-rule bg-cream-2 p-5">
                <h3 className="text-[10px] uppercase tracking-[0.22em] font-semibold text-oxblood">
                  More in {category.name}
                </h3>
                <ul className="mt-3 space-y-2">
                  {related.map((r) => (
                    <li key={r.id}>
                      <Link
                        href={`/resource/${slugify(r.name)}`}
                        className="text-[14px] text-ink-2 hover:text-oxblood transition-colors"
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
      </main>

      <SiteFooter />
    </>
  );
}

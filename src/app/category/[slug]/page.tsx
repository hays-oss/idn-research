import type { Metadata } from "next";
import Link from "next/link";
import { notFound } from "next/navigation";
import {
  getAllResourceCategories,
  getCategoryBySlug,
} from "@/lib/resourceQueries";
import { slugify } from "@/lib/slug";
import { getCategoryCopy } from "@/lib/categoryIntros";
import Breadcrumbs, { breadcrumbJsonLd } from "@/components/Breadcrumbs";
import IhesPromoSidebar from "@/components/IhesPromoSidebar";
import SiteFooter from "@/components/SiteFooter";

const SITE_ORIGIN = "https://idnresearch.com";

export const dynamicParams = false;
export const revalidate = 3600;

export async function generateStaticParams() {
  const categories = await getAllResourceCategories();
  return categories
    .filter((c) => !!c.slug)
    .map((c) => ({ slug: c.slug }));
}

export async function generateMetadata({
  params,
}: {
  params: Promise<{ slug: string }>;
}): Promise<Metadata> {
  const { slug } = await params;
  const data = await getCategoryBySlug(slug);
  if (!data) return { title: "Category Not Found — IDN Research" };
  const copy = getCategoryCopy(slug);
  const heading = copy.heading ?? `${data.category.name} Resources`;
  return {
    title: `${heading} — IDN Research`,
    description: copy.meta,
    alternates: { canonical: `${SITE_ORIGIN}/category/${slug}` },
    openGraph: {
      title: `${heading} — IDN Research`,
      description: copy.meta,
      url: `${SITE_ORIGIN}/category/${slug}`,
      type: "website",
    },
  };
}

function hostnameOf(url: string | null | undefined): string {
  if (!url) return "";
  try {
    return new URL(url).hostname.replace(/^www\./, "");
  } catch {
    return "";
  }
}

export default async function CategoryPage({
  params,
}: {
  params: Promise<{ slug: string }>;
}) {
  const { slug } = await params;
  const data = await getCategoryBySlug(slug);
  if (!data) notFound();

  const { category, resources, siblings } = data;
  const copy = getCategoryCopy(slug);
  const heading = copy.heading ?? `${category.name} Resources`;

  const breadcrumbs = [
    { label: "Home", href: "/" },
    { label: "Directory", href: "/directory" },
    { label: category.name },
  ];

  const itemListJsonLd = JSON.stringify({
    "@context": "https://schema.org",
    "@type": "ItemList",
    name: heading,
    numberOfItems: resources.length,
    itemListElement: resources.slice(0, 50).map((r, i) => ({
      "@type": "ListItem",
      position: i + 1,
      url: `${SITE_ORIGIN}/resource/${slugify(r.name)}`,
      name: r.name,
    })),
  });

  return (
    <main className="mx-auto max-w-6xl px-4 sm:px-6 lg:px-8 py-8">
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: itemListJsonLd }}
      />
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{
          __html: breadcrumbJsonLd(breadcrumbs, SITE_ORIGIN),
        }}
      />

      <Breadcrumbs items={breadcrumbs} />

      <header className="mt-6">
        <h1 className="text-3xl font-bold text-foreground">{heading}</h1>
        <p className="mt-1 text-sm text-muted">
          {resources.length} curated{" "}
          {resources.length === 1 ? "resource" : "resources"}
        </p>
        <p className="mt-4 max-w-3xl text-base text-foreground/80 leading-relaxed">
          {copy.intro}
        </p>
      </header>

      <div className="mt-8 grid gap-8 lg:grid-cols-[1fr_280px]">
        <section>
          {resources.length === 0 ? (
            <p className="text-muted">No resources in this category yet.</p>
          ) : (
            <ul className="space-y-2">
              {resources.map((r) => {
                const host = hostnameOf(r.url);
                return (
                  <li
                    key={r.id}
                    className="rounded-xl border border-border bg-white px-4 py-3 transition-colors hover:border-primary/30"
                  >
                    <div className="flex items-start justify-between gap-4">
                      <div className="min-w-0">
                        <Link
                          href={`/resource/${slugify(r.name)}`}
                          className="text-base font-semibold text-foreground hover:text-primary transition-colors"
                        >
                          {r.name}
                        </Link>
                        {r.description && (
                          <p className="mt-1 text-sm text-muted">
                            {r.description}
                          </p>
                        )}
                        {r.tags && r.tags.length > 0 && (
                          <div className="mt-2 flex flex-wrap gap-1">
                            {r.tags.slice(0, 4).map((t) => (
                              <span
                                key={t}
                                className="rounded bg-surface px-1.5 py-0.5 text-[11px] text-muted"
                              >
                                {t}
                              </span>
                            ))}
                          </div>
                        )}
                      </div>
                      {host && (
                        <a
                          href={r.url}
                          target="_blank"
                          rel="noopener noreferrer"
                          className="shrink-0 text-xs text-primary hover:text-primary-light transition-colors whitespace-nowrap"
                        >
                          {host} ↗
                        </a>
                      )}
                    </div>
                  </li>
                );
              })}
            </ul>
          )}
        </section>

        <aside className="space-y-6">
          <IhesPromoSidebar />

          {siblings.length > 0 && (
            <div className="rounded-xl border border-border bg-white p-5">
              <h3 className="text-sm font-bold uppercase tracking-wide text-muted">
                Other Categories
              </h3>
              <ul className="mt-3 space-y-2">
                {siblings.map((s) => (
                  <li key={s.id}>
                    <Link
                      href={`/category/${s.slug}`}
                      className="text-sm text-foreground hover:text-primary transition-colors"
                    >
                      {s.name}
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

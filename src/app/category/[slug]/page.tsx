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
import AboutHeaderShim from "@/components/AboutHeaderShim";

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
    <>
      <AboutHeaderShim />

      <main className="mx-auto max-w-6xl px-6 sm:px-8 lg:px-12 py-12">
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

        <header className="mt-7">
          <div className="text-[11px] uppercase tracking-[0.22em] font-semibold text-oxblood mb-3">
            {category.name} · {resources.length}{" "}
            {resources.length === 1 ? "resource" : "resources"}
          </div>
          <h1 className="font-serif text-[40px] sm:text-[48px] leading-[1.1] tracking-[-0.02em] text-ink">
            {heading}
          </h1>
          <p className="mt-5 max-w-3xl font-serif text-[19px] leading-[1.55] text-ink-2">
            {copy.intro}
          </p>
        </header>

        <div className="mt-12 grid gap-12 lg:grid-cols-[1fr_280px]">
          <section>
            {resources.length === 0 ? (
              <p className="text-ink-muted">No resources in this category yet.</p>
            ) : (
              <ul className="border-t border-rule-strong">
                {resources.map((r) => {
                  const host = hostnameOf(r.url);
                  return (
                    <li
                      key={r.id}
                      className="border-b border-rule px-1 py-3 hover:bg-cream-2/60 transition-colors"
                    >
                      <div className="flex items-start justify-between gap-4">
                        <div className="min-w-0 flex-1">
                          <Link
                            href={`/resource/${slugify(r.name)}`}
                            className="font-serif text-[18px] leading-snug text-ink hover:text-oxblood transition-colors"
                          >
                            {r.name}
                          </Link>
                          {r.description && (
                            <p className="mt-1 text-[14px] leading-[1.55] text-ink-2 line-clamp-2">
                              {r.description}
                            </p>
                          )}
                          {r.tags && r.tags.length > 0 && (
                            <div className="mt-2 flex flex-wrap gap-1">
                              {r.tags.slice(0, 4).map((t) => (
                                <span
                                  key={t}
                                  className="rounded-[2px] bg-cream-2 border border-rule px-2 py-0.5 text-[10px] uppercase tracking-[0.1em] text-ink-2"
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
                            className="shrink-0 mt-1 font-serif italic text-[13px] text-oxblood hover:text-oxblood-deep transition-colors whitespace-nowrap"
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
              <div className="rounded-[4px] border border-rule bg-cream-2 p-5">
                <h3 className="text-[10px] uppercase tracking-[0.22em] font-semibold text-oxblood">
                  Other Categories
                </h3>
                <ul className="mt-3 space-y-2">
                  {siblings.map((s) => (
                    <li key={s.id}>
                      <Link
                        href={`/category/${s.slug}`}
                        className="text-[14px] text-ink-2 hover:text-oxblood transition-colors"
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
      </main>

      <SiteFooter />
    </>
  );
}

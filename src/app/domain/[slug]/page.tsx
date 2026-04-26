import type { Metadata } from "next";
import Link from "next/link";
import { notFound } from "next/navigation";
import {
  getAllTaxonomy,
  getDomainBySlug,
} from "@/lib/resourceQueries";
import { slugify } from "@/lib/slug";
import { getDomainCopy } from "@/lib/domainIntros";
import Breadcrumbs, { breadcrumbJsonLd } from "@/components/Breadcrumbs";
import IhesPromoSidebar from "@/components/IhesPromoSidebar";
import SiteFooter from "@/components/SiteFooter";

const SITE_ORIGIN = "https://idnresearch.com";

export const dynamicParams = false;
export const revalidate = 3600;

export async function generateStaticParams() {
  const { domains } = await getAllTaxonomy();
  return domains.map((d) => ({ slug: slugify(d.name) }));
}

export async function generateMetadata({
  params,
}: {
  params: Promise<{ slug: string }>;
}): Promise<Metadata> {
  const { slug } = await params;
  const data = await getDomainBySlug(slug);
  if (!data) return { title: "Domain Not Found — IDN Research" };
  const copy = getDomainCopy(data.domain.id);
  const heading = `${data.domain.name} Companies`;
  return {
    title: `${heading} — IDN Research`,
    description: copy.meta,
    alternates: { canonical: `${SITE_ORIGIN}/domain/${slug}` },
    openGraph: {
      title: `${heading} — IDN Research`,
      description: copy.meta,
      url: `${SITE_ORIGIN}/domain/${slug}`,
      type: "website",
    },
  };
}

export default async function DomainPage({
  params,
}: {
  params: Promise<{ slug: string }>;
}) {
  const { slug } = await params;
  const data = await getDomainBySlug(slug);
  if (!data) notFound();

  const { domain, subcategories, siblings, totalCompanies } = data;
  const copy = getDomainCopy(domain.id);
  const heading = `${domain.name} Companies`;

  const breadcrumbs = [
    { label: "Home", href: "/" },
    { label: "Directory", href: "/directory" },
    { label: domain.name },
  ];

  return (
    <main className="mx-auto max-w-6xl px-4 sm:px-6 lg:px-8 py-8">
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
          {totalCompanies} {totalCompanies === 1 ? "company" : "companies"}{" "}
          across {subcategories.length}{" "}
          {subcategories.length === 1 ? "market segment" : "market segments"}
        </p>
        <p className="mt-4 max-w-3xl text-base text-foreground/80 leading-relaxed">
          {copy.intro}
        </p>
      </header>

      <div className="mt-8 grid gap-8 lg:grid-cols-[1fr_280px]">
        <section className="space-y-10">
          {subcategories.map((sub) => (
            <div key={sub.id} id={`sub-${sub.id}`} className="scroll-mt-20">
              <h2 className="text-xl font-bold text-foreground">{sub.name}</h2>
              <p className="text-xs text-muted mt-0.5">
                {sub.companies.length}{" "}
                {sub.companies.length === 1 ? "company" : "companies"}
              </p>
              <ul className="mt-3 grid gap-2 sm:grid-cols-2">
                {sub.companies.map((c) => (
                  <li
                    key={c.id}
                    className="rounded-lg border border-border bg-white px-3 py-2 transition-colors hover:border-primary/30"
                  >
                    {c.slug ? (
                      <Link
                        href={`/company/${c.slug}`}
                        className="text-sm font-medium text-foreground hover:text-primary transition-colors"
                      >
                        {c.company_name}
                      </Link>
                    ) : (
                      <span className="text-sm font-medium text-foreground">
                        {c.company_name}
                      </span>
                    )}
                    {c.description && (
                      <p className="mt-0.5 text-xs text-muted line-clamp-2">
                        {c.description}
                      </p>
                    )}
                  </li>
                ))}
              </ul>
            </div>
          ))}
        </section>

        <aside className="space-y-6">
          <IhesPromoSidebar />

          {subcategories.length > 1 && (
            <div className="rounded-xl border border-border bg-white p-5">
              <h3 className="text-sm font-bold uppercase tracking-wide text-muted">
                Market Segments
              </h3>
              <ul className="mt-3 space-y-1.5">
                {subcategories.map((sub) => (
                  <li key={sub.id}>
                    <a
                      href={`#sub-${sub.id}`}
                      className="text-sm text-foreground hover:text-primary transition-colors"
                    >
                      {sub.name}{" "}
                      <span className="text-xs text-muted">
                        ({sub.companies.length})
                      </span>
                    </a>
                  </li>
                ))}
              </ul>
            </div>
          )}

          {siblings.length > 0 && (
            <div className="rounded-xl border border-border bg-white p-5">
              <h3 className="text-sm font-bold uppercase tracking-wide text-muted">
                Other Domains
              </h3>
              <ul className="mt-3 space-y-2">
                {siblings.map((d) => (
                  <li key={d.id}>
                    <Link
                      href={`/domain/${slugify(d.name)}`}
                      className="text-sm text-foreground hover:text-primary transition-colors"
                    >
                      {d.name}
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

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
import AboutHeaderShim from "@/components/AboutHeaderShim";

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
    <>
      <AboutHeaderShim />

      <main className="mx-auto max-w-6xl px-6 sm:px-8 lg:px-12 py-12">
        <script
          type="application/ld+json"
          dangerouslySetInnerHTML={{
            __html: breadcrumbJsonLd(breadcrumbs, SITE_ORIGIN),
          }}
        />

        <Breadcrumbs items={breadcrumbs} />

        <header className="mt-7">
          <div className="text-[11px] uppercase tracking-[0.22em] font-semibold text-oxblood mb-3">
            {totalCompanies} {totalCompanies === 1 ? "company" : "companies"}{" "}
            · {subcategories.length}{" "}
            {subcategories.length === 1 ? "segment" : "segments"}
          </div>
          <h1 className="font-serif text-[40px] sm:text-[48px] leading-[1.1] tracking-[-0.02em] text-ink">
            {heading}
          </h1>
          <p className="mt-5 max-w-3xl font-serif text-[19px] leading-[1.55] text-ink-2">
            {copy.intro}
          </p>
        </header>

        <div className="mt-12 grid gap-12 lg:grid-cols-[1fr_280px]">
          <section className="space-y-10">
            {subcategories.map((sub) => (
              <div key={sub.id} id={`sub-${sub.id}`} className="scroll-mt-20">
                <div className="border-t border-rule-strong pt-5">
                  <div className="text-[10px] uppercase tracking-[0.22em] font-semibold text-oxblood mb-1">
                    {sub.companies.length}{" "}
                    {sub.companies.length === 1 ? "company" : "companies"}
                  </div>
                  <h2 className="font-serif text-[24px] tracking-[-0.015em] text-ink">
                    {sub.name}
                  </h2>
                </div>
                <ul className="mt-3">
                  {sub.companies.map((c) => (
                    <li
                      key={c.id}
                      className="border-b border-rule px-1 py-3 hover:bg-cream-2/60 transition-colors"
                    >
                      {c.slug ? (
                        <Link
                          href={`/company/${c.slug}`}
                          className="font-serif text-[17px] text-ink hover:text-oxblood transition-colors"
                        >
                          {c.company_name}
                        </Link>
                      ) : (
                        <span className="font-serif text-[17px] text-ink">
                          {c.company_name}
                        </span>
                      )}
                      {c.description && (
                        <p className="mt-1 text-[14px] leading-[1.55] text-ink-2 line-clamp-2">
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
              <div className="rounded-[4px] border border-rule bg-cream-2 p-5">
                <h3 className="text-[10px] uppercase tracking-[0.22em] font-semibold text-oxblood">
                  Market Segments
                </h3>
                <ul className="mt-3 space-y-1.5">
                  {subcategories.map((sub) => (
                    <li key={sub.id}>
                      <a
                        href={`#sub-${sub.id}`}
                        className="text-[14px] text-ink-2 hover:text-oxblood transition-colors"
                      >
                        {sub.name}{" "}
                        <span className="text-[11px] text-ink-muted">
                          ({sub.companies.length})
                        </span>
                      </a>
                    </li>
                  ))}
                </ul>
              </div>
            )}

            {siblings.length > 0 && (
              <div className="rounded-[4px] border border-rule bg-cream-2 p-5">
                <h3 className="text-[10px] uppercase tracking-[0.22em] font-semibold text-oxblood">
                  Other Domains
                </h3>
                <ul className="mt-3 space-y-2">
                  {siblings.map((d) => (
                    <li key={d.id}>
                      <Link
                        href={`/domain/${slugify(d.name)}`}
                        className="text-[14px] text-ink-2 hover:text-oxblood transition-colors"
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
      </main>

      <SiteFooter />
    </>
  );
}

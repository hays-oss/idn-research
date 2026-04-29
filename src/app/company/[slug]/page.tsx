import type { Metadata } from "next";
import Link from "next/link";
import { notFound } from "next/navigation";
import {
  getAllActiveCompanies,
  getCompanyBySlug,
} from "@/lib/resourceQueries";
import Breadcrumbs, { breadcrumbJsonLd } from "@/components/Breadcrumbs";
import IhesPromoSidebar from "@/components/IhesPromoSidebar";
import SiteFooter from "@/components/SiteFooter";
import TrackedExternalLink from "@/components/TrackedExternalLink";
import AboutHeaderShim from "@/components/AboutHeaderShim";

const SITE_ORIGIN = "https://idnresearch.com";

const AFFILIATION_STYLES: Record<string, string> = {
  IHES: "bg-ihes-green",
  CPES: "bg-cpes-blue",
  CSCE: "bg-csce-orange",
  MUIA: "bg-muia-purple",
};

export const dynamicParams = true;
export const revalidate = 3600;

export async function generateStaticParams() {
  const companies = await getAllActiveCompanies();
  return companies
    .filter((c) => !!c.slug)
    .map((c) => ({ slug: c.slug as string }));
}

export async function generateMetadata({
  params,
}: {
  params: Promise<{ slug: string }>;
}): Promise<Metadata> {
  const { slug } = await params;
  const data = await getCompanyBySlug(slug);
  if (!data) return { title: "Company Not Found — IDN Research" };

  const { company } = data;
  const description =
    company.description?.slice(0, 155) ??
    `${company.company_name} — healthcare company profile in the IDN Research directory.`;

  return {
    title: `${company.company_name} — IDN Research`,
    description,
    alternates: { canonical: `${SITE_ORIGIN}/company/${slug}` },
    openGraph: {
      title: `${company.company_name} — IDN Research`,
      description,
      url: `${SITE_ORIGIN}/company/${slug}`,
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

export default async function CompanyPage({
  params,
}: {
  params: Promise<{ slug: string }>;
}) {
  const { slug } = await params;
  const data = await getCompanyBySlug(slug);
  if (!data) notFound();

  const { company, domain, subcategory, related, affiliations } = data;
  const hostname = hostnameOf(company.website);

  const breadcrumbs = [
    { label: "Home", href: "/" },
    { label: "Directory", href: "/directory" },
    ...(domain
      ? [{ label: domain.name, href: `/directory?domain=${domain.id}` }]
      : []),
    { label: company.company_name },
  ];

  const orgJsonLd = JSON.stringify({
    "@context": "https://schema.org",
    "@type": "Organization",
    name: company.company_name,
    ...(company.website ? { url: company.website } : {}),
    ...(company.description ? { description: company.description } : {}),
    ...(company.linkedin_url ? { sameAs: [company.linkedin_url] } : {}),
    ...(company.year_founded ? { foundingDate: String(company.year_founded) } : {}),
    ...(company.headquarters_city || company.headquarters_state
      ? {
          address: {
            "@type": "PostalAddress",
            ...(company.headquarters_city
              ? { addressLocality: company.headquarters_city }
              : {}),
            ...(company.headquarters_state
              ? { addressRegion: company.headquarters_state }
              : {}),
            ...(company.headquarters_country
              ? { addressCountry: company.headquarters_country }
              : {}),
          },
        }
      : {}),
    parentOrganization: {
      "@type": "Organization",
      name: "IDN Research",
      url: SITE_ORIGIN,
    },
  });

  const locationParts = [
    company.headquarters_city,
    company.headquarters_state,
    company.headquarters_country,
  ].filter(Boolean);

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
            {(domain || subcategory) && (
              <div className="text-[11px] uppercase tracking-[0.22em] font-semibold text-oxblood mb-3">
                {domain && (
                  <Link
                    href={`/directory?domain=${domain.id}`}
                    className="hover:text-oxblood-deep transition-colors"
                  >
                    {domain.name}
                  </Link>
                )}
                {subcategory && (
                  <>
                    <span className="mx-2 text-rule-strong">·</span>
                    {subcategory.name}
                  </>
                )}
              </div>
            )}

            <h1 className="font-serif text-[40px] sm:text-[48px] leading-[1.1] tracking-[-0.02em] text-ink">
              {company.company_name}
            </h1>

            {affiliations.length > 0 && (
              <div className="mt-5 flex flex-wrap gap-2">
                {affiliations.map((a) => (
                  <span
                    key={a.code}
                    className={`inline-flex items-center rounded-[2px] px-2 py-0.5 text-[10px] font-bold tracking-[0.1em] text-white ${
                      AFFILIATION_STYLES[a.code] || "bg-ink"
                    }`}
                    title={a.name}
                  >
                    {a.code} Member
                  </span>
                ))}
              </div>
            )}

            {(locationParts.length > 0 ||
              company.year_founded ||
              company.employee_count_range) && (
              <dl className="mt-7 grid grid-cols-2 gap-x-8 gap-y-3 text-[14px] sm:grid-cols-3 border-y border-rule py-4">
                {locationParts.length > 0 && (
                  <div>
                    <dt className="text-[10px] uppercase tracking-[0.18em] font-semibold text-ink-muted mb-0.5">
                      Headquarters
                    </dt>
                    <dd className="font-serif text-[15px] text-ink">
                      {locationParts.join(", ")}
                    </dd>
                  </div>
                )}
                {company.year_founded && (
                  <div>
                    <dt className="text-[10px] uppercase tracking-[0.18em] font-semibold text-ink-muted mb-0.5">
                      Founded
                    </dt>
                    <dd className="font-serif text-[15px] text-ink">
                      {company.year_founded}
                    </dd>
                  </div>
                )}
                {company.employee_count_range && (
                  <div>
                    <dt className="text-[10px] uppercase tracking-[0.18em] font-semibold text-ink-muted mb-0.5">
                      Employees
                    </dt>
                    <dd className="font-serif text-[15px] text-ink">
                      {company.employee_count_range}
                    </dd>
                  </div>
                )}
              </dl>
            )}

            <div className="mt-7 max-w-2xl">
              {company.description ? (
                <p className="font-serif text-[19px] leading-[1.55] text-ink-2">
                  {company.description}
                </p>
              ) : (
                <p className="font-serif text-[17px] leading-[1.55] text-ink-muted italic">
                  Description coming soon — visit{" "}
                  {hostname && company.website ? (
                    <a
                      href={company.website}
                      target="_blank"
                      rel="noopener noreferrer"
                      className="text-oxblood hover:text-oxblood-deep underline decoration-rule-strong underline-offset-4"
                    >
                      {hostname}
                    </a>
                  ) : (
                    "the source"
                  )}{" "}
                  for more information.
                </p>
              )}
            </div>

            <div className="mt-8 flex flex-wrap gap-3">
              {company.website && (
                <TrackedExternalLink
                  href={company.website}
                  resourceId={company.id}
                  resourceName={company.company_name}
                  source="company_page"
                  className="inline-flex items-center gap-2 rounded-[3px] bg-ink px-5 py-2.5 text-[11px] font-semibold uppercase tracking-[0.16em] text-cream hover:bg-oxblood transition-colors"
                >
                  Visit {hostname || "Website"}
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
              {company.linkedin_url && (
                <a
                  href={company.linkedin_url}
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

            {related.length > 0 && subcategory && (
              <div className="rounded-[4px] border border-rule bg-cream-2 p-5">
                <h3 className="text-[10px] uppercase tracking-[0.22em] font-semibold text-oxblood">
                  More in {subcategory.name}
                </h3>
                <ul className="mt-3 space-y-2">
                  {related.map((c) => (
                    <li key={c.id}>
                      {c.slug ? (
                        <Link
                          href={`/company/${c.slug}`}
                          className="text-[14px] text-ink-2 hover:text-oxblood transition-colors"
                        >
                          {c.company_name}
                        </Link>
                      ) : (
                        <span className="text-[14px] text-ink-2">
                          {c.company_name}
                        </span>
                      )}
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

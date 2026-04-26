import type { Metadata } from "next";
import Link from "next/link";
import { notFound } from "next/navigation";
import {
  getAllActiveCompanies,
  getCompanyBySlug,
} from "@/lib/resourceQueries";
import Breadcrumbs, { breadcrumbJsonLd } from "@/components/Breadcrumbs";
import IhesPromoSidebar from "@/components/IhesPromoSidebar";

const SITE_ORIGIN = "https://idnresearch.com";

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
          <h1 className="text-3xl font-bold text-foreground">
            {company.company_name}
          </h1>

          {(domain || subcategory) && (
            <div className="mt-2 text-sm text-muted">
              {domain && (
                <Link
                  href={`/directory?domain=${domain.id}`}
                  className="text-primary hover:underline"
                >
                  {domain.name}
                </Link>
              )}
              {subcategory && (
                <>
                  <span className="mx-1.5 text-muted/60">/</span>
                  {subcategory.name}
                </>
              )}
            </div>
          )}

          {affiliations.length > 0 && (
            <div className="mt-3 flex flex-wrap gap-1.5">
              {affiliations.map((a) => (
                <span
                  key={a.code}
                  className="inline-flex items-center rounded bg-primary/10 px-2 py-0.5 text-xs font-semibold text-primary"
                  title={a.name}
                >
                  {a.code} Member
                </span>
              ))}
            </div>
          )}

          <dl className="mt-4 grid grid-cols-2 gap-x-6 gap-y-1 text-sm sm:grid-cols-3">
            {locationParts.length > 0 && (
              <div>
                <dt className="text-muted">Headquarters</dt>
                <dd className="font-medium">{locationParts.join(", ")}</dd>
              </div>
            )}
            {company.year_founded && (
              <div>
                <dt className="text-muted">Founded</dt>
                <dd className="font-medium">{company.year_founded}</dd>
              </div>
            )}
            {company.employee_count_range && (
              <div>
                <dt className="text-muted">Employees</dt>
                <dd className="font-medium">{company.employee_count_range}</dd>
              </div>
            )}
          </dl>

          <div className="prose prose-sm mt-6 max-w-none text-foreground">
            {company.description ? (
              <p>{company.description}</p>
            ) : (
              <p className="text-muted">
                Description coming soon — visit{" "}
                {hostname && company.website ? (
                  <a
                    href={company.website}
                    target="_blank"
                    rel="noopener noreferrer"
                    className="text-primary hover:underline"
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

          <div className="mt-6 flex flex-wrap gap-3">
            {company.website && (
              <a
                href={company.website}
                target="_blank"
                rel="noopener noreferrer"
                className="inline-flex items-center gap-2 rounded-lg bg-primary px-4 py-2 text-sm font-semibold text-white hover:bg-primary-light transition-colors"
              >
                Visit {hostname || "Website"}
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
              </a>
            )}
            {company.linkedin_url && (
              <a
                href={company.linkedin_url}
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

          {related.length > 0 && subcategory && (
            <div className="rounded-xl border border-border bg-white p-5">
              <h3 className="text-sm font-bold uppercase tracking-wide text-muted">
                More in {subcategory.name}
              </h3>
              <ul className="mt-3 space-y-2">
                {related.map((c) => (
                  <li key={c.id}>
                    {c.slug ? (
                      <Link
                        href={`/company/${c.slug}`}
                        className="text-sm text-foreground hover:text-primary transition-colors"
                      >
                        {c.company_name}
                      </Link>
                    ) : (
                      <span className="text-sm text-foreground">
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
  );
}

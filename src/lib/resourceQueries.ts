import "server-only";
import { cache } from "react";
import { supabase } from "@/lib/supabase";
import {
  Resource,
  ResourceCategory,
  Company,
  TaxonomyDomain,
  TaxonomySubcategory,
} from "@/lib/types";
import { slugify } from "@/lib/slug";

// React.cache memoizes within a single request, so calling these helpers
// from both generateStaticParams + the page + generateMetadata only hits
// Supabase once per build invocation.

export const getAllActiveResources = cache(async (): Promise<Resource[]> => {
  const { data } = await supabase
    .from("resources")
    .select("*")
    .eq("is_active", true)
    .order("name");
  return (data ?? []) as Resource[];
});

export const getAllResourceCategories = cache(
  async (): Promise<ResourceCategory[]> => {
    const { data } = await supabase
      .from("resource_categories")
      .select("*")
      .eq("is_active", true)
      .order("display_order");
    return (data ?? []) as ResourceCategory[];
  }
);

export const getResourceBySlug = cache(
  async (
    slug: string
  ): Promise<{
    resource: Resource;
    category: ResourceCategory | null;
    related: Resource[];
  } | null> => {
    const [resources, categories] = await Promise.all([
      getAllActiveResources(),
      getAllResourceCategories(),
    ]);
    const resource = resources.find((r) => slugify(r.name) === slug);
    if (!resource) return null;

    const category =
      categories.find((c) => c.id === resource.category_id) ?? null;
    const related = resources
      .filter(
        (r) => r.category_id === resource.category_id && r.id !== resource.id
      )
      .slice(0, 8);
    return { resource, category, related };
  }
);

type CompanyRow = Pick<
  Company,
  | "id"
  | "company_name"
  | "slug"
  | "website"
  | "linkedin_url"
  | "description"
  | "headquarters_city"
  | "headquarters_state"
  | "headquarters_country"
  | "year_founded"
  | "employee_count_range"
  | "primary_subcategory_id"
  | "is_featured"
>;

export const getAllActiveCompanies = cache(async (): Promise<CompanyRow[]> => {
  const { data } = await supabase
    .from("companies")
    .select(
      "id, company_name, slug, website, linkedin_url, description, headquarters_city, headquarters_state, headquarters_country, year_founded, employee_count_range, primary_subcategory_id, is_featured"
    )
    .eq("is_active", true)
    .eq("review_status", "approved")
    .not("slug", "is", null)
    .order("company_name");
  return (data ?? []) as CompanyRow[];
});

export const getAllTaxonomy = cache(
  async (): Promise<{
    domains: TaxonomyDomain[];
    subcategories: TaxonomySubcategory[];
  }> => {
    const [dom, sub] = await Promise.all([
      supabase
        .from("taxonomy_domains")
        .select("*")
        .eq("is_active", true)
        .order("display_order"),
      supabase
        .from("taxonomy_subcategories")
        .select("*")
        .eq("is_active", true)
        .order("display_order"),
    ]);
    return {
      domains: (dom.data ?? []) as TaxonomyDomain[],
      subcategories: (sub.data ?? []) as TaxonomySubcategory[],
    };
  }
);

export const getCompanyAffiliations = cache(
  async (
    companyId: string
  ): Promise<{ code: string; name: string }[]> => {
    const { data } = await supabase
      .from("company_affiliations")
      .select("organizations(code, name)")
      .eq("is_active", true)
      .eq("company_id", companyId);
    const rows = (data ?? []) as unknown as Array<{
      organizations: { code: string; name: string } | null;
    }>;
    return rows
      .map((r) => r.organizations)
      .filter((o): o is { code: string; name: string } => !!o);
  }
);

export const getCompanyBySlug = cache(
  async (
    slug: string
  ): Promise<{
    company: CompanyRow;
    domain: TaxonomyDomain | null;
    subcategory: TaxonomySubcategory | null;
    related: CompanyRow[];
    affiliations: { code: string; name: string }[];
  } | null> => {
    const [companies, taxonomy] = await Promise.all([
      getAllActiveCompanies(),
      getAllTaxonomy(),
    ]);
    const company = companies.find((c) => c.slug === slug);
    if (!company) return null;

    const subcategory =
      taxonomy.subcategories.find(
        (s) => s.id === company.primary_subcategory_id
      ) ?? null;
    const domain = subcategory
      ? taxonomy.domains.find((d) => d.id === subcategory.domain_id) ?? null
      : null;
    const related = companies
      .filter(
        (c) =>
          c.primary_subcategory_id === company.primary_subcategory_id &&
          c.id !== company.id
      )
      .slice(0, 8);
    const affiliations = await getCompanyAffiliations(company.id);
    return { company, domain, subcategory, related, affiliations };
  }
);

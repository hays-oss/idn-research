import "server-only";
import { cache } from "react";
import { supabase } from "@/lib/supabase";
import {
  Resource,
  ResourceCategory,
  Company,
  TaxonomyDomain,
  TaxonomySubcategory,
  MeetingDate,
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

// ===== Category page helpers =====

export const getCategoryBySlug = cache(
  async (
    slug: string
  ): Promise<{
    category: ResourceCategory;
    resources: Resource[];
    siblings: ResourceCategory[];
  } | null> => {
    const [categories, resources] = await Promise.all([
      getAllResourceCategories(),
      getAllActiveResources(),
    ]);
    const category = categories.find((c) => c.slug === slug);
    if (!category) return null;
    const inCategory = resources.filter((r) => r.category_id === category.id);
    const siblings = categories.filter((c) => c.id !== category.id).slice(0, 8);
    return { category, resources: inCategory, siblings };
  }
);

// ===== Domain page helpers =====

export const getDomainBySlug = cache(
  async (
    slug: string
  ): Promise<{
    domain: TaxonomyDomain;
    subcategories: Array<{
      id: number;
      name: string;
      companies: CompanyRow[];
    }>;
    siblings: TaxonomyDomain[];
    totalCompanies: number;
  } | null> => {
    const [taxonomy, companies] = await Promise.all([
      getAllTaxonomy(),
      getAllActiveCompanies(),
    ]);
    const domain = taxonomy.domains.find((d) => slugify(d.name) === slug);
    if (!domain) return null;

    const subs = taxonomy.subcategories
      .filter((s) => s.domain_id === domain.id)
      .map((sub) => ({
        id: sub.id,
        name: sub.name,
        companies: companies.filter((c) => c.primary_subcategory_id === sub.id),
      }))
      .filter((sub) => sub.companies.length > 0);

    const totalCompanies = subs.reduce((sum, s) => sum + s.companies.length, 0);
    const siblings = taxonomy.domains.filter((d) => d.id !== domain.id);

    return { domain, subcategories: subs, siblings, totalCompanies };
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

export const getAllMeetingDates = cache(async (): Promise<MeetingDate[]> => {
  const { data } = await supabase
    .from("meeting_dates")
    .select("*")
    .order("start_date", { ascending: true, nullsFirst: false });
  return (data ?? []) as MeetingDate[];
});

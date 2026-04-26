import HomePage from "@/components/HomePage";
import { supabase } from "@/lib/supabase";
import {
  ResourceCategory,
  Resource,
  LinkedInInfluencer,
  TaxonomyDomain,
  TaxonomySubcategory,
  DirectoryDomain,
  DirectorySubcategory,
} from "@/lib/types";

// Re-render the homepage at most every 5 minutes so new resources appear
// without forcing a full request-time render on every visit.
export const revalidate = 300;

async function getHomepageData() {
  // Legacy resources schema (powers the main category sections)
  const [catRes, resRes, infRes] = await Promise.all([
    supabase
      .from("resource_categories")
      .select("*")
      .eq("is_active", true)
      .order("display_order"),
    supabase
      .from("resources")
      .select("*")
      .eq("is_active", true)
      .order("display_order"),
    supabase
      .from("linkedin_influencers")
      .select("*")
      .eq("is_active", true)
      .order("display_order"),
  ]);

  // New company directory schema (powers the Company Directory section)
  const [domRes, subRes, compRes, affRes, tagCountRes] = await Promise.all([
    supabase.from("taxonomy_domains").select("*").eq("is_active", true).order("display_order"),
    supabase.from("taxonomy_subcategories").select("*").eq("is_active", true).order("display_order"),
    supabase
      .from("companies")
      .select(
        "id, company_name, slug, website, linkedin_url, description, is_featured, primary_subcategory_id"
      )
      .eq("is_active", true)
      .eq("review_status", "approved")
      .order("company_name"),
    supabase
      .from("company_affiliations")
      .select("organization_id, company_id, organizations(code, name)")
      .eq("is_active", true),
    supabase
      .from("category_taxonomy")
      .select("id", { count: "exact", head: true })
      .eq("is_active", true),
  ]);

  const allCategories = (catRes.data ?? []) as ResourceCategory[];
  const resources = (resRes.data ?? []) as Resource[];
  const influencers = (infRes.data ?? []) as LinkedInInfluencer[];
  const taxonomyTagCount = tagCountRes.count ?? 0;

  const domData = (domRes.data ?? []) as TaxonomyDomain[];
  const subData = (subRes.data ?? []) as TaxonomySubcategory[];
  const compData = (compRes.data ?? []) as Array<{
    id: string;
    company_name: string;
    slug: string | null;
    website: string | null;
    linkedin_url: string | null;
    description: string | null;
    is_featured: boolean;
    primary_subcategory_id: number | null;
  }>;
  // Supabase's generated type for joined relations is an array, but the
  // foreign key is many-to-one so the runtime value is a single object.
  // Mirror the original homepage code's loose typing here.
  const affData = (affRes.data ?? []) as unknown as Array<{
    company_id: string;
    organizations: { code: string; name: string } | null;
  }>;

  const affMap = new Map<string, { code: string; name: string }[]>();
  for (const a of affData) {
    const org = a.organizations;
    if (!org) continue;
    const list = affMap.get(a.company_id) || [];
    list.push({ code: org.code, name: org.name });
    affMap.set(a.company_id, list);
  }

  const directoryDomains: DirectoryDomain[] = domData
    .map((domain) => {
      const subs: DirectorySubcategory[] = subData
        .filter((s) => s.domain_id === domain.id)
        .map((sub) => ({
          id: sub.id,
          name: sub.name,
          domain_id: sub.domain_id,
          companies: compData
            .filter((c) => c.primary_subcategory_id === sub.id)
            .map((c) => ({
              id: c.id,
              company_name: c.company_name,
              slug: c.slug,
              website: c.website,
              linkedin_url: c.linkedin_url,
              description: c.description,
              is_featured: c.is_featured,
              affiliations: affMap.get(c.id) || [],
            })),
        }))
        .filter((sub) => sub.companies.length > 0);

      return {
        id: domain.id,
        name: domain.name,
        subcategories: subs,
        totalCompanies: subs.reduce((sum, s) => sum + s.companies.length, 0),
      };
    })
    .filter((d) => d.totalCompanies > 0);

  return {
    allCategories,
    resources,
    influencers,
    directoryDomains,
    taxonomyTagCount,
  };
}

export default async function Page() {
  const data = await getHomepageData();
  return <HomePage initialData={data} />;
}

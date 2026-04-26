import { Suspense } from "react";
import DirectoryPage from "@/components/directory/DirectoryPage";
import { supabase } from "@/lib/supabase";
import { TaxonomyDomain, TaxonomySubcategory } from "@/lib/types";

export const metadata = {
  title: "Company Directory — IDN Research",
  description:
    "Browse 570+ healthcare companies across 14 domains and 57 market segments. Filter by organization, domain, subcategory, and tags.",
};

export const revalidate = 300;

interface RawCompany {
  id: string;
  company_name: string;
  slug: string | null;
  website: string | null;
  linkedin_url: string | null;
  description: string | null;
  is_featured: boolean;
  primary_subcategory_id: number | null;
  company_type: string | null;
  headquarters_city: string | null;
  headquarters_state: string | null;
}

async function getDirectoryData() {
  const [domRes, subRes, compRes, affRes, tagRes, ctRes] = await Promise.all([
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
    supabase
      .from("companies")
      .select(
        "id, company_name, slug, website, linkedin_url, description, is_featured, primary_subcategory_id, company_type, headquarters_city, headquarters_state"
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
      .select("id, level_3_tag, subcategory_id")
      .eq("is_active", true)
      .order("level_3_tag"),
    supabase
      .from("company_tags")
      .select("company_id, taxonomy_id, category_taxonomy(id, level_3_tag)"),
  ]);

  const domains = (domRes.data ?? []) as TaxonomyDomain[];
  const subcategories = (subRes.data ?? []) as TaxonomySubcategory[];
  const companies = (compRes.data ?? []) as RawCompany[];

  // Build affiliations map
  const affiliations: Record<string, { code: string; name: string }[]> = {};
  if (affRes.data) {
    const rows = affRes.data as unknown as Array<{
      company_id: string;
      organizations: { code: string; name: string } | null;
    }>;
    for (const a of rows) {
      const org = a.organizations;
      if (!org) continue;
      const list = affiliations[a.company_id] ?? [];
      list.push({ code: org.code, name: org.name });
      affiliations[a.company_id] = list;
    }
  }

  // Build tag options
  const allTags = ((tagRes.data ?? []) as unknown as Array<{
    id: number;
    level_3_tag: string;
    subcategory_id: number;
  }>).map((t) => ({
    id: t.id,
    name: t.level_3_tag,
    subcategory_id: t.subcategory_id,
  }));

  // Build company → tags map
  const companyTags: Record<string, { id: number; name: string }[]> = {};
  if (ctRes.data) {
    const rows = ctRes.data as unknown as Array<{
      company_id: string;
      category_taxonomy: { id: number; level_3_tag: string } | null;
    }>;
    for (const ct of rows) {
      const tag = ct.category_taxonomy;
      if (!tag) continue;
      const list = companyTags[ct.company_id] ?? [];
      list.push({ id: tag.id, name: tag.level_3_tag });
      companyTags[ct.company_id] = list;
    }
  }

  return {
    domains,
    subcategories,
    companies,
    affiliations,
    allTags,
    companyTags,
  };
}

export default async function DirectoryRoute() {
  const data = await getDirectoryData();
  // useSearchParams in DirectoryPage requires a Suspense boundary at build time.
  return (
    <Suspense fallback={null}>
      <DirectoryPage initialData={data} />
    </Suspense>
  );
}

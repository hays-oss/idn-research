export interface ResourceCategory {
  id: string
  name: string
  slug: string
  description: string | null
  icon: string | null
  display_order: number
  is_active: boolean
  category_type: 'resource' | 'directory'
  created_at: string
  updated_at: string
}

export interface Resource {
  id: string
  category_id: string
  name: string
  url: string
  description: string | null
  display_order: number
  is_active: boolean
  is_featured: boolean
  added_date: string
  last_verified: string | null
  tags: string[]
  click_count: number
  affiliations: string[]
  linkedin_url: string | null
  created_at: string
  updated_at: string
}

export interface LinkedInInfluencer {
  id: string
  name: string
  linkedin_url: string
  title: string | null
  organization: string | null
  headshot_url: string | null
  bio: string | null
  is_active: boolean
  display_order: number
  created_at: string
  updated_at: string
}

export interface CategoryWithResources extends ResourceCategory {
  resources: Resource[]
}

// ============================================
// New Company Directory Schema Types
// ============================================

export interface TaxonomyDomain {
  id: number
  name: string
  display_order: number
  is_active: boolean
  created_at: string
  updated_at: string
}

export interface TaxonomySubcategory {
  id: number
  domain_id: number
  name: string
  display_order: number
  is_active: boolean
  created_at: string
  updated_at: string
}

export interface CategoryTaxonomy {
  id: number
  subcategory_id: number
  level_1_category: string
  level_2_subcategory: string
  level_3_tag: string
  synonyms_json: string[]
  keyword_rules_json: Record<string, string[]>
  is_active: boolean
  created_at: string
  updated_at: string
}

export type CompanyType = 'vendor' | 'manufacturer' | 'distributor' | 'gpo' | 'provider' | 'payer' | 'consultant' | 'media' | 'association' | 'other'
export type ReviewStatus = 'pending' | 'approved' | 'rejected' | 'needs_review' | 'archived'

export interface Company {
  id: string
  company_name: string
  normalized_company_name: string
  slug: string | null
  website: string | null
  linkedin_url: string | null
  logo_url: string | null
  description: string | null
  headquarters_city: string | null
  headquarters_state: string | null
  headquarters_country: string | null
  company_type: CompanyType
  primary_subcategory_id: number | null
  secondary_subcategory_id: number | null
  parent_company_id: string | null
  source_system: string | null
  source_url: string | null
  confidence_score: number | null
  review_status: ReviewStatus
  is_active: boolean
  is_featured: boolean
  employee_count_range: string | null
  year_founded: number | null
  phone: string | null
  contact_email: string | null
  notes: string | null
  import_batch_id: string | null
  created_at: string
  updated_at: string
}

export interface CompanyTag {
  id: string
  company_id: string
  taxonomy_id: number
  confidence_score: number | null
  source_method: string | null
  created_at: string
}

export interface Organization {
  id: string
  code: string
  name: string
  color_primary: string | null
  color_secondary: string | null
  logo_url: string | null
  website_url: string | null
  is_active: boolean
  created_at: string
  updated_at: string
}

export interface CompanyAffiliation {
  id: string
  company_id: string
  organization_id: string
  membership_type: string
  start_date: string | null
  end_date: string | null
  is_active: boolean
  notes: string | null
  created_at: string
}

// Public directory display types
export interface DirectoryCompany {
  id: string
  company_name: string
  slug: string | null
  website: string | null
  linkedin_url: string | null
  description: string | null
  is_featured: boolean
  affiliations: { code: string; name: string }[]
}

export interface DirectorySubcategory {
  id: number
  name: string
  domain_id: number
  companies: DirectoryCompany[]
}

export interface DirectoryDomain {
  id: number
  name: string
  subcategories: DirectorySubcategory[]
  totalCompanies: number
}

export interface ReviewQueueItem {
  queue_id: string
  reason: string
  status: string
  assigned_to: string | null
  resolution_notes: string | null
  queued_at: string
  resolved_at: string | null
  suggested_subcategory_id: number | null
  suggested_subcategory: string | null
  suggested_domain: string | null
  company_id: string
  company_name: string
  description: string | null
  website: string | null
  confidence_score: number | null
  review_status: string
  current_primary_subcategory: string | null
  current_primary_domain: string | null
}

export interface ResourceCategory {
  id: string
  name: string
  slug: string
  description: string | null
  icon: string | null
  display_order: number
  is_active: boolean
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

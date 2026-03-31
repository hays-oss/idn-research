-- IDN Research Platform — Foundation Tables
-- Run in Supabase SQL Editor
-- These tables are in the same Supabase instance as Mission Control
-- but are logically separate with public-read RLS policies

-- ============================================
-- 1. Resource Categories
-- ============================================
CREATE TABLE resource_categories (
  id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  name varchar(255) NOT NULL,
  slug varchar(255) NOT NULL UNIQUE,
  description text,
  icon varchar(100),
  display_order integer NOT NULL DEFAULT 0,
  is_active boolean NOT NULL DEFAULT true,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);

-- ============================================
-- 2. Resources (the ~450 links)
-- ============================================
CREATE TABLE resources (
  id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  category_id uuid NOT NULL REFERENCES resource_categories(id) ON DELETE CASCADE,
  name varchar(500) NOT NULL,
  url text NOT NULL,
  description text,
  display_order integer NOT NULL DEFAULT 0,
  is_active boolean NOT NULL DEFAULT true,
  is_featured boolean NOT NULL DEFAULT false,
  added_date date NOT NULL DEFAULT CURRENT_DATE,
  last_verified date,
  tags text[] DEFAULT '{}',
  click_count integer NOT NULL DEFAULT 0,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);

-- ============================================
-- 3. LinkedIn Influencers (richer profile data)
-- ============================================
CREATE TABLE linkedin_influencers (
  id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  name varchar(255) NOT NULL,
  linkedin_url text NOT NULL,
  title varchar(500),
  organization varchar(500),
  headshot_url text,
  bio text,
  is_active boolean NOT NULL DEFAULT true,
  display_order integer NOT NULL DEFAULT 0,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);

-- ============================================
-- 4. Resource Submissions (community submissions)
-- ============================================
CREATE TABLE resource_submissions (
  id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  category_id uuid REFERENCES resource_categories(id),
  suggested_category varchar(255),
  name varchar(500) NOT NULL,
  url text NOT NULL,
  description text,
  submitted_by_name varchar(255),
  submitted_by_email varchar(255),
  status varchar(50) NOT NULL DEFAULT 'pending'
    CHECK (status IN ('pending', 'approved', 'rejected')),
  reviewed_at timestamptz,
  created_at timestamptz NOT NULL DEFAULT now()
);

-- ============================================
-- 5. Click Analytics
-- ============================================
CREATE TABLE click_analytics (
  id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  resource_id uuid REFERENCES resources(id) ON DELETE SET NULL,
  influencer_id uuid REFERENCES linkedin_influencers(id) ON DELETE SET NULL,
  clicked_at timestamptz NOT NULL DEFAULT now(),
  referrer text,
  user_agent text
);

-- ============================================
-- Indexes
-- ============================================
CREATE INDEX idx_resources_category ON resources(category_id);
CREATE INDEX idx_resources_active ON resources(is_active) WHERE is_active = true;
CREATE INDEX idx_resources_tags ON resources USING GIN(tags);
CREATE INDEX idx_resources_name_search ON resources USING GIN(to_tsvector('english', name || ' ' || COALESCE(description, '')));
CREATE INDEX idx_categories_order ON resource_categories(display_order);
CREATE INDEX idx_categories_active ON resource_categories(is_active) WHERE is_active = true;
CREATE INDEX idx_influencers_active ON linkedin_influencers(is_active) WHERE is_active = true;
CREATE INDEX idx_click_analytics_resource ON click_analytics(resource_id);
CREATE INDEX idx_click_analytics_time ON click_analytics(clicked_at);
CREATE INDEX idx_submissions_status ON resource_submissions(status);

-- ============================================
-- Updated_at triggers
-- ============================================
CREATE OR REPLACE FUNCTION update_updated_at()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = now();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_resource_categories_updated
  BEFORE UPDATE ON resource_categories
  FOR EACH ROW EXECUTE FUNCTION update_updated_at();

CREATE TRIGGER trg_resources_updated
  BEFORE UPDATE ON resources
  FOR EACH ROW EXECUTE FUNCTION update_updated_at();

CREATE TRIGGER trg_linkedin_influencers_updated
  BEFORE UPDATE ON linkedin_influencers
  FOR EACH ROW EXECUTE FUNCTION update_updated_at();

-- ============================================
-- Row Level Security
-- Public can READ everything, only authenticated users can write
-- ============================================
ALTER TABLE resource_categories ENABLE ROW LEVEL SECURITY;
ALTER TABLE resources ENABLE ROW LEVEL SECURITY;
ALTER TABLE linkedin_influencers ENABLE ROW LEVEL SECURITY;
ALTER TABLE resource_submissions ENABLE ROW LEVEL SECURITY;
ALTER TABLE click_analytics ENABLE ROW LEVEL SECURITY;

-- Public read access (anyone can browse the site)
CREATE POLICY "Public read categories" ON resource_categories
  FOR SELECT USING (true);

CREATE POLICY "Public read resources" ON resources
  FOR SELECT USING (true);

CREATE POLICY "Public read influencers" ON linkedin_influencers
  FOR SELECT USING (true);

-- Anyone can submit a resource suggestion
CREATE POLICY "Public insert submissions" ON resource_submissions
  FOR INSERT WITH CHECK (true);

-- Anyone can log a click (for analytics)
CREATE POLICY "Public insert clicks" ON click_analytics
  FOR INSERT WITH CHECK (true);

-- Only authenticated users (admins) can modify data
CREATE POLICY "Admin write categories" ON resource_categories
  FOR ALL USING (auth.role() = 'authenticated')
  WITH CHECK (auth.role() = 'authenticated');

CREATE POLICY "Admin write resources" ON resources
  FOR ALL USING (auth.role() = 'authenticated')
  WITH CHECK (auth.role() = 'authenticated');

CREATE POLICY "Admin write influencers" ON linkedin_influencers
  FOR ALL USING (auth.role() = 'authenticated')
  WITH CHECK (auth.role() = 'authenticated');

CREATE POLICY "Admin manage submissions" ON resource_submissions
  FOR ALL USING (auth.role() = 'authenticated')
  WITH CHECK (auth.role() = 'authenticated');

-- ============================================
-- Increment click count function (called from app)
-- ============================================
CREATE OR REPLACE FUNCTION increment_click_count(resource_uuid uuid)
RETURNS void AS $$
BEGIN
  UPDATE resources SET click_count = click_count + 1 WHERE id = resource_uuid;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

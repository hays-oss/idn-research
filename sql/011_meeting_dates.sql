-- Meeting Calendar — Conference dates and locations
-- Run in Supabase SQL Editor

CREATE TABLE meeting_dates (
  id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  resource_id uuid REFERENCES resources(id) ON DELETE SET NULL,
  name text NOT NULL,
  org_short text,
  start_date date,
  end_date date,
  city text,
  state_country text,
  category text CHECK (category IN (
    'pharmacy', 'supply-chain', 'c-suite', 'technology',
    'clinical', 'revenue-cycle', 'facilities', 'nursing', 'workforce'
  )),
  tags text[] DEFAULT '{}',
  website_url text,
  source_url text,
  last_verified timestamptz,
  notes text,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);

-- Indexes
CREATE INDEX idx_meeting_dates_start ON meeting_dates(start_date);
CREATE INDEX idx_meeting_dates_category ON meeting_dates(category);
CREATE INDEX idx_meeting_dates_resource ON meeting_dates(resource_id);

-- Updated_at trigger (reuses existing function from 001)
CREATE TRIGGER trg_meeting_dates_updated
  BEFORE UPDATE ON meeting_dates
  FOR EACH ROW EXECUTE FUNCTION update_updated_at();

-- RLS
ALTER TABLE meeting_dates ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Public read meeting_dates" ON meeting_dates
  FOR SELECT USING (true);

CREATE POLICY "Admin write meeting_dates" ON meeting_dates
  FOR ALL USING (auth.role() = 'authenticated')
  WITH CHECK (auth.role() = 'authenticated');

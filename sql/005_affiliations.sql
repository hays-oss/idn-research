-- Add affiliations column to resources table
-- Values: 'IHES', 'CPES', 'MUAI', 'CSCE'
-- A company can belong to multiple organizations
ALTER TABLE resources ADD COLUMN IF NOT EXISTS affiliations text[] NOT NULL DEFAULT '{}';

-- Migration: Legacy directory resources -> new companies table
-- Safe: uses ON CONFLICT DO NOTHING, does not delete anything
-- DOES NOT drop or alter any existing tables

DO $$
DECLARE
  cat_record RECORD;
  res_record RECORD;
  new_company_id uuid;
  aff_code text;
  subcat_map jsonb := '{
    "orthopedic-spine-biologics": 1,
    "cardiac-cardiovascular": 2,
    "surgical-robotics": 3,
    "diagnostics-imaging": 15,
    "wound-care-infection-prevention": 12,
    "infusion-iv-therapy": 31,
    "respiratory-anesthesia": 5,
    "diabetes-patient-monitoring": 18,
    "endoscopy-gi": 9,
    "distribution-med-surg": 45
  }';
  mapped_subcat_id bigint;
BEGIN
  -- Loop through all active directory-type categories
  FOR cat_record IN
    SELECT id, slug FROM resource_categories
    WHERE category_type = 'directory' AND is_active = true
  LOOP
    -- Get mapped subcategory ID
    mapped_subcat_id := (subcat_map ->> cat_record.slug)::bigint;

    IF mapped_subcat_id IS NULL THEN
      RAISE NOTICE 'No mapping for category slug: %', cat_record.slug;
      CONTINUE;
    END IF;

    -- Loop through all active resources in this category
    FOR res_record IN
      SELECT * FROM resources
      WHERE category_id = cat_record.id AND is_active = true
    LOOP
      -- Insert into companies (skip if slug already exists)
      INSERT INTO companies (
        company_name,
        website,
        linkedin_url,
        description,
        company_type,
        primary_subcategory_id,
        review_status,
        confidence_score,
        is_active,
        is_featured,
        source_system,
        notes
      ) VALUES (
        res_record.name,
        res_record.url,
        res_record.linkedin_url,
        res_record.description,
        'vendor',
        mapped_subcat_id,
        'approved',
        1.0000,
        true,
        res_record.is_featured,
        'legacy_migration',
        'Migrated from legacy resource ID: ' || res_record.id
      )
      ON CONFLICT (slug) DO NOTHING
      RETURNING id INTO new_company_id;

      -- If insert succeeded, create affiliation rows from text[] array
      IF new_company_id IS NOT NULL AND res_record.affiliations IS NOT NULL THEN
        FOREACH aff_code IN ARRAY res_record.affiliations
        LOOP
          INSERT INTO company_affiliations (company_id, organization_id, membership_type, is_active)
          SELECT new_company_id, o.id, 'member', true
          FROM organizations o
          WHERE o.code = aff_code
          ON CONFLICT (company_id, organization_id) DO NOTHING;
        END LOOP;
      END IF;
    END LOOP;
  END LOOP;
END $$;

-- Deactivate legacy directory resources (NOT deleted)
UPDATE resources
SET is_active = false
WHERE category_id IN (
  SELECT id FROM resource_categories WHERE category_type = 'directory'
);

-- Deactivate legacy directory categories (NOT deleted)
UPDATE resource_categories
SET is_active = false
WHERE category_type = 'directory';

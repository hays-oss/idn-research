-- Enable RLS on import-related tables
ALTER TABLE ingestion_runs ENABLE ROW LEVEL SECURITY;
ALTER TABLE source_records ENABLE ROW LEVEL SECURITY;

-- Allow authenticated users full access to ingestion_runs
CREATE POLICY "authenticated_ingestion_runs_select" ON ingestion_runs
  FOR SELECT TO authenticated USING (true);
CREATE POLICY "authenticated_ingestion_runs_insert" ON ingestion_runs
  FOR INSERT TO authenticated WITH CHECK (true);
CREATE POLICY "authenticated_ingestion_runs_update" ON ingestion_runs
  FOR UPDATE TO authenticated USING (true) WITH CHECK (true);

-- Allow authenticated users full access to source_records
CREATE POLICY "authenticated_source_records_select" ON source_records
  FOR SELECT TO authenticated USING (true);
CREATE POLICY "authenticated_source_records_insert" ON source_records
  FOR INSERT TO authenticated WITH CHECK (true);

import { createClient } from '@supabase/supabase-js'

// These are public credentials (anon key is designed to be public, protected by RLS)
export const supabase = createClient(
  'https://aszhjzseobgadbgxaosq.supabase.co',
  'sb_publishable_Pak6sxTym3hMbH9f0_qy9Q_JKFW0-1L'
)

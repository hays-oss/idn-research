import { createClient } from '@supabase/supabase-js'

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL || 'https://aszhjzseobgadbgxaosq.supabase.co'
const supabaseAnonKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY || 'sb_publishable_Pak6sxTym3hMbH9f0_qy9Q_JKFW0-1L'

export const supabase = createClient(supabaseUrl, supabaseAnonKey)

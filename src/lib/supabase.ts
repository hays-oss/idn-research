import { createClient, SupabaseClient } from '@supabase/supabase-js'

function createSupabaseClient(): SupabaseClient {
  const url = process.env.NEXT_PUBLIC_SUPABASE_URL
  const key = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY
  if (!url || !key) {
    // During build/SSR prerender, env vars may not be available.
    // Return a dummy client that will be replaced at runtime.
    return createClient('https://localhost.supabase.co', 'dummy-key')
  }
  return createClient(url, key)
}

export const supabase = createSupabaseClient()

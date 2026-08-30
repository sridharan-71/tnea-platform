import { createClient } from "@supabase/supabase-js";

/**
 * Anonymous, server-side data client for the public TNEA catalogue.
 *
 * Authentication uses the dedicated clients in lib/supabase/browser.ts and
 * lib/supabase/server.ts. Keeping this client session-free prevents user
 * sessions from leaking into cached repository work.
 */
export const supabase = createClient(
  process.env.NEXT_PUBLIC_SUPABASE_URL!,
  process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!,
  {
    auth: {
      autoRefreshToken: false,
      detectSessionInUrl: false,
      persistSession: false,
    },
  },
);

"use client";

import { useState, useEffect } from "react";
import { supabase } from "@/lib/supabase";
import type { Session } from "@supabase/supabase-js";
import AdminDashboard from "@/components/admin/AdminDashboard";

export default function AdminPage() {
  const [session, setSession] = useState<Session | null>(null);
  const [loading, setLoading] = useState(true);
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [error, setError] = useState("");
  const [loggingIn, setLoggingIn] = useState(false);

  useEffect(() => {
    supabase.auth.getSession().then(({ data: { session } }) => {
      setSession(session);
      setLoading(false);
    });

    const {
      data: { subscription },
    } = supabase.auth.onAuthStateChange((_event, session) => {
      setSession(session);
    });

    return () => subscription.unsubscribe();
  }, []);

  async function handleLogin(e: React.FormEvent) {
    e.preventDefault();
    setError("");
    setLoggingIn(true);
    const { error } = await supabase.auth.signInWithPassword({ email, password });
    if (error) {
      setError(error.message);
    }
    setLoggingIn(false);
  }

  async function handleLogout() {
    await supabase.auth.signOut();
    setSession(null);
  }

  if (loading) {
    return (
      <div className="flex items-center justify-center min-h-screen bg-[var(--background)]">
        <div className="h-8 w-8 animate-spin rounded-full border-2 border-[var(--primary)] border-t-transparent" />
      </div>
    );
  }

  if (session) {
    return <AdminDashboard onLogout={handleLogout} />;
  }

  return (
    <div className="flex items-center justify-center min-h-screen bg-[var(--background)]">
      <div className="w-full max-w-sm mx-4">
        <div className="text-center mb-8">
          <div className="flex h-12 w-12 items-center justify-center rounded-xl bg-[var(--primary)] text-white font-bold text-lg mx-auto mb-3">
            IDN
          </div>
          <h1 className="text-xl font-semibold text-[var(--foreground)]">
            IDN Research Admin
          </h1>
          <p className="text-sm text-[var(--muted)] mt-1">
            Sign in to manage resources
          </p>
        </div>

        <form
          onSubmit={handleLogin}
          className="bg-white rounded-xl border border-[var(--border)] p-6 shadow-sm"
        >
          <div className="space-y-4">
            <div>
              <label className="block text-xs font-medium text-[var(--foreground)] mb-1">
                Email
              </label>
              <input
                type="email"
                required
                value={email}
                onChange={(e) => setEmail(e.target.value)}
                className="w-full rounded-lg border border-[var(--border)] bg-white px-3 py-2 text-sm focus:border-[var(--primary)] focus:outline-none focus:ring-1 focus:ring-[var(--primary)]"
                placeholder="admin@example.com"
              />
            </div>
            <div>
              <label className="block text-xs font-medium text-[var(--foreground)] mb-1">
                Password
              </label>
              <input
                type="password"
                required
                value={password}
                onChange={(e) => setPassword(e.target.value)}
                className="w-full rounded-lg border border-[var(--border)] bg-white px-3 py-2 text-sm focus:border-[var(--primary)] focus:outline-none focus:ring-1 focus:ring-[var(--primary)]"
                placeholder="Enter password"
              />
            </div>
          </div>

          {error && (
            <p className="mt-3 text-xs text-red-600">{error}</p>
          )}

          <button
            type="submit"
            disabled={loggingIn}
            className="mt-6 w-full rounded-lg bg-[var(--primary)] py-2.5 text-sm font-medium text-white hover:bg-[var(--primary-light)] transition-colors disabled:opacity-50"
          >
            {loggingIn ? "Signing in..." : "Sign In"}
          </button>
        </form>

        <p className="text-center text-xs text-[var(--muted)] mt-4">
          <a href="/" className="hover:text-[var(--primary)] transition-colors">
            &larr; Back to IDN Research
          </a>
        </p>
      </div>
    </div>
  );
}

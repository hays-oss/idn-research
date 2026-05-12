"use client";

import { useEffect, useRef, useState } from "react";
import Link from "next/link";
import { trackSearch } from "@/lib/analytics";

export default function Header({
  onSearch,
  onToggleSidebar,
  searchQuery: externalQuery,
}: {
  onSearch: (query: string) => void;
  onToggleSidebar: () => void;
  searchQuery?: string;
}) {
  const [query, setQuery] = useState("");
  const trackTimer = useRef<ReturnType<typeof setTimeout> | null>(null);

  useEffect(() => {
    if (externalQuery !== undefined && externalQuery !== query) {
      setQuery(externalQuery);
    }
  }, [externalQuery]);

  function handleSearch(value: string) {
    setQuery(value);
    onSearch(value);
    if (trackTimer.current) clearTimeout(trackTimer.current);
    if (value.trim().length >= 3) {
      trackTimer.current = setTimeout(
        () => trackSearch(value, "header"),
        1000
      );
    }
  }

  return (
    <header className="sticky top-0 z-50 bg-cream border-b border-rule">
      <div className="mx-auto max-w-[1600px] px-4 sm:px-6 lg:px-8">
        <div className="flex h-16 items-center justify-between gap-4">
          {/* Mobile menu + Logo */}
          <div className="flex items-center gap-3 shrink-0">
            <button
              onClick={onToggleSidebar}
              className="lg:hidden flex items-center justify-center h-9 w-9 rounded-sm text-ink-2 hover:text-ink hover:bg-cream-2 transition-colors"
              aria-label="Toggle navigation"
            >
              <svg className="h-5 w-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M4 6h16M4 12h16M4 18h16" />
              </svg>
            </button>
            <Link href="/" className="flex items-center gap-3">
              <div className="flex h-9 w-9 items-center justify-center rounded-[3px] bg-ink text-gold font-serif font-semibold text-sm tracking-tight">
                IDN
              </div>
              <div className="hidden sm:block">
                <div className="font-serif text-lg text-ink leading-tight tracking-tight">
                  IDN Research
                </div>
                <div className="text-[10px] uppercase tracking-[0.18em] text-oxblood font-semibold leading-tight">
                  Healthcare Resource Intelligence
                </div>
              </div>
            </Link>
          </div>

          {/* Slim search */}
          <div className="flex-1 max-w-md">
            <div className="relative">
              <svg
                className="absolute left-3 top-1/2 -translate-y-1/2 h-4 w-4 text-ink-muted"
                fill="none"
                stroke="currentColor"
                viewBox="0 0 24 24"
              >
                <path
                  strokeLinecap="round"
                  strokeLinejoin="round"
                  strokeWidth={2}
                  d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"
                />
              </svg>
              <input
                type="text"
                value={query}
                onChange={(e) => handleSearch(e.target.value)}
                placeholder="Search the directory…"
                className="w-full rounded-[3px] border border-rule bg-card py-2 pl-9 pr-4 text-sm text-ink placeholder:text-ink-muted focus:border-ink focus:outline-none focus:ring-1 focus:ring-ink"
              />
              {query && (
                <button
                  onClick={() => handleSearch("")}
                  className="absolute right-3 top-1/2 -translate-y-1/2 text-ink-muted hover:text-ink"
                  aria-label="Clear search"
                >
                  <svg className="h-4 w-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M6 18L18 6M6 6l12 12" />
                  </svg>
                </button>
              )}
            </div>
          </div>

          {/* Nav links — serif italic oxblood */}
          <nav className="hidden md:flex items-center gap-7 text-sm">
            <Link
              href="/calendar"
              className="font-serif italic text-oxblood hover:text-oxblood-deep transition-colors"
            >
              Meeting Calendar
            </Link>
            <Link
              href="/directory"
              className="font-serif italic text-oxblood hover:text-oxblood-deep transition-colors"
            >
              Directory
            </Link>
            <Link
              href="/about"
              className="font-serif italic text-oxblood hover:text-oxblood-deep transition-colors"
            >
              About
            </Link>
            <a
              href="/#submit"
              className="rounded-[3px] border border-ink bg-ink px-4 py-1.5 text-xs font-sans font-semibold uppercase tracking-[0.12em] text-cream hover:bg-oxblood hover:border-oxblood transition-colors"
            >
              Submit Resource
            </a>
          </nav>
        </div>
      </div>
    </header>
  );
}

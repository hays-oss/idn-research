"use client";

import { useState } from "react";
import Link from "next/link";

export default function Header({
  onSearch,
}: {
  onSearch: (query: string) => void;
}) {
  const [query, setQuery] = useState("");

  function handleSearch(value: string) {
    setQuery(value);
    onSearch(value);
  }

  return (
    <header className="sticky top-0 z-50 border-b border-border bg-white/95 backdrop-blur-sm">
      <div className="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
        <div className="flex h-16 items-center justify-between gap-4">
          {/* Logo */}
          <Link href="/" className="flex items-center gap-3 shrink-0">
            <div className="flex h-9 w-9 items-center justify-center rounded-lg bg-primary text-white font-bold text-sm">
              IDN
            </div>
            <div className="hidden sm:block">
              <div className="text-lg font-semibold text-primary leading-tight">
                IDN Research
              </div>
              <div className="text-xs text-muted leading-tight">
                Healthcare Resource Intelligence
              </div>
            </div>
          </Link>

          {/* Search */}
          <div className="flex-1 max-w-xl">
            <div className="relative">
              <svg
                className="absolute left-3 top-1/2 -translate-y-1/2 h-4 w-4 text-muted"
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
                placeholder="Search 600+ healthcare resources..."
                className="w-full rounded-lg border border-border bg-surface py-2 pl-10 pr-4 text-sm placeholder:text-muted/60 focus:border-primary focus:outline-none focus:ring-1 focus:ring-primary"
              />
              {query && (
                <button
                  onClick={() => handleSearch("")}
                  className="absolute right-3 top-1/2 -translate-y-1/2 text-muted hover:text-foreground"
                >
                  <svg className="h-4 w-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M6 18L18 6M6 6l12 12" />
                  </svg>
                </button>
              )}
            </div>
          </div>

          {/* Nav links */}
          <nav className="hidden md:flex items-center gap-6 text-sm font-medium text-muted">
            <Link href="/about" className="hover:text-primary transition-colors">
              About
            </Link>
            <a
              href="#submit"
              className="rounded-lg bg-primary px-4 py-2 text-white hover:bg-primary-light transition-colors"
            >
              Submit Resource
            </a>
          </nav>
        </div>
      </div>
    </header>
  );
}

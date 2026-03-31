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
    <header className="sticky top-0 z-50 bg-header-bg shadow-md">
      <div className="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
        <div className="flex h-16 items-center justify-between gap-4">
          {/* Logo */}
          <Link href="/" className="flex items-center gap-3 shrink-0">
            <div className="flex h-9 w-9 items-center justify-center rounded-lg bg-accent text-header-bg font-bold text-sm">
              IDN
            </div>
            <div className="hidden sm:block">
              <div className="text-lg font-semibold text-white leading-tight">
                IDN Research
              </div>
              <div className="text-xs text-white/60 leading-tight">
                Healthcare Resource Intelligence
              </div>
            </div>
          </Link>

          {/* Search */}
          <div className="flex-1 max-w-xl">
            <div className="relative">
              <svg
                className="absolute left-3 top-1/2 -translate-y-1/2 h-4 w-4 text-white/40"
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
                className="w-full rounded-lg border border-white/20 bg-white/10 py-2 pl-10 pr-4 text-sm text-white placeholder:text-white/50 focus:border-accent focus:outline-none focus:ring-1 focus:ring-accent focus:bg-white/15"
              />
              {query && (
                <button
                  onClick={() => handleSearch("")}
                  className="absolute right-3 top-1/2 -translate-y-1/2 text-white/50 hover:text-white"
                >
                  <svg className="h-4 w-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M6 18L18 6M6 6l12 12" />
                  </svg>
                </button>
              )}
            </div>
          </div>

          {/* Nav links */}
          <nav className="hidden md:flex items-center gap-6 text-sm font-medium">
            <Link href="/about" className="text-white/70 hover:text-white transition-colors">
              About
            </Link>
            <a
              href="#submit"
              className="rounded-lg bg-accent px-4 py-2 text-header-bg font-semibold hover:bg-accent-light transition-colors"
            >
              Submit Resource
            </a>
          </nav>
        </div>
      </div>
    </header>
  );
}

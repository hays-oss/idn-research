"use client";

import { useState } from "react";
import Header from "@/components/Header";

// On the About page there's no list to search, so we mount the global Header
// with local-only state — keeps the chrome consistent across the site without
// wiring About into the homepage's search context.
export default function AboutHeaderShim() {
  const [query, setQuery] = useState("");
  return (
    <Header
      onSearch={(q) => {
        setQuery(q);
        if (q.trim().length >= 2) {
          // Send the query to the homepage where the directory lives.
          window.location.href = `/?q=${encodeURIComponent(q.trim())}`;
        }
      }}
      onToggleSidebar={() => {}}
      searchQuery={query}
    />
  );
}

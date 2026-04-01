"use client";

import { LinkedInInfluencer } from "@/lib/types";

export default function InfluencerCard({
  influencer,
}: {
  influencer: LinkedInInfluencer;
}) {
  return (
    <a
      href={influencer.linkedin_url}
      target="_blank"
      rel="noopener noreferrer"
      className="group flex items-center gap-3 rounded-xl border border-border bg-white px-4 py-3 transition-all duration-200 ease-out hover:border-blue-300 hover:shadow-md hover:-translate-y-0.5"
    >
      <div className="flex h-14 w-14 shrink-0 items-center justify-center rounded-full bg-gradient-to-br from-blue-50 to-blue-100 text-base font-bold text-blue-700 shadow-sm">
        {influencer.name
          .split(" ")
          .map((n) => n[0])
          .join("")
          .slice(0, 2)}
      </div>
      <div className="min-w-0">
        <span className="text-sm font-medium text-foreground group-hover:text-blue-700 truncate block">
          {influencer.name}
        </span>
        {influencer.title && (
          <p className="text-xs text-muted truncate">{influencer.title}</p>
        )}
        {influencer.organization && (
          <p className="text-xs text-muted/70 truncate">{influencer.organization}</p>
        )}
      </div>
      <svg
        className="h-4 w-4 shrink-0 text-blue-400 ml-auto"
        viewBox="0 0 24 24"
        fill="currentColor"
      >
        <path d="M20.447 20.452h-3.554v-5.569c0-1.328-.027-3.037-1.852-3.037-1.853 0-2.136 1.445-2.136 2.939v5.667H9.351V9h3.414v1.561h.046c.477-.9 1.637-1.85 3.37-1.85 3.601 0 4.267 2.37 4.267 5.455v6.286zM5.337 7.433a2.062 2.062 0 01-2.063-2.065 2.064 2.064 0 112.063 2.065zm1.782 13.019H3.555V9h3.564v11.452zM22.225 0H1.771C.792 0 0 .774 0 1.729v20.542C0 23.227.792 24 1.771 24h20.451C23.2 24 24 23.227 24 22.271V1.729C24 .774 23.2 0 22.222 0h.003z" />
      </svg>
    </a>
  );
}

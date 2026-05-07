"use client";

import Image from "next/image";

interface HeroSectionProps {
  companyCount: number;
  domainCount: number;
  tagCount: number;
  searchQuery: string;
  onSearch: (query: string) => void;
}

export default function HeroSection({
  companyCount,
  domainCount,
  tagCount,
  searchQuery,
  onSearch,
}: HeroSectionProps) {
  return (
    <section
      className="relative overflow-hidden bg-ink text-cream"
      style={{
        backgroundImage:
          "radial-gradient(circle at 80% 0%, rgba(233,217,168,0.12), transparent 55%)",
      }}
    >
      {/* Floating IHES family lockup, top-right */}
      <div className="hidden md:flex absolute top-6 right-8 lg:right-16 z-10 items-center gap-2.5 text-cream/60">
        <span className="text-[10px] uppercase tracking-[0.22em] font-semibold text-gold-deep">
          From the Family
        </span>
        <div className="flex items-center gap-1.5">
          {[
            { code: "IHES", asset: "/assets/ihes.png" },
            { code: "CPES", asset: "/assets/cpes.png" },
            { code: "MUIA", asset: "/assets/muia.png" },
            { code: "CSCE", asset: "/assets/csce.png" },
          ].map((d) => (
            <div
              key={d.code}
              className="flex items-center justify-center h-6 w-14 rounded-[2px] bg-card px-1.5"
              title={d.code}
            >
              <Image
                src={d.asset}
                alt={d.code}
                width={120}
                height={36}
                className="h-4 w-auto object-contain"
              />
            </div>
          ))}
        </div>
      </div>

      <div className="relative mx-auto max-w-[860px] px-6 sm:px-10 lg:px-16 py-20 sm:py-24 lg:py-28">
        {/* Eyebrow */}
        <div className="text-[11px] uppercase tracking-[0.22em] font-semibold text-gold-deep mb-6">
          An IHES Resource · Curated Since 2003
        </div>

        {/* H1 */}
        <h1 className="font-serif text-[40px] sm:text-[48px] lg:text-[56px] leading-[1.08] tracking-[-0.02em] text-cream max-w-[14ch] mb-7">
          The healthcare industry,{" "}
          <em className="text-gold not-italic font-serif italic">
            organized.
          </em>
        </h1>

        {/* Lede */}
        <p className="font-serif text-[19px] leading-[1.55] text-cream/80 max-w-[60ch] mb-10">
          A curated directory of the meetings, media, organizations, and people
          that move healthcare forward — maintained by IHES.
        </p>

        {/* Stats row — live data */}
        <div className="grid grid-cols-3 gap-0 border-y border-gold/30 py-7 mb-10 max-w-2xl">
          <Stat value={`${companyCount}+`} label="Companies" divider />
          <Stat value={`${domainCount}`} label="Domains" divider />
          <Stat value={`${tagCount}+`} label="Tags" />
        </div>

        {/* Search — paper-white, prominent */}
        <div className="relative max-w-xl">
          <svg
            className="absolute left-4 top-1/2 -translate-y-1/2 h-5 w-5 text-ink-muted"
            fill="none"
            stroke="currentColor"
            viewBox="0 0 24 24"
            aria-hidden
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
            value={searchQuery}
            onChange={(e) => onSearch(e.target.value)}
            placeholder="Search 600+ resources, companies, and people…"
            className="w-full rounded-[3px] bg-cream py-4 pl-12 pr-20 text-[15px] text-ink placeholder:text-ink-muted shadow-[0_2px_24px_rgba(0,0,0,0.18)] focus:outline-none focus:ring-2 focus:ring-gold focus:ring-offset-2 focus:ring-offset-ink"
          />
          <span className="hidden sm:inline-block absolute right-4 top-1/2 -translate-y-1/2 text-[10px] uppercase tracking-[0.18em] text-ink-muted font-semibold">
            ⌘K
          </span>
        </div>

        {/* Tagline */}
        <p className="mt-12 text-center font-serif italic text-[15px] text-gold/90 max-w-xl mx-auto">
          Smart people. Small rooms. Big things happen.
        </p>
      </div>
    </section>
  );
}

function Stat({
  value,
  label,
  divider,
}: {
  value: string;
  label: string;
  divider?: boolean;
}) {
  return (
    <div
      className={`px-4 ${divider ? "border-r border-gold/30" : ""} text-left`}
    >
      <div className="font-serif text-[34px] sm:text-[38px] leading-none text-gold tracking-[-0.01em]">
        {value}
      </div>
      <div className="mt-2 text-[10.5px] uppercase tracking-[0.18em] font-semibold text-cream/60">
        {label}
      </div>
    </div>
  );
}

"use client";

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
      className="relative overflow-hidden py-16 sm:py-20 text-center"
      style={{ background: "var(--gradient-hero)" }}
    >
      {/* Subtle geometric pattern overlay */}
      <div
        className="absolute inset-0 opacity-[0.06]"
        style={{
          backgroundImage:
            "radial-gradient(circle at 25% 25%, rgba(255,255,255,0.2) 1px, transparent 1px), radial-gradient(circle at 75% 75%, rgba(255,255,255,0.15) 1px, transparent 1px)",
          backgroundSize: "60px 60px",
        }}
      />

      <div className="relative max-w-3xl mx-auto px-4 sm:px-6">
        {/* Headline */}
        <h1 className="text-2xl sm:text-3xl lg:text-4xl font-bold text-white mb-4 leading-tight">
          Empowering Healthcare through Executive Intelligence
        </h1>

        {/* Subtitle */}
        <p className="text-base sm:text-lg text-white/80 max-w-2xl mx-auto mb-10">
          Connecting healthcare leaders with the companies, resources, and
          insights that matter — powered by IHES
        </p>

        {/* Stat counters */}
        <div className="flex flex-col sm:flex-row items-center justify-center gap-6 sm:gap-10 mb-10">
          {[
            { value: `${companyCount}+`, label: "Companies" },
            { value: `${domainCount}`, label: "Domains" },
            { value: `${tagCount}+`, label: "Tags" },
          ].map((stat) => (
            <div key={stat.label} className="text-center">
              <div className="text-3xl sm:text-4xl font-bold text-[var(--accent)]">
                {stat.value}
              </div>
              <div className="text-sm text-white/70 mt-1">{stat.label}</div>
            </div>
          ))}
        </div>

        {/* Search bar */}
        <div className="max-w-xl mx-auto relative">
          <svg
            className="absolute left-4 top-1/2 -translate-y-1/2 h-5 w-5 text-muted"
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
            value={searchQuery}
            onChange={(e) => onSearch(e.target.value)}
            placeholder="Search companies, resources, and more..."
            className="w-full rounded-full bg-white py-3.5 pl-12 pr-5 text-sm text-foreground shadow-lg placeholder:text-muted focus:outline-none focus:ring-2 focus:ring-[var(--accent)] focus:ring-offset-2 focus:ring-offset-transparent"
          />
          {searchQuery && (
            <button
              onClick={() => onSearch("")}
              className="absolute right-4 top-1/2 -translate-y-1/2 text-muted hover:text-foreground transition-colors"
            >
              <svg
                className="h-4 w-4"
                fill="none"
                stroke="currentColor"
                viewBox="0 0 24 24"
              >
                <path
                  strokeLinecap="round"
                  strokeLinejoin="round"
                  strokeWidth={2}
                  d="M6 18L18 6M6 6l12 12"
                />
              </svg>
            </button>
          )}
        </div>
      </div>
    </section>
  );
}

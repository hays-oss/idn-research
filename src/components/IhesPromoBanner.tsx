import IhesCtaLink from "@/components/IhesCtaLink";

// Wide, full-bleed CTA banner pushing IHES meetings.
// Use on the homepage and other pages where a prominent placement is
// appropriate. For a compact sidebar version see IhesPromoSidebar.

export default function IhesPromoBanner({
  location,
}: {
  location: string;
}) {
  return (
    <section
      className="bg-header-bg text-white"
      style={{
        background:
          "linear-gradient(135deg, #1a3a2a 0%, #1a5632 60%, #2d7a4f 100%)",
      }}
    >
      <div className="mx-auto max-w-5xl px-4 sm:px-6 lg:px-8 py-10 sm:py-12 flex flex-col sm:flex-row sm:items-center sm:justify-between gap-6">
        <div className="max-w-2xl">
          <h2 className="text-xl sm:text-2xl font-bold leading-tight">
            Looking to reach pharmacy, supply chain, or hospital executives?
          </h2>
          <p className="mt-2 text-sm sm:text-base text-white/80">
            IHES brings the right rooms together — four executive meetings a year.
          </p>
        </div>
        <IhesCtaLink
          location={location}
          className="inline-flex items-center gap-2 rounded-lg bg-accent px-5 py-3 text-sm font-bold text-header-bg shadow-md hover:bg-accent-light transition-colors whitespace-nowrap"
        >
          Learn About IHES Meetings
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
              d="M13 7l5 5m0 0l-5 5m5-5H6"
            />
          </svg>
        </IhesCtaLink>
      </div>
    </section>
  );
}

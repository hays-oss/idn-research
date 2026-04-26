import IhesCtaLink from "@/components/IhesCtaLink";

// Reusable IHES cross-promotion sidebar widget for resource/company detail pages.
// Server component — pure markup; the IhesCtaLink wrapper handles the click event.
export default function IhesPromoSidebar({
  location = "sidebar",
}: {
  location?: string;
}) {
  return (
    <aside className="rounded-xl border border-accent/30 bg-header-bg p-5 text-white">
      <h3 className="text-sm font-bold uppercase tracking-wide text-accent">
        Reach Healthcare Executives
      </h3>
      <p className="mt-2 text-sm text-white/80">
        Meet executives from this network in person at IHES — four executive
        meetings a year, by invitation.
      </p>
      <IhesCtaLink
        location={location}
        className="mt-4 inline-flex items-center gap-1.5 rounded-lg bg-accent px-3 py-1.5 text-sm font-semibold text-header-bg transition-colors hover:bg-accent-light"
      >
        Learn About IHES Meetings
        <svg
          className="h-3.5 w-3.5"
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
    </aside>
  );
}

import IhesCtaLink from "@/components/IhesCtaLink";

export default function IhesPromoSidebar({
  location = "sidebar",
}: {
  location?: string;
}) {
  return (
    <aside className="rounded-[4px] border border-rule bg-cream-2 p-5">
      <div className="text-[10px] uppercase tracking-[0.22em] font-semibold text-oxblood mb-2">
        Reach Healthcare Executives
      </div>
      <p className="text-[14px] leading-[1.6] text-ink-2">
        Meet executives from this network in person at IHES — four executive
        meetings a year, by invitation.
      </p>
      <IhesCtaLink
        location={location}
        className="mt-4 inline-flex items-center gap-1.5 font-serif italic text-[14px] text-oxblood hover:text-oxblood-deep transition-colors"
      >
        Learn About IHES Meetings →
      </IhesCtaLink>
    </aside>
  );
}

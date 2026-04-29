import Link from "next/link";
import Image from "next/image";
import IhesCtaLink from "@/components/IhesCtaLink";

const FOOTER_CATEGORIES: { slug: string; label: string }[] = [
  { slug: "industry-meetings", label: "Industry Meetings" },
  { slug: "industry-meetings-pharmacy", label: "Pharmacy Conferences" },
  { slug: "industry-meetings-supply-chain", label: "Supply Chain Conferences" },
  { slug: "industry-meetings-technology", label: "Technology Conferences" },
  { slug: "group-purchasing-organizations", label: "GPOs" },
  { slug: "podcasts", label: "Podcasts" },
  { slug: "consulting-capital", label: "Consulting & Capital" },
  { slug: "federal-government-cms", label: "Federal / CMS" },
];

type FamilyDivision = {
  code: "IHES" | "CPES" | "CSCE" | "MUIA";
  fullName: string;
  chipBg: string;
  asset?: string;
  altText?: string;
};

// All wordmark PNGs ship as colored-letters-on-transparent, so we render them
// on a cream chip rather than a same-color chip (which would erase them).
const IHES_FAMILY: FamilyDivision[] = [
  {
    code: "IHES",
    fullName: "Institute of Healthcare Executives & Suppliers",
    chipBg: "bg-card",
    asset: "/assets/ihes.png",
    altText: "IHES",
  },
  {
    code: "CPES",
    fullName: "Council of Pharmacy Executives & Suppliers",
    chipBg: "bg-card",
    asset: "/assets/cpes.png",
    altText: "CPES",
  },
  {
    code: "MUIA",
    fullName: "Med Use Intelligence & Automation",
    chipBg: "bg-card",
    asset: "/assets/muia.png",
    altText: "MUIA",
  },
  {
    code: "CSCE",
    fullName: "Council of Supply Chain Executives",
    chipBg: "bg-card",
    asset: "/assets/csce.png",
    altText: "CSCE",
  },
];

export default function SiteFooter() {
  return (
    <footer className="bg-cream-2 border-t border-rule mt-auto">
      <div className="mx-auto max-w-7xl px-4 sm:px-6 lg:px-12 py-14">
        <div className="grid gap-10 lg:grid-cols-12">
          {/* About column */}
          <div className="lg:col-span-4">
            <div className="text-[10px] uppercase tracking-[0.22em] text-oxblood font-semibold mb-3">
              IDN Research
            </div>
            <p className="font-serif text-[19px] leading-[1.45] text-ink-2 max-w-sm">
              A curated directory of the meetings, media, organizations, and
              people that move healthcare forward — maintained by IHES.
            </p>
            <p className="mt-6 font-serif italic text-[15px] text-ink leading-snug max-w-sm border-l-2 border-oxblood pl-4">
              Smart people. Small rooms. Big things happen.
            </p>
          </div>

          {/* Explore column */}
          <div className="lg:col-span-3">
            <div className="text-[10px] uppercase tracking-[0.22em] text-oxblood font-semibold mb-3">
              Explore
            </div>
            <ul className="space-y-2 text-sm">
              <li>
                <Link
                  href="/"
                  className="text-ink-2 hover:text-oxblood transition-colors"
                >
                  Home
                </Link>
              </li>
              <li>
                <Link
                  href="/directory"
                  className="text-ink-2 hover:text-oxblood transition-colors"
                >
                  Company Directory
                </Link>
              </li>
              <li>
                <Link
                  href="/about"
                  className="text-ink-2 hover:text-oxblood transition-colors"
                >
                  About
                </Link>
              </li>
              <li>
                <Link
                  href="/contact"
                  className="text-ink-2 hover:text-oxblood transition-colors"
                >
                  Contact
                </Link>
              </li>
            </ul>
            <div className="text-[10px] uppercase tracking-[0.22em] text-oxblood font-semibold mb-3 mt-8">
              Top Categories
            </div>
            <ul className="space-y-2 text-sm">
              {FOOTER_CATEGORIES.slice(0, 6).map((c) => (
                <li key={c.slug}>
                  <Link
                    href={`/category/${c.slug}`}
                    className="text-ink-2 hover:text-oxblood transition-colors"
                  >
                    {c.label}
                  </Link>
                </li>
              ))}
            </ul>
          </div>

          {/* IHES Family column */}
          <div className="lg:col-span-5">
            <div className="text-[10px] uppercase tracking-[0.22em] text-oxblood font-semibold mb-3">
              The IHES Family
            </div>
            <p className="font-serif text-[15px] text-ink-2 leading-[1.55] mb-5 max-w-md">
              IDN Research is curated by IHES — the parent peer-group network
              connecting senior health system executives with the supplier
              companies that serve them.
            </p>
            <div className="grid grid-cols-2 gap-3">
              {IHES_FAMILY.map((d) => (
                <div
                  key={d.code}
                  className="border border-rule bg-card p-3 rounded-[3px]"
                >
                  <div
                    className={`flex items-center justify-center h-12 ${d.chipBg} rounded-[2px]`}
                  >
                    {d.asset ? (
                      <Image
                        src={d.asset}
                        alt={d.altText || d.code}
                        width={120}
                        height={36}
                        className="h-7 w-auto object-contain"
                      />
                    ) : (
                      <span
                        className="text-white font-black text-[11px] tracking-[0.06em]"
                        style={{ fontFamily: "Georgia, serif" }}
                      >
                        {d.code}
                      </span>
                    )}
                  </div>
                  <div className="mt-2 text-[11px] uppercase tracking-[0.16em] text-ink-2 font-semibold leading-tight">
                    {d.code}
                  </div>
                  <div className="text-[11px] text-ink-muted leading-snug mt-1">
                    {d.fullName}
                  </div>
                </div>
              ))}
            </div>
            <IhesCtaLink
              location="footer_family"
              className="mt-5 inline-flex items-center gap-2 font-serif italic text-sm text-oxblood hover:text-oxblood-deep transition-colors"
            >
              Learn more at ihesllc.com →
            </IhesCtaLink>
          </div>
        </div>

        {/* Copyright bar */}
        <div className="mt-12 pt-6 border-t border-rule flex flex-col sm:flex-row items-start sm:items-center justify-between gap-3 text-xs text-ink-muted">
          <div>
            © {new Date().getFullYear()} IHES LLC · All Rights Reserved · Franklin, TN
          </div>
          <div className="flex items-center gap-4">
            <a
              href="https://www.linkedin.com/in/hayswaldrop/"
              target="_blank"
              rel="noopener noreferrer"
              className="hover:text-oxblood transition-colors"
            >
              LinkedIn
            </a>
            <Link href="/contact" className="hover:text-oxblood transition-colors">
              Contact
            </Link>
          </div>
        </div>
      </div>
    </footer>
  );
}

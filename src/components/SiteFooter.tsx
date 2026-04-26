import Link from "next/link";
import IhesCtaLink from "@/components/IhesCtaLink";

// Top categories surfaced in the footer for crawlable internal links to
// the highest-traffic landing pages. Slugs match the category page routes.
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

export default function SiteFooter() {
  return (
    <footer className="bg-header-bg text-white mt-auto">
      <div className="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8 py-10">
        <div className="grid gap-10 md:grid-cols-4">
          {/* Brand */}
          <div>
            <div className="flex items-center gap-2">
              <div className="flex h-8 w-8 items-center justify-center rounded bg-accent text-header-bg text-xs font-bold">
                IDN
              </div>
              <span className="text-sm font-semibold">IDN Research</span>
            </div>
            <p className="mt-3 text-xs text-white/60 max-w-xs">
              The most comprehensive curated directory of healthcare industry
              resources — built and maintained by IHES.
            </p>
            <a
              href="https://www.linkedin.com/in/hayswaldrop/"
              target="_blank"
              rel="noopener noreferrer"
              className="mt-4 inline-flex items-center gap-1.5 text-xs text-white/70 hover:text-white transition-colors"
              aria-label="Hays Waldrop on LinkedIn"
            >
              <svg className="h-4 w-4" fill="currentColor" viewBox="0 0 24 24">
                <path d="M20.447 20.452h-3.554v-5.569c0-1.328-.027-3.037-1.852-3.037-1.853 0-2.136 1.445-2.136 2.939v5.667H9.351V9h3.414v1.561h.046c.477-.9 1.637-1.85 3.37-1.85 3.601 0 4.267 2.37 4.267 5.455v6.286zM5.337 7.433a2.062 2.062 0 01-2.063-2.065 2.064 2.064 0 112.063 2.065zm1.782 13.019H3.555V9h3.564v11.452zM22.225 0H1.771C.792 0 0 .774 0 1.729v20.542C0 23.227.792 24 1.771 24h20.451C23.2 24 24 23.227 24 22.271V1.729C24 .774 23.2 0 22.222 0h.003z" />
              </svg>
              LinkedIn
            </a>
          </div>

          {/* Site */}
          <div>
            <h3 className="text-xs font-bold uppercase tracking-wide text-white/50">
              Site
            </h3>
            <ul className="mt-3 space-y-2 text-sm">
              <li>
                <Link href="/" className="text-white/80 hover:text-white transition-colors">
                  Home
                </Link>
              </li>
              <li>
                <Link href="/directory" className="text-white/80 hover:text-white transition-colors">
                  Directory
                </Link>
              </li>
              <li>
                <Link href="/about" className="text-white/80 hover:text-white transition-colors">
                  About
                </Link>
              </li>
              <li>
                <Link href="/contact" className="text-white/80 hover:text-white transition-colors">
                  Contact
                </Link>
              </li>
            </ul>
          </div>

          {/* Top categories */}
          <div className="md:col-span-2">
            <h3 className="text-xs font-bold uppercase tracking-wide text-white/50">
              Top Categories
            </h3>
            <ul className="mt-3 grid grid-cols-2 gap-x-4 gap-y-2 text-sm">
              {FOOTER_CATEGORIES.map((c) => (
                <li key={c.slug}>
                  <Link
                    href={`/category/${c.slug}`}
                    className="text-white/80 hover:text-white transition-colors"
                  >
                    {c.label}
                  </Link>
                </li>
              ))}
            </ul>
          </div>
        </div>

        <div className="mt-10 pt-6 border-t border-white/10 flex flex-col sm:flex-row items-start sm:items-center justify-between gap-4 text-xs text-white/60">
          <div>
            &copy; {new Date().getFullYear()} IDN Research. Built by{" "}
            <IhesCtaLink
              location="footer"
              className="text-accent hover:text-accent-light transition-colors"
            >
              IHES
            </IhesCtaLink>
            .
          </div>
        </div>
      </div>
    </footer>
  );
}

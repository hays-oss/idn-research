import type { Metadata } from "next";
import Link from "next/link";

export const metadata: Metadata = {
  title: "About IDN Research — Built by IHES",
  description:
    "IDN Research is the most comprehensive curated directory of healthcare industry resources, built and maintained by the Institute of Healthcare Executives and Suppliers (IHES).",
  alternates: { canonical: "https://idnresearch.com/about" },
  openGraph: {
    title: "About IDN Research — Built by IHES",
    description:
      "IDN Research is the most comprehensive curated directory of healthcare industry resources, built and maintained by IHES.",
    url: "https://idnresearch.com/about",
    type: "website",
  },
};

export default function AboutPage() {
  return (
    <>
      <header className="border-b border-[var(--border)] bg-white">
        <div className="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
          <div className="flex h-16 items-center justify-between">
            <Link href="/" className="flex items-center gap-3">
              <div className="flex h-9 w-9 items-center justify-center rounded-lg bg-[var(--primary)] text-white font-bold text-sm">
                IDN
              </div>
              <div>
                <div className="text-lg font-semibold text-[var(--primary)] leading-tight">
                  IDN Research
                </div>
                <div className="text-xs text-[var(--muted)] leading-tight">
                  Healthcare Resource Intelligence
                </div>
              </div>
            </Link>
            <Link
              href="/"
              className="text-sm font-medium text-[var(--muted)] hover:text-[var(--primary)] transition-colors"
            >
              &larr; Back to Directory
            </Link>
          </div>
        </div>
      </header>

      <main className="mx-auto max-w-3xl px-4 sm:px-6 lg:px-8 py-12">
        <h1 className="text-3xl font-bold text-[var(--foreground)] mb-6">
          About IDN Research
        </h1>

        <div className="prose prose-slate max-w-none space-y-6 text-[var(--foreground)]">
          <p className="text-lg text-[var(--muted)]">
            IDN Research is the most comprehensive curated directory of healthcare
            industry resources — built and maintained by{" "}
            <a
              href="https://www.ihesllc.com"
              target="_blank"
              rel="noopener noreferrer"
              className="text-[var(--primary)] hover:underline"
            >
              IHES
            </a>{" "}
            (Institute of Healthcare Executives and Suppliers).
          </p>

          <h2 className="text-xl font-semibold mt-8">What You&apos;ll Find Here</h2>
          <p className="text-[var(--muted)]">
            Over 600 hand-picked resources across 20+ categories spanning the full
            healthcare ecosystem — from industry meetings and newsletters to GPOs,
            government resources, podcasts, consulting firms, and LinkedIn thought
            leaders.
          </p>

          <h2 className="text-xl font-semibold mt-8">Why We Built This</h2>
          <p className="text-[var(--muted)]">
            Healthcare executives and suppliers need quick access to the right
            information. Whether you&apos;re looking for the next industry conference,
            a GPO contact, a great healthcare podcast, or the latest regulatory
            updates — it should be one search away, not scattered across dozens of
            bookmarks.
          </p>

          <h2 className="text-xl font-semibold mt-8">Submit a Resource</h2>
          <p className="text-[var(--muted)]">
            Know something that should be on this list?{" "}
            <Link href="/#submit" className="text-[var(--primary)] hover:underline">
              Submit a resource
            </Link>{" "}
            and we&apos;ll review it for inclusion.
          </p>

          <h2 className="text-xl font-semibold mt-8">About IHES</h2>
          <p className="text-[var(--muted)]">
            IHES connects hospital executives with industry suppliers through
            premier events including IHES, CSCE, CPES, and MUIA — bringing together
            the people who run healthcare with the companies that support them.
          </p>
          <p>
            <a
              href="https://www.ihesllc.com"
              target="_blank"
              rel="noopener noreferrer"
              className="inline-flex items-center gap-2 rounded-lg bg-[var(--primary)] px-5 py-2.5 text-sm font-medium text-white hover:opacity-90 transition-opacity"
            >
              Visit IHES &rarr;
            </a>
          </p>
        </div>
      </main>
    </>
  );
}

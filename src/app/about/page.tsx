import type { Metadata } from "next";
import Link from "next/link";
import SiteFooter from "@/components/SiteFooter";
import IhesCtaLink from "@/components/IhesCtaLink";
import AboutHeaderShim from "@/components/AboutHeaderShim";

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

type Division = {
  code: "IHES" | "CPES" | "MUIA" | "CSCE";
  full: string;
  meta: string;
  chip: string;
  asset?: string;
};

// All wordmark PNGs are colored-letters-on-transparent, so render them on cream
// rather than the brand-color chip (which would erase the wordmark).
const DIVISIONS: Division[] = [
  {
    code: "IHES",
    full: "Institute of Healthcare Executives & Suppliers",
    meta: "Flagship meetings each March & September",
    chip: "bg-card",
    asset: "/assets/ihes.png",
  },
  {
    code: "CPES",
    full: "Council of Pharmacy Executives & Suppliers",
    meta: "October",
    chip: "bg-card",
    asset: "/assets/cpes.png",
  },
  {
    code: "MUIA",
    full: "Med Use Intelligence & Automation",
    meta: "October, alongside CPES",
    chip: "bg-card",
    asset: "/assets/muia.png",
  },
  {
    code: "CSCE",
    full: "Council of Supply Chain Executives",
    meta: "November",
    chip: "bg-card",
    asset: "/assets/csce.png",
  },
];

export default function AboutPage() {
  return (
    <>
      <AboutHeaderShim />

      <main className="mx-auto max-w-[720px] px-6 sm:px-8 py-16 sm:py-20">
        {/* Eyebrow + H1 */}
        <div className="text-[11px] uppercase tracking-[0.22em] font-semibold text-oxblood mb-5">
          About
        </div>
        <h1 className="font-serif text-[40px] sm:text-[48px] leading-[1.1] tracking-[-0.02em] text-ink mb-8">
          About IDN Research
        </h1>

        {/* Lede */}
        <p className="font-serif text-[19px] leading-[1.55] text-ink-2 mb-12">
          IDN Research is the most comprehensive curated directory of
          healthcare industry resources — a labor of love I&apos;ve maintained
          for more than 22 years.
        </p>

        {/* Backstory */}
        <Section title="The Backstory">
          <p>
            I&apos;m <strong className="font-semibold text-ink">Hays Waldrop</strong>,
            founder of the Institute of Healthcare Executives and Suppliers (IHES).
            This project started as a simple Excel spreadsheet I&apos;d share with
            friends and colleagues across the industry whenever someone asked,{" "}
            <em className="font-serif italic">
              &ldquo;Hey, do you know a good resource for…?&rdquo;
            </em>
          </p>
          <p>
            Over the years, that spreadsheet kept growing. Eventually it
            outgrew the format, and I built it into the site you&apos;re using
            today — a real resource for the healthcare community I&apos;ve
            spent my career serving.
          </p>
        </Section>

        {/* What you'll find */}
        <Section title="What You'll Find Here">
          <p>
            Over 600 hand-picked resources across 20+ categories spanning the
            full healthcare ecosystem — from industry meetings and newsletters
            to GPOs, government resources, podcasts, consulting firms, and
            LinkedIn thought leaders.
          </p>
        </Section>

        {/* Why */}
        <Section title="Why It Exists">
          <p>
            Healthcare executives and suppliers need quick access to the right
            information. Whether you&apos;re looking for the next industry
            conference, a GPO contact, a great healthcare podcast, or the
            latest regulatory updates — it should be one search away, not
            scattered across dozens of bookmarks.
          </p>
        </Section>

        {/* Submit */}
        <Section title="Submit a Resource">
          <p>
            Know something that should be on this list?{" "}
            <Link
              href="/#submit"
              className="text-oxblood hover:text-oxblood-deep underline decoration-rule-strong underline-offset-4"
            >
              Submit a resource
            </Link>{" "}
            and I&apos;ll review it for inclusion.
          </p>
        </Section>

        {/* About IHES panel — raised cream2 card */}
        <aside className="mt-16 bg-cream-2 border border-rule rounded-[4px] p-8 sm:p-10">
          <div className="grid sm:grid-cols-[140px_1fr] gap-8">
            {/* Left lockup column */}
            <div className="space-y-2">
              <div className="h-10 bg-card border border-rule flex items-center justify-center rounded-[2px] px-2">
                <ChipImage asset="/assets/ihes.png" alt="IHES" />
              </div>
              <div className="h-10 bg-card border border-rule flex items-center justify-center rounded-[2px] px-2">
                <ChipImage asset="/assets/cpes.png" alt="CPES" />
              </div>
              <div className="h-10 bg-card border border-rule flex items-center justify-center rounded-[2px] px-2">
                <ChipImage asset="/assets/csce.png" alt="CSCE" />
              </div>
            </div>

            {/* Right copy column */}
            <div>
              <div className="text-[11px] uppercase tracking-[0.22em] font-semibold text-oxblood mb-2">
                The Parent Brand
              </div>
              <h2 className="font-serif text-[26px] leading-[1.2] tracking-[-0.015em] text-ink mb-4">
                About IHES
              </h2>
              <p className="text-[15px] leading-[1.65] text-ink-2 mb-6">
                IDN Research is curated and maintained by IHES, the Institute
                of Healthcare Executives and Suppliers. For over two decades,
                IHES has connected senior health system executives with the
                supplier companies that serve them — in the same room, at the
                same table.
              </p>

              {/* 2x2 grid of divisions */}
              <div className="grid grid-cols-2 gap-3 mb-6">
                {DIVISIONS.map((d) => (
                  <div
                    key={d.code}
                    className="bg-card border border-rule rounded-[3px] p-3"
                  >
                    <div
                      className={`h-9 ${d.chip} rounded-[2px] flex items-center justify-center px-2 mb-2`}
                    >
                      {d.asset ? (
                        <ChipImage asset={d.asset} alt={d.code} />
                      ) : (
                        <span
                          className="text-white font-black text-[11px] tracking-[0.06em]"
                          style={{ fontFamily: "Georgia, serif" }}
                        >
                          {d.code}
                        </span>
                      )}
                    </div>
                    <div className="text-[11px] uppercase tracking-[0.16em] text-ink font-semibold leading-tight">
                      {d.code}
                    </div>
                    <div className="text-[11px] text-ink-2 leading-snug mt-1">
                      {d.full}
                    </div>
                    <div className="text-[10.5px] uppercase tracking-[0.14em] text-ink-muted mt-1.5">
                      {d.meta}
                    </div>
                  </div>
                ))}
              </div>

              <blockquote className="font-serif italic text-[18px] text-ink text-center border-t border-b border-rule py-4 my-6">
                &ldquo;Smart people. Small rooms. Big things happen.&rdquo;
              </blockquote>

              <IhesCtaLink
                location="about_panel"
                className="inline-flex items-center gap-2 font-serif italic text-[15px] text-oxblood hover:text-oxblood-deep transition-colors"
              >
                Learn more at ihesllc.com →
              </IhesCtaLink>
            </div>
          </div>
        </aside>
      </main>

      <SiteFooter />
    </>
  );
}

function Section({
  title,
  children,
}: {
  title: string;
  children: React.ReactNode;
}) {
  return (
    <section className="mb-12">
      <h2 className="font-serif text-[26px] leading-[1.2] tracking-[-0.015em] text-ink mb-4">
        {title}
      </h2>
      <div className="space-y-4 text-[15px] leading-[1.65] text-ink-2">
        {children}
      </div>
    </section>
  );
}

function ChipImage({ asset, alt }: { asset: string; alt: string }) {
  // plain <img> here — these are tiny brand wordmarks shipped with the site,
  // not user content; using next/image adds layout overhead with no benefit.
  /* eslint-disable-next-line @next/next/no-img-element */
  return <img src={asset} alt={alt} className="h-5 w-auto object-contain" />;
}


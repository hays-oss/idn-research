import type { Metadata } from "next";
import SubmitResourceForm from "@/components/SubmitResourceForm";
import { getAllResourceCategories } from "@/lib/resourceQueries";
import SiteFooter from "@/components/SiteFooter";
import AboutHeaderShim from "@/components/AboutHeaderShim";

export const revalidate = 3600;

export const metadata: Metadata = {
  title: "Contact IDN Research — Talk to IHES",
  description:
    "Get in touch with IDN Research. Submit a resource, ask a question, or explore collaboration with IHES.",
  alternates: { canonical: "https://idnresearch.com/contact" },
  openGraph: {
    title: "Contact IDN Research — Talk to IHES",
    description:
      "Get in touch with IDN Research. Submit a resource, ask a question, or explore collaboration with IHES.",
    url: "https://idnresearch.com/contact",
    type: "website",
  },
};

export default async function ContactPage() {
  const categories = await getAllResourceCategories();

  return (
    <>
      <AboutHeaderShim />

      <main className="mx-auto max-w-[720px] px-6 sm:px-8 py-16 sm:py-20">
        <div className="text-[11px] uppercase tracking-[0.22em] font-semibold text-oxblood mb-5">
          Contact
        </div>
        <h1 className="font-serif text-[40px] sm:text-[48px] leading-[1.1] tracking-[-0.02em] text-ink mb-6">
          Contact IDN Research
        </h1>
        <p className="font-serif text-[19px] leading-[1.55] text-ink-2 mb-12">
          Have a resource we should add to the directory, a question for the
          team, or interest in partnering with IHES? Use the form below — it
          goes straight to Hays.
        </p>

        <SubmitResourceForm categories={categories} />

        <section className="mt-16 bg-cream-2 border border-rule rounded-[4px] p-8">
          <div className="text-[11px] uppercase tracking-[0.22em] font-semibold text-oxblood mb-3">
            Reach Hays Directly
          </div>
          <h2 className="font-serif text-[22px] tracking-[-0.01em] text-ink mb-5">
            Founder, IHES
          </h2>
          <dl className="grid gap-y-3 gap-x-6 text-[14px] sm:grid-cols-[140px_1fr]">
            <dt className="text-ink-muted uppercase tracking-[0.14em] text-[11px] font-semibold pt-0.5">
              Name
            </dt>
            <dd className="font-serif text-ink text-[16px]">Hays Waldrop</dd>

            <dt className="text-ink-muted uppercase tracking-[0.14em] text-[11px] font-semibold pt-0.5">
              Email
            </dt>
            <dd>
              <a
                href="mailto:Hays@ihesllc.com"
                className="text-oxblood hover:text-oxblood-deep underline decoration-rule-strong underline-offset-4"
              >
                Hays@ihesllc.com
              </a>
            </dd>

            <dt className="text-ink-muted uppercase tracking-[0.14em] text-[11px] font-semibold pt-0.5">
              Phone
            </dt>
            <dd>
              <a
                href="tel:+16156694437"
                className="text-ink hover:text-oxblood transition-colors"
              >
                (615) 669-IHES
              </a>
            </dd>

            <dt className="text-ink-muted uppercase tracking-[0.14em] text-[11px] font-semibold pt-0.5">
              IHES
            </dt>
            <dd>
              <a
                href="https://www.ihesllc.com"
                target="_blank"
                rel="noopener noreferrer"
                className="text-oxblood hover:text-oxblood-deep underline decoration-rule-strong underline-offset-4"
              >
                ihesllc.com
              </a>
            </dd>
          </dl>
        </section>
      </main>

      <SiteFooter />
    </>
  );
}

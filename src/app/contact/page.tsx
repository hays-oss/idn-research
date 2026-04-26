import type { Metadata } from "next";
import Link from "next/link";
import SubmitResourceForm from "@/components/SubmitResourceForm";
import { getAllResourceCategories } from "@/lib/resourceQueries";

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
        <h1 className="text-3xl font-bold text-foreground mb-3">
          Contact IDN Research
        </h1>
        <p className="text-base text-muted mb-10 max-w-2xl">
          Have a resource we should add to the directory, a question for the
          team, or interest in partnering with IHES? Use the form below — it
          goes straight to Hays.
        </p>

        <SubmitResourceForm categories={categories} />

        <section className="mt-12 rounded-xl border border-border bg-surface p-6 sm:p-8">
          <h2 className="text-lg font-semibold text-foreground">
            Reach Hays directly
          </h2>
          <dl className="mt-4 grid gap-3 text-sm sm:grid-cols-[160px_1fr]">
            <dt className="text-muted">Founder, IHES</dt>
            <dd className="font-medium text-foreground">Hays Waldrop</dd>

            <dt className="text-muted">Email</dt>
            <dd>
              <a
                href="mailto:Hays@ihesllc.com"
                className="font-medium text-primary hover:underline"
              >
                Hays@ihesllc.com
              </a>
            </dd>

            <dt className="text-muted">Phone</dt>
            <dd>
              <a
                href="tel:+16156694437"
                className="font-medium text-foreground hover:text-primary transition-colors"
              >
                (615) 669-IHES
              </a>
            </dd>

            <dt className="text-muted">IHES</dt>
            <dd>
              <a
                href="https://www.ihesllc.com"
                target="_blank"
                rel="noopener noreferrer"
                className="font-medium text-primary hover:underline"
              >
                ihesllc.com
              </a>
            </dd>
          </dl>
        </section>
      </main>
    </>
  );
}

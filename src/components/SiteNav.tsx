import Link from "next/link";

export default function SiteNav() {
  return (
    <nav className="bg-cream border-b border-rule px-4 sm:px-8 lg:px-12">
      <div className="flex h-14 items-center justify-between">
        <Link href="/" className="flex items-center gap-3">
          <div className="flex h-8 w-8 items-center justify-center rounded-[3px] bg-ink text-gold font-serif font-semibold text-sm tracking-tight">
            IDN
          </div>
          <div className="hidden sm:block">
            <div className="font-serif text-base text-ink leading-tight tracking-tight">
              IDN Research
            </div>
            <div className="text-[9px] uppercase tracking-[0.18em] text-oxblood font-semibold leading-tight">
              Healthcare Resource Intelligence
            </div>
          </div>
        </Link>
        <div className="flex items-center gap-6 text-sm">
          <Link
            href="/"
            className="font-serif italic text-oxblood hover:text-ink transition-colors"
          >
            Home
          </Link>
          <Link
            href="/directory"
            className="font-serif italic text-oxblood hover:text-ink transition-colors"
          >
            Directory
          </Link>
          <Link
            href="/calendar"
            className="font-serif italic text-oxblood hover:text-ink transition-colors"
          >
            Meeting Calendar
          </Link>
          <Link
            href="/about"
            className="font-serif italic text-oxblood hover:text-ink transition-colors"
          >
            About
          </Link>
          <Link
            href="/contact"
            className="rounded-[3px] border border-ink bg-ink px-4 py-1.5 text-xs font-sans font-semibold uppercase tracking-[0.12em] text-cream hover:bg-oxblood hover:border-oxblood transition-colors"
          >
            Contact
          </Link>
        </div>
      </div>
    </nav>
  );
}

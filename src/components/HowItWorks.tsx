"use client";

const steps = [
  {
    label: "Discover",
    description: "Search companies, resources, and industry leaders",
    icon: (
      <svg className="h-8 w-8" fill="none" stroke="currentColor" viewBox="0 0 24 24" strokeWidth={1.5}>
        <path strokeLinecap="round" strokeLinejoin="round" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
      </svg>
    ),
  },
  {
    label: "Filter",
    description: "Narrow by domain, organization, tags, and more",
    icon: (
      <svg className="h-8 w-8" fill="none" stroke="currentColor" viewBox="0 0 24 24" strokeWidth={1.5}>
        <path strokeLinecap="round" strokeLinejoin="round" d="M10.5 6h9.75M10.5 6a1.5 1.5 0 11-3 0m3 0a1.5 1.5 0 10-3 0M3.75 6H7.5m3 12h9.75m-9.75 0a1.5 1.5 0 01-3 0m3 0a1.5 1.5 0 00-3 0m-3.75 0H7.5m9-6h3.75m-3.75 0a1.5 1.5 0 01-3 0m3 0a1.5 1.5 0 00-3 0m-9.75 0h9.75" />
      </svg>
    ),
  },
  {
    label: "Connect",
    description: "Access direct links, LinkedIn profiles, and company details",
    icon: (
      <svg className="h-8 w-8" fill="none" stroke="currentColor" viewBox="0 0 24 24" strokeWidth={1.5}>
        <path strokeLinecap="round" strokeLinejoin="round" d="M13.19 8.688a4.5 4.5 0 011.242 7.244l-4.5 4.5a4.5 4.5 0 01-6.364-6.364l1.757-1.757m9.86-2.06a4.5 4.5 0 00-1.242-7.244l-4.5-4.5a4.5 4.5 0 00-6.364 6.364L4.34 8.374" />
      </svg>
    ),
  },
];

export default function HowItWorks() {
  return (
    <section className="bg-cream-2 border-y border-rule py-12 sm:py-14">
      <div className="max-w-4xl mx-auto px-4 sm:px-6">
        <div className="text-center text-[10px] uppercase tracking-[0.22em] font-semibold text-oxblood mb-8">
          How It Works
        </div>
        <div className="grid grid-cols-1 sm:grid-cols-3 gap-10 text-center">
          {steps.map((step, idx) => (
            <div key={step.label} className="relative">
              {idx > 0 && (
                <span
                  aria-hidden
                  className="hidden sm:block absolute -left-5 top-4 h-px w-10 bg-rule-strong"
                />
              )}
              <div className="inline-flex items-center justify-center text-oxblood mb-3">
                {step.icon}
              </div>
              <h3 className="font-serif text-[20px] tracking-[-0.01em] text-ink mb-2">
                {step.label}
              </h3>
              <p className="text-[14px] leading-[1.6] text-ink-2 max-w-[28ch] mx-auto">
                {step.description}
              </p>
            </div>
          ))}
        </div>
      </div>
    </section>
  );
}

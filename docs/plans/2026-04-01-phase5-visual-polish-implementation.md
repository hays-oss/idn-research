# Phase 5: Visual Polish & Onboarding — Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Add a hero section, "How It Works" strip, section intros, upgraded cards, and a teal/coral color pop to the IDN Research homepage.

**Architecture:** Extend existing CSS custom properties with new colors/gradients. Create two new components (HeroSection, HowItWorks). Modify existing card and section components with upgraded styling. No structural changes to data flow or routing.

**Tech Stack:** Next.js 16.2.1, React 19, Tailwind CSS v4 with `@theme inline`, Supabase (read-only for stat counts in hero). No new dependencies — using inline SVGs for icons (project uses no icon library).

---

### Task 1: Add Color Pop — New CSS Tokens

**Files:**
- Modify: `src/app/globals.css`

**Step 1: Add new CSS custom properties and Tailwind theme tokens**

In `src/app/globals.css`, add the new color variables to `:root` and register them in `@theme inline`:

```css
:root {
  --background: #f0f7f2;
  --foreground: #1a2e1a;
  --primary: #1a5632;
  --primary-light: #237243;
  --accent: #e5b84c;
  --accent-light: #f0d078;
  --surface: #e8f1eb;
  --border: #c8ddd0;
  --muted: #5a7a64;
  --header-bg: #1a5632;
  --teal: #0d9488;
  --teal-light: #14b8a6;
  --coral: #e87461;
  --coral-light: #f09a8d;
  --gradient-hero: linear-gradient(135deg, #1a5632, #0d7a6a);
  --gradient-btn: linear-gradient(135deg, #1a5632, #237243);
}
```

Add to `@theme inline`:
```css
  --color-teal: var(--teal);
  --color-teal-light: var(--teal-light);
  --color-coral: var(--coral);
  --color-coral-light: var(--coral-light);
```

Note: `--accent` changes from `#c5a84c` to `#e5b84c`, and `--accent-light` from `#d4bc6a` to `#f0d078`.

**Step 2: Verify the dev server starts without errors**

Run: `npm run dev`
Expected: Server starts, no CSS parse errors.

**Step 3: Commit**

```bash
git add src/app/globals.css
git commit -m "feat: add teal, coral, gradient color tokens to design system"
```

---

### Task 2: Create HeroSection Component

**Files:**
- Create: `src/components/HeroSection.tsx`

**Step 1: Create the HeroSection component**

```tsx
"use client";

interface HeroSectionProps {
  companyCount: number;
  domainCount: number;
  tagCount: number;
  searchQuery: string;
  onSearch: (query: string) => void;
}

export default function HeroSection({
  companyCount,
  domainCount,
  tagCount,
  searchQuery,
  onSearch,
}: HeroSectionProps) {
  return (
    <section
      className="relative overflow-hidden py-16 sm:py-20 text-center"
      style={{ background: "var(--gradient-hero)" }}
    >
      {/* Subtle geometric pattern overlay */}
      <div
        className="absolute inset-0 opacity-[0.06]"
        style={{
          backgroundImage:
            "radial-gradient(circle at 25% 25%, rgba(255,255,255,0.2) 1px, transparent 1px), radial-gradient(circle at 75% 75%, rgba(255,255,255,0.15) 1px, transparent 1px)",
          backgroundSize: "60px 60px",
        }}
      />

      <div className="relative max-w-3xl mx-auto px-4 sm:px-6">
        {/* Headline */}
        <h1 className="text-2xl sm:text-3xl lg:text-4xl font-bold text-white mb-4 leading-tight">
          Empowering Healthcare through Executive Intelligence
        </h1>

        {/* Subtitle */}
        <p className="text-base sm:text-lg text-white/80 max-w-2xl mx-auto mb-10">
          Connecting healthcare leaders with the companies, resources, and
          insights that matter — powered by IHES
        </p>

        {/* Stat counters */}
        <div className="flex flex-col sm:flex-row items-center justify-center gap-6 sm:gap-10 mb-10">
          {[
            { value: `${companyCount}+`, label: "Companies" },
            { value: `${domainCount}`, label: "Domains" },
            { value: `${tagCount}+`, label: "Tags" },
          ].map((stat) => (
            <div key={stat.label} className="text-center">
              <div className="text-3xl sm:text-4xl font-bold text-[var(--accent)]">
                {stat.value}
              </div>
              <div className="text-sm text-white/70 mt-1">{stat.label}</div>
            </div>
          ))}
        </div>

        {/* Search bar */}
        <div className="max-w-xl mx-auto relative">
          <svg
            className="absolute left-4 top-1/2 -translate-y-1/2 h-5 w-5 text-muted"
            fill="none"
            stroke="currentColor"
            viewBox="0 0 24 24"
          >
            <path
              strokeLinecap="round"
              strokeLinejoin="round"
              strokeWidth={2}
              d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"
            />
          </svg>
          <input
            type="text"
            value={searchQuery}
            onChange={(e) => onSearch(e.target.value)}
            placeholder="Search companies, resources, and more..."
            className="w-full rounded-full bg-white py-3.5 pl-12 pr-5 text-sm text-foreground shadow-lg placeholder:text-muted focus:outline-none focus:ring-2 focus:ring-[var(--accent)] focus:ring-offset-2 focus:ring-offset-transparent"
          />
          {searchQuery && (
            <button
              onClick={() => onSearch("")}
              className="absolute right-4 top-1/2 -translate-y-1/2 text-muted hover:text-foreground transition-colors"
            >
              <svg
                className="h-4 w-4"
                fill="none"
                stroke="currentColor"
                viewBox="0 0 24 24"
              >
                <path
                  strokeLinecap="round"
                  strokeLinejoin="round"
                  strokeWidth={2}
                  d="M6 18L18 6M6 6l12 12"
                />
              </svg>
            </button>
          )}
        </div>
      </div>
    </section>
  );
}
```

**Step 2: Verify it renders by importing in HomePage (next task wires it in)**

No standalone test — this gets wired in Task 4.

**Step 3: Commit**

```bash
git add src/components/HeroSection.tsx
git commit -m "feat: add HeroSection component with headline, stats, and search"
```

---

### Task 3: Create HowItWorks Component

**Files:**
- Create: `src/components/HowItWorks.tsx`

**Step 1: Create the HowItWorks component**

```tsx
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
    <section className="bg-surface py-10 sm:py-12">
      <div className="max-w-3xl mx-auto px-4 sm:px-6">
        <div className="grid grid-cols-1 sm:grid-cols-3 gap-8 text-center">
          {steps.map((step) => (
            <div key={step.label}>
              <div className="inline-flex items-center justify-center text-teal mb-3">
                {step.icon}
              </div>
              <h3 className="text-sm font-bold text-foreground mb-1">
                {step.label}
              </h3>
              <p className="text-sm text-muted">{step.description}</p>
            </div>
          ))}
        </div>
      </div>
    </section>
  );
}
```

**Step 2: Commit**

```bash
git add src/components/HowItWorks.tsx
git commit -m "feat: add HowItWorks 3-column explainer strip"
```

---

### Task 4: Wire Hero + HowItWorks into HomePage

**Files:**
- Modify: `src/components/HomePage.tsx`

**Step 1: Import the new components**

Add at the top of `HomePage.tsx` with the other imports:
```tsx
import HeroSection from "@/components/HeroSection";
import HowItWorks from "@/components/HowItWorks";
```

**Step 2: Compute tag count for stats**

Inside the `Home` component, after the existing `useMemo` blocks (around line 237), add:
```tsx
const uniqueTagCount = useMemo(() => {
  const tags = new Set<string>();
  for (const r of resources) {
    for (const t of r.tags ?? []) tags.add(t);
  }
  return tags.size;
}, [resources]);

const totalCompanyCount = useMemo(
  () => directoryDomains.reduce((sum, d) => sum + d.totalCompanies, 0),
  [directoryDomains]
);
```

**Step 3: Replace the old hero stats block with HeroSection + HowItWorks**

In the JSX, find the section after `<main className="flex-1 lg:ml-64 min-w-0">` and the `<div className="max-w-[1200px]...` wrapper.

Replace the existing hero stats block (lines 286-297, the `!searchQuery && !activeTag` block with the h1 and p) with the HeroSection and HowItWorks placed **above** the `<div className="max-w-[1200px]...` wrapper, but still inside `<main>`:

The new structure of `<main>` becomes:

```tsx
<main className="flex-1 lg:ml-64 min-w-0">
  {/* Hero + How It Works — full-width, above content */}
  {!searchQuery && !activeTag && (
    <>
      <HeroSection
        companyCount={totalCompanyCount}
        domainCount={directoryDomains.length}
        tagCount={uniqueTagCount}
        searchQuery={searchQuery}
        onSearch={setSearchQuery}
      />
      <HowItWorks />
    </>
  )}

  <div className="max-w-[1200px] px-4 sm:px-6 lg:px-8 py-8">
    {/* Remove the old hero stats block that was here */}

    {/* Active tag filter bar — unchanged */}
    {activeTag && ( ... )}

    {/* Search results header — unchanged */}
    {searchQuery && !activeTag && ( ... )}

    {/* Rest of content unchanged */}
    ...
  </div>

  {/* Footer — unchanged */}
  <footer>...</footer>
</main>
```

Remove the old hero block (lines 286-297) entirely since HeroSection replaces it.

**Step 4: Verify in browser**

Run: `npm run dev`
Open `http://localhost:3000`. Verify:
- Hero banner appears with gradient background, headline, subtitle, 3 stat counters, search bar
- "How It Works" strip appears below hero with 3 columns
- Hero search bar works (typing filters content below)
- When a search is active or tag filter active, hero + HowItWorks hide
- Rest of page unchanged

**Step 5: Commit**

```bash
git add src/components/HomePage.tsx
git commit -m "feat: wire HeroSection and HowItWorks into homepage"
```

---

### Task 5: Upgrade ResourceCard Styling

**Files:**
- Modify: `src/components/ResourceCard.tsx`

**Step 1: Add left accent bar, hover lift, rounded-xl, more padding, tag cap**

Replace the outer `<div>` wrapper class (line 29):

Old:
```tsx
<div className="group rounded-lg border border-border bg-white px-4 py-2.5 transition-all hover:border-primary/30 hover:shadow-sm">
```

New:
```tsx
<div className="group rounded-xl border border-border bg-white pl-0 pr-4 py-2.5 transition-all duration-200 ease-out hover:border-teal/30 hover:shadow-md hover:-translate-y-0.5 flex">
  {/* Left accent bar */}
  <div className="w-1 shrink-0 rounded-l-xl bg-teal/60 group-hover:bg-teal transition-colors" />
  <div className="flex-1 min-w-0 pl-3">
```

Close the inner `<div className="flex-1 min-w-0 pl-3">` at the end of the card content, before the outer `</div>`.

For the tag cap, replace the tags section (lines 89-106) with:

```tsx
{hasTags && (
  <div className="flex flex-wrap gap-1 mt-1.5">
    {resource.tags.slice(0, 3).map((tag) => (
      <button
        key={tag}
        onClick={(e) => {
          e.stopPropagation();
          onTagClick?.(tag);
        }}
        className={`rounded px-1.5 py-0.5 text-[10px] transition-colors ${
          activeTag === tag
            ? "bg-primary text-white"
            : "bg-surface/70 text-muted hover:bg-primary/10 hover:text-primary"
        }`}
      >
        {tag}
      </button>
    ))}
    {resource.tags.length > 3 && (
      <span className="rounded px-1.5 py-0.5 text-[10px] text-muted bg-surface/50">
        +{resource.tags.length - 3} more
      </span>
    )}
  </div>
)}
```

**Step 2: Verify in browser**

Check resource cards have:
- Teal left accent bar
- Rounded-xl corners
- Hover lift effect with shadow
- Tags capped at 3 with "+N more"

**Step 3: Commit**

```bash
git add src/components/ResourceCard.tsx
git commit -m "feat: upgrade ResourceCard with accent bar, hover lift, tag cap"
```

---

### Task 6: Upgrade CompanyCard Styling

**Files:**
- Modify: `src/components/CompanyCard.tsx`

**Step 1: Add hover lift, rounded-xl, bolder name**

Replace the outer wrapper class (line 23):

Old:
```tsx
<div className="group rounded-lg border border-border bg-white px-4 py-2.5 transition-all hover:border-primary/30 hover:shadow-sm">
```

New:
```tsx
<div className="group rounded-xl border border-border bg-white px-4 py-3 transition-all duration-200 ease-out hover:border-teal/30 hover:shadow-md hover:-translate-y-0.5">
```

Update the company name span (line 33):

Old:
```tsx
<span className="text-sm font-medium text-foreground group-hover:text-primary truncate">
```

New:
```tsx
<span className="text-base font-bold text-foreground group-hover:text-primary truncate">
```

**Step 2: Verify in browser**

Check company cards in the directory preview section have:
- `rounded-xl` corners
- Hover lift with teal border
- Bolder, slightly larger company name

**Step 3: Commit**

```bash
git add src/components/CompanyCard.tsx
git commit -m "feat: upgrade CompanyCard with hover lift, bolder name, rounded-xl"
```

---

### Task 7: Upgrade InfluencerCard Styling

**Files:**
- Modify: `src/components/InfluencerCard.tsx`

**Step 1: Add hover lift, rounded-xl, larger avatar with shadow**

Replace the outer `<a>` tag classes (line 15):

Old:
```tsx
className="group flex items-center gap-3 rounded-lg border border-border bg-white px-4 py-3 transition-all hover:border-blue-300 hover:shadow-sm"
```

New:
```tsx
className="group flex items-center gap-3 rounded-xl border border-border bg-white px-4 py-3 transition-all duration-200 ease-out hover:border-blue-300 hover:shadow-md hover:-translate-y-0.5"
```

Update the avatar div (line 17):

Old:
```tsx
<div className="flex h-10 w-10 shrink-0 items-center justify-center rounded-full bg-blue-50 text-sm font-bold text-blue-700">
```

New:
```tsx
<div className="flex h-14 w-14 shrink-0 items-center justify-center rounded-full bg-gradient-to-br from-blue-50 to-blue-100 text-base font-bold text-blue-700 shadow-sm">
```

**Step 2: Verify in browser**

Check influencer cards have:
- Rounded-xl corners
- Hover lift with shadow
- Larger avatar (56px) with subtle gradient and shadow

**Step 3: Commit**

```bash
git add src/components/InfluencerCard.tsx
git commit -m "feat: upgrade InfluencerCard with hover lift, larger gradient avatar"
```

---

### Task 8: Add Section Intros

**Files:**
- Modify: `src/components/CategorySection.tsx`
- Modify: `src/components/HomePage.tsx`

**Step 1: CategorySection already has description support**

The `CategorySection` component already renders `category.description` if present (lines 25-27). No changes needed to the component itself — descriptions come from the database `resource_categories.description` field.

If descriptions aren't populated in the database, add static intro text directly in `HomePage.tsx` instead.

Add intro text above the LinkedIn Influencers section in `HomePage.tsx`. Find the influencers heading (line 372-377) and add a subtitle:

After the existing heading `<h2>` and count badge `</div>`:
```tsx
<p className="text-sm sm:text-base text-muted max-w-2xl mb-4">
  Follow the voices shaping healthcare leadership — executives and thought leaders active on LinkedIn.
</p>
```

Note: the `mb-4` on the parent `<div>` (line 371) should be changed to `mb-2` since the new `<p>` provides spacing.

**Step 2: Add intro to Company Directory preview section**

Find the Company Directory heading block in `HomePage.tsx` (around line 393-395). After the existing `<p>` with company counts, add or replace with:

```tsx
<p className="text-sm text-muted mt-1">
  Browse {filteredDirectoryDomains.reduce((s, d) => s + d.totalCompanies, 0)} healthcare companies across{" "}
  {filteredDirectoryDomains.length} domains — from medical devices to health IT.
</p>
```

This replaces the existing `<p>` (line 394) with more descriptive text.

**Step 3: Verify in browser**

Check:
- LinkedIn Influencers section has intro text below heading
- Company Directory section has descriptive intro text

**Step 4: Commit**

```bash
git add src/components/HomePage.tsx
git commit -m "feat: add section intro text for influencers and directory"
```

---

### Task 9: Build Verification

**Files:** None — verification only.

**Step 1: Run the production build**

Run: `npm run build`
Expected: Build succeeds with no errors.

**Step 2: Fix any build errors**

If TypeScript or build errors occur, fix them and re-run.

**Step 3: Visual spot-check**

Run `npm run dev` and verify in browser:
1. Hero section renders with gradient, headline, stats, search
2. "How It Works" strip shows 3 columns below hero
3. Resource cards have left accent bar, hover lift, tag cap
4. Company cards have bolder name, hover lift
5. Influencer cards have larger avatar, hover lift
6. Section intros appear for influencers and directory
7. Hero hides when searching or filtering by tag
8. Mobile: hero stacks properly, cards are full-width

**Step 4: Final commit if any fixes were needed**

```bash
git add -A
git commit -m "fix: resolve build issues from Phase 5 visual polish"
```

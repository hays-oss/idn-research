# Phase 5: Visual Polish & Onboarding — Design

**Date:** 2026-04-01
**Status:** Draft — wording may be revised

## Overview

A visual polish pass on the public-facing homepage to add a professional hero section, upgrade card components, add contextual section intros, and introduce a color pop to the existing IHES green palette. Goal: make the site feel like a modern, approachable healthcare platform rather than a raw data tool.

**Audience:** Healthcare executives and medical device sales reps equally.
**Tone:** Modern and approachable (think Doximity, Becker's — clean but not stuffy).

## Decisions

| Decision | Choice | Rationale |
|----------|--------|-----------|
| Approach | Polish pass (Approach A) | Highest ROI per hour; no structural changes, just visual upgrades |
| Color additions | Teal + coral accents | Adds energy without clashing with IHES green brand |
| Hero copy | "Empowering Healthcare through Executive Intelligence" | Aspirational, positions platform as strategic tool |
| Card changes | Accent bars, hover lift, softer radius | Modern feel without redesigning card layouts |

## 1. Hero Section

New full-width hero banner at the top of the homepage, above all content.

### Layout

```
┌─────────────────────────────────────────────────────────┐
│  (gradient: deep IHES green → teal-green)               │
│                                                         │
│     Empowering Healthcare through Executive Intelligence│
│                                                         │
│     Connecting healthcare leaders with the companies,   │
│     resources, and insights that matter — powered by    │
│     IHES                                                │
│                                                         │
│     [ 572+ Companies ]  [ 14 Domains ]  [ 350+ Tags ]  │
│                                                         │
│     [ 🔍 Search companies, resources, and more...     ] │
│                                                         │
└─────────────────────────────────────────────────────────┘
```

### Specs

- **Background**: CSS gradient from `#1a5632` (IHES green) → `#0d7a6a` (teal-green), angled ~135deg
- **Subtle texture**: Soft geometric pattern or gradient mesh overlay at low opacity (~5-8%) for depth
- **Headline**: White, bold, ~2rem/`text-3xl sm:text-4xl`, centered
- **Subtitle**: White/80% opacity, regular weight, ~1.1rem/`text-lg`, centered, max-width ~640px
- **Stat counters**: 3 inline blocks with gold accent (`#e5b84c`) numbers, white labels, slight scale-up animation on scroll into view
- **Search bar**: Full-width (max ~560px), white background, rounded-full, drop shadow, mirrors header search functionality
- **Padding**: `py-16 sm:py-20` for breathing room
- **Mobile**: Stack stat counters vertically, reduce headline to `text-2xl`

### Copy

- **Headline**: "Empowering Healthcare through Executive Intelligence"
- **Subtitle**: "Connecting healthcare leaders with the companies, resources, and insights that matter — powered by IHES"
- Wording may be revised — this is the approved direction.

## 2. "How It Works" Strip

A 3-column explainer strip between the hero and the main content. Light background to visually separate the sections.

### Layout

```
┌─────────────────────────────────────────────────────────┐
│  (bg: surface/light mint)                               │
│                                                         │
│   🔍 Discover        ⚙️ Filter         🔗 Connect      │
│   Search companies,  Narrow by domain, Access direct    │
│   resources, and     organization,     links, LinkedIn  │
│   industry leaders   tags, and more    profiles, and    │
│                                        company details  │
└─────────────────────────────────────────────────────────┘
```

### Specs

- **Background**: `var(--surface)` (#e8f1eb) or slightly lighter
- **Icons**: Teal accent color (`#0d9488`), ~32px, simple line-style (Lucide icons)
- **Label**: Bold, `text-sm`, foreground color
- **Description**: Muted, `text-sm`, 1-2 lines max
- **Layout**: 3-column grid on desktop, stack on mobile
- **Padding**: `py-10 sm:py-12`

## 3. Color Pop — Palette Additions

Extend the existing CSS custom properties in `globals.css`:

| Token | Current | New | Use |
|-------|---------|-----|-----|
| `--accent` | `#c5a84c` | `#e5b84c` | Slightly more saturated gold for stat numbers, CTAs |
| `--accent-light` | `#d4bc6a` | `#f0d078` | Lighter gold for hover states |
| `--teal` | (new) | `#0d9488` | Secondary accent: icons, hover borders, links |
| `--teal-light` | (new) | `#14b8a6` | Teal hover state |
| `--coral` | (new) | `#e87461` | "New" badges, notifications, attention items |
| `--coral-light` | (new) | `#f09a8d` | Coral hover state |

### Gradient Tokens

| Token | Value | Use |
|-------|-------|-----|
| `--gradient-hero` | `linear-gradient(135deg, #1a5632, #0d7a6a)` | Hero background |
| `--gradient-btn` | `linear-gradient(135deg, #1a5632, #237243)` | Primary button hover |

### Application

- **Primary buttons**: Add gradient on hover instead of flat color shift
- **Active sidebar items**: Teal left-border accent instead of just bold text
- **Links in content**: Teal instead of primary green (more contrast, feels clickable)
- **"New" badges**: Coral pill on recently added resources

## 4. Card Upgrades

### Resource Cards

- Add **4px left accent bar** in the category's color (or teal fallback)
- **Hover effect**: `translateY(-2px)` + `shadow-md` + border shifts to `teal/30`
- Organization badges: slightly larger pills, existing org colors
- Tags: cap visible tags at 3, show "+N more" chip for overflow
- **Border radius**: `rounded-lg` → `rounded-xl`
- **Padding**: increase from `p-3` to `p-4` for breathing room

### Company Cards (Homepage Preview)

- Add **domain color dot** (8px circle) before company name
- Company name: `font-semibold` → `font-bold`, bump to `text-base`
- Truncated description with teal "View in Directory →" link
- Same hover lift as resource cards
- **Border radius**: `rounded-xl`

### Influencer Cards

- Header strip: **subtle gradient** (LinkedIn blue → 10% lighter)
- Initials avatar: larger (48px → 56px), add soft `shadow-sm`
- Add role/title as muted secondary line under name
- Same hover lift pattern
- **Border radius**: `rounded-xl`

### All Cards — Shared

- `rounded-xl` border radius
- Hover: `translateY(-2px)`, `shadow-md`, border color → `teal/30`
- `transition-all duration-200 ease-out`
- Slightly more padding for breathing room

## 5. Section Intros

Add 1-2 sentence descriptions below each section heading on the homepage.

| Section | Intro Text |
|---------|-----------|
| Resources | "Curated publications, tools, and industry reports organized by category — from GPO contracting to supply chain strategy." |
| LinkedIn Influencers | "Follow the voices shaping healthcare leadership — executives and thought leaders active on LinkedIn." |
| Company Directory | "Browse 572+ healthcare companies across 14 domains — from medical devices to health IT." + teal "Explore the full directory →" link |

### Specs

- **Style**: `text-muted`, `text-sm sm:text-base`, `max-w-2xl`
- **Position**: Directly below section heading, above the content grid
- **Mobile**: Same text, no truncation (it's only 1-2 lines)

## 6. Files Modified

| File | Changes |
|------|---------|
| `src/app/globals.css` | Add teal, coral, gradient CSS custom properties |
| `src/components/HomePage.tsx` | Add Hero, HowItWorks strip, section intros, reorganize top |
| `src/components/ResourceCard.tsx` | Left accent bar, hover lift, tag cap, rounded-xl |
| `src/components/CompanyCard.tsx` | Domain dot, bolder name, teal link, hover lift |
| `src/components/InfluencerCard.tsx` | Gradient header, larger avatar, title line, hover lift |
| `src/components/CategorySection.tsx` | Section intro text below heading |

### New Components (extracted from HomePage)

| File | Purpose |
|------|---------|
| `src/components/HeroSection.tsx` | Hero banner with headline, subtitle, stats, search |
| `src/components/HowItWorks.tsx` | 3-column explainer strip |

### No Changes To

- `/directory` page (already has its own header/layout)
- Admin pages
- Database schema
- API routes

## 7. Mobile Considerations

- Hero: Stack stat counters, reduce headline size, search bar full-width with less padding
- How It Works: Single column stack
- Cards: Full-width, same hover effects (touch-friendly tap targets already exist)
- Section intros: Keep visible, they're short enough

## 8. Out of Scope

- Page restructuring / reordering sections (that's Approach B territory)
- New illustrations or custom icon sets
- Testimonials or social proof
- Animation libraries (CSS transitions only)
- Changes to the /directory page

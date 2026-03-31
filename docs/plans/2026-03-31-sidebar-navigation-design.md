# Sidebar Navigation Redesign

## Problem
21 categories in a horizontal scrolling strip. Most are hidden off-screen. Long category names ("Industry Meetings — Revenue Cycle") make it worse. The page is an overwhelming wall of 300+ links.

## Solution
Replace horizontal category nav with a fixed left sidebar. Group "Industry Meetings" sub-categories under a collapsible parent. Clean up resource cards.

## Layout
- **Sidebar**: 260px fixed left, full height, independently scrollable
- **Main content**: fills remaining width, scrolls independently
- **Header**: simplified — logo, search, nav links span full width above both panels
- **Mobile**: sidebar becomes slide-over drawer via hamburger icon

## Sidebar Structure
- Category items with resource count badges
- "Industry Meetings" group collapses/expands to show 6 sub-categories
- Active category: green left border + bold text
- IntersectionObserver tracks active section as user scrolls

## Card Cleanup
- Remove "NEW" badges (when everything is new, nothing is)
- Remove letter-circle avatars (visual noise)
- More compact card design

## Files Changed
1. New: `src/components/Sidebar.tsx`
2. Modified: `src/components/HomePage.tsx` — sidebar layout, remove CategoryNav
3. Modified: `src/components/Header.tsx` — add mobile hamburger toggle
4. Modified: `src/components/ResourceCard.tsx` — remove NEW badge, letter avatar
5. Deleted: `src/components/CategoryNav.tsx` — replaced by Sidebar

"use client";

import { useState } from "react";
import { ResourceCategory, DirectoryDomain } from "@/lib/types";

const MEETINGS_PREFIX = "Industry Meetings";

interface CategoryGroup {
  type: "single" | "group";
  name: string;
  slug: string;
  count: number;
  children?: { name: string; slug: string; count: number }[];
}

function buildGroups(
  categories: ResourceCategory[],
  resourceCounts: Record<string, number>
): CategoryGroup[] {
  const groups: CategoryGroup[] = [];
  const meetingsChildren: { name: string; slug: string; count: number }[] = [];
  let meetingsTotal = 0;

  for (const cat of categories) {
    const count = resourceCounts[cat.id] || 0;

    if (cat.name === MEETINGS_PREFIX || cat.name.startsWith(MEETINGS_PREFIX + " —") || cat.name.startsWith(MEETINGS_PREFIX + " -")) {
      const shortName =
        cat.name === MEETINGS_PREFIX
          ? "General"
          : cat.name.replace(/^Industry Meetings\s*[—\-]\s*/, "").trim();
      meetingsChildren.push({ name: shortName, slug: cat.slug, count });
      meetingsTotal += count;
    } else {
      groups.push({ type: "single", name: cat.name, slug: cat.slug, count });
    }
  }

  if (meetingsChildren.length > 0) {
    const insertIdx = groups.length > 0 ? 1 : 0;
    groups.splice(insertIdx, 0, {
      type: "group",
      name: MEETINGS_PREFIX,
      slug: "industry-meetings",
      count: meetingsTotal,
      children: meetingsChildren,
    });
  }

  return groups;
}

const itemBase =
  "flex w-full items-center justify-between px-3 py-2 text-left text-sm transition-colors border-l-2";
const itemInactive =
  "border-transparent text-ink-2 hover:bg-cream hover:text-ink";
const itemActive =
  "border-oxblood bg-cream text-ink font-semibold";
const countBase =
  "shrink-0 ml-2 px-1.5 py-0.5 text-[10px] font-medium tracking-wide rounded-[2px]";
const countInactive = "bg-cream text-ink-muted border border-rule";
const countActive = "bg-oxblood/10 text-oxblood";

function SidebarNavItem({
  slug,
  name,
  count,
  isActive,
  onClick,
}: {
  slug: string;
  name: string;
  count: number;
  isActive: boolean;
  onClick: () => void;
}) {
  return (
    <button
      onClick={onClick}
      className={`${itemBase} ${isActive ? itemActive : itemInactive}`}
    >
      <span className="truncate">{name}</span>
      <span className={`${countBase} ${isActive ? countActive : countInactive}`}>
        {count}
      </span>
    </button>
  );
}

function DomainNavGroup({
  domain,
  activeSlug,
}: {
  domain: DirectoryDomain;
  activeSlug: string | null;
  onNavigate: (slug: string) => void;
}) {
  const [expanded, setExpanded] = useState(false);

  const hasActiveChild = domain.subcategories.some(
    (sub) => activeSlug === `directory-sub-${sub.id}`
  );

  return (
    <div>
      <button
        onClick={() => setExpanded(!expanded)}
        className={`${itemBase} ${
          hasActiveChild && !expanded ? itemActive : itemInactive
        }`}
      >
        <div className="flex items-center gap-1.5">
          <svg
            className={`h-3 w-3 shrink-0 text-ink-muted transition-transform ${
              expanded ? "rotate-90" : ""
            }`}
            fill="none"
            stroke="currentColor"
            viewBox="0 0 24 24"
          >
            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 5l7 7-7 7" />
          </svg>
          <span className="truncate">{domain.name}</span>
        </div>
        <span className={`${countBase} ${countInactive}`}>
          {domain.totalCompanies}
        </span>
      </button>

      {expanded && (
        <div className="ml-6 mt-0.5 space-y-0.5 border-l border-rule pl-2">
          {domain.subcategories.map((sub) => (
            <a
              key={sub.id}
              href={`/directory?domain=${domain.id}&sub=${sub.id}`}
              className="flex w-full items-center justify-between px-2.5 py-1.5 text-left text-xs transition-colors text-ink-2/80 hover:bg-cream hover:text-ink"
            >
              <span className="truncate">{sub.name}</span>
              <span className={`${countBase} ${countInactive}`}>
                {sub.companies.length}
              </span>
            </a>
          ))}
        </div>
      )}
    </div>
  );
}

export default function Sidebar({
  categories,
  directoryDomains,
  resourceCounts,
  influencerCount,
  activeSlug,
  isOpen,
  onClose,
}: {
  categories: ResourceCategory[];
  directoryDomains: DirectoryDomain[];
  resourceCounts: Record<string, number>;
  influencerCount: number;
  activeSlug: string | null;
  isOpen: boolean;
  onClose: () => void;
}) {
  const [meetingsExpanded, setMeetingsExpanded] = useState(false);
  const [directoryExpanded, setDirectoryExpanded] = useState(true);
  const groups = buildGroups(categories, resourceCounts);

  const meetingsSlugs = categories
    .filter(
      (c) =>
        c.name === MEETINGS_PREFIX ||
        c.name.startsWith(MEETINGS_PREFIX + " —") ||
        c.name.startsWith(MEETINGS_PREFIX + " -")
    )
    .map((c) => c.slug);
  const isMeetingsActive = meetingsSlugs.includes(activeSlug || "");

  function handleClick(slug: string) {
    const el = document.getElementById(slug);
    if (el) {
      el.scrollIntoView({ behavior: "smooth", block: "start" });
    }
    onClose();
  }

  return (
    <>
      {/* Mobile overlay */}
      {isOpen && (
        <div
          className="fixed inset-0 z-40 bg-ink/40 lg:hidden"
          onClick={onClose}
        />
      )}

      {/* Sidebar */}
      <aside
        className={`fixed top-16 left-0 z-50 h-[calc(100vh-4rem)] w-64 bg-cream-2 border-r border-rule overflow-y-auto transition-transform duration-200 lg:translate-x-0 lg:z-30 ${
          isOpen ? "translate-x-0" : "-translate-x-full"
        }`}
      >
        <div className="px-2 py-5">
          {/* Resources eyebrow */}
          <div className="text-[10px] font-semibold uppercase tracking-[0.22em] text-oxblood px-3 mb-3">
            Resources
          </div>

          <nav className="space-y-px">
            {groups.map((group) => {
              if (group.type === "single") {
                return (
                  <SidebarNavItem
                    key={group.slug}
                    slug={group.slug}
                    name={group.name}
                    count={group.count}
                    isActive={activeSlug === group.slug}
                    onClick={() => handleClick(group.slug)}
                  />
                );
              }

              return (
                <div key={group.slug}>
                  <button
                    onClick={() => setMeetingsExpanded(!meetingsExpanded)}
                    className={`${itemBase} ${
                      isMeetingsActive && !meetingsExpanded ? itemActive : itemInactive
                    }`}
                  >
                    <div className="flex items-center gap-1.5">
                      <svg
                        className={`h-3 w-3 shrink-0 text-ink-muted transition-transform ${
                          meetingsExpanded ? "rotate-90" : ""
                        }`}
                        fill="none"
                        stroke="currentColor"
                        viewBox="0 0 24 24"
                      >
                        <path
                          strokeLinecap="round"
                          strokeLinejoin="round"
                          strokeWidth={2}
                          d="M9 5l7 7-7 7"
                        />
                      </svg>
                      <span className="truncate">{group.name}</span>
                    </div>
                    <span className={`${countBase} ${countInactive}`}>
                      {group.count}
                    </span>
                  </button>

                  {meetingsExpanded && group.children && (
                    <div className="ml-6 mt-0.5 space-y-0.5 border-l border-rule pl-2">
                      {group.children.map((child) => {
                        const isActive = activeSlug === child.slug;
                        return (
                          <button
                            key={child.slug}
                            onClick={() => handleClick(child.slug)}
                            className={`flex w-full items-center justify-between px-2.5 py-1.5 text-left text-xs transition-colors ${
                              isActive
                                ? "text-oxblood font-semibold"
                                : "text-ink-2/80 hover:bg-cream hover:text-ink"
                            }`}
                          >
                            <span className="truncate">{child.name}</span>
                            <span
                              className={`${countBase} ${
                                isActive ? countActive : countInactive
                              }`}
                            >
                              {child.count}
                            </span>
                          </button>
                        );
                      })}
                    </div>
                  )}
                </div>
              );
            })}

            <SidebarNavItem
              slug="linkedin-influencers"
              name="LinkedIn Influencers"
              count={influencerCount}
              isActive={activeSlug === "linkedin-influencers"}
              onClick={() => handleClick("linkedin-influencers")}
            />
          </nav>

          {/* Company Directory eyebrow */}
          {directoryDomains.length > 0 && (
            <>
              <div className="mt-7 mb-3 flex items-center justify-between px-3">
                <div className="text-[10px] font-semibold uppercase tracking-[0.22em] text-oxblood">
                  Company Directory
                </div>
                <button
                  onClick={() => setDirectoryExpanded(!directoryExpanded)}
                  className="text-ink-muted/60 hover:text-ink-muted transition-colors"
                  aria-label="Toggle Company Directory"
                >
                  <svg
                    className={`h-3 w-3 transition-transform ${
                      directoryExpanded ? "rotate-90" : ""
                    }`}
                    fill="none"
                    stroke="currentColor"
                    viewBox="0 0 24 24"
                  >
                    <path
                      strokeLinecap="round"
                      strokeLinejoin="round"
                      strokeWidth={2}
                      d="M9 5l7 7-7 7"
                    />
                  </svg>
                </button>
              </div>

              {directoryExpanded && (
                <nav className="space-y-px">
                  {directoryDomains.map((domain) => (
                    <DomainNavGroup
                      key={domain.id}
                      domain={domain}
                      activeSlug={activeSlug}
                      onNavigate={handleClick}
                    />
                  ))}
                </nav>
              )}
            </>
          )}
        </div>
      </aside>
    </>
  );
}

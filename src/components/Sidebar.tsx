"use client";

import { useState } from "react";
import { ResourceCategory, DirectoryDomain } from "@/lib/types";

// Group "Industry Meetings" sub-categories under a parent
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

  // Insert meetings group after first item (Companies/Newsletters)
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
      className={`flex w-full items-center justify-between rounded-md px-3 py-2 text-left text-sm transition-colors ${
        isActive
          ? "bg-primary/10 text-primary font-semibold border-l-2 border-primary"
          : "text-foreground/80 hover:bg-surface hover:text-foreground"
      }`}
    >
      <span className="truncate">{name}</span>
      <span
        className={`shrink-0 ml-2 rounded-full px-1.5 py-0.5 text-[10px] font-medium ${
          isActive ? "bg-primary/20 text-primary" : "bg-surface text-muted"
        }`}
      >
        {count}
      </span>
    </button>
  );
}

function DomainNavGroup({
  domain,
  activeSlug,
  onNavigate,
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
        className={`flex w-full items-center justify-between rounded-md px-3 py-2 text-left text-sm transition-colors ${
          hasActiveChild && !expanded
            ? "bg-primary/10 text-primary font-semibold"
            : "text-foreground/80 hover:bg-surface hover:text-foreground"
        }`}
      >
        <div className="flex items-center gap-1.5">
          <svg
            className={`h-3 w-3 shrink-0 text-muted transition-transform ${
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
        <span className="shrink-0 ml-2 rounded-full bg-surface px-1.5 py-0.5 text-[10px] font-medium text-muted">
          {domain.totalCompanies}
        </span>
      </button>

      {expanded && (
        <div className="ml-4 mt-0.5 space-y-0.5 border-l border-border pl-2">
          {domain.subcategories.map((sub) => (
            <a
              key={sub.id}
              href={`/directory?domain=${domain.id}&sub=${sub.id}`}
              className="flex w-full items-center justify-between rounded-md px-2.5 py-1.5 text-left text-xs transition-colors text-foreground/60 hover:bg-surface hover:text-foreground"
            >
              <span className="truncate">{sub.name}</span>
              <span className="shrink-0 ml-2 rounded-full px-1.5 py-0.5 text-[10px] font-medium bg-surface text-muted">
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

  // Check if any meetings child is active
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
          className="fixed inset-0 z-40 bg-black/40 lg:hidden"
          onClick={onClose}
        />
      )}

      {/* Sidebar */}
      <aside
        className={`fixed top-16 left-0 z-50 h-[calc(100vh-4rem)] w-64 bg-white border-r border-border overflow-y-auto transition-transform duration-200 lg:translate-x-0 lg:z-30 ${
          isOpen ? "translate-x-0" : "-translate-x-full"
        }`}
      >
        <div className="px-3 py-4">
          {/* ====== RESOURCES SECTION ====== */}
          <div className="text-[10px] font-semibold uppercase tracking-wider text-muted/60 px-3 mb-2">
            Resources
          </div>

          <nav className="space-y-0.5">
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

              // Group (Industry Meetings)
              return (
                <div key={group.slug}>
                  <button
                    onClick={() => setMeetingsExpanded(!meetingsExpanded)}
                    className={`flex w-full items-center justify-between rounded-md px-3 py-2 text-left text-sm transition-colors ${
                      isMeetingsActive && !meetingsExpanded
                        ? "bg-primary/10 text-primary font-semibold"
                        : "text-foreground/80 hover:bg-surface hover:text-foreground"
                    }`}
                  >
                    <div className="flex items-center gap-1.5">
                      <svg
                        className={`h-3 w-3 shrink-0 text-muted transition-transform ${
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
                    <span className="shrink-0 ml-2 rounded-full bg-surface px-1.5 py-0.5 text-[10px] font-medium text-muted">
                      {group.count}
                    </span>
                  </button>

                  {meetingsExpanded && group.children && (
                    <div className="ml-4 mt-0.5 space-y-0.5 border-l border-border pl-2">
                      {group.children.map((child) => {
                        const isActive = activeSlug === child.slug;
                        return (
                          <button
                            key={child.slug}
                            onClick={() => handleClick(child.slug)}
                            className={`flex w-full items-center justify-between rounded-md px-2.5 py-1.5 text-left text-xs transition-colors ${
                              isActive
                                ? "bg-primary/10 text-primary font-semibold"
                                : "text-foreground/60 hover:bg-surface hover:text-foreground"
                            }`}
                          >
                            <span className="truncate">{child.name}</span>
                            <span
                              className={`shrink-0 ml-2 rounded-full px-1.5 py-0.5 text-[10px] font-medium ${
                                isActive
                                  ? "bg-primary/20 text-primary"
                                  : "bg-surface text-muted"
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

            {/* LinkedIn Influencers */}
            <SidebarNavItem
              slug="linkedin-influencers"
              name="LinkedIn Influencers"
              count={influencerCount}
              isActive={activeSlug === "linkedin-influencers"}
              onClick={() => handleClick("linkedin-influencers")}
            />
          </nav>

          {/* ====== COMPANY DIRECTORY SECTION ====== */}
          {directoryDomains.length > 0 && (
            <>
              <div className="mt-6 mb-2 flex items-center justify-between px-3">
                <div className="text-[10px] font-semibold uppercase tracking-wider text-muted/60">
                  Company Directory
                </div>
                <button
                  onClick={() => setDirectoryExpanded(!directoryExpanded)}
                  className="text-muted/40 hover:text-muted transition-colors"
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
                <nav className="space-y-0.5">
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

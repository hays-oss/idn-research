"use client";

import { useState } from "react";
import {
  ReviewQueueItem,
  TaxonomySubcategory,
  TaxonomyDomain,
} from "@/lib/types";
import { supabase } from "@/lib/supabase";

interface ReviewQueueAdminProps {
  queueItems: ReviewQueueItem[];
  subcategories: TaxonomySubcategory[];
  domains: TaxonomyDomain[];
  onRefresh: () => void;
}

type FilterTab = "all" | "open" | "in_progress" | "resolved" | "dismissed";

const REASON_LABELS: Record<string, string> = {
  low_confidence: "Low Confidence",
  duplicate_suspect: "Duplicate Suspect",
  missing_category: "Missing Category",
  ai_uncertain: "AI Uncertain",
};

const REASON_COLORS: Record<string, string> = {
  low_confidence:
    "bg-red-50 text-red-700 border border-red-200",
  duplicate_suspect:
    "bg-purple-50 text-purple-700 border border-purple-200",
  missing_category:
    "bg-yellow-50 text-yellow-700 border border-yellow-200",
  ai_uncertain:
    "bg-blue-50 text-blue-700 border border-blue-200",
};

function confidenceColor(score: number): string {
  if (score < 60) return "text-red-600";
  if (score < 80) return "text-yellow-600";
  return "text-green-600";
}

function confidenceBg(score: number): string {
  if (score < 60) return "bg-red-50";
  if (score < 80) return "bg-yellow-50";
  return "bg-green-50";
}

export default function ReviewQueueAdmin({
  queueItems,
  subcategories,
  domains,
  onRefresh,
}: ReviewQueueAdminProps) {
  const [activeFilter, setActiveFilter] = useState<FilterTab>("all");
  const [actionLoading, setActionLoading] = useState<string | null>(null);
  const [overrideItemId, setOverrideItemId] = useState<string | null>(null);
  const [overrideDomainId, setOverrideDomainId] = useState<number | null>(null);
  const [overrideSubcategoryId, setOverrideSubcategoryId] = useState<
    number | null
  >(null);

  // --- Filtering ---

  const counts: Record<FilterTab, number> = {
    all: queueItems.length,
    open: queueItems.filter((i) => i.status === "open").length,
    in_progress: queueItems.filter((i) => i.status === "in_progress").length,
    resolved: queueItems.filter((i) => i.status === "resolved").length,
    dismissed: queueItems.filter((i) => i.status === "dismissed").length,
  };

  const filtered =
    activeFilter === "all"
      ? queueItems
      : queueItems.filter((i) => i.status === activeFilter);

  const tabs: { key: FilterTab; label: string }[] = [
    { key: "all", label: "All" },
    { key: "open", label: "Open" },
    { key: "in_progress", label: "In Progress" },
    { key: "resolved", label: "Resolved" },
    { key: "dismissed", label: "Dismissed" },
  ];

  // --- Domain / Subcategory helpers ---

  const filteredSubcategories = overrideDomainId
    ? subcategories.filter((s) => s.domain_id === overrideDomainId)
    : [];

  // --- Actions ---

  async function handleApprove(item: ReviewQueueItem) {
    setActionLoading(item.queue_id);
    try {
      await supabase
        .from("company_review_queue")
        .update({
          status: "resolved",
          resolved_at: new Date().toISOString(),
        })
        .eq("id", item.queue_id);

      const companyUpdate: Record<string, unknown> = {
        review_status: "approved",
      };
      if (item.suggested_subcategory_id) {
        companyUpdate.primary_subcategory_id = item.suggested_subcategory_id;
      }

      await supabase
        .from("companies")
        .update(companyUpdate)
        .eq("id", item.company_id);

      onRefresh();
    } finally {
      setActionLoading(null);
    }
  }

  async function handleOverrideSubmit(item: ReviewQueueItem) {
    if (!overrideSubcategoryId) return;
    setActionLoading(item.queue_id);
    try {
      await supabase
        .from("company_review_queue")
        .update({
          status: "resolved",
          resolved_at: new Date().toISOString(),
        })
        .eq("id", item.queue_id);

      await supabase
        .from("companies")
        .update({
          review_status: "approved",
          primary_subcategory_id: overrideSubcategoryId,
        })
        .eq("id", item.company_id);

      setOverrideItemId(null);
      setOverrideDomainId(null);
      setOverrideSubcategoryId(null);
      onRefresh();
    } finally {
      setActionLoading(null);
    }
  }

  async function handleDismiss(item: ReviewQueueItem) {
    setActionLoading(item.queue_id);
    try {
      await supabase
        .from("company_review_queue")
        .update({
          status: "dismissed",
          resolved_at: new Date().toISOString(),
        })
        .eq("id", item.queue_id);

      onRefresh();
    } finally {
      setActionLoading(null);
    }
  }

  // --- Render ---

  return (
    <div>
      {/* Filter Tabs */}
      <div className="mb-4 flex gap-1">
        {tabs.map((tab) => (
          <button
            key={tab.key}
            onClick={() => setActiveFilter(tab.key)}
            className={`flex items-center gap-2 px-4 py-2 text-sm font-medium rounded-lg transition-colors ${
              activeFilter === tab.key
                ? "bg-[var(--primary)] text-white"
                : "text-[var(--muted)] hover:bg-[var(--surface)] hover:text-[var(--foreground)]"
            }`}
          >
            {tab.label}
            <span
              className={`rounded-full px-2 py-0.5 text-xs ${
                activeFilter === tab.key
                  ? "bg-white/20 text-white"
                  : "bg-[var(--surface)] text-[var(--muted)]"
              }`}
            >
              {counts[tab.key]}
            </span>
          </button>
        ))}
      </div>

      {/* Queue Items */}
      {filtered.length === 0 ? (
        <div className="flex flex-col items-center justify-center py-16 text-[var(--muted)]">
          <svg
            className="h-12 w-12 mb-3 text-green-400"
            fill="none"
            viewBox="0 0 24 24"
            stroke="currentColor"
            strokeWidth={1.5}
          >
            <path
              strokeLinecap="round"
              strokeLinejoin="round"
              d="M9 12.75L11.25 15 15 9.75M21 12a9 9 0 11-18 0 9 9 0 0118 0z"
            />
          </svg>
          <p className="text-sm font-medium">No items in the review queue</p>
        </div>
      ) : (
        <div className="flex flex-col gap-3">
          {filtered.map((item) => {
            const isLoading = actionLoading === item.queue_id;
            const isOverriding = overrideItemId === item.queue_id;
            const confidencePercent = item.confidence_score
              ? Math.round(item.confidence_score * 100)
              : null;

            return (
              <div
                key={item.queue_id}
                className="rounded-lg border border-[var(--border)] bg-white p-4"
              >
                {/* Top row: company name, website, reason badge */}
                <div className="flex items-start justify-between gap-4 mb-2">
                  <div className="min-w-0 flex-1">
                    <div className="flex items-center gap-2 flex-wrap">
                      <span className="text-sm font-semibold text-[var(--foreground)]">
                        {item.company_name}
                      </span>
                      {item.website && (
                        <a
                          href={item.website}
                          target="_blank"
                          rel="noopener noreferrer"
                          className="text-xs text-[var(--primary)] hover:underline truncate max-w-[200px]"
                        >
                          {item.website}
                        </a>
                      )}
                    </div>
                    {item.description && (
                      <p className="text-xs text-[var(--muted)] mt-1 line-clamp-2">
                        {item.description}
                      </p>
                    )}
                  </div>
                  <div className="flex items-center gap-2 shrink-0">
                    {confidencePercent !== null && (
                      <span
                        className={`rounded-full px-2 py-0.5 text-xs font-medium ${confidenceBg(confidencePercent)} ${confidenceColor(confidencePercent)}`}
                      >
                        {confidencePercent}%
                      </span>
                    )}
                    <span
                      className={`rounded-full px-2 py-0.5 text-xs font-medium ${
                        REASON_COLORS[item.reason] ??
                        "bg-[var(--surface)] text-[var(--muted)]"
                      }`}
                    >
                      {REASON_LABELS[item.reason] ?? item.reason}
                    </span>
                  </div>
                </div>

                {/* Category info */}
                <div className="flex flex-wrap gap-x-6 gap-y-1 text-xs text-[var(--muted)] mb-3">
                  {item.current_primary_domain ||
                  item.current_primary_subcategory ? (
                    <span>
                      Currently:{" "}
                      <span className="text-[var(--foreground)]">
                        {item.current_primary_domain ?? "?"}
                        {" \u2192 "}
                        {item.current_primary_subcategory ?? "?"}
                      </span>
                    </span>
                  ) : null}
                  {item.suggested_domain || item.suggested_subcategory ? (
                    <span>
                      Suggested:{" "}
                      <span className="font-medium text-[var(--primary)]">
                        {item.suggested_domain ?? "?"}
                        {" \u2192 "}
                        {item.suggested_subcategory ?? "?"}
                      </span>
                    </span>
                  ) : null}
                </div>

                {/* Override picker */}
                {isOverriding && (
                  <div className="flex items-end gap-2 mb-3 p-3 rounded-md bg-[var(--surface)] border border-[var(--border)]">
                    <div className="flex-1">
                      <label className="block text-xs font-medium text-[var(--muted)] mb-1">
                        Domain
                      </label>
                      <select
                        value={overrideDomainId ?? ""}
                        onChange={(e) => {
                          const val = e.target.value
                            ? Number(e.target.value)
                            : null;
                          setOverrideDomainId(val);
                          setOverrideSubcategoryId(null);
                        }}
                        className="w-full rounded-md border border-[var(--border)] bg-white px-2 py-1.5 text-sm text-[var(--foreground)] focus:border-[var(--primary)] focus:outline-none focus:ring-1 focus:ring-[var(--primary)]"
                      >
                        <option value="">Select domain...</option>
                        {domains
                          .filter((d) => d.is_active)
                          .map((d) => (
                            <option key={d.id} value={d.id}>
                              {d.name}
                            </option>
                          ))}
                      </select>
                    </div>
                    <div className="flex-1">
                      <label className="block text-xs font-medium text-[var(--muted)] mb-1">
                        Subcategory
                      </label>
                      <select
                        value={overrideSubcategoryId ?? ""}
                        onChange={(e) =>
                          setOverrideSubcategoryId(
                            e.target.value ? Number(e.target.value) : null
                          )
                        }
                        disabled={!overrideDomainId}
                        className="w-full rounded-md border border-[var(--border)] bg-white px-2 py-1.5 text-sm text-[var(--foreground)] focus:border-[var(--primary)] focus:outline-none focus:ring-1 focus:ring-[var(--primary)] disabled:opacity-50"
                      >
                        <option value="">Select subcategory...</option>
                        {filteredSubcategories
                          .filter((s) => s.is_active)
                          .map((s) => (
                            <option key={s.id} value={s.id}>
                              {s.name}
                            </option>
                          ))}
                      </select>
                    </div>
                    <button
                      onClick={() => handleOverrideSubmit(item)}
                      disabled={!overrideSubcategoryId || isLoading}
                      className="rounded-md px-3 py-1.5 text-xs font-medium text-white bg-[var(--primary)] hover:bg-[var(--primary-light)] transition-colors disabled:opacity-50"
                    >
                      Apply
                    </button>
                    <button
                      onClick={() => {
                        setOverrideItemId(null);
                        setOverrideDomainId(null);
                        setOverrideSubcategoryId(null);
                      }}
                      className="rounded-md px-3 py-1.5 text-xs font-medium text-[var(--muted)] hover:bg-[var(--surface)] transition-colors"
                    >
                      Cancel
                    </button>
                  </div>
                )}

                {/* Action buttons */}
                {item.status !== "resolved" && item.status !== "dismissed" && (
                  <div className="flex items-center gap-2">
                    <button
                      onClick={() => handleApprove(item)}
                      disabled={isLoading}
                      className="rounded-md px-3 py-1.5 text-xs font-medium text-green-600 hover:bg-green-50 transition-colors disabled:opacity-50"
                    >
                      Approve
                    </button>
                    <button
                      onClick={() => {
                        setOverrideItemId(
                          isOverriding ? null : item.queue_id
                        );
                        setOverrideDomainId(null);
                        setOverrideSubcategoryId(null);
                      }}
                      disabled={isLoading}
                      className="rounded-md px-3 py-1.5 text-xs font-medium text-[var(--primary)] hover:bg-[var(--surface)] transition-colors disabled:opacity-50"
                    >
                      Override
                    </button>
                    <button
                      onClick={() => handleDismiss(item)}
                      disabled={isLoading}
                      className="rounded-md px-3 py-1.5 text-xs font-medium text-[var(--muted)] hover:bg-[var(--surface)] transition-colors disabled:opacity-50"
                    >
                      Dismiss
                    </button>
                  </div>
                )}

                {/* Status badge for resolved/dismissed */}
                {(item.status === "resolved" ||
                  item.status === "dismissed") && (
                  <div className="flex items-center gap-2">
                    <span
                      className={`rounded-full px-2 py-0.5 text-xs font-medium ${
                        item.status === "resolved"
                          ? "bg-green-50 text-green-700"
                          : "bg-gray-100 text-gray-500"
                      }`}
                    >
                      {item.status === "resolved" ? "Resolved" : "Dismissed"}
                    </span>
                    {item.resolved_at && (
                      <span className="text-xs text-[var(--muted)]">
                        {new Date(item.resolved_at).toLocaleDateString()}
                      </span>
                    )}
                  </div>
                )}
              </div>
            );
          })}
        </div>
      )}
    </div>
  );
}

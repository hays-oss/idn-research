// Thin wrapper around gtag. The script tag is loaded in the root layout.
// All calls are no-ops in environments where gtag isn't available
// (server, ad-blockers, dev) so callers don't need to guard.

type GtagFn = (
  command: "event" | "config" | "set" | "consent",
  action: string,
  params?: Record<string, unknown>
) => void;

declare global {
  interface Window {
    gtag?: GtagFn;
    dataLayer?: unknown[];
  }
}

function gtag(eventName: string, params: Record<string, unknown> = {}): void {
  if (typeof window === "undefined") return;
  const fn = window.gtag;
  if (typeof fn !== "function") return;
  fn("event", eventName, params);
}

// ===== Form submissions =====

export type FormPurpose = "resource" | "contact" | "get-involved";

export function trackFormSubmit(purpose: FormPurpose): void {
  const map: Record<FormPurpose, string> = {
    resource: "submit_resource",
    contact: "ask_question",
    "get-involved": "get_involved",
  };
  gtag(map[purpose], { form_purpose: purpose });
  // Also fire a generic event so the unified funnel is easy to query
  gtag("form_submit", { form_purpose: purpose });
}

// ===== IHES CTA clicks =====

export function trackIhesCtaClick(location: string): void {
  gtag("ihes_cta_click", { cta_location: location });
}

// ===== External resource link clicks =====

export function trackExternalLinkClick(params: {
  resourceId?: string;
  resourceName: string;
  destinationUrl: string;
  source: string; // e.g. "homepage", "resource_page", "category_page"
}): void {
  gtag("external_link_click", {
    resource_id: params.resourceId,
    resource_name: params.resourceName,
    destination_url: params.destinationUrl,
    click_source: params.source,
  });
}

// ===== Search bar usage =====

export function trackSearch(query: string, source: string): void {
  if (!query.trim()) return;
  gtag("search", {
    search_term: query.trim().slice(0, 100),
    search_source: source,
  });
}

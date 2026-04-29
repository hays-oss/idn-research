"use client";

import { useState, useEffect, useRef, useCallback } from "react";
import { supabase } from "@/lib/supabase";
import { ResourceCategory } from "@/lib/types";
import { trackFormSubmit } from "@/lib/analytics";

const TURNSTILE_SITE_KEY = "0x4AAAAAACzF-XO9naOGbgEB";

type FormPurpose = "resource" | "contact" | "get-involved";

const PURPOSE_OPTIONS: { value: FormPurpose; label: string; description: string }[] = [
  { value: "resource", label: "Submit a Resource", description: "Suggest a company, tool, or resource for our directory" },
  { value: "contact", label: "Ask a Question", description: "Get in touch with the IDN Research team" },
  { value: "get-involved", label: "Get Involved", description: "Learn about partnership or collaboration opportunities" },
];

export default function SubmitResourceForm({
  categories,
}: {
  categories: ResourceCategory[];
}) {
  const [purpose, setPurpose] = useState<FormPurpose>("resource");
  const [form, setForm] = useState({
    name: "",
    url: "",
    description: "",
    category_id: "",
    suggested_category: "",
    submitted_by_name: "",
    submitted_by_email: "",
    message: "",
  });
  // Honeypot field — bots fill this in, humans don't see it
  const [honeypot, setHoneypot] = useState("");
  const [status, setStatus] = useState<"idle" | "submitting" | "success" | "error">("idle");
  const [submitTime] = useState(() => Date.now());
  const [turnstileToken, setTurnstileToken] = useState<string | null>(null);
  const turnstileRef = useRef<HTMLDivElement>(null);
  const turnstileWidgetId = useRef<string | null>(null);

  // Load Turnstile script and render widget
  useEffect(() => {
    // Define callback before loading script
    (window as any).onTurnstileLoad = () => {
      if (turnstileRef.current && (window as any).turnstile) {
        turnstileWidgetId.current = (window as any).turnstile.render(turnstileRef.current, {
          sitekey: TURNSTILE_SITE_KEY,
          callback: (token: string) => setTurnstileToken(token),
          "expired-callback": () => setTurnstileToken(null),
          theme: "light",
          size: "flexible",
        });
      }
    };

    // Load script if not already loaded
    if (!(window as any).turnstile) {
      const script = document.createElement("script");
      script.src = "https://challenges.cloudflare.com/turnstile/v0/api.js?onload=onTurnstileLoad";
      script.async = true;
      document.head.appendChild(script);
    } else {
      // Script already loaded, just render
      (window as any).onTurnstileLoad();
    }

    return () => {
      if (turnstileWidgetId.current && (window as any).turnstile) {
        (window as any).turnstile.remove(turnstileWidgetId.current);
      }
    };
  }, []);

  const resetTurnstile = useCallback(() => {
    if (turnstileWidgetId.current && (window as any).turnstile) {
      (window as any).turnstile.reset(turnstileWidgetId.current);
      setTurnstileToken(null);
    }
  }, []);

  function normalizeUrl(url: string): string {
    let trimmed = url.trim();
    if (!trimmed) return trimmed;
    if (!/^https?:\/\//i.test(trimmed)) {
      trimmed = "https://" + trimmed;
    }
    return trimmed;
  }

  async function handleSubmit(e: React.FormEvent) {
    e.preventDefault();

    // Bot detection
    if (honeypot) return;
    if (Date.now() - submitTime < 3000) return;
    if (!turnstileToken) {
      setStatus("error");
      return;
    }

    setStatus("submitting");
    try {
      if (purpose === "resource") {
        // Save to database
        const normalizedUrl = normalizeUrl(form.url);
        const { error } = await supabase.from("resource_submissions").insert({
          name: form.name,
          url: normalizedUrl,
          description: form.description || null,
          category_id: form.category_id || null,
          suggested_category: form.suggested_category || null,
          submitted_by_name: form.submitted_by_name || null,
          submitted_by_email: form.submitted_by_email || null,
        });
        if (error) throw error;

        // Send email
        await fetch("/api/notify-submission", {
          method: "POST",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify({
            type: "resource",
            turnstileToken,
            name: form.name,
            url: normalizedUrl,
            description: form.description,
            submitted_by_name: form.submitted_by_name,
            submitted_by_email: form.submitted_by_email,
            category: form.category_id
              ? categories.find((c) => c.id === form.category_id)?.name || "Unknown"
              : form.suggested_category || "Not specified",
          }),
        }).catch(() => {});
      } else {
        // Contact or Get Involved — just send email
        await fetch("/api/notify-submission", {
          method: "POST",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify({
            type: "contact",
            turnstileToken,
            submitted_by_name: form.submitted_by_name,
            submitted_by_email: form.submitted_by_email,
            message: form.message,
            description: `[${purpose === "get-involved" ? "Get Involved" : "Question"}] ${form.message}`,
          }),
        });
      }

      trackFormSubmit(purpose);
      setStatus("success");
      setForm({ name: "", url: "", description: "", category_id: "", suggested_category: "", submitted_by_name: "", submitted_by_email: "", message: "" });
      resetTurnstile();
    } catch {
      setStatus("error");
    }
  }

  if (status === "success") {
    return (
      <div
        id="submit"
        className="scroll-mt-28 rounded-[4px] border border-rule bg-cream-2 p-8 text-center"
      >
        <div className="text-[10px] uppercase tracking-[0.22em] font-semibold text-oxblood mb-3">
          Received
        </div>
        <h3 className="font-serif text-[22px] tracking-[-0.01em] text-ink mb-3">
          Thank you.
        </h3>
        <p className="text-[15px] leading-[1.6] text-ink-2 max-w-md mx-auto">
          {purpose === "resource"
            ? "Your resource has been submitted for review. I'll add it to the directory once approved."
            : "I've received your message and will get back to you soon."}
        </p>
        <button
          onClick={() => setStatus("idle")}
          className="mt-5 inline-flex items-center font-serif italic text-[14px] text-oxblood hover:text-oxblood-deep underline decoration-rule-strong underline-offset-4"
        >
          {purpose === "resource" ? "Submit another →" : "Send another message →"}
        </button>
      </div>
    );
  }

  return (
    <div
      id="submit"
      className="scroll-mt-28 rounded-[4px] border border-rule bg-cream-2 p-6 sm:p-8"
    >
      <div className="text-[11px] uppercase tracking-[0.22em] font-semibold text-oxblood mb-2">
        Get in Touch
      </div>
      <h2 className="font-serif text-[22px] tracking-[-0.01em] text-ink mb-2">
        Submit, ask, or partner
      </h2>
      <p className="text-[14px] text-ink-2 mb-6">
        Submit a resource, ask a question, or explore collaboration with IHES.
      </p>

      {/* Purpose selector */}
      <div className="flex flex-wrap gap-2 mb-6">
        {PURPOSE_OPTIONS.map((opt) => (
          <button
            key={opt.value}
            type="button"
            onClick={() => setPurpose(opt.value)}
            className={`rounded-[3px] px-4 py-2 text-[11px] font-semibold uppercase tracking-[0.12em] transition-colors ${
              purpose === opt.value
                ? "bg-ink text-cream"
                : "bg-card border border-rule text-ink-2 hover:border-ink hover:text-ink"
            }`}
          >
            {opt.label}
          </button>
        ))}
      </div>

      <form onSubmit={handleSubmit} className="grid gap-4 sm:grid-cols-2">
        {/* Honeypot — hidden from humans */}
        <div className="absolute opacity-0 h-0 w-0 overflow-hidden" aria-hidden="true" tabIndex={-1}>
          <label htmlFor="website_url">Website</label>
          <input
            id="website_url"
            name="website_url"
            type="text"
            value={honeypot}
            onChange={(e) => setHoneypot(e.target.value)}
            autoComplete="off"
            tabIndex={-1}
          />
        </div>

        {/* Resource-specific fields */}
        {purpose === "resource" && (
          <>
            <div className="sm:col-span-2">
              <label className="block text-[10px] uppercase tracking-[0.18em] font-semibold text-ink-2 mb-1.5">Resource Name *</label>
              <input
                required
                value={form.name}
                onChange={(e) => setForm({ ...form, name: e.target.value })}
                className="w-full rounded-[3px] border border-rule bg-card px-3 py-2 text-[14px] text-ink placeholder:text-ink-muted focus:border-ink focus:outline-none focus:ring-1 focus:ring-ink"
                placeholder="e.g., Becker's Healthcare"
              />
            </div>
            <div className="sm:col-span-2">
              <label className="block text-[10px] uppercase tracking-[0.18em] font-semibold text-ink-2 mb-1.5">URL *</label>
              <input
                required
                type="text"
                value={form.url}
                onChange={(e) => setForm({ ...form, url: e.target.value })}
                className="w-full rounded-[3px] border border-rule bg-card px-3 py-2 text-[14px] text-ink placeholder:text-ink-muted focus:border-ink focus:outline-none focus:ring-1 focus:ring-ink"
                placeholder="www.example.com"
              />
            </div>
            <div>
              <label className="block text-[10px] uppercase tracking-[0.18em] font-semibold text-ink-2 mb-1.5">Category</label>
              <select
                value={form.category_id}
                onChange={(e) => setForm({ ...form, category_id: e.target.value })}
                className="w-full rounded-[3px] border border-rule bg-card px-3 py-2 text-[14px] text-ink placeholder:text-ink-muted focus:border-ink focus:outline-none focus:ring-1 focus:ring-ink"
              >
                <option value="">Select a category...</option>
                {categories.map((cat) => (
                  <option key={cat.id} value={cat.id}>
                    {cat.name}
                  </option>
                ))}
              </select>
            </div>
            <div>
              <label className="block text-[10px] uppercase tracking-[0.18em] font-semibold text-ink-2 mb-1.5">Or suggest a new category</label>
              <input
                value={form.suggested_category}
                onChange={(e) => setForm({ ...form, suggested_category: e.target.value })}
                className="w-full rounded-[3px] border border-rule bg-card px-3 py-2 text-[14px] text-ink placeholder:text-ink-muted focus:border-ink focus:outline-none focus:ring-1 focus:ring-ink"
                placeholder="e.g., AI in Healthcare"
              />
            </div>
            <div className="sm:col-span-2">
              <label className="block text-[10px] uppercase tracking-[0.18em] font-semibold text-ink-2 mb-1.5">Description</label>
              <textarea
                value={form.description}
                onChange={(e) => setForm({ ...form, description: e.target.value })}
                rows={2}
                className="w-full rounded-[3px] border border-rule bg-card px-3 py-2 text-[14px] text-ink placeholder:text-ink-muted focus:border-ink focus:outline-none focus:ring-1 focus:ring-ink"
                placeholder="Brief description of this resource..."
              />
            </div>
          </>
        )}

        {/* Contact / Get Involved — message field */}
        {(purpose === "contact" || purpose === "get-involved") && (
          <div className="sm:col-span-2">
            <label className="block text-[10px] uppercase tracking-[0.18em] font-semibold text-ink-2 mb-1.5">
              {purpose === "contact" ? "Your Question *" : "How would you like to get involved? *"}
            </label>
            <textarea
              required
              value={form.message}
              onChange={(e) => setForm({ ...form, message: e.target.value })}
              rows={4}
              className="w-full rounded-[3px] border border-rule bg-card px-3 py-2 text-[14px] text-ink placeholder:text-ink-muted focus:border-ink focus:outline-none focus:ring-1 focus:ring-ink"
              placeholder={
                purpose === "contact"
                  ? "What would you like to know?"
                  : "Tell us about your interest in partnering, contributing data, or collaborating..."
              }
            />
          </div>
        )}

        {/* Shared fields — name and email */}
        <div>
          <label className="block text-[10px] uppercase tracking-[0.18em] font-semibold text-ink-2 mb-1.5">
            Your Name {purpose !== "resource" ? "*" : ""}
          </label>
          <input
            required={purpose !== "resource"}
            value={form.submitted_by_name}
            onChange={(e) => setForm({ ...form, submitted_by_name: e.target.value })}
            className="w-full rounded-[3px] border border-rule bg-card px-3 py-2 text-[14px] text-ink placeholder:text-ink-muted focus:border-ink focus:outline-none focus:ring-1 focus:ring-ink"
          />
        </div>
        <div>
          <label className="block text-[10px] uppercase tracking-[0.18em] font-semibold text-ink-2 mb-1.5">
            Your Email {purpose !== "resource" ? "*" : ""}
          </label>
          <input
            type="email"
            required={purpose !== "resource"}
            value={form.submitted_by_email}
            onChange={(e) => setForm({ ...form, submitted_by_email: e.target.value })}
            className="w-full rounded-[3px] border border-rule bg-card px-3 py-2 text-[14px] text-ink placeholder:text-ink-muted focus:border-ink focus:outline-none focus:ring-1 focus:ring-ink"
          />
        </div>

        {/* Cloudflare Turnstile */}
        <div className="sm:col-span-2">
          <div ref={turnstileRef} />
        </div>

        <div className="sm:col-span-2">
          <button
            type="submit"
            disabled={status === "submitting" || !turnstileToken}
            className="rounded-[3px] bg-ink px-7 py-3 text-[11px] font-semibold uppercase tracking-[0.16em] text-cream hover:bg-oxblood transition-colors disabled:opacity-50"
          >
            {status === "submitting"
              ? "Sending…"
              : purpose === "resource"
              ? "Submit Resource"
              : purpose === "get-involved"
              ? "Send Message"
              : "Send Question"}
          </button>
          {status === "error" && (
            <p className="mt-3 text-[12px] text-oxblood">
              Something went wrong. Please try again.
            </p>
          )}
        </div>
      </form>
    </div>
  );
}

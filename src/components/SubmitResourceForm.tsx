"use client";

import { useState } from "react";
import { supabase } from "@/lib/supabase";
import { ResourceCategory } from "@/lib/types";

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
            submitted_by_name: form.submitted_by_name,
            submitted_by_email: form.submitted_by_email,
            message: form.message,
            description: `[${purpose === "get-involved" ? "Get Involved" : "Question"}] ${form.message}`,
          }),
        });
      }

      setStatus("success");
      setForm({ name: "", url: "", description: "", category_id: "", suggested_category: "", submitted_by_name: "", submitted_by_email: "", message: "" });
    } catch {
      setStatus("error");
    }
  }

  if (status === "success") {
    return (
      <div id="submit" className="scroll-mt-28 rounded-xl border border-emerald-200 bg-emerald-50 p-8 text-center">
        <div className="text-3xl mb-3">&#10003;</div>
        <h3 className="text-lg font-semibold text-emerald-800 mb-2">Thank you!</h3>
        <p className="text-sm text-emerald-700">
          {purpose === "resource"
            ? "Your resource has been submitted for review. We'll add it to the directory once approved."
            : "We've received your message and will get back to you soon."}
        </p>
        <button
          onClick={() => setStatus("idle")}
          className="mt-4 text-sm text-emerald-700 underline hover:no-underline"
        >
          {purpose === "resource" ? "Submit another" : "Send another message"}
        </button>
      </div>
    );
  }

  return (
    <div id="submit" className="scroll-mt-28 rounded-xl border border-border bg-surface p-6 sm:p-8">
      <h2 className="text-lg font-semibold text-foreground mb-1">Get in Touch</h2>
      <p className="text-sm text-muted mb-5">
        Submit a resource, ask a question, or explore collaboration opportunities.
      </p>

      {/* Purpose selector */}
      <div className="flex flex-wrap gap-2 mb-6">
        {PURPOSE_OPTIONS.map((opt) => (
          <button
            key={opt.value}
            type="button"
            onClick={() => setPurpose(opt.value)}
            className={`rounded-lg px-4 py-2 text-xs font-medium transition-colors ${
              purpose === opt.value
                ? "bg-primary text-white"
                : "bg-white border border-border text-foreground hover:border-primary/30"
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
              <label className="block text-xs font-medium text-foreground mb-1">Resource Name *</label>
              <input
                required
                value={form.name}
                onChange={(e) => setForm({ ...form, name: e.target.value })}
                className="w-full rounded-lg border border-border bg-white px-3 py-2 text-sm focus:border-primary focus:outline-none focus:ring-1 focus:ring-primary"
                placeholder="e.g., Becker's Healthcare"
              />
            </div>
            <div className="sm:col-span-2">
              <label className="block text-xs font-medium text-foreground mb-1">URL *</label>
              <input
                required
                type="text"
                value={form.url}
                onChange={(e) => setForm({ ...form, url: e.target.value })}
                className="w-full rounded-lg border border-border bg-white px-3 py-2 text-sm focus:border-primary focus:outline-none focus:ring-1 focus:ring-primary"
                placeholder="www.example.com"
              />
            </div>
            <div>
              <label className="block text-xs font-medium text-foreground mb-1">Category</label>
              <select
                value={form.category_id}
                onChange={(e) => setForm({ ...form, category_id: e.target.value })}
                className="w-full rounded-lg border border-border bg-white px-3 py-2 text-sm focus:border-primary focus:outline-none focus:ring-1 focus:ring-primary"
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
              <label className="block text-xs font-medium text-foreground mb-1">Or suggest a new category</label>
              <input
                value={form.suggested_category}
                onChange={(e) => setForm({ ...form, suggested_category: e.target.value })}
                className="w-full rounded-lg border border-border bg-white px-3 py-2 text-sm focus:border-primary focus:outline-none focus:ring-1 focus:ring-primary"
                placeholder="e.g., AI in Healthcare"
              />
            </div>
            <div className="sm:col-span-2">
              <label className="block text-xs font-medium text-foreground mb-1">Description</label>
              <textarea
                value={form.description}
                onChange={(e) => setForm({ ...form, description: e.target.value })}
                rows={2}
                className="w-full rounded-lg border border-border bg-white px-3 py-2 text-sm focus:border-primary focus:outline-none focus:ring-1 focus:ring-primary"
                placeholder="Brief description of this resource..."
              />
            </div>
          </>
        )}

        {/* Contact / Get Involved — message field */}
        {(purpose === "contact" || purpose === "get-involved") && (
          <div className="sm:col-span-2">
            <label className="block text-xs font-medium text-foreground mb-1">
              {purpose === "contact" ? "Your Question *" : "How would you like to get involved? *"}
            </label>
            <textarea
              required
              value={form.message}
              onChange={(e) => setForm({ ...form, message: e.target.value })}
              rows={4}
              className="w-full rounded-lg border border-border bg-white px-3 py-2 text-sm focus:border-primary focus:outline-none focus:ring-1 focus:ring-primary"
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
          <label className="block text-xs font-medium text-foreground mb-1">
            Your Name {purpose !== "resource" ? "*" : ""}
          </label>
          <input
            required={purpose !== "resource"}
            value={form.submitted_by_name}
            onChange={(e) => setForm({ ...form, submitted_by_name: e.target.value })}
            className="w-full rounded-lg border border-border bg-white px-3 py-2 text-sm focus:border-primary focus:outline-none focus:ring-1 focus:ring-primary"
          />
        </div>
        <div>
          <label className="block text-xs font-medium text-foreground mb-1">
            Your Email {purpose !== "resource" ? "*" : ""}
          </label>
          <input
            type="email"
            required={purpose !== "resource"}
            value={form.submitted_by_email}
            onChange={(e) => setForm({ ...form, submitted_by_email: e.target.value })}
            className="w-full rounded-lg border border-border bg-white px-3 py-2 text-sm focus:border-primary focus:outline-none focus:ring-1 focus:ring-primary"
          />
        </div>

        <div className="sm:col-span-2">
          <button
            type="submit"
            disabled={status === "submitting"}
            className="rounded-lg bg-primary px-6 py-2.5 text-sm font-medium text-white hover:bg-primary-light transition-colors disabled:opacity-50"
          >
            {status === "submitting"
              ? "Sending..."
              : purpose === "resource"
              ? "Submit Resource"
              : purpose === "get-involved"
              ? "Send Message"
              : "Send Question"}
          </button>
          {status === "error" && (
            <p className="mt-2 text-xs text-red-600">
              Something went wrong. Please try again.
            </p>
          )}
        </div>
      </form>
    </div>
  );
}

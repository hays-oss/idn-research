"use client";

import { useState } from "react";
import { supabase } from "@/lib/supabase";
import { ResourceCategory } from "@/lib/types";

const NOTIFY_EMAIL = "hays+idn@ihesllc.com";

export default function SubmitResourceForm({
  categories,
}: {
  categories: ResourceCategory[];
}) {
  const [form, setForm] = useState({
    name: "",
    url: "",
    description: "",
    category_id: "",
    suggested_category: "",
    submitted_by_name: "",
    submitted_by_email: "",
  });
  // Honeypot field — bots fill this in, humans don't see it
  const [honeypot, setHoneypot] = useState("");
  const [status, setStatus] = useState<"idle" | "submitting" | "success" | "error">("idle");
  const [submitTime] = useState(() => Date.now());

  function normalizeUrl(url: string): string {
    let trimmed = url.trim();
    if (!trimmed) return trimmed;
    // Add https:// if no protocol present
    if (!/^https?:\/\//i.test(trimmed)) {
      trimmed = "https://" + trimmed;
    }
    return trimmed;
  }

  async function handleSubmit(e: React.FormEvent) {
    e.preventDefault();

    // Bot detection: honeypot field should be empty
    if (honeypot) return;

    // Bot detection: form submitted too quickly (under 3 seconds)
    if (Date.now() - submitTime < 3000) return;

    setStatus("submitting");
    try {
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

      // Send email notification
      try {
        await fetch("/api/notify-submission", {
          method: "POST",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify({
            name: form.name,
            url: normalizedUrl,
            description: form.description,
            submitted_by_name: form.submitted_by_name,
            submitted_by_email: form.submitted_by_email,
            category: form.category_id
              ? categories.find((c) => c.id === form.category_id)?.name || "Unknown"
              : form.suggested_category || "Not specified",
          }),
        });
      } catch {
        // Notification failure shouldn't block the submission
      }

      setStatus("success");
      setForm({ name: "", url: "", description: "", category_id: "", suggested_category: "", submitted_by_name: "", submitted_by_email: "" });
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
          Your resource has been submitted for review. We&apos;ll add it to the directory once approved.
        </p>
        <button
          onClick={() => setStatus("idle")}
          className="mt-4 text-sm text-emerald-700 underline hover:no-underline"
        >
          Submit another
        </button>
      </div>
    );
  }

  return (
    <div id="submit" className="scroll-mt-28 rounded-xl border border-border bg-surface p-6 sm:p-8">
      <h2 className="text-lg font-semibold text-foreground mb-1">Submit a Missing Resource</h2>
      <p className="text-sm text-muted mb-6">
        Know a healthcare resource that should be on this list? Let us know.
      </p>
      <form onSubmit={handleSubmit} className="grid gap-4 sm:grid-cols-2">
        {/* Honeypot — hidden from humans, bots fill it in */}
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
        <div>
          <label className="block text-xs font-medium text-foreground mb-1">Your Name</label>
          <input
            value={form.submitted_by_name}
            onChange={(e) => setForm({ ...form, submitted_by_name: e.target.value })}
            className="w-full rounded-lg border border-border bg-white px-3 py-2 text-sm focus:border-primary focus:outline-none focus:ring-1 focus:ring-primary"
          />
        </div>
        <div>
          <label className="block text-xs font-medium text-foreground mb-1">Your Email</label>
          <input
            type="email"
            value={form.submitted_by_email}
            onChange={(e) => setForm({ ...form, submitted_by_email: e.target.value })}
            className="w-full rounded-lg border border-border bg-white px-3 py-2 text-sm focus:border-primary focus:outline-none focus:ring-1 focus:ring-primary"
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
        <div className="sm:col-span-2">
          <button
            type="submit"
            disabled={status === "submitting"}
            className="rounded-lg bg-primary px-6 py-2.5 text-sm font-medium text-white hover:bg-primary-light transition-colors disabled:opacity-50"
          >
            {status === "submitting" ? "Submitting..." : "Submit Resource"}
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

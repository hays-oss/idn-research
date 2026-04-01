import { NextResponse } from "next/server";

const NOTIFY_EMAIL = "hays+idn@ihesllc.com";

export async function POST(request: Request) {
  try {
    const body = await request.json();
    const { name, url, description, submitted_by_name, submitted_by_email, category } = body;

    // Build email content
    const subject = `New IDN Research Submission: ${name}`;
    const text = [
      `New resource submission on IDN Research:`,
      ``,
      `Resource: ${name}`,
      `URL: ${url}`,
      `Category: ${category}`,
      description ? `Description: ${description}` : null,
      ``,
      `Submitted by: ${submitted_by_name || "Anonymous"}`,
      submitted_by_email ? `Email: ${submitted_by_email}` : null,
      ``,
      `Review in admin: ${process.env.NEXT_PUBLIC_SITE_URL || "https://idnresearch.com"}/admin`,
    ]
      .filter(Boolean)
      .join("\n");

    // Use Supabase Edge Function or a simple webhook for email
    // For now, use the Supabase database trigger approach:
    // Store the notification in a table that a Supabase webhook/function can pick up
    // OR use a simple email API

    // Try Resend (free tier: 100 emails/month) if API key is set
    const resendKey = process.env.RESEND_API_KEY;
    if (resendKey) {
      const res = await fetch("https://api.resend.com/emails", {
        method: "POST",
        headers: {
          Authorization: `Bearer ${resendKey}`,
          "Content-Type": "application/json",
        },
        body: JSON.stringify({
          from: "IDN Research <notifications@idnresearch.com>",
          to: [NOTIFY_EMAIL],
          subject,
          text,
        }),
      });

      if (!res.ok) {
        console.error("Resend error:", await res.text());
      }
    } else {
      // No email provider configured — log to console
      console.log("=== NEW SUBMISSION (no email provider configured) ===");
      console.log(text);
      console.log("====================================================");
    }

    return NextResponse.json({ ok: true });
  } catch (error) {
    console.error("Notification error:", error);
    return NextResponse.json({ ok: false }, { status: 500 });
  }
}

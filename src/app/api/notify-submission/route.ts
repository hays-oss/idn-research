import { NextResponse } from "next/server";

const NOTIFY_EMAIL = "hays@ihesllc.com";

export async function POST(request: Request) {
  try {
    const body = await request.json();
    const { type, turnstileToken, name, url, description, submitted_by_name, submitted_by_email, category, message } = body;

    // Verify Cloudflare Turnstile token
    const turnstileSecret = process.env.TURNSTILE_SECRET_KEY;
    if (turnstileSecret && turnstileToken) {
      const verifyRes = await fetch("https://challenges.cloudflare.com/turnstile/v0/siteverify", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          secret: turnstileSecret,
          response: turnstileToken,
        }),
      });
      const verifyData = await verifyRes.json();
      if (!verifyData.success) {
        console.error("Turnstile verification failed:", verifyData);
        return NextResponse.json({ ok: false, error: "Bot verification failed" }, { status: 403 });
      }
    } else if (turnstileSecret && !turnstileToken) {
      return NextResponse.json({ ok: false, error: "Missing verification token" }, { status: 403 });
    }

    const isContact = type === "contact";

    const subject = isContact
      ? `IDN Research Contact: ${submitted_by_name || "Anonymous"}`
      : `IDN Research Submission: ${name}`;

    const text = isContact
      ? [
          `New contact form message on IDN Research:`,
          ``,
          `From: ${submitted_by_name || "Anonymous"}`,
          submitted_by_email ? `Email: ${submitted_by_email}` : null,
          ``,
          `Message:`,
          message || description || "(no message)",
          ``,
          `Sent from: https://idnresearch.com`,
        ]
          .filter(Boolean)
          .join("\n")
      : [
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
          `Review in admin: https://idnresearch.com/admin`,
        ]
          .filter(Boolean)
          .join("\n");

    const resendKey = process.env.RESEND_API_KEY;
    if (resendKey) {
      const res = await fetch("https://api.resend.com/emails", {
        method: "POST",
        headers: {
          Authorization: `Bearer ${resendKey}`,
          "Content-Type": "application/json",
        },
        body: JSON.stringify({
          from: "IDN Research <onboarding@resend.dev>",
          to: [NOTIFY_EMAIL],
          subject,
          text,
        }),
      });

      if (!res.ok) {
        const errText = await res.text();
        console.error("Resend error:", errText);
        return NextResponse.json({ ok: false, error: errText }, { status: 500 });
      }
    } else {
      console.log("=== NEW SUBMISSION (no email provider configured) ===");
      console.log(text);
    }

    return NextResponse.json({ ok: true });
  } catch (error) {
    console.error("Notification error:", error);
    return NextResponse.json({ ok: false }, { status: 500 });
  }
}

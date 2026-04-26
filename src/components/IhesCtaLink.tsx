"use client";

import { trackIhesCtaClick } from "@/lib/analytics";

// Drop-in replacement for an <a> linking to ihesllc.com that fires a
// GA4 ihes_cta_click event with the placement label.
export default function IhesCtaLink({
  href = "https://www.ihesllc.com",
  location,
  children,
  className,
  ...rest
}: {
  href?: string;
  location: string;
  children: React.ReactNode;
  className?: string;
} & Omit<
  React.AnchorHTMLAttributes<HTMLAnchorElement>,
  "href" | "onClick" | "className" | "children"
>) {
  return (
    <a
      href={href}
      target="_blank"
      rel="noopener noreferrer"
      className={className}
      onClick={() => trackIhesCtaClick(location)}
      {...rest}
    >
      {children}
    </a>
  );
}

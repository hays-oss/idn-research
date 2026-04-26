"use client";

import { trackExternalLinkClick } from "@/lib/analytics";

// Wraps an <a> to fire a GA4 external_link_click event before navigation.
// Use on resource/company detail page Visit buttons and similar outbound
// links where we want to count which resources visitors actually click.
export default function TrackedExternalLink({
  href,
  resourceId,
  resourceName,
  source,
  children,
  className,
  ...rest
}: {
  href: string;
  resourceId?: string;
  resourceName: string;
  source: string;
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
      onClick={() =>
        trackExternalLinkClick({
          resourceId,
          resourceName,
          destinationUrl: href,
          source,
        })
      }
      {...rest}
    >
      {children}
    </a>
  );
}

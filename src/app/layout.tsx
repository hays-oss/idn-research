import type { Metadata } from "next";
import { Inter } from "next/font/google";
import Script from "next/script";
import "./globals.css";

const inter = Inter({
  variable: "--font-geist-sans",
  subsets: ["latin"],
});

const SITE_ORIGIN = "https://idnresearch.com";
const SITE_DESCRIPTION =
  "The most comprehensive curated directory of healthcare industry resources, meetings, organizations, and influencers. Built by IHES.";

export const metadata: Metadata = {
  metadataBase: new URL(SITE_ORIGIN),
  title: {
    default: "IDN Research — Healthcare Resource Intelligence",
    template: "%s",
  },
  description: SITE_DESCRIPTION,
  openGraph: {
    title: "IDN Research — Healthcare Resource Intelligence",
    description: SITE_DESCRIPTION,
    url: SITE_ORIGIN,
    siteName: "IDN Research",
    type: "website",
  },
  twitter: {
    card: "summary_large_image",
    title: "IDN Research — Healthcare Resource Intelligence",
    description: SITE_DESCRIPTION,
  },
};

const ORGANIZATION_JSON_LD = JSON.stringify({
  "@context": "https://schema.org",
  "@type": "Organization",
  name: "IDN Research",
  alternateName: "IDN Research by IHES",
  url: SITE_ORIGIN,
  logo: `${SITE_ORIGIN}/logo.png`,
  description:
    "The most comprehensive curated directory of healthcare industry resources, meetings, organizations, and influencers. Built by IHES.",
  parentOrganization: {
    "@type": "Organization",
    name: "Institute of Healthcare Executives and Suppliers",
    alternateName: "IHES",
    url: "https://ihesllc.com",
  },
  sameAs: ["https://ihesllc.com", "https://www.linkedin.com/in/hayswaldrop/"],
});

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en" className={`${inter.variable} h-full antialiased`}>
      <head>
        <Script
          src="https://www.googletagmanager.com/gtag/js?id=G-4PGRMM416V"
          strategy="afterInteractive"
        />
        <Script id="google-analytics" strategy="afterInteractive">
          {`
            window.dataLayer = window.dataLayer || [];
            function gtag(){dataLayer.push(arguments);}
            gtag('js', new Date());
            gtag('config', 'G-4PGRMM416V');
          `}
        </Script>
        <script
          type="application/ld+json"
          dangerouslySetInnerHTML={{ __html: ORGANIZATION_JSON_LD }}
        />
      </head>
      <body className="min-h-full flex flex-col">{children}</body>
    </html>
  );
}

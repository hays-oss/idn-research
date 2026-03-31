import type { Metadata } from "next";
import { Inter } from "next/font/google";
import "./globals.css";

const inter = Inter({
  variable: "--font-geist-sans",
  subsets: ["latin"],
});

export const metadata: Metadata = {
  title: "IDN Research — Healthcare Resource Intelligence",
  description:
    "The most comprehensive curated directory of healthcare industry resources, meetings, organizations, and influencers. Built by IHES.",
  keywords: [
    "healthcare",
    "IDN",
    "hospital",
    "supply chain",
    "pharmacy",
    "GPO",
    "healthcare meetings",
    "healthcare resources",
  ],
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en" className={`${inter.variable} h-full antialiased`}>
      <body className="min-h-full flex flex-col">{children}</body>
    </html>
  );
}

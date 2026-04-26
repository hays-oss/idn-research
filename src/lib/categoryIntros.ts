// Original intro copy for category landing pages.
// Hays — feel free to edit any of these. Aim for 100-150 words, focus on
// what the category covers and who it serves. Avoid claims about specific
// orgs.

interface CategoryCopy {
  // Optional override for the H1 (defaults to "[name] Resources").
  heading?: string;
  // 100-150 word intro shown below the H1.
  intro: string;
  // ~150-char meta description.
  meta: string;
}

const FALLBACK: CategoryCopy = {
  intro:
    "Curated organizations, conferences, publications, and tools for healthcare executives and the suppliers who serve them. Each entry is hand-picked by IDN Research, a project of the Institute of Healthcare Executives and Suppliers (IHES).",
  meta:
    "Curated healthcare resources for executives and suppliers — hand-picked by IDN Research, a project of IHES.",
};

export const CATEGORY_COPY: Record<string, CategoryCopy> = {
  "industry-meetings": {
    heading: "Healthcare Industry Meetings & Conferences",
    intro:
      "The conferences, summits, and executive forums where healthcare leaders actually show up. These meetings are where IDN executives, GPO leaders, and major suppliers spend in-person time together — building relationships, comparing notes on contracts and clinical strategy, and scouting vendors. The list here covers cross-functional executive meetings; for discipline-specific gatherings see Pharmacy Meetings, Supply Chain Meetings, Technology Meetings, Revenue Cycle Meetings, or Facilities Meetings.",
    meta:
      "The conferences, summits, and executive forums where healthcare leaders actually show up — curated by IDN Research.",
  },
  "industry-meetings-pharmacy": {
    heading: "Pharmacy Conferences for Healthcare Executives",
    intro:
      "Conferences focused on hospital and health-system pharmacy — formulary decisions, 340B, drug shortages, sterile compounding, specialty pharmacy, and pharmacist clinical practice. Audiences typically include directors of pharmacy, chief pharmacy officers, P&T committee members, and the manufacturers and distributors who supply them. If you're trying to reach decision-makers in pharmacy procurement or clinical pharmacy, these are the rooms.",
    meta:
      "Conferences for hospital pharmacy directors, CPOs, and the suppliers who serve them — curated by IDN Research.",
  },
  "industry-meetings-technology": {
    heading: "Healthcare Technology & Digital Health Conferences",
    intro:
      "Where healthcare CIOs, CMIOs, and digital health leaders gather to talk EHRs, AI, interoperability, cybersecurity, patient experience, and the build-vs-buy decisions shaping hospital IT. These meetings draw both health-system technology executives and the vendors selling into them — from established EHR companies to startup point solutions.",
    meta:
      "Conferences for healthcare CIOs, CMIOs, and digital health leaders — curated by IDN Research.",
  },
  "industry-meetings-revenue-cycle": {
    heading: "Healthcare Revenue Cycle Conferences",
    intro:
      "Meetings for the leaders responsible for hospital and physician-group revenue cycle: registration, coding, claims, denials, payer contracting, and patient financial experience. Audiences include CFOs, VPs of revenue cycle, and the technology and services vendors that work with them.",
    meta:
      "Conferences for healthcare revenue cycle leaders, CFOs, and RCM vendors — curated by IDN Research.",
  },
  "industry-meetings-facilities": {
    heading: "Healthcare Facilities & Construction Conferences",
    intro:
      "Conferences for healthcare facility executives — the directors of facilities, plant operations, real estate, environmental services, and capital construction at hospitals and health systems. Topics include sustainability, deferred maintenance, capital project delivery, biomed equipment, and the vendors who design, build, and service healthcare buildings.",
    meta:
      "Conferences for hospital facility directors, plant operations leaders, and capital construction teams — curated by IDN Research.",
  },
  "industry-meetings-supply-chain": {
    heading: "Healthcare Supply Chain Conferences",
    intro:
      "The events where hospital supply chain executives, GPO leadership, and major suppliers convene. Topics span sourcing strategy, contract management, distribution, value analysis, clinical integration, and the operational challenges of keeping a hospital stocked. If you sell into hospital supply chain or want to learn how it's being run, this is the list.",
    meta:
      "Conferences for hospital supply chain executives, GPOs, and supplier leaders — curated by IDN Research.",
  },
  "group-purchasing-organizations": {
    heading: "Group Purchasing Organizations (GPOs)",
    intro:
      "Group Purchasing Organizations aggregate hospital and health-system purchasing volume to negotiate national contracts on behalf of their members. Almost every hospital in the U.S. is a GPO member, and most major medical-supply purchases run through a GPO contract. This page lists the organizations themselves; understanding which GPO contracts your members hold is often the first step in any hospital sales conversation.",
    meta:
      "The major U.S. healthcare Group Purchasing Organizations (GPOs) — curated by IDN Research, a project of IHES.",
  },
  "federal-government-cms": {
    heading: "Federal Government & CMS Resources",
    intro:
      "U.S. federal agencies and programs that shape how hospitals and suppliers operate — including CMS (Medicare and Medicaid), FDA, HRSA's 340B program, the VA, and related regulators. These are the official sources for reimbursement rules, drug-pricing programs, device approvals, and policy changes that move the entire industry.",
    meta:
      "Official U.S. federal agencies and programs that regulate healthcare — CMS, FDA, HRSA 340B, VA, and more.",
  },
  resources: {
    heading: "Healthcare Industry Resources",
    intro:
      "A catch-all of useful organizations, datasets, and reference sites for healthcare executives and suppliers that don't fit cleanly into another category. Includes industry research, market data, and sector-specific reference material.",
    meta:
      "General-purpose healthcare industry resources — research, market data, and reference material curated by IDN Research.",
  },
  "search-firms-staffing": {
    heading: "Healthcare Executive Search & Staffing Firms",
    intro:
      "The executive search firms and staffing agencies that recruit healthcare leadership and clinical talent — from C-suite to interim leadership to physician and nursing recruitment. If you're hiring at the executive level or evaluating recruiters, this is a starting list.",
    meta:
      "Executive search firms and staffing agencies serving healthcare — curated by IDN Research.",
  },
  "womens-health-resources": {
    heading: "Women's Health & Women in Healthcare Leadership",
    intro:
      "Resources focused on women's clinical health programs and women in healthcare leadership — professional networks, leadership development organizations, and women-led conferences. Useful for sponsorship targeting, partnership outreach, and connecting with the growing community of women shaping healthcare.",
    meta:
      "Women's health and women-in-healthcare-leadership resources — curated by IDN Research.",
  },
  "provider-physician-resources": {
    heading: "Provider & Physician Resources",
    intro:
      "Physician societies, provider networks, and clinician-facing organizations. Useful for any supplier, payer, or service company that needs to reach practicing physicians or understand the physician landscape — including specialty societies, MGMA-style operational resources, and physician-leadership networks.",
    meta:
      "Physician societies, provider networks, and clinician-facing organizations — curated by IDN Research.",
  },
  podcasts: {
    heading: "Healthcare Industry Podcasts",
    intro:
      "Podcasts where healthcare executives, founders, investors, and operators tell their stories — covering hospital operations, supply chain, pharmacy, digital health, payer strategy, and venture investing. A useful way to keep a finger on the pulse of the industry between conferences.",
    meta:
      "The best podcasts for healthcare executives, suppliers, and investors — curated by IDN Research.",
  },
  "consulting-capital": {
    heading: "Healthcare Consulting Firms & Capital Sources",
    intro:
      "Strategy and operations consultancies serving hospitals and suppliers, plus the private equity, venture capital, and growth-equity firms investing in healthcare. Useful for executives evaluating advisors, suppliers tracking who's funding their competitors, and operators looking for capital partners.",
    meta:
      "Healthcare consulting firms, private equity, and venture capital — curated by IDN Research.",
  },
  "national-accounts-sales-support": {
    heading: "National Accounts & Sales Support Resources",
    intro:
      "Tools, organizations, and reference resources for the national-accounts and sales teams selling into hospitals and IDNs — pricing benchmarks, contract intelligence, account-based marketing platforms, and supplier-association resources. The infrastructure behind selling at scale into healthcare.",
    meta:
      "National-accounts and sales-support resources for healthcare suppliers — curated by IDN Research.",
  },
  "tools-apps": {
    heading: "Tools & Apps for Healthcare Professionals",
    intro:
      "Apps and software tools that healthcare executives, clinicians, and suppliers actually use day-to-day — productivity, intelligence, clinical reference, and workflow tools. Selected for relevance to people working in or selling into healthcare.",
    meta:
      "Apps and software tools used by healthcare executives, clinicians, and suppliers — curated by IDN Research.",
  },
  "travel-sites": {
    heading: "Travel Resources for Healthcare Executives",
    intro:
      "Travel and logistics resources useful for the heavy travel schedule of healthcare executives and field-based sales teams — from hotel and airline programs to expense tools to travel-planning utilities.",
    meta:
      "Travel resources for healthcare executives and field sales teams — curated by IDN Research.",
  },
  "companies-newsletters": {
    heading: "Healthcare Media, Newsletters & Trade Publications",
    intro:
      "The publications, newsletters, and content brands that healthcare executives actually read — trade press, analyst firms, and independent newsletters covering hospitals, suppliers, payers, and digital health. A useful list for both staying informed and identifying earned-media opportunities.",
    meta:
      "Trade publications, newsletters, and content brands for healthcare leaders — curated by IDN Research.",
  },
};

export function getCategoryCopy(slug: string): CategoryCopy {
  return CATEGORY_COPY[slug] ?? FALLBACK;
}

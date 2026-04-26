// Original intro copy for the 14 directory domains.
// Keyed by domain ID (matches taxonomy_domains.id in Supabase).
// Hays — edit freely. Aim for 100-150 words.

interface DomainCopy {
  intro: string;
  meta: string;
}

const FALLBACK: DomainCopy = {
  intro:
    "Healthcare companies in this domain — vendors, manufacturers, distributors, and service providers serving hospitals, IDNs, and physician practices. Curated by IDN Research, a project of IHES.",
  meta:
    "Healthcare companies in this domain — curated by IDN Research, a project of IHES.",
};

export const DOMAIN_COPY: Record<number, DomainCopy> = {
  1: {
    intro:
      "Companies that design, manufacture, and sell the implants, surgical instruments, single-use procedural products, and other medical devices used in hospitals, ASCs, and physician offices. This is one of the largest spend categories for any health system and one of the most actively managed by hospital supply chain and clinical value analysis teams.",
    meta:
      "Medical device manufacturers, implant makers, and procedural-product companies — IDN Research directory.",
  },
  2: {
    intro:
      "Manufacturers of capital medical equipment and imaging systems — MRI, CT, ultrasound, surgical robotics, patient monitoring, and other big-ticket purchases that require board-level approval and long planning cycles. The companies in this domain sell to hospital and IDN capital committees, often through GPO contracts.",
    meta:
      "Capital medical equipment and imaging system manufacturers — IDN Research directory.",
  },
  3: {
    intro:
      "Diagnostics and laboratory companies — in-vitro diagnostics manufacturers, reference labs, point-of-care testing, anatomic pathology, and the instrument and reagent vendors that supply hospital and reference lab operations. A high-volume, high-frequency category with deep relationships into health-system labs.",
    meta:
      "Diagnostics manufacturers, reference labs, and laboratory equipment vendors — IDN Research directory.",
  },
  4: {
    intro:
      "Pharmaceutical manufacturers, drug distributors, pharmacy automation companies, specialty pharmacies, and the technology vendors serving hospital and outpatient pharmacy operations. Includes companies focused on 340B program services, sterile compounding, drug-shortage management, and specialty drug distribution.",
    meta:
      "Pharmaceutical manufacturers, distributors, pharmacy automation, and 340B services — IDN Research directory.",
  },
  5: {
    intro:
      "Digital health, health IT, and AI companies — EHRs, clinical decision support, revenue cycle technology, patient engagement, telehealth, AI-assisted clinical and operational tools, and the broader software stack hospitals and physician groups buy. The fastest-evolving domain in healthcare and one of the most invested-in by venture capital.",
    meta:
      "EHRs, digital health, health IT, and healthcare AI companies — IDN Research directory.",
  },
  6: {
    intro:
      "The companies that move medical products from manufacturer to point of care — distributors, GPOs, third-party logistics providers, and the technology vendors building hospital supply-chain visibility, sourcing intelligence, and contract management tools.",
    meta:
      "Medical distributors, GPOs, 3PLs, and supply chain technology vendors — IDN Research directory.",
  },
  7: {
    intro:
      "Companies providing clinical and outsourced care services to hospitals and health systems — emergency medicine, hospitalist, anesthesia, radiology, dialysis, post-acute care, and other clinical service lines that hospitals frequently contract out. Often national in scope and structured as physician-led service organizations or PE-backed platforms.",
    meta:
      "Hospital clinical service providers and outsourced care companies — IDN Research directory.",
  },
  8: {
    intro:
      "Outsourced operational services for hospitals and health systems that don't involve direct clinical care — environmental services, food service, security, valet, transport, sterile processing, linen, and other non-clinical functions hospitals frequently contract out to specialty vendors.",
    meta:
      "Hospital outsourced operations vendors — environmental services, food service, security, and more.",
  },
  9: {
    intro:
      "Companies serving the physical infrastructure of healthcare — building design and construction, biomed equipment service, facility maintenance, energy management, and the specialty contractors who keep hospital plants running. Long sales cycles, capital-budget exposure, and deep relationships with facilities executives.",
    meta:
      "Healthcare facility design, biomed service, and infrastructure companies — IDN Research directory.",
  },
  10: {
    intro:
      "Staffing agencies, executive search firms, management consultancies, and professional service providers serving hospitals, suppliers, payers, and digital health companies. Includes both hospital-focused operational consultancies and the strategy and PE-advisory firms working across the industry.",
    meta:
      "Healthcare staffing, executive search, and consulting firms — IDN Research directory.",
  },
  11: {
    intro:
      "Health insurance companies, payment processors, revenue cycle services, patient financing, and the financial-technology vendors building infrastructure for healthcare claims, payments, and reimbursement. The financial plumbing of U.S. healthcare.",
    meta:
      "Healthcare payers, payment processors, RCM, and patient financing companies — IDN Research directory.",
  },
  12: {
    intro:
      "Companies serving the life sciences and clinical research ecosystem — CROs, site networks, clinical trial technology, real-world data providers, and the suppliers serving pharmaceutical and biotech R&D. Distinct from the hospital-purchasing world but increasingly intertwined as health systems take on more research.",
    meta:
      "CROs, clinical trial technology, and life sciences research companies — IDN Research directory.",
  },
  13: {
    intro:
      "Provider organizations themselves — health systems, IDNs, ACOs, large physician groups, and other care-delivery organizations. The buyers in most healthcare supplier conversations and the operators of the country's hospitals and clinics.",
    meta:
      "Health systems, IDNs, ACOs, and large physician groups — IDN Research directory.",
  },
  14: {
    intro:
      "Trade publications, industry associations, and event organizers serving the healthcare industry. The companies running the conferences, publishing the trade press, and maintaining the professional associations that connect the rest of the ecosystem.",
    meta:
      "Healthcare trade publications, associations, and event organizers — IDN Research directory.",
  },
};

export function getDomainCopy(domainId: number): DomainCopy {
  return DOMAIN_COPY[domainId] ?? FALLBACK;
}

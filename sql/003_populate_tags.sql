-- IDN Research Platform — Populate Tags
-- Run in Supabase SQL Editor AFTER 002_seed_data.sql
-- Sets tags (text[]) on all resources for filtering and search

-- ============================================
-- Companies / Newsletters
-- ============================================
UPDATE resources SET tags = ARRAY['newsletter', 'strategy', 'healthcare'] WHERE name = '4sight Health';
UPDATE resources SET tags = ARRAY['association', 'hospital', 'policy'] WHERE name = 'American Hospital Association';
UPDATE resources SET tags = ARRAY['journal', 'strategy', 'C-suite'] WHERE name = 'AJHCS (American Journal of Healthcare Strategy)';
UPDATE resources SET tags = ARRAY['newsletter', 'news', 'C-suite'] WHERE name = 'Becker''s Healthcare';
UPDATE resources SET tags = ARRAY['news', 'pharmacy', 'newsletter'] WHERE name = 'BioPharmaDrive';
UPDATE resources SET tags = ARRAY['newsletter', 'physician', 'ambulatory'] WHERE name = 'Business of Primary Care';
UPDATE resources SET tags = ARRAY['news', 'C-suite', 'leadership'] WHERE name = 'Chief Healthcare Executive';
UPDATE resources SET tags = ARRAY['newsletter', 'digital health', 'technology'] WHERE name = 'Digital Healthwire';
UPDATE resources SET tags = ARRAY['newsletter', 'pharmacy', 'supply chain'] WHERE name = 'Drug Channels Institute';
UPDATE resources SET tags = ARRAY['news', 'pharmacy', 'clinical'] WHERE name = 'EndPoint News';
UPDATE resources SET tags = ARRAY['research', 'healthcare', 'policy'] WHERE name = 'HealthEconomics.com';
UPDATE resources SET tags = ARRAY['association', 'supply chain', 'healthcare'] WHERE name = 'HIRC (Healthcare Industry Resilience Collaborative)';
UPDATE resources SET tags = ARRAY['news', 'healthcare', 'newsletter'] WHERE name = 'Fierce Healthcare';
UPDATE resources SET tags = ARRAY['news', 'pharmacy', 'newsletter'] WHERE name = 'Fierce Pharma';
UPDATE resources SET tags = ARRAY['newsletter', 'healthcare', 'strategy'] WHERE name = 'Gist Health';
UPDATE resources SET tags = ARRAY['journal', 'leadership', 'strategy'] WHERE name = 'Harvard Business Review';
UPDATE resources SET tags = ARRAY['magazine', 'C-suite', 'leadership'] WHERE name = 'Healthcare Executive';
UPDATE resources SET tags = ARRAY['news', 'C-suite', 'leadership'] WHERE name = 'HealthLeaders';
UPDATE resources SET tags = ARRAY['news', 'healthcare', 'newsletter'] WHERE name = 'Healthcare Dive';
UPDATE resources SET tags = ARRAY['news', 'technology', 'innovation'] WHERE name = 'Healthcare Innovation';
UPDATE resources SET tags = ARRAY['research', 'C-suite', 'health system'] WHERE name = 'Health Management Academy';
UPDATE resources SET tags = ARRAY['news', 'supply chain', 'hospital'] WHERE name = 'Healthcare Purchasing News';
UPDATE resources SET tags = ARRAY['news', 'technology', 'healthcare'] WHERE name = 'Healthcare Tech Outlook';
UPDATE resources SET tags = ARRAY['newsletter', 'innovation', 'healthcare'] WHERE name = 'Healthcare Transformers';
UPDATE resources SET tags = ARRAY['magazine', 'supply chain', 'hospital'] WHERE name = 'Healthcare Value Analysis & Utilization Management Magazine';
UPDATE resources SET tags = ARRAY['newsletter', 'health system', 'strategy'] WHERE name = 'Hospitalogy';
UPDATE resources SET tags = ARRAY['magazine', 'supply chain', 'healthcare'] WHERE name = 'Journal of Healthcare Contracting';
UPDATE resources SET tags = ARRAY['news', 'healthcare', 'policy'] WHERE name = 'Kaiser Health News';
UPDATE resources SET tags = ARRAY['research', 'CFO', 'hospital'] WHERE name = 'Kaufman Hall Flash Report';
UPDATE resources SET tags = ARRAY['news', 'healthcare', 'technology'] WHERE name = 'MarketScale';
UPDATE resources SET tags = ARRAY['news', 'technology', 'healthcare'] WHERE name = 'MassDevice';
UPDATE resources SET tags = ARRAY['consulting', 'strategy', 'health system'] WHERE name = 'McKinsey & Company';
UPDATE resources SET tags = ARRAY['news', 'healthcare', 'innovation'] WHERE name = 'MedCity News';
UPDATE resources SET tags = ARRAY['news', 'clinical', 'healthcare'] WHERE name = 'Medical News Today';
UPDATE resources SET tags = ARRAY['magazine', 'pharmacy', 'healthcare'] WHERE name = 'Medical Marketing + Media';
UPDATE resources SET tags = ARRAY['news', 'technology', 'healthcare'] WHERE name = 'MedTech Dive';
UPDATE resources SET tags = ARRAY['news', 'technology', 'healthcare'] WHERE name = 'Med Tech Outlook';
UPDATE resources SET tags = ARRAY['news', 'healthcare', 'C-suite'] WHERE name = 'Modern Healthcare';
UPDATE resources SET tags = ARRAY['newsletter', 'supply chain', 'clinical'] WHERE name = 'Orthopedic Network News (ONN)';
UPDATE resources SET tags = ARRAY['news', 'clinical', 'healthcare'] WHERE name = 'Orthoworld';
UPDATE resources SET tags = ARRAY['magazine', 'technology', 'clinical'] WHERE name = 'Orthopedic Design & Technology';
UPDATE resources SET tags = ARRAY['magazine', 'clinical', 'hospital'] WHERE name = 'OR Today';
UPDATE resources SET tags = ARRAY['newsletter', 'healthcare', 'innovation'] WHERE name = 'Out-Of-Pocket';
UPDATE resources SET tags = ARRAY['news', 'pharmacy', 'technology'] WHERE name = 'Pharma Tech Outlook';
UPDATE resources SET tags = ARRAY['magazine', 'pharmacy', 'healthcare'] WHERE name = 'PharmaVoice';
UPDATE resources SET tags = ARRAY['news', 'technology', 'healthcare'] WHERE name = 'QMed MD+DI';
UPDATE resources SET tags = ARRAY['magazine', 'supply chain', 'healthcare'] WHERE name = 'Repertoire Magazine';
UPDATE resources SET tags = ARRAY['newsletter', 'revenue cycle', 'healthcare'] WHERE name = 'Revenue Cycle Resources-RCR Hub';
UPDATE resources SET tags = ARRAY['news', 'healthcare', 'clinical'] WHERE name = 'STAT';
UPDATE resources SET tags = ARRAY['news', 'digital health', 'innovation'] WHERE name = 'StartUp Health';

-- ============================================
-- Industry Meetings
-- ============================================
UPDATE resources SET tags = ARRAY['conference', 'association', 'pharmacy'] WHERE name = 'AACP (American Association of Colleges of Pharmacy)';
UPDATE resources SET tags = ARRAY['conference', 'association', 'technology'] WHERE name = 'AAMI (Association for the Advancement of Medical Instrumentation)';
UPDATE resources SET tags = ARRAY['conference', 'association', 'workforce'] WHERE name = 'AAPPR (Association for Advancing Physician and Provider Recruitment)';
UPDATE resources SET tags = ARRAY['conference', 'association', 'clinical'] WHERE name = 'AAOS (American Academy of Orthopedic Surgeons)';
UPDATE resources SET tags = ARRAY['conference', 'association', 'clinical'] WHERE name = 'ACOG (American College of Obstetricians and Gynecologists)';
UPDATE resources SET tags = ARRAY['conference', 'association', 'data analytics'] WHERE name = 'AHIMA (American Health Information Management Association)';
UPDATE resources SET tags = ARRAY['conference', 'association', 'C-suite'] WHERE name = 'ACHE (American College of Healthcare Executives)';
UPDATE resources SET tags = ARRAY['conference', 'association', 'supply chain'] WHERE name = 'AHRMM (Association for Health Care Resources & Materials Management)';
UPDATE resources SET tags = ARRAY['conference', 'association', 'supply chain'] WHERE name = 'AHVAP (Association of Healthcare Value Analysis Professionals)';
UPDATE resources SET tags = ARRAY['conference', 'association', 'supply chain'] WHERE name = 'ANAE (Association of National Account Executives)';
UPDATE resources SET tags = ARRAY['conference', 'association', 'clinical'] WHERE name = 'APIC (Association for Professionals in Infection Control and Epidemiology)';
UPDATE resources SET tags = ARRAY['conference', 'association', 'ambulatory'] WHERE name = 'ASCA (Ambulatory Surgery Center Association)';
UPDATE resources SET tags = ARRAY['conference', 'association', 'clinical'] WHERE name = 'ASCP (American Society for Clinical Pathology)';
UPDATE resources SET tags = ARRAY['conference', 'association', 'clinical'] WHERE name = 'ASH (American Society of Hematology)';
UPDATE resources SET tags = ARRAY['conference', 'association', 'workforce'] WHERE name = 'ASHHRA (American Society for Healthcare Human Resources Administration)';
UPDATE resources SET tags = ARRAY['conference', 'association', 'pharmacy'] WHERE name = 'ASHP (American Society of Health-System Pharmacists)';
UPDATE resources SET tags = ARRAY['conference', 'association', 'nursing'] WHERE name = 'AONL (American Organization for Nursing Leadership)';
UPDATE resources SET tags = ARRAY['conference', 'association', 'nursing'] WHERE name = 'AORN (Association of periOperative Registered Nurses)';
UPDATE resources SET tags = ARRAY['conference', 'pharmacy', 'healthcare'] WHERE name = 'Asembia-Speciality Pharmacy Summit';
UPDATE resources SET tags = ARRAY['conference', 'clinical', 'hospital'] WHERE name = 'BRINetwork (Operating Room Management Summit)';
UPDATE resources SET tags = ARRAY['conference', 'association', 'supply chain'] WHERE name = 'CSCE (The Council of Supply Chain Executives)';
UPDATE resources SET tags = ARRAY['conference', 'association', 'pharmacy'] WHERE name = 'CPES (The Council of Pharmacy Executives and Suppliers)';
UPDATE resources SET tags = ARRAY['conference', 'association', 'hospital'] WHERE name = 'Federation of American Hospitals';
UPDATE resources SET tags = ARRAY['conference', 'technology', 'healthcare'] WHERE name = 'FIME (Federation of International Medical Equipment Suppliers)';
UPDATE resources SET tags = ARRAY['conference', 'supply chain', 'healthcare'] WHERE name = 'HCP (Health Connect Partners)';
UPDATE resources SET tags = ARRAY['conference', 'association', 'revenue cycle'] WHERE name = 'HFMA (Healthcare Financial Management Association)';
UPDATE resources SET tags = ARRAY['conference', 'facilities', 'healthcare'] WHERE name = 'Healthcare Facilities Symposium & Expo';
UPDATE resources SET tags = ARRAY['conference', 'innovation', 'digital health'] WHERE name = 'HLTH';
UPDATE resources SET tags = ARRAY['conference', 'association', 'supply chain'] WHERE name = 'HIDA (Health Industry Distributors Association)';
UPDATE resources SET tags = ARRAY['conference', 'association', 'technology'] WHERE name = 'HIMSS (Healthcare Information & Management Systems Society)';
UPDATE resources SET tags = ARRAY['conference', 'supply chain', 'C-suite'] WHERE name = 'IDN Summit & Reverse Expo';
UPDATE resources SET tags = ARRAY['conference', 'association', 'C-suite'] WHERE name = 'IHES (Institute of Healthcare Executives and Suppliers)';
UPDATE resources SET tags = ARRAY['conference', 'strategy', 'healthcare'] WHERE name = 'J.P. Morgan Healthcare Conference';
UPDATE resources SET tags = ARRAY['conference', 'technology', 'healthcare'] WHERE name = 'Medica';
UPDATE resources SET tags = ARRAY['conference', 'association', 'revenue cycle'] WHERE name = 'NAHAM (National Association of Healthcare Access Management)';
UPDATE resources SET tags = ARRAY['conference', 'association', 'physician'] WHERE name = 'MGMA (Medical Group Management Association)';
UPDATE resources SET tags = ARRAY['conference', 'association', 'pharmacy'] WHERE name = 'NASP (National Association of Specialty Pharmacy)';
UPDATE resources SET tags = ARRAY['conference', 'leadership', 'healthcare'] WHERE name = 'Professional Women in Healthcare Leadership Summit';
UPDATE resources SET tags = ARRAY['conference', 'association', 'clinical'] WHERE name = 'RSNA (Radiological Society of North America)';
UPDATE resources SET tags = ARRAY['conference', 'association', 'clinical'] WHERE name = 'SCCM (Society of Critical Care Medicine)';
UPDATE resources SET tags = ARRAY['conference', 'association', 'technology'] WHERE name = 'SRS (Society of Robotic Surgery)';
UPDATE resources SET tags = ARRAY['conference', 'association', 'clinical'] WHERE name = 'SHEA (Society for Healthcare Epidemiology of America)';
UPDATE resources SET tags = ARRAY['conference', 'association', 'supply chain'] WHERE name = 'SMI-Strategic Marketplace Initiative';
UPDATE resources SET tags = ARRAY['conference', 'government', 'healthcare'] WHERE name = 'VA Healthcare (IDGA''s Annual VA Healthcare Summit)';
UPDATE resources SET tags = ARRAY['conference', 'clinical', 'innovation'] WHERE name = 'World Hospital at Home Congress';

-- ============================================
-- Industry Meetings — Pharmacy
-- ============================================
UPDATE resources SET tags = ARRAY['conference', 'pharmacy', 'policy'] WHERE name = '340B Coalition';
UPDATE resources SET tags = ARRAY['conference', 'pharmacy', 'policy'] WHERE name = '340B Grantees Conference';
UPDATE resources SET tags = ARRAY['conference', 'pharmacy', 'policy'] WHERE name = '340B Summer Conference';
UPDATE resources SET tags = ARRAY['conference', 'pharmacy', 'association'] WHERE name = 'ACCP (American College of Clinical Pharmacy)';
UPDATE resources SET tags = ARRAY['conference', 'pharmacy', 'payer'] WHERE name = 'AMCP (Academy of Managed Care Pharmacy)';
UPDATE resources SET tags = ARRAY['conference', 'pharmacy', 'association'] WHERE name = 'APhA (American Pharmacist Association)';
UPDATE resources SET tags = ARRAY['conference', 'pharmacy', 'clinical'] WHERE name = 'ASPN (American Society of Pain & Neuroscience)';
UPDATE resources SET tags = ARRAY['conference', 'pharmacy', 'clinical'] WHERE name = 'ASM (American Society for Microbiology)';
UPDATE resources SET tags = ARRAY['conference', 'pharmacy', 'technology'] WHERE name = 'Autonomous Pharmacy';
UPDATE resources SET tags = ARRAY['conference', 'pharmacy', 'clinical'] WHERE name = 'CROI (Conference on Retroviruses and Opportunistic Infections)';
UPDATE resources SET tags = ARRAY['conference', 'pharmacy', 'regulatory'] WHERE name = 'DIA (Drug Information Association)';
UPDATE resources SET tags = ARRAY['conference', 'pharmacy', 'clinical'] WHERE name = 'HOPA (Hematology/Oncology Pharmacy Association)';
UPDATE resources SET tags = ARRAY['conference', 'pharmacy', 'clinical'] WHERE name = 'IgNS (Immunoglobulin National Society)';
UPDATE resources SET tags = ARRAY['conference', 'pharmacy', 'association'] WHERE name = 'NACDS (National Association of Chain Drug Stores)';
UPDATE resources SET tags = ARRAY['conference', 'pharmacy', 'clinical'] WHERE name = 'NHIA (National Home Infusion Association)';
UPDATE resources SET tags = ARRAY['conference', 'pharmacy', 'clinical'] WHERE name = 'NICA (National Infusion Center Association)';
UPDATE resources SET tags = ARRAY['conference', 'pharmacy', 'supply chain'] WHERE name = 'NPPA (National Pharmacy Purchasing Association)';
UPDATE resources SET tags = ARRAY['conference', 'pharmacy', 'payer'] WHERE name = 'PCMA (Pharmaceutical Care Management Association)';
UPDATE resources SET tags = ARRAY['conference', 'pharmacy', 'healthcare'] WHERE name = 'Pharma USA';

-- ============================================
-- Industry Meetings — Technology
-- ============================================
UPDATE resources SET tags = ARRAY['conference', 'technology', 'healthcare'] WHERE name = 'American Medical Device Summit';
UPDATE resources SET tags = ARRAY['conference', 'technology', 'data analytics'] WHERE name = 'AMIA (American Medical Informatics Association)';
UPDATE resources SET tags = ARRAY['conference', 'technology', 'innovation'] WHERE name = 'CES (Consumer Technology Association)';
UPDATE resources SET tags = ARRAY['conference', 'digital health', 'technology'] WHERE name = 'Digital Health Reuters';
UPDATE resources SET tags = ARRAY['conference', 'digital health', 'innovation'] WHERE name = 'DHIS (Digital Healthcare Innovation Summit)';
UPDATE resources SET tags = ARRAY['conference', 'technology', 'healthcare'] WHERE name = 'e-Health Conference and Tradeshow (Canada)';
UPDATE resources SET tags = ARRAY['conference', 'data analytics', 'healthcare'] WHERE name = 'Health Datapalooza';
UPDATE resources SET tags = ARRAY['conference', 'data analytics', 'technology'] WHERE name = 'HAS (Healthcare Analytics Summit)';
UPDATE resources SET tags = ARRAY['conference', 'technology', 'healthcare'] WHERE name = 'Healthcare IT Connect';
UPDATE resources SET tags = ARRAY['conference', 'technology', 'healthcare'] WHERE name = 'SIIM (Society for Imaging Informatics in Medicine)';
UPDATE resources SET tags = ARRAY['conference', 'technology', 'innovation'] WHERE name = 'SXSW Health and MedTech';
UPDATE resources SET tags = ARRAY['conference', 'technology', 'innovation'] WHERE name = 'thinc (The Healthcare Innovation Company)';
UPDATE resources SET tags = ARRAY['conference', 'technology', 'digital health'] WHERE name = 'ViVe';

-- ============================================
-- Industry Meetings — Revenue Cycle
-- ============================================
UPDATE resources SET tags = ARRAY['conference', 'revenue cycle', 'association'] WHERE name = 'AAHAM (American Association of Healthcare Administrative Management)';
UPDATE resources SET tags = ARRAY['conference', 'revenue cycle', 'association'] WHERE name = 'AAPC (American Academy of Professional Coders)';
UPDATE resources SET tags = ARRAY['conference', 'revenue cycle', 'association'] WHERE name = 'AMBA (American Medical Billing Association)';
UPDATE resources SET tags = ARRAY['conference', 'revenue cycle', 'healthcare'] WHERE name = 'Beckers Revenue Cycle Conference';
UPDATE resources SET tags = ARRAY['conference', 'revenue cycle', 'association'] WHERE name = 'HFMA Chapters & Regions';
UPDATE resources SET tags = ARRAY['conference', 'revenue cycle', 'association'] WHERE name = 'HBMA (Healthcare Business Management Association)';
UPDATE resources SET tags = ARRAY['conference', 'revenue cycle', 'healthcare'] WHERE name = 'Healthcare Payment and Revenue Integrity Congress';

-- ============================================
-- Industry Meetings — Facilities
-- ============================================
UPDATE resources SET tags = ARRAY['conference', 'facilities', 'supply chain'] WHERE name = 'ACE Summit & Reverse Expo';
UPDATE resources SET tags = ARRAY['conference', 'facilities', 'association'] WHERE name = 'AHE (Association for the Health Care Environment)';
UPDATE resources SET tags = ARRAY['conference', 'facilities', 'association'] WHERE name = 'AMFP (Association of Medical Facility Professionals)';
UPDATE resources SET tags = ARRAY['conference', 'facilities', 'association'] WHERE name = 'ASHE (American Society of Health Care Engineering)';
UPDATE resources SET tags = ARRAY['conference', 'facilities', 'healthcare'] WHERE name = 'Bisnow Healthcare Summit';
UPDATE resources SET tags = ARRAY['conference', 'facilities', 'association'] WHERE name = 'BOMA (Building Owners and Managers Association)';
UPDATE resources SET tags = ARRAY['conference', 'facilities', 'healthcare'] WHERE name = 'Healthcare Design Conference+Expo';
UPDATE resources SET tags = ARRAY['conference', 'facilities', 'healthcare'] WHERE name = 'Healthcare Facilities Expo';
UPDATE resources SET tags = ARRAY['conference', 'facilities', 'ambulatory'] WHERE name = 'Hospital, Outpatient Facilities & Medical Office Buildings Summits';
UPDATE resources SET tags = ARRAY['conference', 'facilities', 'healthcare'] WHERE name = 'HSI (Healthcare Surfaces Institute)';
UPDATE resources SET tags = ARRAY['conference', 'facilities', 'C-suite'] WHERE name = 'Opal Group';

-- ============================================
-- Industry Meetings — Supply Chain
-- ============================================
UPDATE resources SET tags = ARRAY['conference', 'supply chain', 'association'] WHERE name = 'Bellwether League Foundation';
UPDATE resources SET tags = ARRAY['conference', 'supply chain', 'strategy'] WHERE name = 'Gartner Supply Chain Symposium';
UPDATE resources SET tags = ARRAY['conference', 'supply chain', 'technology'] WHERE name = 'GHX Summits';
UPDATE resources SET tags = ARRAY['conference', 'supply chain', 'interoperability'] WHERE name = 'GS1';
UPDATE resources SET tags = ARRAY['conference', 'supply chain', 'association'] WHERE name = 'HDA (Healthcare Distribution Alliance)';
UPDATE resources SET tags = ARRAY['conference', 'supply chain', 'technology'] WHERE name = 'LogiMed';
UPDATE resources SET tags = ARRAY['conference', 'supply chain', 'clinical'] WHERE name = 'RNA (Radiological Society of North America)';

-- ============================================
-- Group Purchasing Organizations
-- ============================================
UPDATE resources SET tags = ARRAY['GPO', 'supply chain', 'healthcare'] WHERE name = 'Advantus Health Partners';
UPDATE resources SET tags = ARRAY['GPO', 'supply chain', 'health system'] WHERE name = 'Advocate Health Supply Chain Alliance';
UPDATE resources SET tags = ARRAY['GPO', 'supply chain', 'healthcare'] WHERE name = 'Allied Health Solutions';
UPDATE resources SET tags = ARRAY['GPO', 'supply chain', 'health system'] WHERE name = 'AllSpire Health Partners';
UPDATE resources SET tags = ARRAY['GPO', 'supply chain', 'healthcare'] WHERE name = 'Captis';
UPDATE resources SET tags = ARRAY['GPO', 'supply chain', 'healthcare'] WHERE name = 'Capstone Health Alliance';
UPDATE resources SET tags = ARRAY['GPO', 'supply chain', 'healthcare'] WHERE name = 'CHC Supply Trust';
UPDATE resources SET tags = ARRAY['GPO', 'supply chain', 'hospital'] WHERE name = 'Greater New York Hospital Association (GNYHA)';
UPDATE resources SET tags = ARRAY['GPO', 'supply chain', 'health system'] WHERE name = 'HealthTrust Performance Group';
UPDATE resources SET tags = ARRAY['GPO', 'supply chain', 'healthcare'] WHERE name = 'HPS';
UPDATE resources SET tags = ARRAY['GPO', 'supply chain', 'healthcare'] WHERE name = 'Partners Cooperative';
UPDATE resources SET tags = ARRAY['GPO', 'supply chain', 'healthcare'] WHERE name = 'Pandion Optimization Alliance';
UPDATE resources SET tags = ARRAY['GPO', 'supply chain', 'health system'] WHERE name = 'Premier Inc.';
UPDATE resources SET tags = ARRAY['GPO', 'supply chain', 'healthcare'] WHERE name = 'Provista';
UPDATE resources SET tags = ARRAY['GPO', 'supply chain', 'healthcare'] WHERE name = 'TPC';
UPDATE resources SET tags = ARRAY['GPO', 'supply chain', 'healthcare'] WHERE name = 'Yankee Alliance';
UPDATE resources SET tags = ARRAY['GPO', 'supply chain', 'health system'] WHERE name = 'Vizient';

-- ============================================
-- Federal Government / CMS
-- ============================================
UPDATE resources SET tags = ARRAY['government', 'policy', 'healthcare'] WHERE name = 'Medicare Publications';
UPDATE resources SET tags = ARRAY['government', 'policy', 'healthcare'] WHERE name = 'Medicare.gov';
UPDATE resources SET tags = ARRAY['government', 'policy', 'regulatory'] WHERE name = 'Centers for Medicare and Medicaid Services';
UPDATE resources SET tags = ARRAY['government', 'data analytics', 'healthcare'] WHERE name = 'CMS Stats';
UPDATE resources SET tags = ARRAY['government', 'pharmacy', 'regulatory'] WHERE name = 'DSCSA (Drug Supply Chain and Security Act)';
UPDATE resources SET tags = ARRAY['government', 'data analytics', 'healthcare'] WHERE name = 'HealthData.gov';
UPDATE resources SET tags = ARRAY['government', 'policy', 'healthcare'] WHERE name = 'List of State Medicaid Programs';
UPDATE resources SET tags = ARRAY['government', 'directory', 'healthcare'] WHERE name = 'List of State Health Departments';
UPDATE resources SET tags = ARRAY['government', 'directory', 'hospital'] WHERE name = 'CMS List of Hospitals by State';
UPDATE resources SET tags = ARRAY['government', 'regulatory', 'healthcare'] WHERE name = 'Food and Drug Administration';
UPDATE resources SET tags = ARRAY['government', 'policy', 'healthcare'] WHERE name = 'Office of Disease Prevention and Health Promotion';
UPDATE resources SET tags = ARRAY['government', 'data analytics', 'healthcare'] WHERE name = 'Open Payments Data';
UPDATE resources SET tags = ARRAY['government', 'research', 'clinical'] WHERE name = 'National Institutes of Health';
UPDATE resources SET tags = ARRAY['government', 'research', 'clinical'] WHERE name = 'National Cancer Institute';
UPDATE resources SET tags = ARRAY['government', 'data analytics', 'policy'] WHERE name = 'USA Government Spending';

-- ============================================
-- Resources
-- ============================================
UPDATE resources SET tags = ARRAY['association', 'payer', 'policy'] WHERE name = 'AHIP (America''s Health Insurance Plans)';
UPDATE resources SET tags = ARRAY['government', 'directory', 'research'] WHERE name = 'A-Z Federal Agencies';
UPDATE resources SET tags = ARRAY['government', 'data analytics', 'research'] WHERE name = 'Bureau of Justice Stats';
UPDATE resources SET tags = ARRAY['government', 'data analytics', 'research'] WHERE name = 'Census Bureau';
UPDATE resources SET tags = ARRAY['research', 'data analytics', 'healthcare'] WHERE name = 'Clarivate';
UPDATE resources SET tags = ARRAY['research', 'data analytics', 'health system'] WHERE name = 'Definitive Healthcare';
UPDATE resources SET tags = ARRAY['research', 'pharmacy', 'directory'] WHERE name = 'Drugsdb.com';
UPDATE resources SET tags = ARRAY['research', 'pharmacy', 'directory'] WHERE name = 'Drug Index- RXList';
UPDATE resources SET tags = ARRAY['tools', 'pharmacy', 'clinical'] WHERE name = 'Epocrates';
UPDATE resources SET tags = ARRAY['tools', 'news', 'research'] WHERE name = 'Google Alerts';
UPDATE resources SET tags = ARRAY['tools', 'data analytics', 'research'] WHERE name = 'Google Trends';
UPDATE resources SET tags = ARRAY['research', 'directory', 'healthcare'] WHERE name = 'GuideStar';
UPDATE resources SET tags = ARRAY['quality', 'safety', 'hospital'] WHERE name = 'The Joint Commission';
UPDATE resources SET tags = ARRAY['directory', 'news', 'research'] WHERE name = 'Magazine Directory';
UPDATE resources SET tags = ARRAY['government', 'safety', 'regulatory'] WHERE name = 'MAUDE (Manufacturer and User Facility Device Experience)';
UPDATE resources SET tags = ARRAY['research', 'clinical', 'healthcare'] WHERE name = 'Mayo Clinic';
UPDATE resources SET tags = ARRAY['research', 'pharmacy', 'clinical'] WHERE name = 'Medline Drug Info';
UPDATE resources SET tags = ARRAY['research', 'pharmacy', 'directory'] WHERE name = 'PDR-Drug Search';
UPDATE resources SET tags = ARRAY['research', 'pharmacy', 'directory'] WHERE name = 'RXList';
UPDATE resources SET tags = ARRAY['tools', 'data analytics', 'healthcare'] WHERE name = 'Sales Data Generator';
UPDATE resources SET tags = ARRAY['directory', 'physician', 'regulatory'] WHERE name = 'State Medical Board Search';
UPDATE resources SET tags = ARRAY['government', 'data analytics', 'research'] WHERE name = 'US Government Stats';
UPDATE resources SET tags = ARRAY['government', 'data analytics', 'research'] WHERE name = 'Uniform Crime Reports';
UPDATE resources SET tags = ARRAY['government', 'safety', 'directory'] WHERE name = 'US Consumer – Product Recall Database';

-- ============================================
-- Search Firms / Staffing
-- ============================================
UPDATE resources SET tags = ARRAY['staffing', 'association', 'workforce'] WHERE name = 'AHSA (American Healthcare Staffing Association)';
UPDATE resources SET tags = ARRAY['staffing', 'workforce', 'healthcare'] WHERE name = 'AMN Healthcare';
UPDATE resources SET tags = ARRAY['staffing', 'workforce', 'healthcare'] WHERE name = 'Cielo Healthcare';
UPDATE resources SET tags = ARRAY['executive search', 'workforce', 'healthcare'] WHERE name = 'Code Bellew';
UPDATE resources SET tags = ARRAY['executive search', 'C-suite', 'healthcare'] WHERE name = 'Diversified Search Group';
UPDATE resources SET tags = ARRAY['executive search', 'C-suite', 'healthcare'] WHERE name = 'Heidrick & Struggles';
UPDATE resources SET tags = ARRAY['executive search', 'C-suite', 'healthcare'] WHERE name = 'Gallagher Search';
UPDATE resources SET tags = ARRAY['executive search', 'workforce', 'healthcare'] WHERE name = 'Gibson Consultants';
UPDATE resources SET tags = ARRAY['executive search', 'C-suite', 'healthcare'] WHERE name = 'Grant Cooper Healthcare';
UPDATE resources SET tags = ARRAY['executive search', 'nursing', 'C-suite'] WHERE name = 'Kirby Bates Associates';
UPDATE resources SET tags = ARRAY['executive search', 'C-suite', 'healthcare'] WHERE name = 'Klein Hersh';
UPDATE resources SET tags = ARRAY['executive search', 'C-suite', 'healthcare'] WHERE name = 'Korn Ferry';
UPDATE resources SET tags = ARRAY['staffing', 'workforce', 'healthcare'] WHERE name = 'MedReps';
UPDATE resources SET tags = ARRAY['staffing', 'pharmacy', 'workforce'] WHERE name = 'PharmVille';
UPDATE resources SET tags = ARRAY['executive search', 'C-suite', 'healthcare'] WHERE name = 'Rudish Health';
UPDATE resources SET tags = ARRAY['staffing', 'workforce', 'healthcare'] WHERE name = 'SimpliFi';
UPDATE resources SET tags = ARRAY['executive search', 'C-suite', 'healthcare'] WHERE name = 'Spencer Stuart';
UPDATE resources SET tags = ARRAY['executive search', 'C-suite', 'healthcare'] WHERE name = 'Witt Kieffer';

-- ============================================
-- Women's Health / Resources
-- ============================================
UPDATE resources SET tags = ARRAY['association', 'physician', 'healthcare'] WHERE name = 'American Medical Women''s Association';
UPDATE resources SET tags = ARRAY['government', 'research', 'healthcare'] WHERE name = 'NIH Office of Research on Women''s Health (ORWH)';
UPDATE resources SET tags = ARRAY['government', 'research', 'healthcare'] WHERE name = 'Office of Women''s Health';
UPDATE resources SET tags = ARRAY['association', 'leadership', 'healthcare'] WHERE name = 'Professional Women in Healthcare';
UPDATE resources SET tags = ARRAY['association', 'leadership', 'healthcare'] WHERE name = 'Women''s Health Leadership TRUST';
UPDATE resources SET tags = ARRAY['association', 'leadership', 'healthcare'] WHERE name = 'Women in Healthcare';
UPDATE resources SET tags = ARRAY['association', 'leadership', 'healthcare'] WHERE name = 'Women in Healthcare Management';

-- ============================================
-- Provider / Physician Resources
-- ============================================
UPDATE resources SET tags = ARRAY['directory', 'physician', 'healthcare'] WHERE name = 'ABMS (American Board of Medical Specialties)';
UPDATE resources SET tags = ARRAY['directory', 'physician', 'healthcare'] WHERE name = 'Board Certification Verification';
UPDATE resources SET tags = ARRAY['association', 'hospital', 'healthcare'] WHERE name = 'Children''s Hospital Association';
UPDATE resources SET tags = ARRAY['directory', 'physician', 'healthcare'] WHERE name = 'Doctor Search';
UPDATE resources SET tags = ARRAY['government', 'regulatory', 'policy'] WHERE name = 'Fraud & Abuse Laws - Office of Inspector General';
UPDATE resources SET tags = ARRAY['news', 'regulatory', 'healthcare'] WHERE name = 'The HIPAA Journal';
UPDATE resources SET tags = ARRAY['safety', 'quality', 'hospital'] WHERE name = 'Hospital Safety Grade by State';
UPDATE resources SET tags = ARRAY['research', 'pharmacy', 'clinical'] WHERE name = 'InpharmD- Drug Literature Search';
UPDATE resources SET tags = ARRAY['association', 'hospital', 'healthcare'] WHERE name = 'International Hospital Association';
UPDATE resources SET tags = ARRAY['association', 'healthcare', 'ambulatory'] WHERE name = 'NACHC (National Association of Community Health Centers)';
UPDATE resources SET tags = ARRAY['hospital', 'clinical', 'healthcare'] WHERE name = 'Nationwide Children''s Hospital';
UPDATE resources SET tags = ARRAY['research', 'rural health', 'healthcare'] WHERE name = 'NC Rural Health Research Program';
UPDATE resources SET tags = ARRAY['research', 'clinical', 'healthcare'] WHERE name = 'ResearchGate';
UPDATE resources SET tags = ARRAY['research', 'rural health', 'healthcare'] WHERE name = 'RHIhub (Rural Health Information Hub)';
UPDATE resources SET tags = ARRAY['research', 'rural health', 'healthcare'] WHERE name = 'Rural Health Research Gateway';
UPDATE resources SET tags = ARRAY['directory', 'physician', 'healthcare'] WHERE name = 'Who''s Board Certified';

-- ============================================
-- Podcasts
-- ============================================
UPDATE resources SET tags = ARRAY['podcast', 'C-suite', 'leadership'] WHERE name = 'ACHE''s The Healthcare Executive Podcast';
UPDATE resources SET tags = ARRAY['podcast', 'nursing', 'clinical'] WHERE name = 'AORN''s Periop Talk';
UPDATE resources SET tags = ARRAY['podcast', 'C-suite', 'healthcare'] WHERE name = 'Becker''s Healthcare Podcast';
UPDATE resources SET tags = ARRAY['podcast', 'clinical', 'hospital'] WHERE name = 'Beyond Clean';
UPDATE resources SET tags = ARRAY['podcast', 'clinical', 'hospital'] WHERE name = 'First Case Podcast';
UPDATE resources SET tags = ARRAY['podcast', 'supply chain', 'healthcare'] WHERE name = 'Healthcare Hodgepodge- HPN';
UPDATE resources SET tags = ARRAY['podcast', 'healthcare', 'strategy'] WHERE name = 'Healthcare Insider Podcast';
UPDATE resources SET tags = ARRAY['podcast', 'supply chain', 'healthcare'] WHERE name = 'Healthcare Supply Chain Best Practices';
UPDATE resources SET tags = ARRAY['podcast', 'revenue cycle', 'CFO'] WHERE name = 'HFMA''s Voices in Healthcare Finance';
UPDATE resources SET tags = ARRAY['podcast', 'healthcare', 'leadership'] WHERE name = 'I Don''t Care- Dr. Kevin Stevenson';
UPDATE resources SET tags = ARRAY['podcast', 'supply chain', 'healthcare'] WHERE name = 'Power Supply';
UPDATE resources SET tags = ARRAY['podcast', 'revenue cycle', 'healthcare'] WHERE name = 'My Good Friends (RCM)';
UPDATE resources SET tags = ARRAY['podcast', 'pharmacy', 'healthcare'] WHERE name = 'Pharmacy Podcast Network';
UPDATE resources SET tags = ARRAY['podcast', 'value-based care', 'healthcare'] WHERE name = 'Relentless Health Value';
UPDATE resources SET tags = ARRAY['podcast', 'strategy', 'health system'] WHERE name = 'Sg2 Perspectives';
UPDATE resources SET tags = ARRAY['podcast', 'healthcare', 'strategy'] WHERE name = 'The Business of Healthcare Podcast';
UPDATE resources SET tags = ARRAY['podcast', 'innovation', 'digital health'] WHERE name = 'The Business of HLTH';

-- ============================================
-- Consulting / Capital
-- ============================================
UPDATE resources SET tags = ARRAY['consulting', 'strategy', 'health system'] WHERE name = 'Advisory Board';
UPDATE resources SET tags = ARRAY['consulting', 'strategy', 'healthcare'] WHERE name = 'Bain & Company';
UPDATE resources SET tags = ARRAY['consulting', 'pharmacy', 'healthcare'] WHERE name = 'Bourne Partners';
UPDATE resources SET tags = ARRAY['consulting', 'research', 'healthcare'] WHERE name = 'BRG (Berkeley Research Group)';
UPDATE resources SET tags = ARRAY['consulting', 'strategy', 'healthcare'] WHERE name = 'Brentwood Capital Advisors';
UPDATE resources SET tags = ARRAY['consulting', 'strategy', 'healthcare'] WHERE name = 'Cypress Growth Capital';
UPDATE resources SET tags = ARRAY['consulting', 'strategy', 'healthcare'] WHERE name = 'Heritage Group';
UPDATE resources SET tags = ARRAY['consulting', 'CFO', 'health system'] WHERE name = 'Kaufman Hall';
UPDATE resources SET tags = ARRAY['consulting', 'strategy', 'healthcare'] WHERE name = 'MSOUTH Equity Partners';
UPDATE resources SET tags = ARRAY['consulting', 'strategy', 'healthcare'] WHERE name = 'Warbird Healthcare Advisors';

-- ============================================
-- National Accounts / Sales Support
-- ============================================
UPDATE resources SET tags = ARRAY['consulting', 'strategy', 'healthcare'] WHERE name = 'The Alexander Group';
UPDATE resources SET tags = ARRAY['consulting', 'supply chain', 'healthcare'] WHERE name = 'Excelerant Consulting';
UPDATE resources SET tags = ARRAY['directory', 'healthcare', 'research'] WHERE name = 'Healthcare Links';
UPDATE resources SET tags = ARRAY['consulting', 'supply chain', 'healthcare'] WHERE name = 'The Mark Dixon Group';
UPDATE resources SET tags = ARRAY['consulting', 'strategy', 'healthcare'] WHERE name = 'Medical Strategies International';
UPDATE resources SET tags = ARRAY['consulting', 'data analytics', 'healthcare'] WHERE name = 'Ratio Health Solutions';
UPDATE resources SET tags = ARRAY['consulting', 'supply chain', 'healthcare'] WHERE name = 'The Wetrich Group';

-- ============================================
-- Tools / Apps
-- ============================================
UPDATE resources SET tags = ARRAY['tools', 'news', 'research'] WHERE name = '12 Foot Ladder';
UPDATE resources SET tags = ARRAY['tools', 'technology'] WHERE name = 'Ditto';
UPDATE resources SET tags = ARRAY['tools', 'AI', 'technology'] WHERE name = 'ChatGPT';
UPDATE resources SET tags = ARRAY['tools', 'technology'] WHERE name = 'Cyrano';
UPDATE resources SET tags = ARRAY['tools', 'technology'] WHERE name = 'Calendly';
UPDATE resources SET tags = ARRAY['tools', 'technology'] WHERE name = 'Email Checker';
UPDATE resources SET tags = ARRAY['tools', 'research'] WHERE name = 'FIRE Calculator (Financial/Retirement)';
UPDATE resources SET tags = ARRAY['tools', 'technology'] WHERE name = 'Grammarly';
UPDATE resources SET tags = ARRAY['tools', 'AI', 'technology'] WHERE name = 'Perplexity';
UPDATE resources SET tags = ARRAY['tools', 'technology'] WHERE name = 'Loom';
UPDATE resources SET tags = ARRAY['tools', 'technology'] WHERE name = 'PDF24 Tools';
UPDATE resources SET tags = ARRAY['tools', 'technology'] WHERE name = 'Remove Background';
UPDATE resources SET tags = ARRAY['tools', 'technology'] WHERE name = 'Text Blaze';
UPDATE resources SET tags = ARRAY['tools', 'technology'] WHERE name = 'Text Expander';
UPDATE resources SET tags = ARRAY['tools', 'technology'] WHERE name = 'Vidyard';

-- ============================================
-- Top News Sites
-- ============================================
UPDATE resources SET tags = ARRAY['news', 'healthcare'] WHERE name = 'Fox News';
UPDATE resources SET tags = ARRAY['news', 'healthcare'] WHERE name = 'CNN';
UPDATE resources SET tags = ARRAY['news', 'healthcare', 'clinical'] WHERE name = 'CNN-Health';
UPDATE resources SET tags = ARRAY['news', 'healthcare'] WHERE name = 'Crains';
UPDATE resources SET tags = ARRAY['news', 'healthcare'] WHERE name = 'LA Times';
UPDATE resources SET tags = ARRAY['news', 'healthcare'] WHERE name = 'NY Times';
UPDATE resources SET tags = ARRAY['news', 'healthcare'] WHERE name = 'USA Today News';
UPDATE resources SET tags = ARRAY['news', 'healthcare'] WHERE name = 'Mercury News';
UPDATE resources SET tags = ARRAY['news', 'healthcare'] WHERE name = 'Washington Post';
UPDATE resources SET tags = ARRAY['news', 'directory'] WHERE name = 'United States Newspapers';
UPDATE resources SET tags = ARRAY['news', 'directory'] WHERE name = 'World Newspapers';
UPDATE resources SET tags = ARRAY['news', 'healthcare'] WHERE name = 'The Wall Street Journal';
UPDATE resources SET tags = ARRAY['news', 'healthcare'] WHERE name = 'Yahoo Finance';
UPDATE resources SET tags = ARRAY['news', 'healthcare'] WHERE name = 'WSJ Private Equity';
UPDATE resources SET tags = ARRAY['news', 'physician', 'clinical'] WHERE name = 'Medscape';
UPDATE resources SET tags = ARRAY['news', 'supply chain'] WHERE name = 'Industry Week- Supply Chain';

-- ============================================
-- Travel Sites
-- ============================================
UPDATE resources SET tags = ARRAY['tools', 'directory'] WHERE name = 'All Airline Phone Numbers';
UPDATE resources SET tags = ARRAY['tools', 'research'] WHERE name = 'American Express Travel';
UPDATE resources SET tags = ARRAY['tools', 'research'] WHERE name = 'Flight Stats';
UPDATE resources SET tags = ARRAY['tools', 'research'] WHERE name = 'Flightaware';
UPDATE resources SET tags = ARRAY['tools', 'directory'] WHERE name = 'Frommers Travel Guide';
UPDATE resources SET tags = ARRAY['tools', 'research'] WHERE name = 'Last Minute Travel';
UPDATE resources SET tags = ARRAY['tools', 'research'] WHERE name = 'Priceline';
UPDATE resources SET tags = ARRAY['tools', 'directory'] WHERE name = 'National Traffic and Road Closures';

-- ============================================
-- Time / Weather
-- ============================================
UPDATE resources SET tags = ARRAY['tools', 'directory'] WHERE name = 'Airport Delays';
UPDATE resources SET tags = ARRAY['tools', 'research'] WHERE name = 'CDC Travelers Health';
UPDATE resources SET tags = ARRAY['tools', 'research'] WHERE name = 'Flight Tracking';
UPDATE resources SET tags = ARRAY['tools', 'research'] WHERE name = 'Travel Alerts';
UPDATE resources SET tags = ARRAY['tools', 'research'] WHERE name = 'Weather';
UPDATE resources SET tags = ARRAY['tools', 'research'] WHERE name = 'Weather Channel';
UPDATE resources SET tags = ARRAY['tools', 'directory'] WHERE name = 'World Time Zones';
UPDATE resources SET tags = ARRAY['tools', 'directory'] WHERE name = 'U.S. Time';

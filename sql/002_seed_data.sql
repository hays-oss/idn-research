-- IDN Research Platform — Seed Data
-- Run in Supabase SQL Editor AFTER 001_create_tables.sql
-- Seeds all resource categories, resources, and LinkedIn influencers
-- from hayswaldrop.com

DO $$
DECLARE
  cat_companies_newsletters uuid;
  cat_industry_meetings uuid;
  cat_industry_meetings_pharmacy uuid;
  cat_industry_meetings_technology uuid;
  cat_industry_meetings_revenue_cycle uuid;
  cat_industry_meetings_facilities uuid;
  cat_industry_meetings_supply_chain uuid;
  cat_gpos uuid;
  cat_federal_government_cms uuid;
  cat_linkedin_influencers uuid;
  cat_resources uuid;
  cat_search_firms_staffing uuid;
  cat_womens_health uuid;
  cat_provider_physician uuid;
  cat_podcasts uuid;
  cat_consulting_capital uuid;
  cat_national_accounts uuid;
  cat_tools_apps uuid;
  cat_top_news_sites uuid;
  cat_travel_sites uuid;
  cat_time_weather uuid;
BEGIN

-- ============================================
-- Categories
-- ============================================
INSERT INTO resource_categories (id, name, slug, display_order) VALUES
  (gen_random_uuid(), 'Companies / Newsletters', 'companies-newsletters', 1) RETURNING id INTO cat_companies_newsletters;
INSERT INTO resource_categories (id, name, slug, display_order) VALUES
  (gen_random_uuid(), 'Industry Meetings', 'industry-meetings', 2) RETURNING id INTO cat_industry_meetings;
INSERT INTO resource_categories (id, name, slug, display_order) VALUES
  (gen_random_uuid(), 'Industry Meetings — Pharmacy', 'industry-meetings-pharmacy', 3) RETURNING id INTO cat_industry_meetings_pharmacy;
INSERT INTO resource_categories (id, name, slug, display_order) VALUES
  (gen_random_uuid(), 'Industry Meetings — Technology', 'industry-meetings-technology', 4) RETURNING id INTO cat_industry_meetings_technology;
INSERT INTO resource_categories (id, name, slug, display_order) VALUES
  (gen_random_uuid(), 'Industry Meetings — Revenue Cycle', 'industry-meetings-revenue-cycle', 5) RETURNING id INTO cat_industry_meetings_revenue_cycle;
INSERT INTO resource_categories (id, name, slug, display_order) VALUES
  (gen_random_uuid(), 'Industry Meetings — Facilities', 'industry-meetings-facilities', 6) RETURNING id INTO cat_industry_meetings_facilities;
INSERT INTO resource_categories (id, name, slug, display_order) VALUES
  (gen_random_uuid(), 'Industry Meetings — Supply Chain', 'industry-meetings-supply-chain', 7) RETURNING id INTO cat_industry_meetings_supply_chain;
INSERT INTO resource_categories (id, name, slug, display_order) VALUES
  (gen_random_uuid(), 'Group Purchasing Organizations', 'group-purchasing-organizations', 8) RETURNING id INTO cat_gpos;
INSERT INTO resource_categories (id, name, slug, display_order) VALUES
  (gen_random_uuid(), 'Federal Government / CMS', 'federal-government-cms', 9) RETURNING id INTO cat_federal_government_cms;
INSERT INTO resource_categories (id, name, slug, display_order) VALUES
  (gen_random_uuid(), 'LinkedIn Influencers', 'linkedin-influencers', 10) RETURNING id INTO cat_linkedin_influencers;
INSERT INTO resource_categories (id, name, slug, display_order) VALUES
  (gen_random_uuid(), 'Resources', 'resources', 11) RETURNING id INTO cat_resources;
INSERT INTO resource_categories (id, name, slug, display_order) VALUES
  (gen_random_uuid(), 'Search Firms / Staffing', 'search-firms-staffing', 12) RETURNING id INTO cat_search_firms_staffing;
INSERT INTO resource_categories (id, name, slug, display_order) VALUES
  (gen_random_uuid(), 'Women''s Health / Resources', 'womens-health-resources', 13) RETURNING id INTO cat_womens_health;
INSERT INTO resource_categories (id, name, slug, display_order) VALUES
  (gen_random_uuid(), 'Provider / Physician Resources', 'provider-physician-resources', 14) RETURNING id INTO cat_provider_physician;
INSERT INTO resource_categories (id, name, slug, display_order) VALUES
  (gen_random_uuid(), 'Podcasts', 'podcasts', 15) RETURNING id INTO cat_podcasts;
INSERT INTO resource_categories (id, name, slug, display_order) VALUES
  (gen_random_uuid(), 'Consulting / Capital', 'consulting-capital', 16) RETURNING id INTO cat_consulting_capital;
INSERT INTO resource_categories (id, name, slug, display_order) VALUES
  (gen_random_uuid(), 'National Accounts / Sales Support', 'national-accounts-sales-support', 17) RETURNING id INTO cat_national_accounts;
INSERT INTO resource_categories (id, name, slug, display_order) VALUES
  (gen_random_uuid(), 'Tools / Apps', 'tools-apps', 18) RETURNING id INTO cat_tools_apps;
INSERT INTO resource_categories (id, name, slug, display_order) VALUES
  (gen_random_uuid(), 'Top News Sites', 'top-news-sites', 19) RETURNING id INTO cat_top_news_sites;
INSERT INTO resource_categories (id, name, slug, display_order) VALUES
  (gen_random_uuid(), 'Travel Sites', 'travel-sites', 20) RETURNING id INTO cat_travel_sites;
INSERT INTO resource_categories (id, name, slug, display_order) VALUES
  (gen_random_uuid(), 'Time / Weather', 'time-weather', 21) RETURNING id INTO cat_time_weather;

-- ============================================
-- Resources: Companies / Newsletters (50)
-- ============================================
INSERT INTO resources (category_id, name, url, display_order) VALUES
  (cat_companies_newsletters, '4sight Health', 'http://4sighthealth.com/', 1),
  (cat_companies_newsletters, 'American Hospital Association', 'http://www.aha.org', 2),
  (cat_companies_newsletters, 'AJHCS (American Journal of Healthcare Strategy)', 'https://ajhcs.org/', 3),
  (cat_companies_newsletters, 'Becker''s Healthcare', 'https://www.beckershospitalreview.com/', 4),
  (cat_companies_newsletters, 'BioPharmaDrive', 'https://www.biopharmadive.com/', 5),
  (cat_companies_newsletters, 'Business of Primary Care', 'https://businessofprimarycare.com/', 6),
  (cat_companies_newsletters, 'Chief Healthcare Executive', 'http://chiefhealthcareexecutive.com', 7),
  (cat_companies_newsletters, 'Digital Healthwire', 'https://digitalhealthwire.com/', 8),
  (cat_companies_newsletters, 'Drug Channels Institute', 'http://drugchannelsinstitute.com/', 9),
  (cat_companies_newsletters, 'EndPoint News', 'https://endpts.com/', 10),
  (cat_companies_newsletters, 'HealthEconomics.com', 'https://healtheconomics.com/', 11),
  (cat_companies_newsletters, 'HIRC (Healthcare Industry Resilience Collaborative)', 'https://hircstrong.com/', 12),
  (cat_companies_newsletters, 'Fierce Healthcare', 'https://www.fiercehealthcare.com/', 13),
  (cat_companies_newsletters, 'Fierce Pharma', 'https://www.fiercepharma.com/', 14),
  (cat_companies_newsletters, 'Gist Health', 'http://gisthealthcare.com', 15),
  (cat_companies_newsletters, 'Harvard Business Review', 'https://hbr.org/', 16),
  (cat_companies_newsletters, 'Healthcare Executive', 'https://healthcareexecutive.org/', 17),
  (cat_companies_newsletters, 'HealthLeaders', 'https://www.healthleadersmedia.com/', 18),
  (cat_companies_newsletters, 'Healthcare Dive', 'https://www.healthcaredive.com/', 19),
  (cat_companies_newsletters, 'Healthcare Innovation', 'https://www.hcinnovationgroup.com/', 20),
  (cat_companies_newsletters, 'Health Management Academy', 'https://hmacademy.com/', 21),
  (cat_companies_newsletters, 'Healthcare Purchasing News', 'https://www.hpnonline.com/', 22),
  (cat_companies_newsletters, 'Healthcare Tech Outlook', 'https://www.healthcaretechoutlook.com/', 23),
  (cat_companies_newsletters, 'Healthcare Transformers', 'https://healthcaretransformers.com/', 24),
  (cat_companies_newsletters, 'Healthcare Value Analysis & Utilization Management Magazine', 'http://www.ValueAnalysisMag.com', 25),
  (cat_companies_newsletters, 'Hospitalogy', 'https://hospitalogy.com/', 26),
  (cat_companies_newsletters, 'Journal of Healthcare Contracting', 'https://sharemovingmedia.com/', 27),
  (cat_companies_newsletters, 'Kaiser Health News', 'https://kffhealthnews.org/email-signup/', 28),
  (cat_companies_newsletters, 'Kaufman Hall Flash Report', 'https://www.kaufmanhall.com/insights-reports/national-hospital-flash-report', 29),
  (cat_companies_newsletters, 'MarketScale', 'https://marketscale.com/industries/healthcare/', 30),
  (cat_companies_newsletters, 'MassDevice', 'https://www.massdevice.com/', 31),
  (cat_companies_newsletters, 'McKinsey & Company', 'https://www.mckinsey.com/industries/healthcare-systems-and-services/our-insights', 32),
  (cat_companies_newsletters, 'MedCity News', 'https://medcitynews.com/', 33),
  (cat_companies_newsletters, 'Medical News Today', 'https://www.medicalnewstoday.com/', 34),
  (cat_companies_newsletters, 'Medical Marketing + Media', 'https://www.mmm-online.com/', 35),
  (cat_companies_newsletters, 'MedTech Dive', 'https://www.medtechdive.com/', 36),
  (cat_companies_newsletters, 'Med Tech Outlook', 'https://www.medicaltechoutlook.com/', 37),
  (cat_companies_newsletters, 'Modern Healthcare', 'https://www.modernhealthcare.com', 38),
  (cat_companies_newsletters, 'Orthopedic Network News (ONN)', 'https://info.curvolabs.com/onn', 39),
  (cat_companies_newsletters, 'Orthoworld', 'http://orthoworld.com', 40),
  (cat_companies_newsletters, 'Orthopedic Design & Technology', 'https://www.odtmag.com/', 41),
  (cat_companies_newsletters, 'OR Today', 'https://ortoday.com/', 42),
  (cat_companies_newsletters, 'Out-Of-Pocket', 'https://www.outofpocket.health/', 43),
  (cat_companies_newsletters, 'Pharma Tech Outlook', 'https://www.pharmatechoutlook.com/', 44),
  (cat_companies_newsletters, 'PharmaVoice', 'https://www.pharmavoice.com/', 45),
  (cat_companies_newsletters, 'QMed MD+DI', 'https://www.mddionline.com/', 46),
  (cat_companies_newsletters, 'Repertoire Magazine', 'https://repertoiremag.com/', 47),
  (cat_companies_newsletters, 'Revenue Cycle Resources-RCR Hub', 'https://www.revenuecycleresources.com/', 48),
  (cat_companies_newsletters, 'STAT', 'https://www.statnews.com/', 49),
  (cat_companies_newsletters, 'StartUp Health', 'https://www.startuphealth.com/', 50);

-- ============================================
-- Resources: Industry Meetings (45)
-- ============================================
INSERT INTO resources (category_id, name, url, display_order) VALUES
  (cat_industry_meetings, 'AACP (American Association of Colleges of Pharmacy)', 'https://www.aacp.org/events/annual-meetings', 1),
  (cat_industry_meetings, 'AAMI (Association for the Advancement of Medical Instrumentation)', 'https://www.aami.org/', 2),
  (cat_industry_meetings, 'AAPPR (Association for Advancing Physician and Provider Recruitment)', 'https://aappr.org/', 3),
  (cat_industry_meetings, 'AAOS (American Academy of Orthopedic Surgeons)', 'http://www.aaos.org', 4),
  (cat_industry_meetings, 'ACOG (American College of Obstetricians and Gynecologists)', 'https://www.acog.org/', 5),
  (cat_industry_meetings, 'AHIMA (American Health Information Management Association)', 'https://www.ahima.org/', 6),
  (cat_industry_meetings, 'ACHE (American College of Healthcare Executives)', 'https://www.ache.org/', 7),
  (cat_industry_meetings, 'AHRMM (Association for Health Care Resources & Materials Management)', 'https://www.ahrmm.org/', 8),
  (cat_industry_meetings, 'AHVAP (Association of Healthcare Value Analysis Professionals)', 'https://www.ahvap.org/', 9),
  (cat_industry_meetings, 'ANAE (Association of National Account Executives)', 'https://www.nationalaccountexecutives.com/', 10),
  (cat_industry_meetings, 'APIC (Association for Professionals in Infection Control and Epidemiology)', 'https://apic.org/', 11),
  (cat_industry_meetings, 'ASCA (Ambulatory Surgery Center Association)', 'https://www.ascassociation.org/home', 12),
  (cat_industry_meetings, 'ASCP (American Society for Clinical Pathology)', 'https://www.ascp.org', 13),
  (cat_industry_meetings, 'ASH (American Society of Hematology)', 'https://www.hematology.org/', 14),
  (cat_industry_meetings, 'ASHHRA (American Society for Healthcare Human Resources Administration)', 'https://ashhra.org/', 15),
  (cat_industry_meetings, 'ASHP (American Society of Health-System Pharmacists)', 'https://www.ashp.org/', 16),
  (cat_industry_meetings, 'AONL (American Organization for Nursing Leadership)', 'https://www.aonl.org/conference', 17),
  (cat_industry_meetings, 'AORN (Association of periOperative Registered Nurses)', 'http://www.aorn.org', 18),
  (cat_industry_meetings, 'Asembia-Speciality Pharmacy Summit', 'https://asembia.com/', 19),
  (cat_industry_meetings, 'BRINetwork (Operating Room Management Summit)', 'https://brinetwork.com/events/', 20),
  (cat_industry_meetings, 'CSCE (The Council of Supply Chain Executives)', 'http://www.councilhome.com', 21),
  (cat_industry_meetings, 'CPES (The Council of Pharmacy Executives and Suppliers)', 'http://www.council.healthcare', 22),
  (cat_industry_meetings, 'Federation of American Hospitals', 'http://www.fah.org', 23),
  (cat_industry_meetings, 'FIME (Federation of International Medical Equipment Suppliers)', 'https://www.fimeshow.com/en/home.html', 24),
  (cat_industry_meetings, 'HCP (Health Connect Partners)', 'http://www.hlthcp.com', 25),
  (cat_industry_meetings, 'HFMA (Healthcare Financial Management Association)', 'http://www.hfma.org', 26),
  (cat_industry_meetings, 'Healthcare Facilities Symposium & Expo', 'https://hcarefacilities.com/', 27),
  (cat_industry_meetings, 'HLTH', 'https://hlth.com', 28),
  (cat_industry_meetings, 'HIDA (Health Industry Distributors Association)', 'https://www.hida.org/', 29),
  (cat_industry_meetings, 'HIMSS (Healthcare Information & Management Systems Society)', 'http://www.himss.org', 30),
  (cat_industry_meetings, 'IDN Summit & Reverse Expo', 'http://www.idnsummit.com', 31),
  (cat_industry_meetings, 'IHES (Institute of Healthcare Executives and Suppliers)', 'http://www.IHESllc.com', 32),
  (cat_industry_meetings, 'J.P. Morgan Healthcare Conference', 'https://www.jpmorgan.com/about-us/events-conferences/health-care-conference', 33),
  (cat_industry_meetings, 'Medica', 'https://www.medica-tradefair.com/', 34),
  (cat_industry_meetings, 'NAHAM (National Association of Healthcare Access Management)', 'https://www.naham.org/', 35),
  (cat_industry_meetings, 'MGMA (Medical Group Management Association)', 'https://www.mgma.com/', 36),
  (cat_industry_meetings, 'NASP (National Association of Specialty Pharmacy)', 'https://naspnet.org/', 37),
  (cat_industry_meetings, 'Professional Women in Healthcare Leadership Summit', 'https://www.mypwh.org/events', 38),
  (cat_industry_meetings, 'RSNA (Radiological Society of North America)', 'https://www.rsna.org/', 39),
  (cat_industry_meetings, 'SCCM (Society of Critical Care Medicine)', 'https://sccm.org/Home', 40),
  (cat_industry_meetings, 'SRS (Society of Robotic Surgery)', 'https://srobotics.org/', 41),
  (cat_industry_meetings, 'SHEA (Society for Healthcare Epidemiology of America)', 'https://sheaspring.org/', 42),
  (cat_industry_meetings, 'SMI-Strategic Marketplace Initiative', 'https://www.smisupplychain.com/', 43),
  (cat_industry_meetings, 'VA Healthcare (IDGA''s Annual VA Healthcare Summit)', 'https://www.idga.org/events-veteransaffairshealthcare', 44),
  (cat_industry_meetings, 'World Hospital at Home Congress', 'https://whahc.kenes.com/', 45);

-- ============================================
-- Resources: Industry Meetings — Pharmacy (28)
-- ============================================
INSERT INTO resources (category_id, name, url, display_order) VALUES
  (cat_industry_meetings_pharmacy, '340B Coalition', 'https://340bcoalition.org/events/', 1),
  (cat_industry_meetings_pharmacy, '340B Grantees Conference', 'https://rwc340b.org/grantees/', 2),
  (cat_industry_meetings_pharmacy, '340B Summer Conference', 'https://www.340bsummerconference.org/', 3),
  (cat_industry_meetings_pharmacy, 'AACP (American Association of Colleges of Pharmacy)', 'https://www.aacp.org/events/annual-meetings', 4),
  (cat_industry_meetings_pharmacy, 'ACCP (American College of Clinical Pharmacy)', 'https://www.accp.com/', 5),
  (cat_industry_meetings_pharmacy, 'AMCP (Academy of Managed Care Pharmacy)', 'https://www.amcp.org/', 6),
  (cat_industry_meetings_pharmacy, 'APhA (American Pharmacist Association)', 'https://www.pharmacist.com/', 7),
  (cat_industry_meetings_pharmacy, 'ASHP (American Society of Health-System Pharmacists)', 'https://www.ashp.org/', 8),
  (cat_industry_meetings_pharmacy, 'ASPN (American Society of Pain & Neuroscience)', 'http://www.aspnpain.com', 9),
  (cat_industry_meetings_pharmacy, 'ASM (American Society for Microbiology)', 'https://asm.org/', 10),
  (cat_industry_meetings_pharmacy, 'Asembia-Speciality Pharmacy Summit', 'https://asembia.com/', 11),
  (cat_industry_meetings_pharmacy, 'Autonomous Pharmacy', 'https://www.autonomouspharmacy.com/', 12),
  (cat_industry_meetings_pharmacy, 'CPES (The Council of Pharmacy Executives and Suppliers)', 'http://www.council.healthcare', 13),
  (cat_industry_meetings_pharmacy, 'CROI (Conference on Retroviruses and Opportunistic Infections)', 'https://www.croiconference.org/', 14),
  (cat_industry_meetings_pharmacy, 'DIA (Drug Information Association)', 'https://www.diaglobal.org/', 15),
  (cat_industry_meetings_pharmacy, 'HOPA (Hematology/Oncology Pharmacy Association)', 'https://www.hoparx.org/', 16),
  (cat_industry_meetings_pharmacy, 'HCP (Health Connect Partners)', 'http://www.hlthcp.com', 17),
  (cat_industry_meetings_pharmacy, 'Healthcare Facilities Symposium & Expo', 'https://hcarefacilities.com/', 18),
  (cat_industry_meetings_pharmacy, 'IgNS (Immunoglobulin National Society)', 'https://ig-ns.org/', 19),
  (cat_industry_meetings_pharmacy, 'IHES (Institute of Healthcare Executives and Suppliers)', 'http://www.IHESllc.com', 20),
  (cat_industry_meetings_pharmacy, 'Medica', 'https://www.medica-tradefair.com/', 21),
  (cat_industry_meetings_pharmacy, 'NACDS (National Association of Chain Drug Stores)', 'https://www.nacds.org/', 22),
  (cat_industry_meetings_pharmacy, 'NASP (National Association of Specialty Pharmacy)', 'https://naspnet.org/', 23),
  (cat_industry_meetings_pharmacy, 'NHIA (National Home Infusion Association)', 'https://nhia.org/', 24),
  (cat_industry_meetings_pharmacy, 'NICA (National Infusion Center Association)', 'https://infusioncenter.org/', 25),
  (cat_industry_meetings_pharmacy, 'NPPA (National Pharmacy Purchasing Association)', 'https://www.pharmacypurchasing.com/', 26),
  (cat_industry_meetings_pharmacy, 'PCMA (Pharmaceutical Care Management Association)', 'https://www.pcmanet.org/', 27),
  (cat_industry_meetings_pharmacy, 'Pharma USA', 'https://events.reutersevents.com/', 28);

-- ============================================
-- Resources: Industry Meetings — Technology (17)
-- ============================================
INSERT INTO resources (category_id, name, url, display_order) VALUES
  (cat_industry_meetings_technology, 'AHIMA (American Health Information Management Association)', 'https://ahimafoundation.org/news/events/', 1),
  (cat_industry_meetings_technology, 'American Medical Device Summit', 'https://amdsummit.com/', 2),
  (cat_industry_meetings_technology, 'AMIA (American Medical Informatics Association)', 'https://amia.org/education-events', 3),
  (cat_industry_meetings_technology, 'CES (Consumer Technology Association)', 'https://www.ces.tech/', 4),
  (cat_industry_meetings_technology, 'Digital Health Reuters', 'https://reutersevents.com/portfolio.php', 5),
  (cat_industry_meetings_technology, 'DHIS (Digital Healthcare Innovation Summit)', 'https://dhis.net/', 6),
  (cat_industry_meetings_technology, 'e-Health Conference and Tradeshow (Canada)', 'https://www.e-healthconference.com/', 7),
  (cat_industry_meetings_technology, 'Health Datapalooza', 'https://academyhealth.org/', 8),
  (cat_industry_meetings_technology, 'HAS (Healthcare Analytics Summit)', 'https://hasummit.com/', 9),
  (cat_industry_meetings_technology, 'Healthcare IT Connect', 'https://healthcareitconnect.com/', 10),
  (cat_industry_meetings_technology, 'HIMSS (Healthcare Information & Management Systems Society)', 'http://www.himss.org', 11),
  (cat_industry_meetings_technology, 'HLTH', 'https://www.hlth.com/', 12),
  (cat_industry_meetings_technology, 'IHES (Institute of Healthcare Executives and Suppliers)', 'http://www.IHESllc.com', 13),
  (cat_industry_meetings_technology, 'SIIM (Society for Imaging Informatics in Medicine)', 'https://siim.org/', 14),
  (cat_industry_meetings_technology, 'SXSW Health and MedTech', 'https://www.sxsw.com/conference/health-and-medtech/', 15),
  (cat_industry_meetings_technology, 'thinc (The Healthcare Innovation Company)', 'https://thinc360.com/', 16),
  (cat_industry_meetings_technology, 'ViVe', 'https://www.viveevent.com/', 17);

-- ============================================
-- Resources: Industry Meetings — Revenue Cycle (9)
-- ============================================
INSERT INTO resources (category_id, name, url, display_order) VALUES
  (cat_industry_meetings_revenue_cycle, 'AAHAM (American Association of Healthcare Administrative Management)', 'https://aaham.org/', 1),
  (cat_industry_meetings_revenue_cycle, 'AAPC (American Academy of Professional Coders)', 'https://www.aapc.com/', 2),
  (cat_industry_meetings_revenue_cycle, 'AMBA (American Medical Billing Association)', 'https://www.ambastore.net/default.asp', 3),
  (cat_industry_meetings_revenue_cycle, 'Beckers Revenue Cycle Conference', 'https://www.beckershospitalreview.com/health-it-revenue-cycle-conference/', 4),
  (cat_industry_meetings_revenue_cycle, 'HFMA (Healthcare Financial Management Association)', 'http://www.hfma.org/', 5),
  (cat_industry_meetings_revenue_cycle, 'HFMA Chapters & Regions', 'https://www.hfma.org/chapters/', 6),
  (cat_industry_meetings_revenue_cycle, 'HBMA (Healthcare Business Management Association)', 'https://www.hbma.org/', 7),
  (cat_industry_meetings_revenue_cycle, 'Healthcare Payment and Revenue Integrity Congress', 'https://healthcarepaymentrevenueintegritysummit.com/', 8),
  (cat_industry_meetings_revenue_cycle, 'MGMA (Medical Group Management Association)', 'https://www.mgma.com/', 9);

-- ============================================
-- Resources: Industry Meetings — Facilities (11)
-- ============================================
INSERT INTO resources (category_id, name, url, display_order) VALUES
  (cat_industry_meetings_facilities, 'ACE Summit & Reverse Expo', 'https://www.acesummitandexpo.com/', 1),
  (cat_industry_meetings_facilities, 'AHE (Association for the Health Care Environment)', 'https://www.ahe.org/', 2),
  (cat_industry_meetings_facilities, 'AMFP (Association of Medical Facility Professionals)', 'http://www.amfp.org', 3),
  (cat_industry_meetings_facilities, 'ASHE (American Society of Health Care Engineering)', 'https://www.ashe.org/', 4),
  (cat_industry_meetings_facilities, 'Bisnow Healthcare Summit', 'https://www.bisnow.com/', 5),
  (cat_industry_meetings_facilities, 'BOMA (Building Owners and Managers Association)', 'https://www.mob.boma.org/MOB2024/Public/enter.aspx', 6),
  (cat_industry_meetings_facilities, 'Healthcare Design Conference+Expo', 'https://www.hcdexpo.com/', 7),
  (cat_industry_meetings_facilities, 'Healthcare Facilities Expo', 'https://hcarefacilities.com/', 8),
  (cat_industry_meetings_facilities, 'Hospital, Outpatient Facilities & Medical Office Buildings Summits', 'http://www.squarefootage.net', 9),
  (cat_industry_meetings_facilities, 'HSI (Healthcare Surfaces Institute)', 'https://www.healthcaresurfacesinstitute.org/', 10),
  (cat_industry_meetings_facilities, 'Opal Group', 'https://opalgroup.net/', 11);

-- ============================================
-- Resources: Industry Meetings — Supply Chain (19)
-- ============================================
INSERT INTO resources (category_id, name, url, display_order) VALUES
  (cat_industry_meetings_supply_chain, 'AHVAP (Association of Healthcare Value Analysis Professionals)', 'https://www.ahvap.org/', 1),
  (cat_industry_meetings_supply_chain, 'AHRMM (Association for Health Care Resources & Materials Management)', 'https://www.ahrmm.org/', 2),
  (cat_industry_meetings_supply_chain, 'ANAE (Association of National Account Executives)', 'https://www.nationalaccountexecutives.com/', 3),
  (cat_industry_meetings_supply_chain, 'AORN (Association of periOperative Registered Nurses)', 'http://www.aorn.org', 4),
  (cat_industry_meetings_supply_chain, 'Bellwether League Foundation', 'https://www.bellwetherleague.org/index.php', 5),
  (cat_industry_meetings_supply_chain, 'CSCE (The Council of Supply Chain Executives)', 'http://www.councilhome.com', 6),
  (cat_industry_meetings_supply_chain, 'Federation of American Hospitals', 'http://www.fah.org', 7),
  (cat_industry_meetings_supply_chain, 'Gartner Supply Chain Symposium', 'https://www.gartner.com/en/conferences', 8),
  (cat_industry_meetings_supply_chain, 'GHX Summits', 'https://www.ghx.com/events/', 9),
  (cat_industry_meetings_supply_chain, 'GS1', 'https://www.gs1us.org/', 10),
  (cat_industry_meetings_supply_chain, 'HCP (Health Connect Partners)', 'http://www.hlthcp.com', 11),
  (cat_industry_meetings_supply_chain, 'HDA (Healthcare Distribution Alliance)', 'https://www.hda.org/', 12),
  (cat_industry_meetings_supply_chain, 'HIDA (Health Industry Distributors Association)', 'https://www.hida.org/', 13),
  (cat_industry_meetings_supply_chain, 'HIRC (Healthcare Industry Resilience Collaborative)', 'https://hircstrong.com/', 14),
  (cat_industry_meetings_supply_chain, 'IDN Summit & Reverse Expo', 'http://www.idnsummit.com', 15),
  (cat_industry_meetings_supply_chain, 'IHES (Institute of Healthcare Executives and Suppliers)', 'http://www.IHESllc.com', 16),
  (cat_industry_meetings_supply_chain, 'LogiMed', 'https://logimedusa.wbresearch.com/', 17),
  (cat_industry_meetings_supply_chain, 'RNA (Radiological Society of North America)', 'https://www.rsna.org/', 18),
  (cat_industry_meetings_supply_chain, 'SMI (Strategic Marketplace Initiative)', 'https://www.smisupplychain.com/', 19);

-- ============================================
-- Resources: Group Purchasing Organizations (17)
-- ============================================
INSERT INTO resources (category_id, name, url, display_order) VALUES
  (cat_gpos, 'Advantus Health Partners', 'https://advantushp.com/', 1),
  (cat_gpos, 'Advocate Health Supply Chain Alliance', 'https://www.advocatehealthsupplychainalliance.org/', 2),
  (cat_gpos, 'Allied Health Solutions', 'https://wvumedicine.org/allied/', 3),
  (cat_gpos, 'AllSpire Health Partners', 'https://www.allspire.org/', 4),
  (cat_gpos, 'Captis', 'https://www.vizientinc.com/what-we-do/supply-chain/aggregation-solutions/captis', 5),
  (cat_gpos, 'Capstone Health Alliance', 'http://www.capstonehealthalliance.com/', 6),
  (cat_gpos, 'CHC Supply Trust', 'https://chc.com/health-supply-chain-management-optimization/', 7),
  (cat_gpos, 'Greater New York Hospital Association (GNYHA)', 'https://www.gnyha.org/', 8),
  (cat_gpos, 'HealthTrust Performance Group', 'http://healthtrustpg.com/', 9),
  (cat_gpos, 'HPS', 'http://www.hpsnet.com/', 10),
  (cat_gpos, 'Partners Cooperative', 'https://www.pcgpo.org/', 11),
  (cat_gpos, 'Pandion Optimization Alliance', 'https://www.pandionalliance.com/', 12),
  (cat_gpos, 'Premier Inc.', 'https://premierinc.com/', 13),
  (cat_gpos, 'Provista', 'https://www.provista.com/', 14),
  (cat_gpos, 'TPC', 'http://www.tpc1.com', 15),
  (cat_gpos, 'Yankee Alliance', 'http://yankeealliance.com', 16),
  (cat_gpos, 'Vizient', 'http://www.vizientinc.com/', 17);

-- ============================================
-- Resources: Federal Government / CMS (15)
-- ============================================
INSERT INTO resources (category_id, name, url, display_order) VALUES
  (cat_federal_government_cms, 'Medicare Publications', 'https://www.medicare.gov/publications', 1),
  (cat_federal_government_cms, 'Medicare.gov', 'https://www.medicare.gov/', 2),
  (cat_federal_government_cms, 'Centers for Medicare and Medicaid Services', 'https://www.cms.gov/medicare/medicare-general-Information/medicareGenInfo/index.html', 3),
  (cat_federal_government_cms, 'CMS Stats', 'https://data.cms.gov/collection/cms-program-statistics', 4),
  (cat_federal_government_cms, 'DSCSA (Drug Supply Chain and Security Act)', 'https://www.fda.gov/drugs/drug-supply-chain-integrity/drug-supply-chain-security-act-dscsa', 5),
  (cat_federal_government_cms, 'HealthData.gov', 'https://healthdata.gov/dataset/CMS-Program-Statistics-Medicare-Part-D-Enrollment/7n9e-tb52/about_data', 6),
  (cat_federal_government_cms, 'List of State Medicaid Programs', 'https://www.healthcare.gov/medicaid-chip-program-names/', 7),
  (cat_federal_government_cms, 'List of State Health Departments', 'https://www.naccho.org/membership/lhd-directory', 8),
  (cat_federal_government_cms, 'CMS List of Hospitals by State', 'https://data.cms.gov/provider-data/dataset/xubh-q36u', 9),
  (cat_federal_government_cms, 'Food and Drug Administration', 'https://www.fda.gov/', 10),
  (cat_federal_government_cms, 'Office of Disease Prevention and Health Promotion', 'https://health.gov/', 11),
  (cat_federal_government_cms, 'Open Payments Data', 'https://openpaymentsdata.cms.gov/', 12),
  (cat_federal_government_cms, 'National Institutes of Health', 'https://www.nih.gov/health-information', 13),
  (cat_federal_government_cms, 'National Cancer Institute', 'https://www.cancer.gov/', 14),
  (cat_federal_government_cms, 'USA Government Spending', 'https://www.usgovernmentspending.com/', 15);

-- ============================================
-- Resources: Resources (24)
-- ============================================
INSERT INTO resources (category_id, name, url, display_order) VALUES
  (cat_resources, 'AHIP (America''s Health Insurance Plans)', 'https://www.ahip.org/', 1),
  (cat_resources, 'A-Z Federal Agencies', 'https://www.usa.gov/agency-index', 2),
  (cat_resources, 'Bureau of Justice Stats', 'https://bjs.ojp.gov/', 3),
  (cat_resources, 'Census Bureau', 'https://www.census.gov/', 4),
  (cat_resources, 'Clarivate', 'https://clarivate.com/', 5),
  (cat_resources, 'Definitive Healthcare', 'https://www.definitivehc.com/', 6),
  (cat_resources, 'Drugsdb.com', 'https://www.drugsdb.com/', 7),
  (cat_resources, 'Drug Index- RXList', 'https://www.rxlist.com/', 8),
  (cat_resources, 'Epocrates', 'https://www.epocrates.com/', 9),
  (cat_resources, 'Google Alerts', 'http://www.google.com/alerts', 10),
  (cat_resources, 'Google Trends', 'http://www.google.com/trends', 11),
  (cat_resources, 'GuideStar', 'https://www.guidestar.org/', 12),
  (cat_resources, 'The Joint Commission', 'https://www.jointcommission.org/', 13),
  (cat_resources, 'Magazine Directory', 'https://magazine-directory.com/', 14),
  (cat_resources, 'MAUDE (Manufacturer and User Facility Device Experience)', 'https://www.accessdata.fda.gov/scripts/cdrh/cfdocs/cfmaude/search.cfm', 15),
  (cat_resources, 'Mayo Clinic', 'https://www.mayoclinic.org/', 16),
  (cat_resources, 'Medline Drug Info', 'https://medlineplus.gov/', 17),
  (cat_resources, 'PDR-Drug Search', 'https://www.pdr.net/', 18),
  (cat_resources, 'RXList', 'https://www.rxlist.com/', 19),
  (cat_resources, 'Sales Data Generator', 'https://www.salesdatagenerator.com/', 20),
  (cat_resources, 'State Medical Board Search', 'https://www.docinfo.org/', 21),
  (cat_resources, 'US Government Stats', 'https://www.usa.gov/census-data', 22),
  (cat_resources, 'Uniform Crime Reports', 'https://www.fbi.gov/how-we-can-help-you/more-fbi-services-and-information/ucr', 23),
  (cat_resources, 'US Consumer – Product Recall Database', 'https://www.cpsc.gov/Recalls', 24);

-- ============================================
-- Resources: Search Firms / Staffing (18)
-- ============================================
INSERT INTO resources (category_id, name, url, display_order) VALUES
  (cat_search_firms_staffing, 'AHSA (American Healthcare Staffing Association)', 'http://www.ahsa.com', 1),
  (cat_search_firms_staffing, 'AMN Healthcare', 'http://www.amnhealthcare.com', 2),
  (cat_search_firms_staffing, 'Cielo Healthcare', 'http://www.cielotalent.com', 3),
  (cat_search_firms_staffing, 'Code Bellew', 'https://codebellew.com/', 4),
  (cat_search_firms_staffing, 'Diversified Search Group', 'https://diversifiedsearchgroup.com/', 5),
  (cat_search_firms_staffing, 'Heidrick & Struggles', 'https://www.heidrick.com/en/industries/healthcare-life-sciences', 6),
  (cat_search_firms_staffing, 'Gallagher Search', 'https://www.ajg.com/us/services/executive-search/', 7),
  (cat_search_firms_staffing, 'Gibson Consultants', 'https://www.gibson-consultants.com/', 8),
  (cat_search_firms_staffing, 'Grant Cooper Healthcare', 'http://www.grantcooper.com', 9),
  (cat_search_firms_staffing, 'Kirby Bates Associates', 'https://kirbybates.com/', 10),
  (cat_search_firms_staffing, 'Klein Hersh', 'https://www.kleinhersh.com/', 11),
  (cat_search_firms_staffing, 'Korn Ferry', 'https://www.kornferry.com/', 12),
  (cat_search_firms_staffing, 'MedReps', 'http://www.medreps.com/', 13),
  (cat_search_firms_staffing, 'PharmVille', 'https://www.pharmaceuticaljobboard.com/', 14),
  (cat_search_firms_staffing, 'Rudish Health', 'https://www.rudishhealth.com/', 15),
  (cat_search_firms_staffing, 'SimpliFi', 'http://www.simplifimsp.com', 16),
  (cat_search_firms_staffing, 'Spencer Stuart', 'https://www.spencerstuart.com/', 17),
  (cat_search_firms_staffing, 'Witt Kieffer', 'https://wittkieffer.com/markets/healthcare', 18);

-- ============================================
-- Resources: Women's Health / Resources (7)
-- ============================================
INSERT INTO resources (category_id, name, url, display_order) VALUES
  (cat_womens_health, 'American Medical Women''s Association', 'https://www.amwa-doc.org/', 1),
  (cat_womens_health, 'NIH Office of Research on Women''s Health (ORWH)', 'https://orwh.od.nih.gov/', 2),
  (cat_womens_health, 'Office of Women''s Health', 'https://www.womenshealth.gov/', 3),
  (cat_womens_health, 'Professional Women in Healthcare', 'https://www.mypwh.org/', 4),
  (cat_womens_health, 'Women''s Health Leadership TRUST', 'https://whltrust.org/', 5),
  (cat_womens_health, 'Women in Healthcare', 'https://www.womeninhealthcare.org/', 6),
  (cat_womens_health, 'Women in Healthcare Management', 'https://www.whcm.org/', 7);

-- ============================================
-- Resources: Provider / Physician Resources (18)
-- ============================================
INSERT INTO resources (category_id, name, url, display_order) VALUES
  (cat_provider_physician, 'ACHE (American College of Healthcare Executives)', 'https://www.ache.org/', 1),
  (cat_provider_physician, 'ABMS (American Board of Medical Specialties)', 'https://www.certificationmatters.org/', 2),
  (cat_provider_physician, 'Board Certification Verification', 'https://www.abim.org/verify-physician/', 3),
  (cat_provider_physician, 'Children''s Hospital Association', 'https://www.childrenshospitals.org/', 4),
  (cat_provider_physician, 'Doctor Search', 'https://www.abim.org/verify-physician/', 5),
  (cat_provider_physician, 'Fraud & Abuse Laws - Office of Inspector General', 'https://oig.hhs.gov/compliance/physician-education/fraud-abuse-laws/', 6),
  (cat_provider_physician, 'The HIPAA Journal', 'https://www.hipaajournal.com/', 7),
  (cat_provider_physician, 'Healthcare Executive', 'https://healthcareexecutive.org/', 8),
  (cat_provider_physician, 'Hospital Safety Grade by State', 'https://www.hospitalsafetygrade.org/state-rankings', 9),
  (cat_provider_physician, 'InpharmD- Drug Literature Search', 'https://inpharmd.com/our_story', 10),
  (cat_provider_physician, 'International Hospital Association', 'https://ihf-fih.org/', 11),
  (cat_provider_physician, 'NACHC (National Association of Community Health Centers)', 'https://www.nachc.org/', 12),
  (cat_provider_physician, 'Nationwide Children''s Hospital', 'https://www.nationwidechildrens.org/', 13),
  (cat_provider_physician, 'NC Rural Health Research Program', 'https://www.shepscenter.unc.edu/programs-projects/rural-health/', 14),
  (cat_provider_physician, 'ResearchGate', 'https://www.researchgate.net/', 15),
  (cat_provider_physician, 'RHIhub (Rural Health Information Hub)', 'https://www.ruralhealthinfo.org/topics', 16),
  (cat_provider_physician, 'Rural Health Research Gateway', 'https://www.ruralhealthresearch.org/', 17),
  (cat_provider_physician, 'Who''s Board Certified', 'https://www.certificationmatters.org/', 18);

-- ============================================
-- Resources: Podcasts (17)
-- ============================================
INSERT INTO resources (category_id, name, url, display_order) VALUES
  (cat_podcasts, 'ACHE''s The Healthcare Executive Podcast', 'https://open.spotify.com/show/1RbWiHo410CchEbmSzmR2r?si=0700cf2c48ca4f8e', 1),
  (cat_podcasts, 'AORN''s Periop Talk', 'https://open.spotify.com/show/1ZeBF83zOV8rFtKqL8ekwY?si=4e3b9448d2e3408b', 2),
  (cat_podcasts, 'Becker''s Healthcare Podcast', 'https://open.spotify.com/show/2kA3cIUQlZOavc1JCIk3Iu?si=0823b7b6f8944e36', 3),
  (cat_podcasts, 'Beyond Clean', 'https://open.spotify.com/show/4qZVwfPTHS5nqmnsGcaBVQ?si=92efb95b96034ad3', 4),
  (cat_podcasts, 'First Case Podcast', 'https://open.spotify.com/show/7FWxmCx0Yyx2bBgt3vnGDA?si=6aa7fd6ed10242f9', 5),
  (cat_podcasts, 'Healthcare Hodgepodge- HPN', 'https://healthcarehodgepodge.podbean.com/', 6),
  (cat_podcasts, 'Healthcare Insider Podcast', 'https://open.spotify.com/show/46gUAUtLBJIr9q2LyBuh9L?si=707f388b432c460b', 7),
  (cat_podcasts, 'Healthcare Supply Chain Best Practices', 'https://valueanalysismag.com/healthcare-supply-chain-best-practices-podcast/', 8),
  (cat_podcasts, 'HFMA''s Voices in Healthcare Finance', 'https://open.spotify.com/show/7ePyCNdSYIyF9w3RUQfgXM?si=d5a1074319734489', 9),
  (cat_podcasts, 'I Don''t Care- Dr. Kevin Stevenson', 'https://open.spotify.com/show/3Q3YUr9QTJNzQwyvDbCKvS?si=ad414f5abe9c4d91', 10),
  (cat_podcasts, 'Power Supply', 'https://open.spotify.com/show/3qZWCPSU9HYf0vh5pnzlYP?si=0cfdf4b786724074', 11),
  (cat_podcasts, 'My Good Friends (RCM)', 'https://open.spotify.com/show/2xYh5bhGEFFD92ZdGbOFxn?si=8845d40bf0eb4e93', 12),
  (cat_podcasts, 'Pharmacy Podcast Network', 'https://open.spotify.com/show/63XVeykiEKtj5WYHXmHu37?si=58d30d76a8244c6a', 13),
  (cat_podcasts, 'Relentless Health Value', 'https://open.spotify.com/show/6UjgzI7bScDrWvZEk2f46b?si=bed067052af14779', 14),
  (cat_podcasts, 'Sg2 Perspectives', 'https://open.spotify.com/show/2Mhpuv7F6Jq7467qmROfFh?si=511a0c569cff482c', 15),
  (cat_podcasts, 'The Business of Healthcare Podcast', 'https://open.spotify.com/show/5LWZLmUqnK2A9QKHKrkDWI?si=70defc1051d74bc4', 16),
  (cat_podcasts, 'The Business of HLTH', 'https://open.spotify.com/show/2PiNl1tnt3mhU4OiFn71dm?si=3c8fecf886e24133', 17);

-- ============================================
-- Resources: Consulting / Capital (10)
-- ============================================
INSERT INTO resources (category_id, name, url, display_order) VALUES
  (cat_consulting_capital, 'Advisory Board', 'https://www.advisory.com/', 1),
  (cat_consulting_capital, 'Bain & Company', 'https://www.bain.com/', 2),
  (cat_consulting_capital, 'Bourne Partners', 'https://www.bourne-partners.com/', 3),
  (cat_consulting_capital, 'BRG (Berkeley Research Group)', 'https://www.thinkbrg.com/', 4),
  (cat_consulting_capital, 'Brentwood Capital Advisors', 'https://www.brentwoodcap.com/', 5),
  (cat_consulting_capital, 'Cypress Growth Capital', 'https://www.cypressgrowthcapital.com/', 6),
  (cat_consulting_capital, 'Heritage Group', 'https://heritagegroupusa.com/', 7),
  (cat_consulting_capital, 'Kaufman Hall', 'http://www.kaufmanhall.com', 8),
  (cat_consulting_capital, 'MSOUTH Equity Partners', 'https://www.msouth.com/', 9),
  (cat_consulting_capital, 'Warbird Healthcare Advisors', 'https://warbirdconsulting.com/healthcare-2/', 10);

-- ============================================
-- Resources: National Accounts / Sales Support (7)
-- ============================================
INSERT INTO resources (category_id, name, url, display_order) VALUES
  (cat_national_accounts, 'The Alexander Group', 'https://www.alexandergroup.com/', 1),
  (cat_national_accounts, 'Excelerant Consulting', 'https://www.excelerantconsulting.com/', 2),
  (cat_national_accounts, 'Healthcare Links', 'https://www.healthcarelinks.org/', 3),
  (cat_national_accounts, 'The Mark Dixon Group', 'https://www.linkedin.com/in/markddixon/', 4),
  (cat_national_accounts, 'Medical Strategies International', 'https://www.medistrategies.com/#/', 5),
  (cat_national_accounts, 'Ratio Health Solutions', 'https://ratiohealthsolutions.com/', 6),
  (cat_national_accounts, 'The Wetrich Group', 'http://www.wetrichgroup.com', 7);

-- ============================================
-- Resources: Tools / Apps (16)
-- ============================================
INSERT INTO resources (category_id, name, url, display_order) VALUES
  (cat_tools_apps, '12 Foot Ladder', 'https://12ft.io/', 1),
  (cat_tools_apps, 'Ditto', 'https://ditto-cp.sourceforge.io/', 2),
  (cat_tools_apps, 'ChatGPT', 'http://www.chatGPT.com', 3),
  (cat_tools_apps, 'Cyrano', 'https://cyranovideo.com/', 4),
  (cat_tools_apps, 'Calendly', 'https://calendly.com/', 5),
  (cat_tools_apps, 'Email Checker', 'https://email-checker.net/', 6),
  (cat_tools_apps, 'FIRE Calculator (Financial/Retirement)', 'https://walletburst.com/tools/fire-calculator', 7),
  (cat_tools_apps, 'Grammarly', 'https://www.grammarly.com/', 8),
  (cat_tools_apps, 'Google Alerts', 'https://www.google.com/alerts', 9),
  (cat_tools_apps, 'Loom', 'http://www.loom.com', 10),
  (cat_tools_apps, 'PDF24 Tools', 'https://tools.pdf24.org/en/', 11),
  (cat_tools_apps, 'Perplexity', 'https://www.perplexity.ai/', 12),
  (cat_tools_apps, 'Remove Background', 'https://www.remove.bg/', 13),
  (cat_tools_apps, 'Text Blaze', 'https://blaze.today/', 14),
  (cat_tools_apps, 'Text Expander', 'https://textexpander.com/', 15),
  (cat_tools_apps, 'Vidyard', 'https://www.vidyard.com/', 16);

-- ============================================
-- Resources: Top News Sites (16)
-- ============================================
INSERT INTO resources (category_id, name, url, display_order) VALUES
  (cat_top_news_sites, 'Fox News', 'http://www.foxnews.com', 1),
  (cat_top_news_sites, 'CNN', 'http://www.cnn.com', 2),
  (cat_top_news_sites, 'CNN-Health', 'https://www.cnn.com/health', 3),
  (cat_top_news_sites, 'Crains', 'https://www.chicagobusiness.com/', 4),
  (cat_top_news_sites, 'LA Times', 'http://www.latimes.com', 5),
  (cat_top_news_sites, 'NY Times', 'http://www.nytimes.com', 6),
  (cat_top_news_sites, 'USA Today News', 'http://www.usatoday.com', 7),
  (cat_top_news_sites, 'Mercury News', 'http://www.mercurynews.com', 8),
  (cat_top_news_sites, 'Washington Post', 'http://www.washingtonpost.com', 9),
  (cat_top_news_sites, 'United States Newspapers', 'https://www.world-newspapers.com/countries/north-and-central-america/usa', 10),
  (cat_top_news_sites, 'World Newspapers', 'https://www.world-newspapers.com/countries/europe', 11),
  (cat_top_news_sites, 'The Wall Street Journal', 'http://www.wsj.com', 12),
  (cat_top_news_sites, 'Yahoo Finance', 'http://finance.yahoo.com/', 13),
  (cat_top_news_sites, 'WSJ Private Equity', 'http://blogs.wsj.com/privateequity/', 14),
  (cat_top_news_sites, 'Medscape', 'https://www.medscape.com/', 15),
  (cat_top_news_sites, 'Industry Week- Supply Chain', 'https://www.industryweek.com/supply-chain?utm_source=IWmenu&utm_medium=primary', 16);

-- ============================================
-- Resources: Travel Sites (8)
-- ============================================
INSERT INTO resources (category_id, name, url, display_order) VALUES
  (cat_travel_sites, 'All Airline Phone Numbers', 'https://upgradedpoints.com/travel/airlines/airline-phone-numbers/', 1),
  (cat_travel_sites, 'American Express Travel', 'https://travel.americanexpress.com/flight', 2),
  (cat_travel_sites, 'Flight Stats', 'http://www.flightstats.com/', 3),
  (cat_travel_sites, 'Flightaware', 'http://flightaware.com/live/', 4),
  (cat_travel_sites, 'Frommers Travel Guide', 'https://www.frommers.com/', 5),
  (cat_travel_sites, 'Last Minute Travel', 'https://www.lastminute.com/', 6),
  (cat_travel_sites, 'Priceline', 'https://www.priceline.com/', 7),
  (cat_travel_sites, 'National Traffic and Road Closures', 'https://www.fhwa.dot.gov/trafficinfo/', 8);

-- ============================================
-- Resources: Time / Weather (8)
-- ============================================
INSERT INTO resources (category_id, name, url, display_order) VALUES
  (cat_time_weather, 'Airport Delays', 'https://nasstatus.faa.gov/', 1),
  (cat_time_weather, 'CDC Travelers Health', 'https://wwwnc.cdc.gov/travel/', 2),
  (cat_time_weather, 'Flight Tracking', 'https://www.flightaware.com/live/', 3),
  (cat_time_weather, 'Travel Alerts', 'https://travel.state.gov/content/travel/en/traveladvisories/traveladvisories.html/', 4),
  (cat_time_weather, 'Weather', 'https://www.accuweather.com/', 5),
  (cat_time_weather, 'Weather Channel', 'https://weather.com/', 6),
  (cat_time_weather, 'World Time Zones', 'https://weather.com/', 7),
  (cat_time_weather, 'U.S. Time', 'https://www.time.gov/', 8);

-- ============================================
-- LinkedIn Influencers (29)
-- ============================================
INSERT INTO linkedin_influencers (name, linkedin_url, display_order) VALUES
  ('Preston Alexander', 'https://www.linkedin.com/in/preston-alexander/', 1),
  ('Marshall Allen', 'https://www.linkedin.com/in/marshallallen/', 2),
  ('Hank Balch', 'https://www.linkedin.com/in/sterileprocessing/', 3),
  ('Eric Bricker, MD', 'https://www.linkedin.com/in/ericbrickermd/', 4),
  ('Kevin Brown', 'https://www.linkedin.com/in/devicenation/', 5),
  ('Greg Caesar', 'https://www.linkedin.com/in/gregcaesar/', 6),
  ('Mark Copeland', 'https://www.linkedin.com/in/mark-copeland-50712b4/', 7),
  ('Will Conaway', 'https://www.linkedin.com/in/will-conaway-1320b912/', 8),
  ('Charles Cornish', 'https://www.linkedin.com/in/cbcornish/', 9),
  ('Chris Deacon', 'https://www.linkedin.com/in/chrisdeaconesq/', 10),
  ('David Dobrzykowski', 'https://www.linkedin.com/in/david-dobrzykowski/', 11),
  ('Shay Eskew', 'https://www.linkedin.com/in/shayeskew/', 12),
  ('Jonathan Hart, MD MBA', 'https://www.linkedin.com/in/jonathan-hart-md-mba-1870b1a5/', 13),
  ('Emma Geiser', 'https://www.linkedin.com/in/emmageiser/', 14),
  ('Nigel Green', 'https://www.linkedin.com/in/revenueharvest/', 15),
  ('Paul Keckley', 'https://www.linkedin.com/in/paulkeckley/', 16),
  ('Rebecca Love', 'https://www.linkedin.com/in/rebeccalovenursing/', 17),
  ('Bertalan Mesko, MD, PhD', 'https://www.linkedin.com/in/bertalanmesko/', 18),
  ('Joe Mullings', 'https://www.linkedin.com/in/joemullings/', 19),
  ('Blake Madden', 'https://www.linkedin.com/in/blakecmadden/', 20),
  ('Wendell Potter', 'https://www.linkedin.com/in/wendell-potter/', 21),
  ('Justin Poulin', 'https://www.linkedin.com/in/podcasting/', 22),
  ('Ben Reigle', 'https://www.linkedin.com/in/ben-reigle/', 23),
  ('Soumi Saha', 'https://www.linkedin.com/in/soumi-saha-81026a26/', 24),
  ('Matthew Ray Scott', 'https://www.linkedin.com/in/matthewrayscott/', 25),
  ('Quint Studer', 'https://www.linkedin.com/in/quint-studer/', 26),
  ('Adam Turinas', 'https://www.linkedin.com/in/adamturinas/', 27),
  ('Hays Waldrop', 'https://www.linkedin.com/in/hayswaldrop/', 28),
  ('Bob Yokl- Value Analysis', 'https://www.linkedin.com/in/valueanalysis/', 29);

RAISE NOTICE 'Seed data loaded: 21 categories, 300+ resources, 29 LinkedIn influencers';

END $$;

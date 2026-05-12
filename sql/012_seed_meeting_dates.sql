-- Seed meeting_dates from existing Industry Meetings resources
-- Dates are null — will be populated by scraper or manual entry

INSERT INTO meeting_dates (name, org_short, category, tags, website_url, source_url) VALUES
  ('AACP Pharmacy Education Conference', 'AACP', 'pharmacy', '{"PHARMACY","EDUCATION"}', 'https://www.aacp.org', 'https://www.aacp.org'),
  ('AAMI Annual Conference', 'AAMI', 'technology', '{"TECHNOLOGY","MEDICAL DEVICES"}', 'https://www.aami.org', 'https://www.aami.org'),
  ('AAOS Annual Meeting', 'AAOS', 'clinical', '{"ORTHOPEDIC","CLINICAL"}', 'https://www.aaos.org', 'https://www.aaos.org'),
  ('AAPPR Conference', 'AAPPR', 'workforce', '{"PHYSICIAN RECRUITMENT","WORKFORCE"}', 'https://aappr.org', 'https://aappr.org'),
  ('ACHE Congress on Healthcare Leadership', 'ACHE', 'c-suite', '{"LEADERSHIP","C-SUITE"}', 'https://congress.ache.org', 'https://congress.ache.org'),
  ('ACOG Annual Meeting', 'ACOG', 'clinical', '{"OB/GYN","CLINICAL"}', 'https://www.acog.org', 'https://www.acog.org'),
  ('AHIMA Annual Conference', 'AHIMA', 'technology', '{"DATA ANALYTICS","HIM"}', 'https://www.ahima.org', 'https://www.ahima.org'),
  ('AHRMM Annual Conference', 'AHRMM', 'supply-chain', '{"SUPPLY CHAIN","MATERIALS"}', 'https://www.ahrmm.org', 'https://www.ahrmm.org'),
  ('AHVAP Annual Conference', 'AHVAP', 'supply-chain', '{"VALUE ANALYSIS","SUPPLY CHAIN"}', 'https://www.ahvap.org', 'https://www.ahvap.org'),
  ('ANAE Annual Conference', 'ANAE', 'supply-chain', '{"NATIONAL ACCOUNTS","SUPPLY CHAIN"}', 'https://www.naesales.org', 'https://www.naesales.org'),
  ('AONL Conference', 'AONL', 'nursing', '{"NURSING","LEADERSHIP"}', 'https://www.aonl.org', 'https://www.aonl.org'),
  ('AORN Global Surgical Conference', 'AORN', 'nursing', '{"PERIOPERATIVE","NURSING"}', 'https://www.aorn.org', 'https://www.aorn.org'),
  ('APIC Annual Conference', 'APIC', 'clinical', '{"INFECTION PREVENTION","CLINICAL"}', 'https://www.apic.org', 'https://www.apic.org'),
  ('ASCA Annual Meeting', 'ASCA', 'clinical', '{"AMBULATORY","ASC"}', 'https://www.ascassociation.org', 'https://www.ascassociation.org'),
  ('ASCP Annual Meeting', 'ASCP', 'clinical', '{"PATHOLOGY","CLINICAL"}', 'https://www.ascp.org', 'https://www.ascp.org'),
  ('Asembia Specialty Pharmacy Summit', 'Asembia', 'pharmacy', '{"SPECIALTY PHARMACY"}', 'https://www.asembia.com', 'https://www.asembia.com'),
  ('ASH Annual Meeting', 'ASH', 'clinical', '{"HEMATOLOGY","CLINICAL"}', 'https://www.hematology.org', 'https://www.hematology.org'),
  ('ASHHRA Annual Conference', 'ASHHRA', 'workforce', '{"HR","WORKFORCE"}', 'https://www.ashhra.org', 'https://www.ashhra.org'),
  ('ASHP Midyear Clinical Meeting', 'ASHP', 'pharmacy', '{"PHARMACY","CLINICAL"}', 'https://midyear.ashp.org', 'https://midyear.ashp.org'),
  ('BRINetwork OR Management Summit', 'BRINetwork', 'clinical', '{"OR MANAGEMENT","HOSPITAL"}', 'https://www.brinetwork.com', 'https://www.brinetwork.com'),
  ('CPES Annual Meeting', 'CPES', 'pharmacy', '{"PHARMACY","EXECUTIVES"}', 'https://www.cpesllc.com', 'https://www.cpesllc.com'),
  ('CSCE Annual Meeting', 'CSCE', 'supply-chain', '{"SUPPLY CHAIN","EXECUTIVES"}', 'https://www.cscellc.com', 'https://www.cscellc.com'),
  ('Federation of American Hospitals', 'FAH', 'c-suite', '{"HOSPITAL","POLICY"}', 'https://www.fah.org', 'https://www.fah.org'),
  ('FIME Trade Show', 'FIME', 'technology', '{"INTERNATIONAL","MED TECH"}', 'https://www.fimeshow.com', 'https://www.fimeshow.com'),
  ('HCP Health Connect Partners', 'HCP', 'supply-chain', '{"SUPPLY CHAIN","HEALTHCARE"}', 'https://www.healthconnectpartners.com', 'https://www.healthconnectpartners.com'),
  ('Healthcare Facilities Symposium', 'HFS', 'facilities', '{"FACILITIES","DESIGN"}', 'https://www.hcarefacilities.com', 'https://www.hcarefacilities.com'),
  ('HFMA Annual Conference', 'HFMA', 'revenue-cycle', '{"FINANCE","REVENUE CYCLE"}', 'https://www.hfma.org', 'https://www.hfma.org'),
  ('HIDA Streamlining Healthcare Conference', 'HIDA', 'supply-chain', '{"DISTRIBUTION","SUPPLY CHAIN"}', 'https://www.hida.org', 'https://www.hida.org'),
  ('HIMSS Global Conference', 'HIMSS', 'technology', '{"HEALTH IT","DIGITAL HEALTH"}', 'https://www.himss.org', 'https://www.himss.org'),
  ('HLTH USA', 'HLTH', 'technology', '{"INNOVATION","DIGITAL HEALTH"}', 'https://www.hlth.com', 'https://www.hlth.com'),
  ('IDN Summit & Reverse Expo', 'IDN Summit', 'supply-chain', '{"IDN","C-SUITE"}', 'https://www.idnsummit.com', 'https://www.idnsummit.com'),
  ('IHES Spring Summit', 'IHES', 'c-suite', '{"C-SUITE","EXECUTIVE"}', 'https://www.ihesllc.com', 'https://www.ihesllc.com'),
  ('IHES Fall Summit', 'IHES', 'c-suite', '{"C-SUITE","EXECUTIVE"}', 'https://www.ihesllc.com', 'https://www.ihesllc.com'),
  ('J.P. Morgan Healthcare Conference', 'J.P. Morgan', 'c-suite', '{"STRATEGY","HEALTHCARE"}', 'https://www.jpmorgan.com/about/healthcareconference', 'https://www.jpmorgan.com/about/healthcareconference'),
  ('Medica World Forum', 'Medica', 'technology', '{"INTERNATIONAL","MED TECH"}', 'https://www.medica-tradefair.com', 'https://www.medica-tradefair.com'),
  ('MGMA Annual Conference', 'MGMA', 'c-suite', '{"PHYSICIAN","PRACTICE MGMT"}', 'https://www.mgma.com', 'https://www.mgma.com'),
  ('MUIA Annual Summit', 'MUIA', 'pharmacy', '{"AI","PHARMACY AUTOMATION"}', 'https://www.muiallc.com', 'https://www.muiallc.com'),
  ('NAHAM Annual Conference', 'NAHAM', 'revenue-cycle', '{"ACCESS MANAGEMENT","REVENUE CYCLE"}', 'https://www.naham.org', 'https://www.naham.org'),
  ('NASP Annual Meeting', 'NASP', 'pharmacy', '{"SPECIALTY PHARMACY"}', 'https://www.naspnet.org', 'https://www.naspnet.org'),
  ('Professional Women in Healthcare Summit', 'PWIH', 'c-suite', '{"LEADERSHIP","HEALTHCARE"}', 'https://www.pwih.org', 'https://www.pwih.org'),
  ('RSNA Annual Meeting', 'RSNA', 'clinical', '{"RADIOLOGY","IMAGING"}', 'https://www.rsna.org', 'https://www.rsna.org'),
  ('SCCM Critical Care Congress', 'SCCM', 'clinical', '{"CRITICAL CARE","CLINICAL"}', 'https://www.sccm.org', 'https://www.sccm.org'),
  ('SHEA Annual Scientific Meeting', 'SHEA', 'clinical', '{"EPIDEMIOLOGY","INFECTION"}', 'https://www.shea-online.org', 'https://www.shea-online.org'),
  ('SMI Annual Conference', 'SMI', 'supply-chain', '{"MARKETPLACE","SUPPLY CHAIN"}', 'https://www.smisupplychain.com', 'https://www.smisupplychain.com'),
  ('SRS Annual Meeting', 'SRS', 'technology', '{"ROBOTIC SURGERY","TECHNOLOGY"}', 'https://www.srs.org', 'https://www.srs.org'),
  ('VA Healthcare Summit', 'VA/IDGA', 'c-suite', '{"GOVERNMENT","HEALTHCARE"}', 'https://www.idga.org', 'https://www.idga.org'),
  ('ViVE', 'HLTH/CHIME', 'technology', '{"DIGITAL HEALTH","INNOVATION"}', 'https://www.viveevent.com', 'https://www.viveevent.com'),
  ('World Hospital at Home Congress', 'WHAHC', 'clinical', '{"HOSPITAL AT HOME","INNOVATION"}', 'https://www.hospitaladhomecongress.com', 'https://www.hospitaladhomecongress.com');

-- Link to existing resources where possible
UPDATE meeting_dates md
SET resource_id = r.id
FROM resources r
WHERE r.category_id = (
  SELECT id FROM resource_categories WHERE slug = 'industry-meetings'
)
AND r.is_active = true
AND r.name ILIKE '%' || md.org_short || '%';

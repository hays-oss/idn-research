-- IDN Research Platform — Company Directory
-- Run in Supabase SQL Editor AFTER 002_seed_data.sql
-- Adds directory categories and medical device / supply company resources

-- ============================================
-- Step 1: Add category_type column
-- ============================================
ALTER TABLE resource_categories ADD COLUMN IF NOT EXISTS category_type text NOT NULL DEFAULT 'resource';

-- ============================================
-- Step 2: Insert directory categories and resources
-- ============================================
DO $$
DECLARE
  cat_orthopedic uuid;
  cat_cardiac uuid;
  cat_surgical uuid;
  cat_diagnostics uuid;
  cat_wound_care uuid;
  cat_infusion uuid;
  cat_respiratory uuid;
  cat_diabetes uuid;
  cat_endoscopy uuid;
  cat_distribution uuid;
BEGIN

-- ============================================
-- Directory Categories
-- ============================================
INSERT INTO resource_categories (id, name, slug, display_order, category_type) VALUES
  (gen_random_uuid(), 'Orthopedic / Spine / Biologics', 'orthopedic-spine-biologics', 100, 'directory') RETURNING id INTO cat_orthopedic;
INSERT INTO resource_categories (id, name, slug, display_order, category_type) VALUES
  (gen_random_uuid(), 'Cardiac / Cardiovascular', 'cardiac-cardiovascular', 101, 'directory') RETURNING id INTO cat_cardiac;
INSERT INTO resource_categories (id, name, slug, display_order, category_type) VALUES
  (gen_random_uuid(), 'Surgical / Robotics', 'surgical-robotics', 102, 'directory') RETURNING id INTO cat_surgical;
INSERT INTO resource_categories (id, name, slug, display_order, category_type) VALUES
  (gen_random_uuid(), 'Diagnostics / Imaging', 'diagnostics-imaging', 103, 'directory') RETURNING id INTO cat_diagnostics;
INSERT INTO resource_categories (id, name, slug, display_order, category_type) VALUES
  (gen_random_uuid(), 'Wound Care / Infection Prevention', 'wound-care-infection-prevention', 104, 'directory') RETURNING id INTO cat_wound_care;
INSERT INTO resource_categories (id, name, slug, display_order, category_type) VALUES
  (gen_random_uuid(), 'Infusion / IV Therapy', 'infusion-iv-therapy', 105, 'directory') RETURNING id INTO cat_infusion;
INSERT INTO resource_categories (id, name, slug, display_order, category_type) VALUES
  (gen_random_uuid(), 'Respiratory / Anesthesia', 'respiratory-anesthesia', 106, 'directory') RETURNING id INTO cat_respiratory;
INSERT INTO resource_categories (id, name, slug, display_order, category_type) VALUES
  (gen_random_uuid(), 'Diabetes / Patient Monitoring', 'diabetes-patient-monitoring', 107, 'directory') RETURNING id INTO cat_diabetes;
INSERT INTO resource_categories (id, name, slug, display_order, category_type) VALUES
  (gen_random_uuid(), 'Endoscopy / GI', 'endoscopy-gi', 108, 'directory') RETURNING id INTO cat_endoscopy;
INSERT INTO resource_categories (id, name, slug, display_order, category_type) VALUES
  (gen_random_uuid(), 'Distribution / Med-Surg Supply', 'distribution-med-surg', 109, 'directory') RETURNING id INTO cat_distribution;

-- ============================================
-- Resources: Orthopedic / Spine / Biologics (30)
-- ============================================
INSERT INTO resources (category_id, name, url, display_order, tags) VALUES
  (cat_orthopedic, 'Stryker', 'https://www.stryker.com', 1, ARRAY['orthopedic', 'implants', 'robotics']),
  (cat_orthopedic, 'Zimmer Biomet', 'https://www.zimmerbiomet.com', 2, ARRAY['orthopedic', 'implants', 'joints']),
  (cat_orthopedic, 'DePuy Synthes', 'https://www.depuysynthes.com', 3, ARRAY['orthopedic', 'spine', 'trauma']),
  (cat_orthopedic, 'Medtronic Spine', 'https://www.medtronic.com/us-en/healthcare-professionals/products/spinal-orthopaedic.html', 4, ARRAY['spine', 'implants', 'biologics']),
  (cat_orthopedic, 'NuVasive', 'https://www.nuvasive.com', 5, ARRAY['spine', 'minimally invasive', 'implants']),
  (cat_orthopedic, 'Globus Medical', 'https://www.globusmedical.com', 6, ARRAY['spine', 'robotics', 'implants']),
  (cat_orthopedic, 'Smith+Nephew', 'https://www.smith-nephew.com', 7, ARRAY['orthopedic', 'sports medicine', 'joints']),
  (cat_orthopedic, 'Arthrex', 'https://www.arthrex.com', 8, ARRAY['sports medicine', 'orthopedic', 'minimally invasive']),
  (cat_orthopedic, 'Wright Medical', 'https://www.stryker.com/us/en/wright.html', 9, ARRAY['extremities', 'biologics', 'orthopedic']),
  (cat_orthopedic, 'Integra LifeSciences', 'https://www.integralife.com', 10, ARRAY['regenerative', 'neurosurgery', 'orthopedic']),
  (cat_orthopedic, 'Exactech', 'https://www.exac.com', 11, ARRAY['joints', 'orthopedic', 'implants']),
  (cat_orthopedic, 'Anika Therapeutics', 'https://www.anika.com', 12, ARRAY['biologics', 'regenerative', 'orthopedic']),
  (cat_orthopedic, 'Alphatec Spine', 'https://www.atecspine.com', 13, ARRAY['spine', 'implants', 'surgical']),
  (cat_orthopedic, 'Orthofix', 'https://www.orthofix.com', 14, ARRAY['spine', 'orthopedic', 'biologics']),
  (cat_orthopedic, 'RTI Surgical', 'https://www.rtix.com', 15, ARRAY['biologics', 'implants', 'spine']),
  (cat_orthopedic, 'K2M', 'https://www.stryker.com/us/en/spine.html', 16, ARRAY['spine', 'complex deformity', 'implants']),
  (cat_orthopedic, 'Amedisys', 'https://www.amedisys.com', 17, ARRAY['home health', 'rehabilitation', 'orthopedic']),
  (cat_orthopedic, 'Bioventus', 'https://www.bioventus.com', 18, ARRAY['biologics', 'orthopedic', 'healing']),
  (cat_orthopedic, 'Musculoskeletal Transplant Foundation', 'https://www.mtf.org', 19, ARRAY['tissue bank', 'biologics', 'transplant']),
  (cat_orthopedic, 'Medacta', 'https://www.medacta.com', 20, ARRAY['orthopedic', 'joints', 'spine']),
  (cat_orthopedic, 'ConMed', 'https://www.conmed.com', 21, ARRAY['orthopedic', 'surgical', 'sports medicine']),
  (cat_orthopedic, 'DJO Global', 'https://www.djoglobal.com', 22, ARRAY['bracing', 'rehabilitation', 'orthopedic']),
  (cat_orthopedic, 'Breg', 'https://www.breg.com', 23, ARRAY['bracing', 'orthopedic', 'sports medicine']),
  (cat_orthopedic, 'Ossur', 'https://www.ossur.com', 24, ARRAY['prosthetics', 'bracing', 'orthopedic']),
  (cat_orthopedic, 'Hanger Clinic', 'https://www.hangerclinic.com', 25, ARRAY['prosthetics', 'orthotics', 'rehabilitation']),
  (cat_orthopedic, 'OrthoPediatrics', 'https://www.orthopediatrics.com', 26, ARRAY['pediatric', 'orthopedic', 'implants']),
  (cat_orthopedic, 'SI-BONE', 'https://www.si-bone.com', 27, ARRAY['sacroiliac', 'spine', 'implants']),
  (cat_orthopedic, 'SeaSpine', 'https://www.seaspine.com', 28, ARRAY['spine', 'biologics', 'implants']),
  (cat_orthopedic, 'Enovis', 'https://www.enovis.com', 29, ARRAY['orthopedic', 'rehabilitation', 'surgical']),
  (cat_orthopedic, 'Paragon 28', 'https://www.paragon28.com', 30, ARRAY['foot', 'ankle', 'orthopedic']);

-- ============================================
-- Resources: Cardiac / Cardiovascular (25)
-- ============================================
INSERT INTO resources (category_id, name, url, display_order, tags) VALUES
  (cat_cardiac, 'Medtronic Cardiac', 'https://www.medtronic.com/us-en/healthcare-professionals/products/cardiac-rhythm.html', 1, ARRAY['cardiac', 'pacemaker', 'defibrillator']),
  (cat_cardiac, 'Boston Scientific', 'https://www.bostonscientific.com', 2, ARRAY['cardiac', 'interventional', 'devices']),
  (cat_cardiac, 'Edwards Lifesciences', 'https://www.edwards.com', 3, ARRAY['heart valves', 'hemodynamic', 'cardiac']),
  (cat_cardiac, 'Abbott', 'https://www.abbott.com/corpnewsroom/strategy-and-strength/cardiovascular.html', 4, ARRAY['cardiac', 'devices', 'diagnostics']),
  (cat_cardiac, 'Abiomed', 'https://www.abiomed.com', 5, ARRAY['heart pump', 'cardiac support', 'interventional']),
  (cat_cardiac, 'LivaNova', 'https://www.livanova.com', 6, ARRAY['cardiac surgery', 'neuromodulation', 'devices']),
  (cat_cardiac, 'Spectranetics', 'https://www.philips.com/a-w/about/innovation/spectranetics.html', 7, ARRAY['vascular', 'lead management', 'cardiac']),
  (cat_cardiac, 'AtriCure', 'https://www.atricure.com', 8, ARRAY['atrial fibrillation', 'cardiac surgery', 'ablation']),
  (cat_cardiac, 'Cardiovascular Systems', 'https://www.csi360.com', 9, ARRAY['atherectomy', 'vascular', 'interventional']),
  (cat_cardiac, 'Penumbra', 'https://www.penumbrainc.com', 10, ARRAY['neurovascular', 'thrombectomy', 'vascular']),
  (cat_cardiac, 'Merit Medical', 'https://www.merit.com', 11, ARRAY['interventional', 'cardiac', 'devices']),
  (cat_cardiac, 'Teleflex', 'https://www.teleflex.com', 12, ARRAY['vascular access', 'cardiac', 'surgical']),
  (cat_cardiac, 'AngioDynamics', 'https://www.angiodynamics.com', 13, ARRAY['vascular', 'interventional', 'devices']),
  (cat_cardiac, 'Cook Medical', 'https://www.cookmedical.com', 14, ARRAY['vascular', 'interventional', 'devices']),
  (cat_cardiac, 'Terumo', 'https://www.terumo.com', 15, ARRAY['vascular', 'cardiac', 'interventional']),
  (cat_cardiac, 'Biotronik', 'https://www.biotronik.com', 16, ARRAY['cardiac rhythm', 'pacemaker', 'defibrillator']),
  (cat_cardiac, 'MicroPort', 'https://www.microport.com', 17, ARRAY['cardiac', 'stent', 'devices']),
  (cat_cardiac, 'Getinge', 'https://www.getinge.com', 18, ARRAY['cardiac surgery', 'perfusion', 'devices']),
  (cat_cardiac, 'LeMaitre Vascular', 'https://www.lemaitre.com', 19, ARRAY['vascular surgery', 'grafts', 'devices']),
  (cat_cardiac, 'CryoLife', 'https://www.cryolife.com', 20, ARRAY['cardiac surgery', 'tissue preservation', 'aortic']),
  (cat_cardiac, 'Shockwave Medical', 'https://shockwavemedical.com', 21, ARRAY['lithotripsy', 'vascular', 'interventional']),
  (cat_cardiac, 'Nuvera Medical', 'https://www.nuvera.io', 22, ARRAY['cardiac', 'surgical planning', 'devices']),
  (cat_cardiac, 'Aortic Innovations', 'https://www.aorticinnovations.com', 23, ARRAY['aortic', 'endovascular', 'stent graft']),
  (cat_cardiac, 'Acutus Medical', 'https://www.acutusmedical.com', 24, ARRAY['electrophysiology', 'cardiac mapping', 'ablation']),
  (cat_cardiac, 'W.L. Gore', 'https://www.goremedical.com', 25, ARRAY['vascular graft', 'endovascular', 'cardiac']);

-- ============================================
-- Resources: Surgical / Robotics (20)
-- ============================================
INSERT INTO resources (category_id, name, url, display_order, tags) VALUES
  (cat_surgical, 'Intuitive Surgical', 'https://www.intuitive.com', 1, ARRAY['robotics', 'da Vinci', 'minimally invasive']),
  (cat_surgical, 'Stryker Mako', 'https://www.stryker.com/us/en/joint-replacement/systems/mako-robotic-arm-assisted-surgery.html', 2, ARRAY['robotics', 'orthopedic', 'joint replacement']),
  (cat_surgical, 'Medtronic Hugo', 'https://www.medtronic.com/covidien/en-us/robotic-assisted-surgery/hugo-ras-system.html', 3, ARRAY['robotics', 'surgical', 'minimally invasive']),
  (cat_surgical, 'Johnson & Johnson Ottava', 'https://www.jnjmedtech.com/en-US/ottava', 4, ARRAY['robotics', 'surgical', 'innovation']),
  (cat_surgical, 'Zimmer Biomet ROSA', 'https://www.zimmerbiomet.com/en/products-and-solutions/specialties/knee/rosa-knee-system.html', 5, ARRAY['robotics', 'orthopedic', 'knee']),
  (cat_surgical, 'Asensus Surgical', 'https://www.asensus.com', 6, ARRAY['robotics', 'digital surgery', 'laparoscopic']),
  (cat_surgical, 'CMR Surgical', 'https://cmrsurgical.com', 7, ARRAY['robotics', 'Versius', 'minimally invasive']),
  (cat_surgical, 'Vicarious Surgical', 'https://www.vicarioussurgical.com', 8, ARRAY['robotics', 'minimally invasive', 'surgical']),
  (cat_surgical, 'Titan Medical', 'https://www.titanmedicalinc.com', 9, ARRAY['robotics', 'single port', 'surgical']),
  (cat_surgical, 'TransEnterix', 'https://www.asensus.com', 10, ARRAY['robotics', 'digital laparoscopy', 'surgical']),
  (cat_surgical, 'Applied Medical', 'https://www.appliedmedical.com', 11, ARRAY['surgical', 'access', 'energy']),
  (cat_surgical, 'Ethicon', 'https://www.ethicon.com', 12, ARRAY['surgical', 'sutures', 'stapling']),
  (cat_surgical, 'Covidien', 'https://www.medtronic.com/covidien', 13, ARRAY['surgical', 'energy', 'stapling']),
  (cat_surgical, 'Olympus Surgical', 'https://medical.olympusamerica.com', 14, ARRAY['surgical', 'visualization', 'energy']),
  (cat_surgical, 'Karl Storz', 'https://www.karlstorz.com', 15, ARRAY['endoscopy', 'visualization', 'surgical']),
  (cat_surgical, 'Richard Wolf', 'https://www.richard-wolf.com', 16, ARRAY['endoscopy', 'surgical', 'visualization']),
  (cat_surgical, 'ConMed Surgical', 'https://www.conmed.com', 17, ARRAY['surgical', 'orthopedic', 'general surgery']),
  (cat_surgical, 'Teleflex Surgical', 'https://www.teleflex.com/usa/en/product-areas/surgical/index.html', 18, ARRAY['surgical', 'access', 'ligation']),
  (cat_surgical, 'Surgical Specialties', 'https://www.surgicalspecialties.com', 19, ARRAY['sutures', 'surgical', 'wound closure']),
  (cat_surgical, 'Microline Surgical', 'https://www.microline.us', 20, ARRAY['laparoscopic', 'instruments', 'surgical']);

-- ============================================
-- Resources: Diagnostics / Imaging (25)
-- ============================================
INSERT INTO resources (category_id, name, url, display_order, tags) VALUES
  (cat_diagnostics, 'GE Healthcare', 'https://www.gehealthcare.com', 1, ARRAY['imaging', 'diagnostics', 'ultrasound']),
  (cat_diagnostics, 'Siemens Healthineers', 'https://www.siemens-healthineers.com', 2, ARRAY['imaging', 'diagnostics', 'laboratory']),
  (cat_diagnostics, 'Philips Healthcare', 'https://www.usa.philips.com/healthcare', 3, ARRAY['imaging', 'diagnostics', 'monitoring']),
  (cat_diagnostics, 'Hologic', 'https://www.hologic.com', 4, ARRAY['breast health', 'diagnostics', 'imaging']),
  (cat_diagnostics, 'Canon Medical', 'https://us.medical.canon', 5, ARRAY['imaging', 'CT', 'MRI']),
  (cat_diagnostics, 'Fujifilm Medical', 'https://www.fujifilmhealthcare.com', 6, ARRAY['imaging', 'endoscopy', 'diagnostics']),
  (cat_diagnostics, 'Carestream', 'https://www.carestream.com', 7, ARRAY['imaging', 'X-ray', 'healthcare IT']),
  (cat_diagnostics, 'Mindray', 'https://www.mindray.com', 8, ARRAY['monitoring', 'diagnostics', 'ultrasound']),
  (cat_diagnostics, 'Samsung Medison', 'https://www.samsunghealthcare.com', 9, ARRAY['ultrasound', 'imaging', 'diagnostics']),
  (cat_diagnostics, 'Shimadzu Medical', 'https://www.shimadzu.com/med', 10, ARRAY['imaging', 'X-ray', 'fluoroscopy']),
  (cat_diagnostics, 'Roche Diagnostics', 'https://diagnostics.roche.com', 11, ARRAY['laboratory', 'diagnostics', 'molecular']),
  (cat_diagnostics, 'Abbott Diagnostics', 'https://www.abbott.com/diagnostics.html', 12, ARRAY['laboratory', 'point of care', 'diagnostics']),
  (cat_diagnostics, 'Beckman Coulter', 'https://www.beckmancoulter.com', 13, ARRAY['laboratory', 'diagnostics', 'automation']),
  (cat_diagnostics, 'bioMerieux', 'https://www.biomerieux.com', 14, ARRAY['microbiology', 'diagnostics', 'infectious disease']),
  (cat_diagnostics, 'Sysmex', 'https://www.sysmex.com', 15, ARRAY['hematology', 'laboratory', 'diagnostics']),
  (cat_diagnostics, 'Ortho Clinical Diagnostics', 'https://www.orthoclinicaldiagnostics.com', 16, ARRAY['transfusion', 'laboratory', 'diagnostics']),
  (cat_diagnostics, 'Quidel', 'https://www.quidel.com', 17, ARRAY['rapid diagnostics', 'point of care', 'immunoassay']),
  (cat_diagnostics, 'Cepheid', 'https://www.cepheid.com', 18, ARRAY['molecular diagnostics', 'rapid testing', 'laboratory']),
  (cat_diagnostics, 'Illumina', 'https://www.illumina.com', 19, ARRAY['genomics', 'sequencing', 'diagnostics']),
  (cat_diagnostics, 'Exact Sciences', 'https://www.exactsciences.com', 20, ARRAY['cancer screening', 'diagnostics', 'genomics']),
  (cat_diagnostics, 'Guardant Health', 'https://guardanthealth.com', 21, ARRAY['liquid biopsy', 'oncology', 'diagnostics']),
  (cat_diagnostics, 'Lantheus', 'https://www.lantheus.com', 22, ARRAY['nuclear imaging', 'contrast', 'diagnostics']),
  (cat_diagnostics, 'Bracco', 'https://www.bracco.com', 23, ARRAY['contrast media', 'imaging', 'diagnostics']),
  (cat_diagnostics, 'Guerbet', 'https://www.guerbet.com', 24, ARRAY['contrast media', 'imaging', 'interventional']),
  (cat_diagnostics, 'Varex Imaging', 'https://www.vareximaging.com', 25, ARRAY['X-ray', 'components', 'imaging']);

-- ============================================
-- Resources: Wound Care / Infection Prevention (20)
-- ============================================
INSERT INTO resources (category_id, name, url, display_order, tags) VALUES
  (cat_wound_care, '3M Healthcare', 'https://www.3m.com/3M/en_US/health-care-us/', 1, ARRAY['wound care', 'infection prevention', 'sterilization']),
  (cat_wound_care, 'Molnlycke', 'https://www.molnlycke.com', 2, ARRAY['wound care', 'surgical', 'dressings']),
  (cat_wound_care, 'ConvaTec', 'https://www.convatec.com', 3, ARRAY['wound care', 'ostomy', 'continence']),
  (cat_wound_care, 'Solventum', 'https://www.solventum.com', 4, ARRAY['wound care', 'infection prevention', 'sterilization']),
  (cat_wound_care, 'Smith+Nephew Wound', 'https://www.smith-nephew.com/en/health-care-professionals/products/advanced-wound-management', 5, ARRAY['wound care', 'negative pressure', 'dressings']),
  (cat_wound_care, 'Coloplast', 'https://www.coloplast.com', 6, ARRAY['wound care', 'ostomy', 'continence']),
  (cat_wound_care, 'Integra Wound Care', 'https://www.integralife.com/wound-reconstruction', 7, ARRAY['wound care', 'regenerative', 'skin substitutes']),
  (cat_wound_care, 'Organogenesis', 'https://www.organogenesis.com', 8, ARRAY['wound care', 'regenerative', 'biologics']),
  (cat_wound_care, 'MiMedx', 'https://www.mimedx.com', 9, ARRAY['wound care', 'biologics', 'amniotic tissue']),
  (cat_wound_care, 'Derma Sciences', 'https://www.integralife.com', 10, ARRAY['wound care', 'dressings', 'biologics']),
  (cat_wound_care, 'Acelity', 'https://www.3m.com/3M/en_US/health-care-us/kci/', 11, ARRAY['wound care', 'negative pressure', 'therapy']),
  (cat_wound_care, 'DeRoyal', 'https://www.deroyal.com', 12, ARRAY['wound care', 'surgical', 'patient care']),
  (cat_wound_care, 'Medela', 'https://www.medela.com', 13, ARRAY['wound care', 'vacuum therapy', 'drainage']),
  (cat_wound_care, 'Hollister', 'https://www.hollister.com', 14, ARRAY['ostomy', 'wound care', 'continence']),
  (cat_wound_care, 'Ecolab Healthcare', 'https://www.ecolab.com/nalco-water/offerings/life-sciences', 15, ARRAY['infection prevention', 'disinfection', 'hygiene']),
  (cat_wound_care, 'Diversey', 'https://diversey.com', 16, ARRAY['infection prevention', 'cleaning', 'hygiene']),
  (cat_wound_care, 'PDI Healthcare', 'https://pdihc.com', 17, ARRAY['infection prevention', 'disinfection', 'wipes']),
  (cat_wound_care, 'Clorox Healthcare', 'https://www.cloroxpro.com/products/clorox-healthcare/', 18, ARRAY['infection prevention', 'disinfection', 'surface care']),
  (cat_wound_care, 'STERIS', 'https://www.steris.com', 19, ARRAY['sterilization', 'infection prevention', 'surgical']),
  (cat_wound_care, 'Advanced Sterilization Products', 'https://www.asp.com', 20, ARRAY['sterilization', 'infection prevention', 'reprocessing']);

-- ============================================
-- Resources: Infusion / IV Therapy (15)
-- ============================================
INSERT INTO resources (category_id, name, url, display_order, tags) VALUES
  (cat_infusion, 'Becton Dickinson', 'https://www.bd.com', 1, ARRAY['infusion', 'vascular access', 'syringes']),
  (cat_infusion, 'Baxter', 'https://www.baxter.com', 2, ARRAY['infusion', 'IV solutions', 'renal']),
  (cat_infusion, 'ICU Medical', 'https://www.icumed.com', 3, ARRAY['infusion', 'IV therapy', 'oncology']),
  (cat_infusion, 'B. Braun', 'https://www.bbraun.com', 4, ARRAY['infusion', 'IV therapy', 'pharmacy']),
  (cat_infusion, 'Smiths Medical', 'https://www.smiths-medical.com', 5, ARRAY['infusion', 'vascular access', 'airway']),
  (cat_infusion, 'Fresenius Kabi', 'https://www.fresenius-kabi.com', 6, ARRAY['infusion', 'nutrition', 'biosimilars']),
  (cat_infusion, 'Zyno Medical', 'https://www.zynomedical.com', 7, ARRAY['infusion pumps', 'IV therapy', 'devices']),
  (cat_infusion, 'Ivenix', 'https://www.ivenix.com', 8, ARRAY['infusion pumps', 'smart pumps', 'IV therapy']),
  (cat_infusion, 'Hospira', 'https://www.pfizer.com/products/product-detail/hospira', 9, ARRAY['infusion', 'injectable', 'biosimilars']),
  (cat_infusion, 'Moog Medical', 'https://www.moog.com/markets/medical.html', 10, ARRAY['infusion pumps', 'enteral', 'devices']),
  (cat_infusion, 'Caesarea Medical Electronics', 'https://www.caesarea-medical.com', 11, ARRAY['infusion pumps', 'IV therapy', 'devices']),
  (cat_infusion, 'Terumo Infusion', 'https://www.terumo.com/products/infusion-pumps', 12, ARRAY['infusion', 'IV therapy', 'devices']),
  (cat_infusion, 'RiteDose', 'https://www.ritedose.com', 13, ARRAY['unit dose', 'respiratory', 'packaging']),
  (cat_infusion, 'Grifols', 'https://www.grifols.com', 14, ARRAY['plasma', 'transfusion', 'IV therapy']),
  (cat_infusion, 'West Pharmaceutical Services', 'https://www.westpharma.com', 15, ARRAY['drug delivery', 'packaging', 'injectable']);

-- ============================================
-- Resources: Respiratory / Anesthesia (15)
-- ============================================
INSERT INTO resources (category_id, name, url, display_order, tags) VALUES
  (cat_respiratory, 'Drager', 'https://www.draeger.com', 1, ARRAY['anesthesia', 'ventilation', 'monitoring']),
  (cat_respiratory, 'Fisher & Paykel Healthcare', 'https://www.fphcare.com', 2, ARRAY['respiratory', 'humidification', 'nasal high flow']),
  (cat_respiratory, 'Getinge', 'https://www.getinge.com/us/products/ventilation/', 3, ARRAY['ventilation', 'anesthesia', 'critical care']),
  (cat_respiratory, 'Vyaire Medical', 'https://www.vyaire.com', 4, ARRAY['respiratory', 'ventilation', 'diagnostics']),
  (cat_respiratory, 'Masimo', 'https://www.masimo.com', 5, ARRAY['pulse oximetry', 'monitoring', 'respiratory']),
  (cat_respiratory, 'Medtronic Respiratory', 'https://www.medtronic.com/covidien/en-us/products/respiratory-gi.html', 6, ARRAY['airway', 'ventilation', 'respiratory']),
  (cat_respiratory, 'ResMed', 'https://www.resmed.com', 7, ARRAY['sleep apnea', 'ventilation', 'respiratory']),
  (cat_respiratory, 'Philips Respironics', 'https://www.usa.philips.com/healthcare/solutions/sleep-and-respiratory-care', 8, ARRAY['sleep', 'ventilation', 'respiratory']),
  (cat_respiratory, 'Hamilton Medical', 'https://www.hamilton-medical.com', 9, ARRAY['ventilation', 'critical care', 'intelligent ventilation']),
  (cat_respiratory, 'Mindray Anesthesia', 'https://www.mindray.com/en/products/anesthesia.html', 10, ARRAY['anesthesia', 'ventilation', 'monitoring']),
  (cat_respiratory, 'GE Anesthesia', 'https://www.gehealthcare.com/products/anesthesia', 11, ARRAY['anesthesia', 'ventilation', 'monitoring']),
  (cat_respiratory, 'Breas Medical', 'https://www.breas.com', 12, ARRAY['ventilation', 'respiratory', 'home care']),
  (cat_respiratory, 'Lowenstein Medical', 'https://www.loewensteinmedical.com', 13, ARRAY['ventilation', 'anesthesia', 'respiratory']),
  (cat_respiratory, 'Nihon Kohden', 'https://www.nihonkohden.com', 14, ARRAY['monitoring', 'EEG', 'respiratory']),
  (cat_respiratory, 'SenTec', 'https://www.sentec.com', 15, ARRAY['monitoring', 'transcutaneous', 'respiratory']);

-- ============================================
-- Resources: Diabetes / Patient Monitoring (20)
-- ============================================
INSERT INTO resources (category_id, name, url, display_order, tags) VALUES
  (cat_diabetes, 'Dexcom', 'https://www.dexcom.com', 1, ARRAY['CGM', 'diabetes', 'glucose monitoring']),
  (cat_diabetes, 'Abbott FreeStyle Libre', 'https://www.freestyle.abbott', 2, ARRAY['CGM', 'diabetes', 'glucose monitoring']),
  (cat_diabetes, 'Medtronic Diabetes', 'https://www.medtronicdiabetes.com', 3, ARRAY['insulin pump', 'CGM', 'diabetes']),
  (cat_diabetes, 'Insulet', 'https://www.insulet.com', 4, ARRAY['insulin pump', 'Omnipod', 'diabetes']),
  (cat_diabetes, 'Tandem Diabetes', 'https://www.tandemdiabetes.com', 5, ARRAY['insulin pump', 'diabetes', 'automated delivery']),
  (cat_diabetes, 'Roche Diabetes Care', 'https://www.rochediabetes.com', 6, ARRAY['glucose monitoring', 'diabetes', 'diagnostics']),
  (cat_diabetes, 'Ascensia', 'https://www.ascensia.com', 7, ARRAY['glucose monitoring', 'diabetes', 'Contour']),
  (cat_diabetes, 'LifeScan', 'https://www.lifescan.com', 8, ARRAY['glucose monitoring', 'OneTouch', 'diabetes']),
  (cat_diabetes, 'Senseonics', 'https://www.senseonics.com', 9, ARRAY['CGM', 'implantable', 'diabetes']),
  (cat_diabetes, 'Beta Bionics', 'https://www.betabionics.com', 10, ARRAY['bionic pancreas', 'insulin delivery', 'diabetes']),
  (cat_diabetes, 'Bigfoot Biomedical', 'https://www.bigfootbiomedical.com', 11, ARRAY['insulin delivery', 'diabetes', 'smart pen']),
  (cat_diabetes, 'Masimo Patient Monitoring', 'https://www.masimo.com/technology/co-oximetry/', 12, ARRAY['patient monitoring', 'pulse oximetry', 'noninvasive']),
  (cat_diabetes, 'Philips Patient Monitoring', 'https://www.usa.philips.com/healthcare/solutions/patient-monitoring', 13, ARRAY['patient monitoring', 'telemetry', 'critical care']),
  (cat_diabetes, 'GE Patient Monitoring', 'https://www.gehealthcare.com/products/patient-monitoring', 14, ARRAY['patient monitoring', 'telemetry', 'critical care']),
  (cat_diabetes, 'Nihon Kohden Monitoring', 'https://www.nihonkohden.com/products/patient-monitoring', 15, ARRAY['patient monitoring', 'telemetry', 'EEG']),
  (cat_diabetes, 'Mindray Monitoring', 'https://www.mindray.com/en/products/patient-monitoring.html', 16, ARRAY['patient monitoring', 'vital signs', 'telemetry']),
  (cat_diabetes, 'Spacelabs Healthcare', 'https://www.spacelabshealthcare.com', 17, ARRAY['patient monitoring', 'telemetry', 'anesthesia']),
  (cat_diabetes, 'Welch Allyn', 'https://www.welchallyn.com', 18, ARRAY['vital signs', 'diagnostics', 'patient monitoring']),
  (cat_diabetes, 'Nonin Medical', 'https://www.nonin.com', 19, ARRAY['pulse oximetry', 'monitoring', 'noninvasive']),
  (cat_diabetes, 'Natus Medical', 'https://www.natus.com', 20, ARRAY['neurodiagnostic', 'newborn care', 'monitoring']);

-- ============================================
-- Resources: Endoscopy / GI (15)
-- ============================================
INSERT INTO resources (category_id, name, url, display_order, tags) VALUES
  (cat_endoscopy, 'Olympus Endoscopy', 'https://medical.olympusamerica.com/procedure/endoscopy', 1, ARRAY['endoscopy', 'GI', 'visualization']),
  (cat_endoscopy, 'Boston Scientific Endoscopy', 'https://www.bostonscientific.com/en-US/medical-specialties/gastroenterology.html', 2, ARRAY['endoscopy', 'GI', 'interventional']),
  (cat_endoscopy, 'Fujifilm Endoscopy', 'https://www.fujifilmhealthcare.com/endoscopy', 3, ARRAY['endoscopy', 'imaging', 'GI']),
  (cat_endoscopy, 'Pentax Medical', 'https://www.pentaxmedical.com', 4, ARRAY['endoscopy', 'GI', 'visualization']),
  (cat_endoscopy, 'Karl Storz Endoscopy', 'https://www.karlstorz.com/us/en/gastroenterology.htm', 5, ARRAY['endoscopy', 'visualization', 'GI']),
  (cat_endoscopy, 'Medtronic GI', 'https://www.medtronic.com/covidien/en-us/products/gastrointestinal.html', 6, ARRAY['GI', 'capsule endoscopy', 'devices']),
  (cat_endoscopy, 'Cook Medical GI', 'https://www.cookmedical.com/products/endoscopy/', 7, ARRAY['endoscopy', 'GI', 'interventional']),
  (cat_endoscopy, 'ConMed GI', 'https://www.conmed.com/en/medical-specialties/gastroenterology', 8, ARRAY['endoscopy', 'GI', 'surgical']),
  (cat_endoscopy, 'Ambu', 'https://www.ambu.com', 9, ARRAY['single use', 'endoscopy', 'airway']),
  (cat_endoscopy, 'US Endoscopy', 'https://www.usendoscopy.com', 10, ARRAY['endoscopy', 'accessories', 'GI']),
  (cat_endoscopy, 'Endo-Technik', 'https://www.endo-technik.com', 11, ARRAY['endoscopy', 'instruments', 'GI']),
  (cat_endoscopy, 'STERIS Endoscopy', 'https://www.steris.com/healthcare/products/endoscope-reprocessing', 12, ARRAY['reprocessing', 'endoscopy', 'sterilization']),
  (cat_endoscopy, 'Cantel Medical', 'https://www.cantelmedical.com', 13, ARRAY['infection prevention', 'endoscopy', 'reprocessing']),
  (cat_endoscopy, 'NovaBay Pharmaceuticals', 'https://www.novabay.com', 14, ARRAY['infection prevention', 'endoscopy', 'antimicrobial']),
  (cat_endoscopy, 'Cogentix Medical', 'https://www.laborie.com', 15, ARRAY['endoscopy', 'urology', 'visualization']);

-- ============================================
-- Resources: Distribution / Med-Surg Supply (20)
-- ============================================
INSERT INTO resources (category_id, name, url, display_order, tags) VALUES
  (cat_distribution, 'Medline Industries', 'https://www.medline.com', 1, ARRAY['distribution', 'med-surg', 'manufacturer']),
  (cat_distribution, 'Owens & Minor', 'https://www.owens-minor.com', 2, ARRAY['distribution', 'med-surg', 'supply chain']),
  (cat_distribution, 'Cardinal Health', 'https://www.cardinalhealth.com', 3, ARRAY['distribution', 'med-surg', 'pharmacy']),
  (cat_distribution, 'Henry Schein', 'https://www.henryschein.com', 4, ARRAY['distribution', 'dental', 'med-surg']),
  (cat_distribution, 'McKesson Medical-Surgical', 'https://mms.mckesson.com', 5, ARRAY['distribution', 'med-surg', 'supply chain']),
  (cat_distribution, 'Concordance Healthcare Solutions', 'https://www.concordancehealthcare.com', 6, ARRAY['distribution', 'med-surg', 'supply chain']),
  (cat_distribution, 'NDC', 'https://www.ndc-inc.com', 7, ARRAY['distribution', 'contracting', 'supply chain']),
  (cat_distribution, 'Midmark', 'https://www.midmark.com', 8, ARRAY['exam tables', 'clinical equipment', 'ambulatory']),
  (cat_distribution, 'Dukal', 'https://www.dukal.com', 9, ARRAY['medical supplies', 'disposables', 'med-surg']),
  (cat_distribution, 'Dynarex', 'https://www.dynarex.com', 10, ARRAY['medical supplies', 'disposables', 'med-surg']),
  (cat_distribution, 'Halyard Health', 'https://www.owens-minor.com/halyard/', 11, ARRAY['surgical', 'infection prevention', 'med-surg']),
  (cat_distribution, 'Ansell', 'https://www.ansell.com', 12, ARRAY['gloves', 'PPE', 'protective']),
  (cat_distribution, 'Molnlycke Distribution', 'https://www.molnlycke.com', 13, ARRAY['surgical', 'wound care', 'distribution']),
  (cat_distribution, 'Encompass Group', 'https://www.encompassgroup.com', 14, ARRAY['textiles', 'linens', 'reusable']),
  (cat_distribution, 'Standard Textile', 'https://www.standardtextile.com', 15, ARRAY['textiles', 'linens', 'healthcare']),
  (cat_distribution, 'Bovie Medical', 'https://www.symmetrysurgical.com', 16, ARRAY['electrosurgery', 'surgical', 'devices']),
  (cat_distribution, 'Symmetry Surgical', 'https://www.symmetrysurgical.com', 17, ARRAY['instruments', 'surgical', 'sterilization']),
  (cat_distribution, 'Sklar Instruments', 'https://www.sklarcorp.com', 18, ARRAY['instruments', 'surgical', 'reusable']),
  (cat_distribution, 'Bound Tree Medical', 'https://www.boundtree.com', 19, ARRAY['EMS', 'emergency', 'distribution']),
  (cat_distribution, 'MedAssets', 'https://www.vizientinc.com', 20, ARRAY['GPO', 'supply chain', 'contracting']);

END $$;

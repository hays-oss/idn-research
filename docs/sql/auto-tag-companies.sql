-- Auto-tag 574 companies
-- Generated: 2026-04-01T13:42:21.276Z
-- Run this in Supabase SQL Editor

BEGIN;

-- Clear all existing company tags
DELETE FROM company_tags;

-- KR Wolfe (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('07a70243-d0a1-4905-8638-ecfd05331798', 277, 'ai_auto', 0.30),
  ('07a70243-d0a1-4905-8638-ecfd05331798', 278, 'ai_auto', 0.30),
  ('07a70243-d0a1-4905-8638-ecfd05331798', 279, 'ai_auto', 0.30),
  ('07a70243-d0a1-4905-8638-ecfd05331798', 280, 'ai_auto', 0.30),
  ('07a70243-d0a1-4905-8638-ecfd05331798', 281, 'ai_auto', 0.30),
  ('07a70243-d0a1-4905-8638-ecfd05331798', 616, 'ai_auto', 0.30),
  ('07a70243-d0a1-4905-8638-ecfd05331798', 617, 'ai_auto', 0.30),
  ('07a70243-d0a1-4905-8638-ecfd05331798', 618, 'ai_auto', 0.30),
  ('07a70243-d0a1-4905-8638-ecfd05331798', 619, 'ai_auto', 0.30),
  ('07a70243-d0a1-4905-8638-ecfd05331798', 620, 'ai_auto', 0.30);

-- Stryker (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('8649cc4e-110a-4388-a735-bf8d824de9ea', 1, 'ai_auto', 0.30),
  ('8649cc4e-110a-4388-a735-bf8d824de9ea', 2, 'ai_auto', 0.30),
  ('8649cc4e-110a-4388-a735-bf8d824de9ea', 3, 'ai_auto', 0.30),
  ('8649cc4e-110a-4388-a735-bf8d824de9ea', 4, 'ai_auto', 0.30),
  ('8649cc4e-110a-4388-a735-bf8d824de9ea', 5, 'ai_auto', 0.30),
  ('8649cc4e-110a-4388-a735-bf8d824de9ea', 6, 'ai_auto', 0.30),
  ('8649cc4e-110a-4388-a735-bf8d824de9ea', 7, 'ai_auto', 0.30),
  ('8649cc4e-110a-4388-a735-bf8d824de9ea', 8, 'ai_auto', 0.30),
  ('8649cc4e-110a-4388-a735-bf8d824de9ea', 352, 'ai_auto', 0.30),
  ('8649cc4e-110a-4388-a735-bf8d824de9ea', 353, 'ai_auto', 0.30);

-- Zimmer Biomet (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('d0dbd6e8-8b22-4e26-8cc5-25e1d3dc8e9c', 1, 'ai_auto', 0.30),
  ('d0dbd6e8-8b22-4e26-8cc5-25e1d3dc8e9c', 2, 'ai_auto', 0.30),
  ('d0dbd6e8-8b22-4e26-8cc5-25e1d3dc8e9c', 3, 'ai_auto', 0.30),
  ('d0dbd6e8-8b22-4e26-8cc5-25e1d3dc8e9c', 4, 'ai_auto', 0.30),
  ('d0dbd6e8-8b22-4e26-8cc5-25e1d3dc8e9c', 5, 'ai_auto', 0.30),
  ('d0dbd6e8-8b22-4e26-8cc5-25e1d3dc8e9c', 6, 'ai_auto', 0.30),
  ('d0dbd6e8-8b22-4e26-8cc5-25e1d3dc8e9c', 7, 'ai_auto', 0.30),
  ('d0dbd6e8-8b22-4e26-8cc5-25e1d3dc8e9c', 8, 'ai_auto', 0.30),
  ('d0dbd6e8-8b22-4e26-8cc5-25e1d3dc8e9c', 352, 'ai_auto', 0.30),
  ('d0dbd6e8-8b22-4e26-8cc5-25e1d3dc8e9c', 353, 'ai_auto', 0.30);

-- DePuy Synthes (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('83042c3e-5d6c-4892-a9f3-5b5f9ce56f9a', 1, 'ai_auto', 0.30),
  ('83042c3e-5d6c-4892-a9f3-5b5f9ce56f9a', 2, 'ai_auto', 0.30),
  ('83042c3e-5d6c-4892-a9f3-5b5f9ce56f9a', 3, 'ai_auto', 0.30),
  ('83042c3e-5d6c-4892-a9f3-5b5f9ce56f9a', 4, 'ai_auto', 0.30),
  ('83042c3e-5d6c-4892-a9f3-5b5f9ce56f9a', 5, 'ai_auto', 0.30),
  ('83042c3e-5d6c-4892-a9f3-5b5f9ce56f9a', 6, 'ai_auto', 0.30),
  ('83042c3e-5d6c-4892-a9f3-5b5f9ce56f9a', 7, 'ai_auto', 0.30),
  ('83042c3e-5d6c-4892-a9f3-5b5f9ce56f9a', 8, 'ai_auto', 0.30),
  ('83042c3e-5d6c-4892-a9f3-5b5f9ce56f9a', 352, 'ai_auto', 0.30),
  ('83042c3e-5d6c-4892-a9f3-5b5f9ce56f9a', 353, 'ai_auto', 0.30);

-- Medtronic Spine (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('4f0ff77b-5523-4630-90db-9fae22f1e4f6', 2, 'ai_auto', 1.00),
  ('4f0ff77b-5523-4630-90db-9fae22f1e4f6', 1, 'ai_auto', 0.30),
  ('4f0ff77b-5523-4630-90db-9fae22f1e4f6', 3, 'ai_auto', 0.30),
  ('4f0ff77b-5523-4630-90db-9fae22f1e4f6', 4, 'ai_auto', 0.30),
  ('4f0ff77b-5523-4630-90db-9fae22f1e4f6', 5, 'ai_auto', 0.30),
  ('4f0ff77b-5523-4630-90db-9fae22f1e4f6', 6, 'ai_auto', 0.30),
  ('4f0ff77b-5523-4630-90db-9fae22f1e4f6', 7, 'ai_auto', 0.30),
  ('4f0ff77b-5523-4630-90db-9fae22f1e4f6', 8, 'ai_auto', 0.30),
  ('4f0ff77b-5523-4630-90db-9fae22f1e4f6', 352, 'ai_auto', 0.30),
  ('4f0ff77b-5523-4630-90db-9fae22f1e4f6', 353, 'ai_auto', 0.30);

-- NuVasive (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('2591e007-22c7-47c7-8172-d49e6b004c4c', 1, 'ai_auto', 0.30),
  ('2591e007-22c7-47c7-8172-d49e6b004c4c', 2, 'ai_auto', 0.30),
  ('2591e007-22c7-47c7-8172-d49e6b004c4c', 3, 'ai_auto', 0.30),
  ('2591e007-22c7-47c7-8172-d49e6b004c4c', 4, 'ai_auto', 0.30),
  ('2591e007-22c7-47c7-8172-d49e6b004c4c', 5, 'ai_auto', 0.30),
  ('2591e007-22c7-47c7-8172-d49e6b004c4c', 6, 'ai_auto', 0.30),
  ('2591e007-22c7-47c7-8172-d49e6b004c4c', 7, 'ai_auto', 0.30),
  ('2591e007-22c7-47c7-8172-d49e6b004c4c', 8, 'ai_auto', 0.30),
  ('2591e007-22c7-47c7-8172-d49e6b004c4c', 352, 'ai_auto', 0.30),
  ('2591e007-22c7-47c7-8172-d49e6b004c4c', 353, 'ai_auto', 0.30);

-- Globus Medical (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('ff3e8d35-dbe2-4087-b491-d516a7483861', 1, 'ai_auto', 0.30),
  ('ff3e8d35-dbe2-4087-b491-d516a7483861', 2, 'ai_auto', 0.30),
  ('ff3e8d35-dbe2-4087-b491-d516a7483861', 3, 'ai_auto', 0.30),
  ('ff3e8d35-dbe2-4087-b491-d516a7483861', 4, 'ai_auto', 0.30),
  ('ff3e8d35-dbe2-4087-b491-d516a7483861', 5, 'ai_auto', 0.30),
  ('ff3e8d35-dbe2-4087-b491-d516a7483861', 6, 'ai_auto', 0.30),
  ('ff3e8d35-dbe2-4087-b491-d516a7483861', 7, 'ai_auto', 0.30),
  ('ff3e8d35-dbe2-4087-b491-d516a7483861', 8, 'ai_auto', 0.30),
  ('ff3e8d35-dbe2-4087-b491-d516a7483861', 352, 'ai_auto', 0.30),
  ('ff3e8d35-dbe2-4087-b491-d516a7483861', 353, 'ai_auto', 0.30);

-- Smith+Nephew (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('f5572f21-9cb7-453c-a153-3425ba8ac877', 1, 'ai_auto', 0.30),
  ('f5572f21-9cb7-453c-a153-3425ba8ac877', 2, 'ai_auto', 0.30),
  ('f5572f21-9cb7-453c-a153-3425ba8ac877', 3, 'ai_auto', 0.30),
  ('f5572f21-9cb7-453c-a153-3425ba8ac877', 4, 'ai_auto', 0.30),
  ('f5572f21-9cb7-453c-a153-3425ba8ac877', 5, 'ai_auto', 0.30),
  ('f5572f21-9cb7-453c-a153-3425ba8ac877', 6, 'ai_auto', 0.30),
  ('f5572f21-9cb7-453c-a153-3425ba8ac877', 7, 'ai_auto', 0.30),
  ('f5572f21-9cb7-453c-a153-3425ba8ac877', 8, 'ai_auto', 0.30),
  ('f5572f21-9cb7-453c-a153-3425ba8ac877', 352, 'ai_auto', 0.30),
  ('f5572f21-9cb7-453c-a153-3425ba8ac877', 353, 'ai_auto', 0.30);

-- ConMed (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('54a89803-f460-47e5-8ff9-e8c111323b74', 1, 'ai_auto', 0.30),
  ('54a89803-f460-47e5-8ff9-e8c111323b74', 2, 'ai_auto', 0.30),
  ('54a89803-f460-47e5-8ff9-e8c111323b74', 3, 'ai_auto', 0.30),
  ('54a89803-f460-47e5-8ff9-e8c111323b74', 4, 'ai_auto', 0.30),
  ('54a89803-f460-47e5-8ff9-e8c111323b74', 5, 'ai_auto', 0.30),
  ('54a89803-f460-47e5-8ff9-e8c111323b74', 6, 'ai_auto', 0.30),
  ('54a89803-f460-47e5-8ff9-e8c111323b74', 7, 'ai_auto', 0.30),
  ('54a89803-f460-47e5-8ff9-e8c111323b74', 8, 'ai_auto', 0.30),
  ('54a89803-f460-47e5-8ff9-e8c111323b74', 352, 'ai_auto', 0.30),
  ('54a89803-f460-47e5-8ff9-e8c111323b74', 353, 'ai_auto', 0.30);

-- Arthrex (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('248556a9-b0d8-4790-b43c-d77fbda1790b', 1, 'ai_auto', 0.30),
  ('248556a9-b0d8-4790-b43c-d77fbda1790b', 2, 'ai_auto', 0.30),
  ('248556a9-b0d8-4790-b43c-d77fbda1790b', 3, 'ai_auto', 0.30),
  ('248556a9-b0d8-4790-b43c-d77fbda1790b', 4, 'ai_auto', 0.30),
  ('248556a9-b0d8-4790-b43c-d77fbda1790b', 5, 'ai_auto', 0.30),
  ('248556a9-b0d8-4790-b43c-d77fbda1790b', 6, 'ai_auto', 0.30),
  ('248556a9-b0d8-4790-b43c-d77fbda1790b', 7, 'ai_auto', 0.30),
  ('248556a9-b0d8-4790-b43c-d77fbda1790b', 8, 'ai_auto', 0.30),
  ('248556a9-b0d8-4790-b43c-d77fbda1790b', 352, 'ai_auto', 0.30),
  ('248556a9-b0d8-4790-b43c-d77fbda1790b', 353, 'ai_auto', 0.30);

-- Wright Medical (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('c62093aa-77e4-47e6-a1ad-95b13807e28c', 1, 'ai_auto', 0.30),
  ('c62093aa-77e4-47e6-a1ad-95b13807e28c', 2, 'ai_auto', 0.30),
  ('c62093aa-77e4-47e6-a1ad-95b13807e28c', 3, 'ai_auto', 0.30),
  ('c62093aa-77e4-47e6-a1ad-95b13807e28c', 4, 'ai_auto', 0.30),
  ('c62093aa-77e4-47e6-a1ad-95b13807e28c', 5, 'ai_auto', 0.30),
  ('c62093aa-77e4-47e6-a1ad-95b13807e28c', 6, 'ai_auto', 0.30),
  ('c62093aa-77e4-47e6-a1ad-95b13807e28c', 7, 'ai_auto', 0.30),
  ('c62093aa-77e4-47e6-a1ad-95b13807e28c', 8, 'ai_auto', 0.30),
  ('c62093aa-77e4-47e6-a1ad-95b13807e28c', 352, 'ai_auto', 0.30),
  ('c62093aa-77e4-47e6-a1ad-95b13807e28c', 353, 'ai_auto', 0.30);

-- Integra LifeSciences (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('93b079ef-beda-479a-a5b5-17b63a2d48bb', 1, 'ai_auto', 0.30),
  ('93b079ef-beda-479a-a5b5-17b63a2d48bb', 2, 'ai_auto', 0.30),
  ('93b079ef-beda-479a-a5b5-17b63a2d48bb', 3, 'ai_auto', 0.30),
  ('93b079ef-beda-479a-a5b5-17b63a2d48bb', 4, 'ai_auto', 0.30),
  ('93b079ef-beda-479a-a5b5-17b63a2d48bb', 5, 'ai_auto', 0.30),
  ('93b079ef-beda-479a-a5b5-17b63a2d48bb', 6, 'ai_auto', 0.30),
  ('93b079ef-beda-479a-a5b5-17b63a2d48bb', 7, 'ai_auto', 0.30),
  ('93b079ef-beda-479a-a5b5-17b63a2d48bb', 8, 'ai_auto', 0.30),
  ('93b079ef-beda-479a-a5b5-17b63a2d48bb', 352, 'ai_auto', 0.30),
  ('93b079ef-beda-479a-a5b5-17b63a2d48bb', 353, 'ai_auto', 0.30);

-- Exactech (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('645ac636-4914-49ef-b3ca-1c04290c58b1', 1, 'ai_auto', 0.30),
  ('645ac636-4914-49ef-b3ca-1c04290c58b1', 2, 'ai_auto', 0.30),
  ('645ac636-4914-49ef-b3ca-1c04290c58b1', 3, 'ai_auto', 0.30),
  ('645ac636-4914-49ef-b3ca-1c04290c58b1', 4, 'ai_auto', 0.30),
  ('645ac636-4914-49ef-b3ca-1c04290c58b1', 5, 'ai_auto', 0.30),
  ('645ac636-4914-49ef-b3ca-1c04290c58b1', 6, 'ai_auto', 0.30),
  ('645ac636-4914-49ef-b3ca-1c04290c58b1', 7, 'ai_auto', 0.30),
  ('645ac636-4914-49ef-b3ca-1c04290c58b1', 8, 'ai_auto', 0.30),
  ('645ac636-4914-49ef-b3ca-1c04290c58b1', 352, 'ai_auto', 0.30),
  ('645ac636-4914-49ef-b3ca-1c04290c58b1', 353, 'ai_auto', 0.30);

-- Anika Therapeutics (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('14800a9e-fd61-4e5c-9c8c-63bbd6d6a2bb', 1, 'ai_auto', 0.30),
  ('14800a9e-fd61-4e5c-9c8c-63bbd6d6a2bb', 2, 'ai_auto', 0.30),
  ('14800a9e-fd61-4e5c-9c8c-63bbd6d6a2bb', 3, 'ai_auto', 0.30),
  ('14800a9e-fd61-4e5c-9c8c-63bbd6d6a2bb', 4, 'ai_auto', 0.30),
  ('14800a9e-fd61-4e5c-9c8c-63bbd6d6a2bb', 5, 'ai_auto', 0.30),
  ('14800a9e-fd61-4e5c-9c8c-63bbd6d6a2bb', 6, 'ai_auto', 0.30),
  ('14800a9e-fd61-4e5c-9c8c-63bbd6d6a2bb', 7, 'ai_auto', 0.30),
  ('14800a9e-fd61-4e5c-9c8c-63bbd6d6a2bb', 8, 'ai_auto', 0.30),
  ('14800a9e-fd61-4e5c-9c8c-63bbd6d6a2bb', 352, 'ai_auto', 0.30),
  ('14800a9e-fd61-4e5c-9c8c-63bbd6d6a2bb', 353, 'ai_auto', 0.30);

-- Alphatec Spine (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('4da0ed4e-727d-4d52-b7f3-919d565c2e84', 2, 'ai_auto', 1.00),
  ('4da0ed4e-727d-4d52-b7f3-919d565c2e84', 1, 'ai_auto', 0.30),
  ('4da0ed4e-727d-4d52-b7f3-919d565c2e84', 3, 'ai_auto', 0.30),
  ('4da0ed4e-727d-4d52-b7f3-919d565c2e84', 4, 'ai_auto', 0.30),
  ('4da0ed4e-727d-4d52-b7f3-919d565c2e84', 5, 'ai_auto', 0.30),
  ('4da0ed4e-727d-4d52-b7f3-919d565c2e84', 6, 'ai_auto', 0.30),
  ('4da0ed4e-727d-4d52-b7f3-919d565c2e84', 7, 'ai_auto', 0.30),
  ('4da0ed4e-727d-4d52-b7f3-919d565c2e84', 8, 'ai_auto', 0.30),
  ('4da0ed4e-727d-4d52-b7f3-919d565c2e84', 352, 'ai_auto', 0.30),
  ('4da0ed4e-727d-4d52-b7f3-919d565c2e84', 353, 'ai_auto', 0.30);

-- Orthofix (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('a91aa0b8-5758-400f-b8e7-958ec8c450de', 1, 'ai_auto', 0.30),
  ('a91aa0b8-5758-400f-b8e7-958ec8c450de', 2, 'ai_auto', 0.30),
  ('a91aa0b8-5758-400f-b8e7-958ec8c450de', 3, 'ai_auto', 0.30),
  ('a91aa0b8-5758-400f-b8e7-958ec8c450de', 4, 'ai_auto', 0.30),
  ('a91aa0b8-5758-400f-b8e7-958ec8c450de', 5, 'ai_auto', 0.30),
  ('a91aa0b8-5758-400f-b8e7-958ec8c450de', 6, 'ai_auto', 0.30),
  ('a91aa0b8-5758-400f-b8e7-958ec8c450de', 7, 'ai_auto', 0.30),
  ('a91aa0b8-5758-400f-b8e7-958ec8c450de', 8, 'ai_auto', 0.30),
  ('a91aa0b8-5758-400f-b8e7-958ec8c450de', 352, 'ai_auto', 0.30),
  ('a91aa0b8-5758-400f-b8e7-958ec8c450de', 353, 'ai_auto', 0.30);

-- RTI Surgical (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('1a73caed-d8c9-4b39-b360-8cc7811f5044', 1, 'ai_auto', 0.30),
  ('1a73caed-d8c9-4b39-b360-8cc7811f5044', 2, 'ai_auto', 0.30),
  ('1a73caed-d8c9-4b39-b360-8cc7811f5044', 3, 'ai_auto', 0.30),
  ('1a73caed-d8c9-4b39-b360-8cc7811f5044', 4, 'ai_auto', 0.30),
  ('1a73caed-d8c9-4b39-b360-8cc7811f5044', 5, 'ai_auto', 0.30),
  ('1a73caed-d8c9-4b39-b360-8cc7811f5044', 6, 'ai_auto', 0.30),
  ('1a73caed-d8c9-4b39-b360-8cc7811f5044', 7, 'ai_auto', 0.30),
  ('1a73caed-d8c9-4b39-b360-8cc7811f5044', 8, 'ai_auto', 0.30),
  ('1a73caed-d8c9-4b39-b360-8cc7811f5044', 352, 'ai_auto', 0.30),
  ('1a73caed-d8c9-4b39-b360-8cc7811f5044', 353, 'ai_auto', 0.30);

-- K2M (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('e2f38903-b64a-4e92-ac62-1b6bb9e77447', 1, 'ai_auto', 0.30),
  ('e2f38903-b64a-4e92-ac62-1b6bb9e77447', 2, 'ai_auto', 0.30),
  ('e2f38903-b64a-4e92-ac62-1b6bb9e77447', 3, 'ai_auto', 0.30),
  ('e2f38903-b64a-4e92-ac62-1b6bb9e77447', 4, 'ai_auto', 0.30),
  ('e2f38903-b64a-4e92-ac62-1b6bb9e77447', 5, 'ai_auto', 0.30),
  ('e2f38903-b64a-4e92-ac62-1b6bb9e77447', 6, 'ai_auto', 0.30),
  ('e2f38903-b64a-4e92-ac62-1b6bb9e77447', 7, 'ai_auto', 0.30),
  ('e2f38903-b64a-4e92-ac62-1b6bb9e77447', 8, 'ai_auto', 0.30),
  ('e2f38903-b64a-4e92-ac62-1b6bb9e77447', 352, 'ai_auto', 0.30),
  ('e2f38903-b64a-4e92-ac62-1b6bb9e77447', 353, 'ai_auto', 0.30);

-- Amedisys (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('fca7e5a3-30e1-4823-9165-42381fa16ecd', 1, 'ai_auto', 0.30),
  ('fca7e5a3-30e1-4823-9165-42381fa16ecd', 2, 'ai_auto', 0.30),
  ('fca7e5a3-30e1-4823-9165-42381fa16ecd', 3, 'ai_auto', 0.30),
  ('fca7e5a3-30e1-4823-9165-42381fa16ecd', 4, 'ai_auto', 0.30),
  ('fca7e5a3-30e1-4823-9165-42381fa16ecd', 5, 'ai_auto', 0.30),
  ('fca7e5a3-30e1-4823-9165-42381fa16ecd', 6, 'ai_auto', 0.30),
  ('fca7e5a3-30e1-4823-9165-42381fa16ecd', 7, 'ai_auto', 0.30),
  ('fca7e5a3-30e1-4823-9165-42381fa16ecd', 8, 'ai_auto', 0.30),
  ('fca7e5a3-30e1-4823-9165-42381fa16ecd', 352, 'ai_auto', 0.30),
  ('fca7e5a3-30e1-4823-9165-42381fa16ecd', 353, 'ai_auto', 0.30);

-- Bioventus (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('aa4312cd-036e-414d-a41c-883cc834d910', 1, 'ai_auto', 0.30),
  ('aa4312cd-036e-414d-a41c-883cc834d910', 2, 'ai_auto', 0.30),
  ('aa4312cd-036e-414d-a41c-883cc834d910', 3, 'ai_auto', 0.30),
  ('aa4312cd-036e-414d-a41c-883cc834d910', 4, 'ai_auto', 0.30),
  ('aa4312cd-036e-414d-a41c-883cc834d910', 5, 'ai_auto', 0.30),
  ('aa4312cd-036e-414d-a41c-883cc834d910', 6, 'ai_auto', 0.30),
  ('aa4312cd-036e-414d-a41c-883cc834d910', 7, 'ai_auto', 0.30),
  ('aa4312cd-036e-414d-a41c-883cc834d910', 8, 'ai_auto', 0.30),
  ('aa4312cd-036e-414d-a41c-883cc834d910', 352, 'ai_auto', 0.30),
  ('aa4312cd-036e-414d-a41c-883cc834d910', 353, 'ai_auto', 0.30);

-- Musculoskeletal Transplant Foundation (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('6676dada-7327-4e9e-bee7-e1347b490bbb', 1, 'ai_auto', 0.30),
  ('6676dada-7327-4e9e-bee7-e1347b490bbb', 2, 'ai_auto', 0.30),
  ('6676dada-7327-4e9e-bee7-e1347b490bbb', 3, 'ai_auto', 0.30),
  ('6676dada-7327-4e9e-bee7-e1347b490bbb', 4, 'ai_auto', 0.30),
  ('6676dada-7327-4e9e-bee7-e1347b490bbb', 5, 'ai_auto', 0.30),
  ('6676dada-7327-4e9e-bee7-e1347b490bbb', 6, 'ai_auto', 0.30),
  ('6676dada-7327-4e9e-bee7-e1347b490bbb', 7, 'ai_auto', 0.30),
  ('6676dada-7327-4e9e-bee7-e1347b490bbb', 8, 'ai_auto', 0.30),
  ('6676dada-7327-4e9e-bee7-e1347b490bbb', 352, 'ai_auto', 0.30),
  ('6676dada-7327-4e9e-bee7-e1347b490bbb', 353, 'ai_auto', 0.30);

-- Medacta (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('afd14bdb-00b4-4f48-aedd-500548423fdd', 1, 'ai_auto', 0.30),
  ('afd14bdb-00b4-4f48-aedd-500548423fdd', 2, 'ai_auto', 0.30),
  ('afd14bdb-00b4-4f48-aedd-500548423fdd', 3, 'ai_auto', 0.30),
  ('afd14bdb-00b4-4f48-aedd-500548423fdd', 4, 'ai_auto', 0.30),
  ('afd14bdb-00b4-4f48-aedd-500548423fdd', 5, 'ai_auto', 0.30),
  ('afd14bdb-00b4-4f48-aedd-500548423fdd', 6, 'ai_auto', 0.30),
  ('afd14bdb-00b4-4f48-aedd-500548423fdd', 7, 'ai_auto', 0.30),
  ('afd14bdb-00b4-4f48-aedd-500548423fdd', 8, 'ai_auto', 0.30),
  ('afd14bdb-00b4-4f48-aedd-500548423fdd', 352, 'ai_auto', 0.30),
  ('afd14bdb-00b4-4f48-aedd-500548423fdd', 353, 'ai_auto', 0.30);

-- DJO Global (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('8e68f1a2-f583-4cc6-b551-08419f81d82e', 1, 'ai_auto', 0.30),
  ('8e68f1a2-f583-4cc6-b551-08419f81d82e', 2, 'ai_auto', 0.30),
  ('8e68f1a2-f583-4cc6-b551-08419f81d82e', 3, 'ai_auto', 0.30),
  ('8e68f1a2-f583-4cc6-b551-08419f81d82e', 4, 'ai_auto', 0.30),
  ('8e68f1a2-f583-4cc6-b551-08419f81d82e', 5, 'ai_auto', 0.30),
  ('8e68f1a2-f583-4cc6-b551-08419f81d82e', 6, 'ai_auto', 0.30),
  ('8e68f1a2-f583-4cc6-b551-08419f81d82e', 7, 'ai_auto', 0.30),
  ('8e68f1a2-f583-4cc6-b551-08419f81d82e', 8, 'ai_auto', 0.30),
  ('8e68f1a2-f583-4cc6-b551-08419f81d82e', 352, 'ai_auto', 0.30),
  ('8e68f1a2-f583-4cc6-b551-08419f81d82e', 353, 'ai_auto', 0.30);

-- Breg (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('40cb86e7-7724-46c7-8466-56c1e34cbe6e', 1, 'ai_auto', 0.30),
  ('40cb86e7-7724-46c7-8466-56c1e34cbe6e', 2, 'ai_auto', 0.30),
  ('40cb86e7-7724-46c7-8466-56c1e34cbe6e', 3, 'ai_auto', 0.30),
  ('40cb86e7-7724-46c7-8466-56c1e34cbe6e', 4, 'ai_auto', 0.30),
  ('40cb86e7-7724-46c7-8466-56c1e34cbe6e', 5, 'ai_auto', 0.30),
  ('40cb86e7-7724-46c7-8466-56c1e34cbe6e', 6, 'ai_auto', 0.30),
  ('40cb86e7-7724-46c7-8466-56c1e34cbe6e', 7, 'ai_auto', 0.30),
  ('40cb86e7-7724-46c7-8466-56c1e34cbe6e', 8, 'ai_auto', 0.30),
  ('40cb86e7-7724-46c7-8466-56c1e34cbe6e', 352, 'ai_auto', 0.30),
  ('40cb86e7-7724-46c7-8466-56c1e34cbe6e', 353, 'ai_auto', 0.30);

-- Ossur (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('3bc77bc2-fea5-4655-bcb3-e2783444b454', 1, 'ai_auto', 0.30),
  ('3bc77bc2-fea5-4655-bcb3-e2783444b454', 2, 'ai_auto', 0.30),
  ('3bc77bc2-fea5-4655-bcb3-e2783444b454', 3, 'ai_auto', 0.30),
  ('3bc77bc2-fea5-4655-bcb3-e2783444b454', 4, 'ai_auto', 0.30),
  ('3bc77bc2-fea5-4655-bcb3-e2783444b454', 5, 'ai_auto', 0.30),
  ('3bc77bc2-fea5-4655-bcb3-e2783444b454', 6, 'ai_auto', 0.30),
  ('3bc77bc2-fea5-4655-bcb3-e2783444b454', 7, 'ai_auto', 0.30),
  ('3bc77bc2-fea5-4655-bcb3-e2783444b454', 8, 'ai_auto', 0.30),
  ('3bc77bc2-fea5-4655-bcb3-e2783444b454', 352, 'ai_auto', 0.30),
  ('3bc77bc2-fea5-4655-bcb3-e2783444b454', 353, 'ai_auto', 0.30);

-- Hanger Clinic (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('865c0f92-6f6b-4034-b298-b461b786421e', 1, 'ai_auto', 0.30),
  ('865c0f92-6f6b-4034-b298-b461b786421e', 2, 'ai_auto', 0.30),
  ('865c0f92-6f6b-4034-b298-b461b786421e', 3, 'ai_auto', 0.30),
  ('865c0f92-6f6b-4034-b298-b461b786421e', 4, 'ai_auto', 0.30),
  ('865c0f92-6f6b-4034-b298-b461b786421e', 5, 'ai_auto', 0.30),
  ('865c0f92-6f6b-4034-b298-b461b786421e', 6, 'ai_auto', 0.30),
  ('865c0f92-6f6b-4034-b298-b461b786421e', 7, 'ai_auto', 0.30),
  ('865c0f92-6f6b-4034-b298-b461b786421e', 8, 'ai_auto', 0.30),
  ('865c0f92-6f6b-4034-b298-b461b786421e', 352, 'ai_auto', 0.30),
  ('865c0f92-6f6b-4034-b298-b461b786421e', 353, 'ai_auto', 0.30);

-- OrthoPediatrics (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('798e419b-1566-4257-93ab-615ca762bd09', 1, 'ai_auto', 0.30),
  ('798e419b-1566-4257-93ab-615ca762bd09', 2, 'ai_auto', 0.30),
  ('798e419b-1566-4257-93ab-615ca762bd09', 3, 'ai_auto', 0.30),
  ('798e419b-1566-4257-93ab-615ca762bd09', 4, 'ai_auto', 0.30),
  ('798e419b-1566-4257-93ab-615ca762bd09', 5, 'ai_auto', 0.30),
  ('798e419b-1566-4257-93ab-615ca762bd09', 6, 'ai_auto', 0.30),
  ('798e419b-1566-4257-93ab-615ca762bd09', 7, 'ai_auto', 0.30),
  ('798e419b-1566-4257-93ab-615ca762bd09', 8, 'ai_auto', 0.30),
  ('798e419b-1566-4257-93ab-615ca762bd09', 352, 'ai_auto', 0.30),
  ('798e419b-1566-4257-93ab-615ca762bd09', 353, 'ai_auto', 0.30);

-- SI-BONE (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('f561c82b-8d06-4db4-bf15-7a1e234add14', 354, 'ai_auto', 0.40),
  ('f561c82b-8d06-4db4-bf15-7a1e234add14', 356, 'ai_auto', 0.37),
  ('f561c82b-8d06-4db4-bf15-7a1e234add14', 1, 'ai_auto', 0.30),
  ('f561c82b-8d06-4db4-bf15-7a1e234add14', 2, 'ai_auto', 0.30),
  ('f561c82b-8d06-4db4-bf15-7a1e234add14', 3, 'ai_auto', 0.30),
  ('f561c82b-8d06-4db4-bf15-7a1e234add14', 4, 'ai_auto', 0.30),
  ('f561c82b-8d06-4db4-bf15-7a1e234add14', 5, 'ai_auto', 0.30),
  ('f561c82b-8d06-4db4-bf15-7a1e234add14', 6, 'ai_auto', 0.30),
  ('f561c82b-8d06-4db4-bf15-7a1e234add14', 7, 'ai_auto', 0.30),
  ('f561c82b-8d06-4db4-bf15-7a1e234add14', 8, 'ai_auto', 0.30);

-- SeaSpine (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('c16fccbc-b011-407b-b25f-87a1b864e242', 2, 'ai_auto', 1.00),
  ('c16fccbc-b011-407b-b25f-87a1b864e242', 1, 'ai_auto', 0.30),
  ('c16fccbc-b011-407b-b25f-87a1b864e242', 3, 'ai_auto', 0.30),
  ('c16fccbc-b011-407b-b25f-87a1b864e242', 4, 'ai_auto', 0.30),
  ('c16fccbc-b011-407b-b25f-87a1b864e242', 5, 'ai_auto', 0.30),
  ('c16fccbc-b011-407b-b25f-87a1b864e242', 6, 'ai_auto', 0.30),
  ('c16fccbc-b011-407b-b25f-87a1b864e242', 7, 'ai_auto', 0.30),
  ('c16fccbc-b011-407b-b25f-87a1b864e242', 8, 'ai_auto', 0.30),
  ('c16fccbc-b011-407b-b25f-87a1b864e242', 352, 'ai_auto', 0.30),
  ('c16fccbc-b011-407b-b25f-87a1b864e242', 353, 'ai_auto', 0.30);

-- Enovis (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('dee760cd-3555-4cb9-a7d4-38217ab6a9d1', 1, 'ai_auto', 0.30),
  ('dee760cd-3555-4cb9-a7d4-38217ab6a9d1', 2, 'ai_auto', 0.30),
  ('dee760cd-3555-4cb9-a7d4-38217ab6a9d1', 3, 'ai_auto', 0.30),
  ('dee760cd-3555-4cb9-a7d4-38217ab6a9d1', 4, 'ai_auto', 0.30),
  ('dee760cd-3555-4cb9-a7d4-38217ab6a9d1', 5, 'ai_auto', 0.30),
  ('dee760cd-3555-4cb9-a7d4-38217ab6a9d1', 6, 'ai_auto', 0.30),
  ('dee760cd-3555-4cb9-a7d4-38217ab6a9d1', 7, 'ai_auto', 0.30),
  ('dee760cd-3555-4cb9-a7d4-38217ab6a9d1', 8, 'ai_auto', 0.30),
  ('dee760cd-3555-4cb9-a7d4-38217ab6a9d1', 352, 'ai_auto', 0.30),
  ('dee760cd-3555-4cb9-a7d4-38217ab6a9d1', 353, 'ai_auto', 0.30);

-- Paragon 28 (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('c33af2ac-bb1a-484c-861e-bb3769d3dc6e', 1, 'ai_auto', 0.30),
  ('c33af2ac-bb1a-484c-861e-bb3769d3dc6e', 2, 'ai_auto', 0.30),
  ('c33af2ac-bb1a-484c-861e-bb3769d3dc6e', 3, 'ai_auto', 0.30),
  ('c33af2ac-bb1a-484c-861e-bb3769d3dc6e', 4, 'ai_auto', 0.30),
  ('c33af2ac-bb1a-484c-861e-bb3769d3dc6e', 5, 'ai_auto', 0.30),
  ('c33af2ac-bb1a-484c-861e-bb3769d3dc6e', 6, 'ai_auto', 0.30),
  ('c33af2ac-bb1a-484c-861e-bb3769d3dc6e', 7, 'ai_auto', 0.30),
  ('c33af2ac-bb1a-484c-861e-bb3769d3dc6e', 8, 'ai_auto', 0.30),
  ('c33af2ac-bb1a-484c-861e-bb3769d3dc6e', 352, 'ai_auto', 0.30),
  ('c33af2ac-bb1a-484c-861e-bb3769d3dc6e', 353, 'ai_auto', 0.30);

-- Nuvera Medical (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('6a222f8c-bdf3-47f7-8edc-94bf61a557e9', 9, 'ai_auto', 0.30),
  ('6a222f8c-bdf3-47f7-8edc-94bf61a557e9', 10, 'ai_auto', 0.30),
  ('6a222f8c-bdf3-47f7-8edc-94bf61a557e9', 11, 'ai_auto', 0.30),
  ('6a222f8c-bdf3-47f7-8edc-94bf61a557e9', 12, 'ai_auto', 0.30),
  ('6a222f8c-bdf3-47f7-8edc-94bf61a557e9', 13, 'ai_auto', 0.30),
  ('6a222f8c-bdf3-47f7-8edc-94bf61a557e9', 14, 'ai_auto', 0.30),
  ('6a222f8c-bdf3-47f7-8edc-94bf61a557e9', 15, 'ai_auto', 0.30),
  ('6a222f8c-bdf3-47f7-8edc-94bf61a557e9', 361, 'ai_auto', 0.30),
  ('6a222f8c-bdf3-47f7-8edc-94bf61a557e9', 362, 'ai_auto', 0.30),
  ('6a222f8c-bdf3-47f7-8edc-94bf61a557e9', 363, 'ai_auto', 0.30);

-- Aortic Innovations (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('bebe0275-98de-4da5-a8f2-dde4a44142e4', 9, 'ai_auto', 0.30),
  ('bebe0275-98de-4da5-a8f2-dde4a44142e4', 10, 'ai_auto', 0.30),
  ('bebe0275-98de-4da5-a8f2-dde4a44142e4', 11, 'ai_auto', 0.30),
  ('bebe0275-98de-4da5-a8f2-dde4a44142e4', 12, 'ai_auto', 0.30),
  ('bebe0275-98de-4da5-a8f2-dde4a44142e4', 13, 'ai_auto', 0.30),
  ('bebe0275-98de-4da5-a8f2-dde4a44142e4', 14, 'ai_auto', 0.30),
  ('bebe0275-98de-4da5-a8f2-dde4a44142e4', 15, 'ai_auto', 0.30),
  ('bebe0275-98de-4da5-a8f2-dde4a44142e4', 361, 'ai_auto', 0.30),
  ('bebe0275-98de-4da5-a8f2-dde4a44142e4', 362, 'ai_auto', 0.30),
  ('bebe0275-98de-4da5-a8f2-dde4a44142e4', 363, 'ai_auto', 0.30);

-- Medtronic Cardiac (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('774c39cb-3ae6-423f-b553-fe12c8b46d25', 14, 'ai_auto', 0.40),
  ('774c39cb-3ae6-423f-b553-fe12c8b46d25', 12, 'ai_auto', 0.37),
  ('774c39cb-3ae6-423f-b553-fe12c8b46d25', 367, 'ai_auto', 0.37),
  ('774c39cb-3ae6-423f-b553-fe12c8b46d25', 9, 'ai_auto', 0.30),
  ('774c39cb-3ae6-423f-b553-fe12c8b46d25', 10, 'ai_auto', 0.30),
  ('774c39cb-3ae6-423f-b553-fe12c8b46d25', 11, 'ai_auto', 0.30),
  ('774c39cb-3ae6-423f-b553-fe12c8b46d25', 13, 'ai_auto', 0.30),
  ('774c39cb-3ae6-423f-b553-fe12c8b46d25', 15, 'ai_auto', 0.30),
  ('774c39cb-3ae6-423f-b553-fe12c8b46d25', 361, 'ai_auto', 0.30),
  ('774c39cb-3ae6-423f-b553-fe12c8b46d25', 362, 'ai_auto', 0.30);

-- Boston Scientific (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('1afb6222-1ec0-4c17-931a-3180999e3a2c', 9, 'ai_auto', 0.30),
  ('1afb6222-1ec0-4c17-931a-3180999e3a2c', 10, 'ai_auto', 0.30),
  ('1afb6222-1ec0-4c17-931a-3180999e3a2c', 11, 'ai_auto', 0.30),
  ('1afb6222-1ec0-4c17-931a-3180999e3a2c', 12, 'ai_auto', 0.30),
  ('1afb6222-1ec0-4c17-931a-3180999e3a2c', 13, 'ai_auto', 0.30),
  ('1afb6222-1ec0-4c17-931a-3180999e3a2c', 14, 'ai_auto', 0.30),
  ('1afb6222-1ec0-4c17-931a-3180999e3a2c', 15, 'ai_auto', 0.30),
  ('1afb6222-1ec0-4c17-931a-3180999e3a2c', 361, 'ai_auto', 0.30),
  ('1afb6222-1ec0-4c17-931a-3180999e3a2c', 362, 'ai_auto', 0.30),
  ('1afb6222-1ec0-4c17-931a-3180999e3a2c', 363, 'ai_auto', 0.30);

-- Edwards Lifesciences (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('bf397a4a-9fa9-4a38-af12-3def6678abf2', 9, 'ai_auto', 0.30),
  ('bf397a4a-9fa9-4a38-af12-3def6678abf2', 10, 'ai_auto', 0.30),
  ('bf397a4a-9fa9-4a38-af12-3def6678abf2', 11, 'ai_auto', 0.30),
  ('bf397a4a-9fa9-4a38-af12-3def6678abf2', 12, 'ai_auto', 0.30),
  ('bf397a4a-9fa9-4a38-af12-3def6678abf2', 13, 'ai_auto', 0.30),
  ('bf397a4a-9fa9-4a38-af12-3def6678abf2', 14, 'ai_auto', 0.30),
  ('bf397a4a-9fa9-4a38-af12-3def6678abf2', 15, 'ai_auto', 0.30),
  ('bf397a4a-9fa9-4a38-af12-3def6678abf2', 361, 'ai_auto', 0.30),
  ('bf397a4a-9fa9-4a38-af12-3def6678abf2', 362, 'ai_auto', 0.30),
  ('bf397a4a-9fa9-4a38-af12-3def6678abf2', 363, 'ai_auto', 0.30);

-- Abiomed (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('fbdefc55-2da0-4b14-914f-858fe481dc4d', 9, 'ai_auto', 0.30),
  ('fbdefc55-2da0-4b14-914f-858fe481dc4d', 10, 'ai_auto', 0.30),
  ('fbdefc55-2da0-4b14-914f-858fe481dc4d', 11, 'ai_auto', 0.30),
  ('fbdefc55-2da0-4b14-914f-858fe481dc4d', 12, 'ai_auto', 0.30),
  ('fbdefc55-2da0-4b14-914f-858fe481dc4d', 13, 'ai_auto', 0.30),
  ('fbdefc55-2da0-4b14-914f-858fe481dc4d', 14, 'ai_auto', 0.30),
  ('fbdefc55-2da0-4b14-914f-858fe481dc4d', 15, 'ai_auto', 0.30),
  ('fbdefc55-2da0-4b14-914f-858fe481dc4d', 361, 'ai_auto', 0.30),
  ('fbdefc55-2da0-4b14-914f-858fe481dc4d', 362, 'ai_auto', 0.30),
  ('fbdefc55-2da0-4b14-914f-858fe481dc4d', 363, 'ai_auto', 0.30);

-- LivaNova (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('dbc8503c-b841-4db1-95c3-6a450ef9bd73', 9, 'ai_auto', 0.30),
  ('dbc8503c-b841-4db1-95c3-6a450ef9bd73', 10, 'ai_auto', 0.30),
  ('dbc8503c-b841-4db1-95c3-6a450ef9bd73', 11, 'ai_auto', 0.30),
  ('dbc8503c-b841-4db1-95c3-6a450ef9bd73', 12, 'ai_auto', 0.30),
  ('dbc8503c-b841-4db1-95c3-6a450ef9bd73', 13, 'ai_auto', 0.30),
  ('dbc8503c-b841-4db1-95c3-6a450ef9bd73', 14, 'ai_auto', 0.30),
  ('dbc8503c-b841-4db1-95c3-6a450ef9bd73', 15, 'ai_auto', 0.30),
  ('dbc8503c-b841-4db1-95c3-6a450ef9bd73', 361, 'ai_auto', 0.30),
  ('dbc8503c-b841-4db1-95c3-6a450ef9bd73', 362, 'ai_auto', 0.30),
  ('dbc8503c-b841-4db1-95c3-6a450ef9bd73', 363, 'ai_auto', 0.30);

-- Spectranetics (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('11bb1f84-b9d5-483c-80a2-dfdaed0f4f01', 9, 'ai_auto', 0.30),
  ('11bb1f84-b9d5-483c-80a2-dfdaed0f4f01', 10, 'ai_auto', 0.30),
  ('11bb1f84-b9d5-483c-80a2-dfdaed0f4f01', 11, 'ai_auto', 0.30),
  ('11bb1f84-b9d5-483c-80a2-dfdaed0f4f01', 12, 'ai_auto', 0.30),
  ('11bb1f84-b9d5-483c-80a2-dfdaed0f4f01', 13, 'ai_auto', 0.30),
  ('11bb1f84-b9d5-483c-80a2-dfdaed0f4f01', 14, 'ai_auto', 0.30),
  ('11bb1f84-b9d5-483c-80a2-dfdaed0f4f01', 15, 'ai_auto', 0.30),
  ('11bb1f84-b9d5-483c-80a2-dfdaed0f4f01', 361, 'ai_auto', 0.30),
  ('11bb1f84-b9d5-483c-80a2-dfdaed0f4f01', 362, 'ai_auto', 0.30),
  ('11bb1f84-b9d5-483c-80a2-dfdaed0f4f01', 363, 'ai_auto', 0.30);

-- AtriCure (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('5f0da473-dfb8-47ea-9c42-6498e8922fcb', 9, 'ai_auto', 0.30),
  ('5f0da473-dfb8-47ea-9c42-6498e8922fcb', 10, 'ai_auto', 0.30),
  ('5f0da473-dfb8-47ea-9c42-6498e8922fcb', 11, 'ai_auto', 0.30),
  ('5f0da473-dfb8-47ea-9c42-6498e8922fcb', 12, 'ai_auto', 0.30),
  ('5f0da473-dfb8-47ea-9c42-6498e8922fcb', 13, 'ai_auto', 0.30),
  ('5f0da473-dfb8-47ea-9c42-6498e8922fcb', 14, 'ai_auto', 0.30),
  ('5f0da473-dfb8-47ea-9c42-6498e8922fcb', 15, 'ai_auto', 0.30),
  ('5f0da473-dfb8-47ea-9c42-6498e8922fcb', 361, 'ai_auto', 0.30),
  ('5f0da473-dfb8-47ea-9c42-6498e8922fcb', 362, 'ai_auto', 0.30),
  ('5f0da473-dfb8-47ea-9c42-6498e8922fcb', 363, 'ai_auto', 0.30);

-- Cardiovascular Systems (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('62539040-2b60-4d4b-a835-87dc38671cbb', 13, 'ai_auto', 1.00),
  ('62539040-2b60-4d4b-a835-87dc38671cbb', 362, 'ai_auto', 0.40),
  ('62539040-2b60-4d4b-a835-87dc38671cbb', 367, 'ai_auto', 0.37),
  ('62539040-2b60-4d4b-a835-87dc38671cbb', 9, 'ai_auto', 0.30),
  ('62539040-2b60-4d4b-a835-87dc38671cbb', 10, 'ai_auto', 0.30),
  ('62539040-2b60-4d4b-a835-87dc38671cbb', 11, 'ai_auto', 0.30),
  ('62539040-2b60-4d4b-a835-87dc38671cbb', 12, 'ai_auto', 0.30),
  ('62539040-2b60-4d4b-a835-87dc38671cbb', 14, 'ai_auto', 0.30),
  ('62539040-2b60-4d4b-a835-87dc38671cbb', 15, 'ai_auto', 0.30),
  ('62539040-2b60-4d4b-a835-87dc38671cbb', 361, 'ai_auto', 0.30);

-- Penumbra (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('9513b556-e755-4372-b1ee-80c37c3be647', 9, 'ai_auto', 0.30),
  ('9513b556-e755-4372-b1ee-80c37c3be647', 10, 'ai_auto', 0.30),
  ('9513b556-e755-4372-b1ee-80c37c3be647', 11, 'ai_auto', 0.30),
  ('9513b556-e755-4372-b1ee-80c37c3be647', 12, 'ai_auto', 0.30),
  ('9513b556-e755-4372-b1ee-80c37c3be647', 13, 'ai_auto', 0.30),
  ('9513b556-e755-4372-b1ee-80c37c3be647', 14, 'ai_auto', 0.30),
  ('9513b556-e755-4372-b1ee-80c37c3be647', 15, 'ai_auto', 0.30),
  ('9513b556-e755-4372-b1ee-80c37c3be647', 361, 'ai_auto', 0.30),
  ('9513b556-e755-4372-b1ee-80c37c3be647', 362, 'ai_auto', 0.30),
  ('9513b556-e755-4372-b1ee-80c37c3be647', 363, 'ai_auto', 0.30);

-- Merit Medical (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('5de688f4-ff07-4ffc-9f54-c0535d45edf0', 9, 'ai_auto', 0.30),
  ('5de688f4-ff07-4ffc-9f54-c0535d45edf0', 10, 'ai_auto', 0.30),
  ('5de688f4-ff07-4ffc-9f54-c0535d45edf0', 11, 'ai_auto', 0.30),
  ('5de688f4-ff07-4ffc-9f54-c0535d45edf0', 12, 'ai_auto', 0.30),
  ('5de688f4-ff07-4ffc-9f54-c0535d45edf0', 13, 'ai_auto', 0.30),
  ('5de688f4-ff07-4ffc-9f54-c0535d45edf0', 14, 'ai_auto', 0.30),
  ('5de688f4-ff07-4ffc-9f54-c0535d45edf0', 15, 'ai_auto', 0.30),
  ('5de688f4-ff07-4ffc-9f54-c0535d45edf0', 361, 'ai_auto', 0.30),
  ('5de688f4-ff07-4ffc-9f54-c0535d45edf0', 362, 'ai_auto', 0.30),
  ('5de688f4-ff07-4ffc-9f54-c0535d45edf0', 363, 'ai_auto', 0.30);

-- Teleflex (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('162bb7f4-3e3e-4a57-b6e9-3ce60c158853', 9, 'ai_auto', 0.30),
  ('162bb7f4-3e3e-4a57-b6e9-3ce60c158853', 10, 'ai_auto', 0.30),
  ('162bb7f4-3e3e-4a57-b6e9-3ce60c158853', 11, 'ai_auto', 0.30),
  ('162bb7f4-3e3e-4a57-b6e9-3ce60c158853', 12, 'ai_auto', 0.30),
  ('162bb7f4-3e3e-4a57-b6e9-3ce60c158853', 13, 'ai_auto', 0.30),
  ('162bb7f4-3e3e-4a57-b6e9-3ce60c158853', 14, 'ai_auto', 0.30),
  ('162bb7f4-3e3e-4a57-b6e9-3ce60c158853', 15, 'ai_auto', 0.30),
  ('162bb7f4-3e3e-4a57-b6e9-3ce60c158853', 361, 'ai_auto', 0.30),
  ('162bb7f4-3e3e-4a57-b6e9-3ce60c158853', 362, 'ai_auto', 0.30),
  ('162bb7f4-3e3e-4a57-b6e9-3ce60c158853', 363, 'ai_auto', 0.30);

-- AngioDynamics (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('befa85b8-4b85-4f7f-ad87-ef40f10a03df', 9, 'ai_auto', 0.30),
  ('befa85b8-4b85-4f7f-ad87-ef40f10a03df', 10, 'ai_auto', 0.30),
  ('befa85b8-4b85-4f7f-ad87-ef40f10a03df', 11, 'ai_auto', 0.30),
  ('befa85b8-4b85-4f7f-ad87-ef40f10a03df', 12, 'ai_auto', 0.30),
  ('befa85b8-4b85-4f7f-ad87-ef40f10a03df', 13, 'ai_auto', 0.30),
  ('befa85b8-4b85-4f7f-ad87-ef40f10a03df', 14, 'ai_auto', 0.30),
  ('befa85b8-4b85-4f7f-ad87-ef40f10a03df', 15, 'ai_auto', 0.30),
  ('befa85b8-4b85-4f7f-ad87-ef40f10a03df', 361, 'ai_auto', 0.30),
  ('befa85b8-4b85-4f7f-ad87-ef40f10a03df', 362, 'ai_auto', 0.30),
  ('befa85b8-4b85-4f7f-ad87-ef40f10a03df', 363, 'ai_auto', 0.30);

-- Cook Medical (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('7543a76f-e161-4260-8e70-df0ed2a34772', 9, 'ai_auto', 0.30),
  ('7543a76f-e161-4260-8e70-df0ed2a34772', 10, 'ai_auto', 0.30),
  ('7543a76f-e161-4260-8e70-df0ed2a34772', 11, 'ai_auto', 0.30),
  ('7543a76f-e161-4260-8e70-df0ed2a34772', 12, 'ai_auto', 0.30),
  ('7543a76f-e161-4260-8e70-df0ed2a34772', 13, 'ai_auto', 0.30),
  ('7543a76f-e161-4260-8e70-df0ed2a34772', 14, 'ai_auto', 0.30),
  ('7543a76f-e161-4260-8e70-df0ed2a34772', 15, 'ai_auto', 0.30),
  ('7543a76f-e161-4260-8e70-df0ed2a34772', 361, 'ai_auto', 0.30),
  ('7543a76f-e161-4260-8e70-df0ed2a34772', 362, 'ai_auto', 0.30),
  ('7543a76f-e161-4260-8e70-df0ed2a34772', 363, 'ai_auto', 0.30);

-- Terumo (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('a598854f-1021-478d-b2b9-9d7daee5c9f9', 9, 'ai_auto', 0.30),
  ('a598854f-1021-478d-b2b9-9d7daee5c9f9', 10, 'ai_auto', 0.30),
  ('a598854f-1021-478d-b2b9-9d7daee5c9f9', 11, 'ai_auto', 0.30),
  ('a598854f-1021-478d-b2b9-9d7daee5c9f9', 12, 'ai_auto', 0.30),
  ('a598854f-1021-478d-b2b9-9d7daee5c9f9', 13, 'ai_auto', 0.30),
  ('a598854f-1021-478d-b2b9-9d7daee5c9f9', 14, 'ai_auto', 0.30),
  ('a598854f-1021-478d-b2b9-9d7daee5c9f9', 15, 'ai_auto', 0.30),
  ('a598854f-1021-478d-b2b9-9d7daee5c9f9', 361, 'ai_auto', 0.30),
  ('a598854f-1021-478d-b2b9-9d7daee5c9f9', 362, 'ai_auto', 0.30),
  ('a598854f-1021-478d-b2b9-9d7daee5c9f9', 363, 'ai_auto', 0.30);

-- Biotronik (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('34062997-82b3-4002-96c7-97ade2850c13', 9, 'ai_auto', 0.30),
  ('34062997-82b3-4002-96c7-97ade2850c13', 10, 'ai_auto', 0.30),
  ('34062997-82b3-4002-96c7-97ade2850c13', 11, 'ai_auto', 0.30),
  ('34062997-82b3-4002-96c7-97ade2850c13', 12, 'ai_auto', 0.30),
  ('34062997-82b3-4002-96c7-97ade2850c13', 13, 'ai_auto', 0.30),
  ('34062997-82b3-4002-96c7-97ade2850c13', 14, 'ai_auto', 0.30),
  ('34062997-82b3-4002-96c7-97ade2850c13', 15, 'ai_auto', 0.30),
  ('34062997-82b3-4002-96c7-97ade2850c13', 361, 'ai_auto', 0.30),
  ('34062997-82b3-4002-96c7-97ade2850c13', 362, 'ai_auto', 0.30),
  ('34062997-82b3-4002-96c7-97ade2850c13', 363, 'ai_auto', 0.30);

-- MicroPort (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('b5d66ed0-84de-4bf0-adb6-3a4106a9bb5c', 9, 'ai_auto', 0.30),
  ('b5d66ed0-84de-4bf0-adb6-3a4106a9bb5c', 10, 'ai_auto', 0.30),
  ('b5d66ed0-84de-4bf0-adb6-3a4106a9bb5c', 11, 'ai_auto', 0.30),
  ('b5d66ed0-84de-4bf0-adb6-3a4106a9bb5c', 12, 'ai_auto', 0.30),
  ('b5d66ed0-84de-4bf0-adb6-3a4106a9bb5c', 13, 'ai_auto', 0.30),
  ('b5d66ed0-84de-4bf0-adb6-3a4106a9bb5c', 14, 'ai_auto', 0.30),
  ('b5d66ed0-84de-4bf0-adb6-3a4106a9bb5c', 15, 'ai_auto', 0.30),
  ('b5d66ed0-84de-4bf0-adb6-3a4106a9bb5c', 361, 'ai_auto', 0.30),
  ('b5d66ed0-84de-4bf0-adb6-3a4106a9bb5c', 362, 'ai_auto', 0.30),
  ('b5d66ed0-84de-4bf0-adb6-3a4106a9bb5c', 363, 'ai_auto', 0.30);

-- Getinge (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('5fcad0df-c3cd-4922-9395-12b57b01b84d', 9, 'ai_auto', 0.30),
  ('5fcad0df-c3cd-4922-9395-12b57b01b84d', 10, 'ai_auto', 0.30),
  ('5fcad0df-c3cd-4922-9395-12b57b01b84d', 11, 'ai_auto', 0.30),
  ('5fcad0df-c3cd-4922-9395-12b57b01b84d', 12, 'ai_auto', 0.30),
  ('5fcad0df-c3cd-4922-9395-12b57b01b84d', 13, 'ai_auto', 0.30),
  ('5fcad0df-c3cd-4922-9395-12b57b01b84d', 14, 'ai_auto', 0.30),
  ('5fcad0df-c3cd-4922-9395-12b57b01b84d', 15, 'ai_auto', 0.30),
  ('5fcad0df-c3cd-4922-9395-12b57b01b84d', 361, 'ai_auto', 0.30),
  ('5fcad0df-c3cd-4922-9395-12b57b01b84d', 362, 'ai_auto', 0.30),
  ('5fcad0df-c3cd-4922-9395-12b57b01b84d', 363, 'ai_auto', 0.30);

-- LeMaitre Vascular (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('0e9280bc-e261-48fb-b718-8a380ef1267d', 13, 'ai_auto', 1.00),
  ('0e9280bc-e261-48fb-b718-8a380ef1267d', 9, 'ai_auto', 0.30),
  ('0e9280bc-e261-48fb-b718-8a380ef1267d', 10, 'ai_auto', 0.30),
  ('0e9280bc-e261-48fb-b718-8a380ef1267d', 11, 'ai_auto', 0.30),
  ('0e9280bc-e261-48fb-b718-8a380ef1267d', 12, 'ai_auto', 0.30),
  ('0e9280bc-e261-48fb-b718-8a380ef1267d', 14, 'ai_auto', 0.30),
  ('0e9280bc-e261-48fb-b718-8a380ef1267d', 15, 'ai_auto', 0.30),
  ('0e9280bc-e261-48fb-b718-8a380ef1267d', 361, 'ai_auto', 0.30),
  ('0e9280bc-e261-48fb-b718-8a380ef1267d', 362, 'ai_auto', 0.30),
  ('0e9280bc-e261-48fb-b718-8a380ef1267d', 363, 'ai_auto', 0.30);

-- CryoLife (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('164b1ab0-1929-47b9-8dd9-a222ed20e545', 9, 'ai_auto', 0.30),
  ('164b1ab0-1929-47b9-8dd9-a222ed20e545', 10, 'ai_auto', 0.30),
  ('164b1ab0-1929-47b9-8dd9-a222ed20e545', 11, 'ai_auto', 0.30),
  ('164b1ab0-1929-47b9-8dd9-a222ed20e545', 12, 'ai_auto', 0.30),
  ('164b1ab0-1929-47b9-8dd9-a222ed20e545', 13, 'ai_auto', 0.30),
  ('164b1ab0-1929-47b9-8dd9-a222ed20e545', 14, 'ai_auto', 0.30),
  ('164b1ab0-1929-47b9-8dd9-a222ed20e545', 15, 'ai_auto', 0.30),
  ('164b1ab0-1929-47b9-8dd9-a222ed20e545', 361, 'ai_auto', 0.30),
  ('164b1ab0-1929-47b9-8dd9-a222ed20e545', 362, 'ai_auto', 0.30),
  ('164b1ab0-1929-47b9-8dd9-a222ed20e545', 363, 'ai_auto', 0.30);

-- Shockwave Medical (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('76996d10-e720-4037-8b9b-935da8a699d3', 9, 'ai_auto', 0.30),
  ('76996d10-e720-4037-8b9b-935da8a699d3', 10, 'ai_auto', 0.30),
  ('76996d10-e720-4037-8b9b-935da8a699d3', 11, 'ai_auto', 0.30),
  ('76996d10-e720-4037-8b9b-935da8a699d3', 12, 'ai_auto', 0.30),
  ('76996d10-e720-4037-8b9b-935da8a699d3', 13, 'ai_auto', 0.30),
  ('76996d10-e720-4037-8b9b-935da8a699d3', 14, 'ai_auto', 0.30),
  ('76996d10-e720-4037-8b9b-935da8a699d3', 15, 'ai_auto', 0.30),
  ('76996d10-e720-4037-8b9b-935da8a699d3', 361, 'ai_auto', 0.30),
  ('76996d10-e720-4037-8b9b-935da8a699d3', 362, 'ai_auto', 0.30),
  ('76996d10-e720-4037-8b9b-935da8a699d3', 363, 'ai_auto', 0.30);

-- Acutus Medical (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('ee6878f7-8f25-471d-a8ad-23151dda908d', 9, 'ai_auto', 0.30),
  ('ee6878f7-8f25-471d-a8ad-23151dda908d', 10, 'ai_auto', 0.30),
  ('ee6878f7-8f25-471d-a8ad-23151dda908d', 11, 'ai_auto', 0.30),
  ('ee6878f7-8f25-471d-a8ad-23151dda908d', 12, 'ai_auto', 0.30),
  ('ee6878f7-8f25-471d-a8ad-23151dda908d', 13, 'ai_auto', 0.30),
  ('ee6878f7-8f25-471d-a8ad-23151dda908d', 14, 'ai_auto', 0.30),
  ('ee6878f7-8f25-471d-a8ad-23151dda908d', 15, 'ai_auto', 0.30),
  ('ee6878f7-8f25-471d-a8ad-23151dda908d', 361, 'ai_auto', 0.30),
  ('ee6878f7-8f25-471d-a8ad-23151dda908d', 362, 'ai_auto', 0.30),
  ('ee6878f7-8f25-471d-a8ad-23151dda908d', 363, 'ai_auto', 0.30);

-- W.L. Gore (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('6b78b787-0bc3-4fff-9139-da348ebd5640', 9, 'ai_auto', 0.30),
  ('6b78b787-0bc3-4fff-9139-da348ebd5640', 10, 'ai_auto', 0.30),
  ('6b78b787-0bc3-4fff-9139-da348ebd5640', 11, 'ai_auto', 0.30),
  ('6b78b787-0bc3-4fff-9139-da348ebd5640', 12, 'ai_auto', 0.30),
  ('6b78b787-0bc3-4fff-9139-da348ebd5640', 13, 'ai_auto', 0.30),
  ('6b78b787-0bc3-4fff-9139-da348ebd5640', 14, 'ai_auto', 0.30),
  ('6b78b787-0bc3-4fff-9139-da348ebd5640', 15, 'ai_auto', 0.30),
  ('6b78b787-0bc3-4fff-9139-da348ebd5640', 361, 'ai_auto', 0.30),
  ('6b78b787-0bc3-4fff-9139-da348ebd5640', 362, 'ai_auto', 0.30),
  ('6b78b787-0bc3-4fff-9139-da348ebd5640', 363, 'ai_auto', 0.30);

-- Johnson & Johnson Ottava (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('29c50529-ded6-4458-b944-e37d295dc3d6', 16, 'ai_auto', 0.30),
  ('29c50529-ded6-4458-b944-e37d295dc3d6', 17, 'ai_auto', 0.30),
  ('29c50529-ded6-4458-b944-e37d295dc3d6', 18, 'ai_auto', 0.30),
  ('29c50529-ded6-4458-b944-e37d295dc3d6', 19, 'ai_auto', 0.30),
  ('29c50529-ded6-4458-b944-e37d295dc3d6', 20, 'ai_auto', 0.30),
  ('29c50529-ded6-4458-b944-e37d295dc3d6', 21, 'ai_auto', 0.30),
  ('29c50529-ded6-4458-b944-e37d295dc3d6', 22, 'ai_auto', 0.30),
  ('29c50529-ded6-4458-b944-e37d295dc3d6', 23, 'ai_auto', 0.30),
  ('29c50529-ded6-4458-b944-e37d295dc3d6', 370, 'ai_auto', 0.30),
  ('29c50529-ded6-4458-b944-e37d295dc3d6', 371, 'ai_auto', 0.30);

-- Intuitive Surgical (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('efa92d64-3ff0-4803-98bb-22ffc99f8d90', 18, 'ai_auto', 0.40),
  ('efa92d64-3ff0-4803-98bb-22ffc99f8d90', 374, 'ai_auto', 0.40),
  ('efa92d64-3ff0-4803-98bb-22ffc99f8d90', 371, 'ai_auto', 0.37),
  ('efa92d64-3ff0-4803-98bb-22ffc99f8d90', 16, 'ai_auto', 0.30),
  ('efa92d64-3ff0-4803-98bb-22ffc99f8d90', 17, 'ai_auto', 0.30),
  ('efa92d64-3ff0-4803-98bb-22ffc99f8d90', 19, 'ai_auto', 0.30),
  ('efa92d64-3ff0-4803-98bb-22ffc99f8d90', 20, 'ai_auto', 0.30),
  ('efa92d64-3ff0-4803-98bb-22ffc99f8d90', 21, 'ai_auto', 0.30),
  ('efa92d64-3ff0-4803-98bb-22ffc99f8d90', 22, 'ai_auto', 0.30),
  ('efa92d64-3ff0-4803-98bb-22ffc99f8d90', 23, 'ai_auto', 0.30);

-- Stryker Mako (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('b66ae766-f81e-4c10-9f08-693853b046ad', 16, 'ai_auto', 0.30),
  ('b66ae766-f81e-4c10-9f08-693853b046ad', 17, 'ai_auto', 0.30),
  ('b66ae766-f81e-4c10-9f08-693853b046ad', 18, 'ai_auto', 0.30),
  ('b66ae766-f81e-4c10-9f08-693853b046ad', 19, 'ai_auto', 0.30),
  ('b66ae766-f81e-4c10-9f08-693853b046ad', 20, 'ai_auto', 0.30),
  ('b66ae766-f81e-4c10-9f08-693853b046ad', 21, 'ai_auto', 0.30),
  ('b66ae766-f81e-4c10-9f08-693853b046ad', 22, 'ai_auto', 0.30),
  ('b66ae766-f81e-4c10-9f08-693853b046ad', 23, 'ai_auto', 0.30),
  ('b66ae766-f81e-4c10-9f08-693853b046ad', 370, 'ai_auto', 0.30),
  ('b66ae766-f81e-4c10-9f08-693853b046ad', 371, 'ai_auto', 0.30);

-- Medtronic Hugo (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('6b9133b6-6523-4bd6-b4a0-fcd32c051e13', 16, 'ai_auto', 0.30),
  ('6b9133b6-6523-4bd6-b4a0-fcd32c051e13', 17, 'ai_auto', 0.30),
  ('6b9133b6-6523-4bd6-b4a0-fcd32c051e13', 18, 'ai_auto', 0.30),
  ('6b9133b6-6523-4bd6-b4a0-fcd32c051e13', 19, 'ai_auto', 0.30),
  ('6b9133b6-6523-4bd6-b4a0-fcd32c051e13', 20, 'ai_auto', 0.30),
  ('6b9133b6-6523-4bd6-b4a0-fcd32c051e13', 21, 'ai_auto', 0.30),
  ('6b9133b6-6523-4bd6-b4a0-fcd32c051e13', 22, 'ai_auto', 0.30),
  ('6b9133b6-6523-4bd6-b4a0-fcd32c051e13', 23, 'ai_auto', 0.30),
  ('6b9133b6-6523-4bd6-b4a0-fcd32c051e13', 370, 'ai_auto', 0.30),
  ('6b9133b6-6523-4bd6-b4a0-fcd32c051e13', 371, 'ai_auto', 0.30);

-- Zimmer Biomet ROSA (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('e2f258b5-1b1c-491e-a794-e513bcfd021c', 16, 'ai_auto', 0.30),
  ('e2f258b5-1b1c-491e-a794-e513bcfd021c', 17, 'ai_auto', 0.30),
  ('e2f258b5-1b1c-491e-a794-e513bcfd021c', 18, 'ai_auto', 0.30),
  ('e2f258b5-1b1c-491e-a794-e513bcfd021c', 19, 'ai_auto', 0.30),
  ('e2f258b5-1b1c-491e-a794-e513bcfd021c', 20, 'ai_auto', 0.30),
  ('e2f258b5-1b1c-491e-a794-e513bcfd021c', 21, 'ai_auto', 0.30),
  ('e2f258b5-1b1c-491e-a794-e513bcfd021c', 22, 'ai_auto', 0.30),
  ('e2f258b5-1b1c-491e-a794-e513bcfd021c', 23, 'ai_auto', 0.30),
  ('e2f258b5-1b1c-491e-a794-e513bcfd021c', 370, 'ai_auto', 0.30),
  ('e2f258b5-1b1c-491e-a794-e513bcfd021c', 371, 'ai_auto', 0.30);

-- Asensus Surgical (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('cee05a1a-929b-43f8-b7ad-69e773c35279', 18, 'ai_auto', 0.40),
  ('cee05a1a-929b-43f8-b7ad-69e773c35279', 374, 'ai_auto', 0.40),
  ('cee05a1a-929b-43f8-b7ad-69e773c35279', 371, 'ai_auto', 0.37),
  ('cee05a1a-929b-43f8-b7ad-69e773c35279', 16, 'ai_auto', 0.30),
  ('cee05a1a-929b-43f8-b7ad-69e773c35279', 17, 'ai_auto', 0.30),
  ('cee05a1a-929b-43f8-b7ad-69e773c35279', 19, 'ai_auto', 0.30),
  ('cee05a1a-929b-43f8-b7ad-69e773c35279', 20, 'ai_auto', 0.30),
  ('cee05a1a-929b-43f8-b7ad-69e773c35279', 21, 'ai_auto', 0.30),
  ('cee05a1a-929b-43f8-b7ad-69e773c35279', 22, 'ai_auto', 0.30),
  ('cee05a1a-929b-43f8-b7ad-69e773c35279', 23, 'ai_auto', 0.30);

-- CMR Surgical (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('44a9e029-337e-4657-9c8f-b7e6e62e578a', 18, 'ai_auto', 0.40),
  ('44a9e029-337e-4657-9c8f-b7e6e62e578a', 374, 'ai_auto', 0.40),
  ('44a9e029-337e-4657-9c8f-b7e6e62e578a', 371, 'ai_auto', 0.37),
  ('44a9e029-337e-4657-9c8f-b7e6e62e578a', 16, 'ai_auto', 0.30),
  ('44a9e029-337e-4657-9c8f-b7e6e62e578a', 17, 'ai_auto', 0.30),
  ('44a9e029-337e-4657-9c8f-b7e6e62e578a', 19, 'ai_auto', 0.30),
  ('44a9e029-337e-4657-9c8f-b7e6e62e578a', 20, 'ai_auto', 0.30),
  ('44a9e029-337e-4657-9c8f-b7e6e62e578a', 21, 'ai_auto', 0.30),
  ('44a9e029-337e-4657-9c8f-b7e6e62e578a', 22, 'ai_auto', 0.30),
  ('44a9e029-337e-4657-9c8f-b7e6e62e578a', 23, 'ai_auto', 0.30);

-- Vicarious Surgical (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('8b33e993-1778-409f-ac95-67d7389baa48', 18, 'ai_auto', 0.40),
  ('8b33e993-1778-409f-ac95-67d7389baa48', 374, 'ai_auto', 0.40),
  ('8b33e993-1778-409f-ac95-67d7389baa48', 371, 'ai_auto', 0.37),
  ('8b33e993-1778-409f-ac95-67d7389baa48', 16, 'ai_auto', 0.30),
  ('8b33e993-1778-409f-ac95-67d7389baa48', 17, 'ai_auto', 0.30),
  ('8b33e993-1778-409f-ac95-67d7389baa48', 19, 'ai_auto', 0.30),
  ('8b33e993-1778-409f-ac95-67d7389baa48', 20, 'ai_auto', 0.30),
  ('8b33e993-1778-409f-ac95-67d7389baa48', 21, 'ai_auto', 0.30),
  ('8b33e993-1778-409f-ac95-67d7389baa48', 22, 'ai_auto', 0.30),
  ('8b33e993-1778-409f-ac95-67d7389baa48', 23, 'ai_auto', 0.30);

-- Titan Medical (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('0d9640b5-0767-4d38-97b7-e79ffe363589', 16, 'ai_auto', 0.30),
  ('0d9640b5-0767-4d38-97b7-e79ffe363589', 17, 'ai_auto', 0.30),
  ('0d9640b5-0767-4d38-97b7-e79ffe363589', 18, 'ai_auto', 0.30),
  ('0d9640b5-0767-4d38-97b7-e79ffe363589', 19, 'ai_auto', 0.30),
  ('0d9640b5-0767-4d38-97b7-e79ffe363589', 20, 'ai_auto', 0.30),
  ('0d9640b5-0767-4d38-97b7-e79ffe363589', 21, 'ai_auto', 0.30),
  ('0d9640b5-0767-4d38-97b7-e79ffe363589', 22, 'ai_auto', 0.30),
  ('0d9640b5-0767-4d38-97b7-e79ffe363589', 23, 'ai_auto', 0.30),
  ('0d9640b5-0767-4d38-97b7-e79ffe363589', 370, 'ai_auto', 0.30),
  ('0d9640b5-0767-4d38-97b7-e79ffe363589', 371, 'ai_auto', 0.30);

-- TransEnterix (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('18ee4fa4-c551-4448-bc34-472fb03ca116', 16, 'ai_auto', 0.30),
  ('18ee4fa4-c551-4448-bc34-472fb03ca116', 17, 'ai_auto', 0.30),
  ('18ee4fa4-c551-4448-bc34-472fb03ca116', 18, 'ai_auto', 0.30),
  ('18ee4fa4-c551-4448-bc34-472fb03ca116', 19, 'ai_auto', 0.30),
  ('18ee4fa4-c551-4448-bc34-472fb03ca116', 20, 'ai_auto', 0.30),
  ('18ee4fa4-c551-4448-bc34-472fb03ca116', 21, 'ai_auto', 0.30),
  ('18ee4fa4-c551-4448-bc34-472fb03ca116', 22, 'ai_auto', 0.30),
  ('18ee4fa4-c551-4448-bc34-472fb03ca116', 23, 'ai_auto', 0.30),
  ('18ee4fa4-c551-4448-bc34-472fb03ca116', 370, 'ai_auto', 0.30),
  ('18ee4fa4-c551-4448-bc34-472fb03ca116', 371, 'ai_auto', 0.30);

-- Applied Medical (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('5d868174-611b-4776-8c89-1340b9dd161b', 16, 'ai_auto', 0.30),
  ('5d868174-611b-4776-8c89-1340b9dd161b', 17, 'ai_auto', 0.30),
  ('5d868174-611b-4776-8c89-1340b9dd161b', 18, 'ai_auto', 0.30),
  ('5d868174-611b-4776-8c89-1340b9dd161b', 19, 'ai_auto', 0.30),
  ('5d868174-611b-4776-8c89-1340b9dd161b', 20, 'ai_auto', 0.30),
  ('5d868174-611b-4776-8c89-1340b9dd161b', 21, 'ai_auto', 0.30),
  ('5d868174-611b-4776-8c89-1340b9dd161b', 22, 'ai_auto', 0.30),
  ('5d868174-611b-4776-8c89-1340b9dd161b', 23, 'ai_auto', 0.30),
  ('5d868174-611b-4776-8c89-1340b9dd161b', 370, 'ai_auto', 0.30),
  ('5d868174-611b-4776-8c89-1340b9dd161b', 371, 'ai_auto', 0.30);

-- Ethicon (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('b8604be4-b005-4fdb-b03f-4a7bbee447c3', 16, 'ai_auto', 0.30),
  ('b8604be4-b005-4fdb-b03f-4a7bbee447c3', 17, 'ai_auto', 0.30),
  ('b8604be4-b005-4fdb-b03f-4a7bbee447c3', 18, 'ai_auto', 0.30),
  ('b8604be4-b005-4fdb-b03f-4a7bbee447c3', 19, 'ai_auto', 0.30),
  ('b8604be4-b005-4fdb-b03f-4a7bbee447c3', 20, 'ai_auto', 0.30),
  ('b8604be4-b005-4fdb-b03f-4a7bbee447c3', 21, 'ai_auto', 0.30),
  ('b8604be4-b005-4fdb-b03f-4a7bbee447c3', 22, 'ai_auto', 0.30),
  ('b8604be4-b005-4fdb-b03f-4a7bbee447c3', 23, 'ai_auto', 0.30),
  ('b8604be4-b005-4fdb-b03f-4a7bbee447c3', 370, 'ai_auto', 0.30),
  ('b8604be4-b005-4fdb-b03f-4a7bbee447c3', 371, 'ai_auto', 0.30);

-- Covidien (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('0a1ee60c-e352-460c-97d9-06589a3254b3', 16, 'ai_auto', 0.30),
  ('0a1ee60c-e352-460c-97d9-06589a3254b3', 17, 'ai_auto', 0.30),
  ('0a1ee60c-e352-460c-97d9-06589a3254b3', 18, 'ai_auto', 0.30),
  ('0a1ee60c-e352-460c-97d9-06589a3254b3', 19, 'ai_auto', 0.30),
  ('0a1ee60c-e352-460c-97d9-06589a3254b3', 20, 'ai_auto', 0.30),
  ('0a1ee60c-e352-460c-97d9-06589a3254b3', 21, 'ai_auto', 0.30),
  ('0a1ee60c-e352-460c-97d9-06589a3254b3', 22, 'ai_auto', 0.30),
  ('0a1ee60c-e352-460c-97d9-06589a3254b3', 23, 'ai_auto', 0.30),
  ('0a1ee60c-e352-460c-97d9-06589a3254b3', 370, 'ai_auto', 0.30),
  ('0a1ee60c-e352-460c-97d9-06589a3254b3', 371, 'ai_auto', 0.30);

-- Olympus Surgical (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('c14da93b-29e7-4f69-b253-22360829cde4', 18, 'ai_auto', 0.40),
  ('c14da93b-29e7-4f69-b253-22360829cde4', 374, 'ai_auto', 0.40),
  ('c14da93b-29e7-4f69-b253-22360829cde4', 371, 'ai_auto', 0.37),
  ('c14da93b-29e7-4f69-b253-22360829cde4', 16, 'ai_auto', 0.30),
  ('c14da93b-29e7-4f69-b253-22360829cde4', 17, 'ai_auto', 0.30),
  ('c14da93b-29e7-4f69-b253-22360829cde4', 19, 'ai_auto', 0.30),
  ('c14da93b-29e7-4f69-b253-22360829cde4', 20, 'ai_auto', 0.30),
  ('c14da93b-29e7-4f69-b253-22360829cde4', 21, 'ai_auto', 0.30),
  ('c14da93b-29e7-4f69-b253-22360829cde4', 22, 'ai_auto', 0.30),
  ('c14da93b-29e7-4f69-b253-22360829cde4', 23, 'ai_auto', 0.30);

-- Karl Storz (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('f6828920-9998-4d82-b8d8-1c096e16eaae', 16, 'ai_auto', 0.30),
  ('f6828920-9998-4d82-b8d8-1c096e16eaae', 17, 'ai_auto', 0.30),
  ('f6828920-9998-4d82-b8d8-1c096e16eaae', 18, 'ai_auto', 0.30),
  ('f6828920-9998-4d82-b8d8-1c096e16eaae', 19, 'ai_auto', 0.30),
  ('f6828920-9998-4d82-b8d8-1c096e16eaae', 20, 'ai_auto', 0.30),
  ('f6828920-9998-4d82-b8d8-1c096e16eaae', 21, 'ai_auto', 0.30),
  ('f6828920-9998-4d82-b8d8-1c096e16eaae', 22, 'ai_auto', 0.30),
  ('f6828920-9998-4d82-b8d8-1c096e16eaae', 23, 'ai_auto', 0.30),
  ('f6828920-9998-4d82-b8d8-1c096e16eaae', 370, 'ai_auto', 0.30),
  ('f6828920-9998-4d82-b8d8-1c096e16eaae', 371, 'ai_auto', 0.30);

-- Richard Wolf (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('0ba8786e-6c25-42f1-83f5-39feaeafc3dd', 16, 'ai_auto', 0.30),
  ('0ba8786e-6c25-42f1-83f5-39feaeafc3dd', 17, 'ai_auto', 0.30),
  ('0ba8786e-6c25-42f1-83f5-39feaeafc3dd', 18, 'ai_auto', 0.30),
  ('0ba8786e-6c25-42f1-83f5-39feaeafc3dd', 19, 'ai_auto', 0.30),
  ('0ba8786e-6c25-42f1-83f5-39feaeafc3dd', 20, 'ai_auto', 0.30),
  ('0ba8786e-6c25-42f1-83f5-39feaeafc3dd', 21, 'ai_auto', 0.30),
  ('0ba8786e-6c25-42f1-83f5-39feaeafc3dd', 22, 'ai_auto', 0.30),
  ('0ba8786e-6c25-42f1-83f5-39feaeafc3dd', 23, 'ai_auto', 0.30),
  ('0ba8786e-6c25-42f1-83f5-39feaeafc3dd', 370, 'ai_auto', 0.30),
  ('0ba8786e-6c25-42f1-83f5-39feaeafc3dd', 371, 'ai_auto', 0.30);

-- ConMed Surgical (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('68532703-995c-4a2c-9aef-b062d20e1fad', 18, 'ai_auto', 0.40),
  ('68532703-995c-4a2c-9aef-b062d20e1fad', 374, 'ai_auto', 0.40),
  ('68532703-995c-4a2c-9aef-b062d20e1fad', 371, 'ai_auto', 0.37),
  ('68532703-995c-4a2c-9aef-b062d20e1fad', 16, 'ai_auto', 0.30),
  ('68532703-995c-4a2c-9aef-b062d20e1fad', 17, 'ai_auto', 0.30),
  ('68532703-995c-4a2c-9aef-b062d20e1fad', 19, 'ai_auto', 0.30),
  ('68532703-995c-4a2c-9aef-b062d20e1fad', 20, 'ai_auto', 0.30),
  ('68532703-995c-4a2c-9aef-b062d20e1fad', 21, 'ai_auto', 0.30),
  ('68532703-995c-4a2c-9aef-b062d20e1fad', 22, 'ai_auto', 0.30),
  ('68532703-995c-4a2c-9aef-b062d20e1fad', 23, 'ai_auto', 0.30);

-- Teleflex Surgical (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('51f92b2f-ab14-478c-9c3a-977117e41dce', 18, 'ai_auto', 0.40),
  ('51f92b2f-ab14-478c-9c3a-977117e41dce', 374, 'ai_auto', 0.40),
  ('51f92b2f-ab14-478c-9c3a-977117e41dce', 371, 'ai_auto', 0.37),
  ('51f92b2f-ab14-478c-9c3a-977117e41dce', 16, 'ai_auto', 0.30),
  ('51f92b2f-ab14-478c-9c3a-977117e41dce', 17, 'ai_auto', 0.30),
  ('51f92b2f-ab14-478c-9c3a-977117e41dce', 19, 'ai_auto', 0.30),
  ('51f92b2f-ab14-478c-9c3a-977117e41dce', 20, 'ai_auto', 0.30),
  ('51f92b2f-ab14-478c-9c3a-977117e41dce', 21, 'ai_auto', 0.30),
  ('51f92b2f-ab14-478c-9c3a-977117e41dce', 22, 'ai_auto', 0.30),
  ('51f92b2f-ab14-478c-9c3a-977117e41dce', 23, 'ai_auto', 0.30);

-- Surgical Specialties (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('a20a1a63-e7ff-4768-b4db-b0efedee43f2', 18, 'ai_auto', 0.40),
  ('a20a1a63-e7ff-4768-b4db-b0efedee43f2', 374, 'ai_auto', 0.40),
  ('a20a1a63-e7ff-4768-b4db-b0efedee43f2', 371, 'ai_auto', 0.37),
  ('a20a1a63-e7ff-4768-b4db-b0efedee43f2', 16, 'ai_auto', 0.30),
  ('a20a1a63-e7ff-4768-b4db-b0efedee43f2', 17, 'ai_auto', 0.30),
  ('a20a1a63-e7ff-4768-b4db-b0efedee43f2', 19, 'ai_auto', 0.30),
  ('a20a1a63-e7ff-4768-b4db-b0efedee43f2', 20, 'ai_auto', 0.30),
  ('a20a1a63-e7ff-4768-b4db-b0efedee43f2', 21, 'ai_auto', 0.30),
  ('a20a1a63-e7ff-4768-b4db-b0efedee43f2', 22, 'ai_auto', 0.30),
  ('a20a1a63-e7ff-4768-b4db-b0efedee43f2', 23, 'ai_auto', 0.30);

-- Microline Surgical (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('62d9a9ac-98cb-451f-b1a9-4b18f669a4d0', 18, 'ai_auto', 0.40),
  ('62d9a9ac-98cb-451f-b1a9-4b18f669a4d0', 374, 'ai_auto', 0.40),
  ('62d9a9ac-98cb-451f-b1a9-4b18f669a4d0', 371, 'ai_auto', 0.37),
  ('62d9a9ac-98cb-451f-b1a9-4b18f669a4d0', 16, 'ai_auto', 0.30),
  ('62d9a9ac-98cb-451f-b1a9-4b18f669a4d0', 17, 'ai_auto', 0.30),
  ('62d9a9ac-98cb-451f-b1a9-4b18f669a4d0', 19, 'ai_auto', 0.30),
  ('62d9a9ac-98cb-451f-b1a9-4b18f669a4d0', 20, 'ai_auto', 0.30),
  ('62d9a9ac-98cb-451f-b1a9-4b18f669a4d0', 21, 'ai_auto', 0.30),
  ('62d9a9ac-98cb-451f-b1a9-4b18f669a4d0', 22, 'ai_auto', 0.30),
  ('62d9a9ac-98cb-451f-b1a9-4b18f669a4d0', 23, 'ai_auto', 0.30);

-- Ortho Clinical Diagnostics (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('029f74f3-74b7-4a19-8b5b-77f1da08460e', 81, 'ai_auto', 0.30),
  ('029f74f3-74b7-4a19-8b5b-77f1da08460e', 82, 'ai_auto', 0.30),
  ('029f74f3-74b7-4a19-8b5b-77f1da08460e', 83, 'ai_auto', 0.30),
  ('029f74f3-74b7-4a19-8b5b-77f1da08460e', 84, 'ai_auto', 0.30),
  ('029f74f3-74b7-4a19-8b5b-77f1da08460e', 85, 'ai_auto', 0.30),
  ('029f74f3-74b7-4a19-8b5b-77f1da08460e', 86, 'ai_auto', 0.30),
  ('029f74f3-74b7-4a19-8b5b-77f1da08460e', 87, 'ai_auto', 0.30),
  ('029f74f3-74b7-4a19-8b5b-77f1da08460e', 432, 'ai_auto', 0.30),
  ('029f74f3-74b7-4a19-8b5b-77f1da08460e', 433, 'ai_auto', 0.30),
  ('029f74f3-74b7-4a19-8b5b-77f1da08460e', 434, 'ai_auto', 0.30);

-- GE Healthcare (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('8b15e3e2-87b4-4a70-9a4c-9a02f71ff08c', 436, 'ai_auto', 0.37),
  ('8b15e3e2-87b4-4a70-9a4c-9a02f71ff08c', 81, 'ai_auto', 0.30),
  ('8b15e3e2-87b4-4a70-9a4c-9a02f71ff08c', 82, 'ai_auto', 0.30),
  ('8b15e3e2-87b4-4a70-9a4c-9a02f71ff08c', 83, 'ai_auto', 0.30),
  ('8b15e3e2-87b4-4a70-9a4c-9a02f71ff08c', 84, 'ai_auto', 0.30),
  ('8b15e3e2-87b4-4a70-9a4c-9a02f71ff08c', 85, 'ai_auto', 0.30),
  ('8b15e3e2-87b4-4a70-9a4c-9a02f71ff08c', 86, 'ai_auto', 0.30),
  ('8b15e3e2-87b4-4a70-9a4c-9a02f71ff08c', 87, 'ai_auto', 0.30),
  ('8b15e3e2-87b4-4a70-9a4c-9a02f71ff08c', 432, 'ai_auto', 0.30),
  ('8b15e3e2-87b4-4a70-9a4c-9a02f71ff08c', 433, 'ai_auto', 0.30);

-- Siemens Healthineers (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('edd8115b-bb18-4b5d-a7bc-48f42e303383', 81, 'ai_auto', 0.30),
  ('edd8115b-bb18-4b5d-a7bc-48f42e303383', 82, 'ai_auto', 0.30),
  ('edd8115b-bb18-4b5d-a7bc-48f42e303383', 83, 'ai_auto', 0.30),
  ('edd8115b-bb18-4b5d-a7bc-48f42e303383', 84, 'ai_auto', 0.30),
  ('edd8115b-bb18-4b5d-a7bc-48f42e303383', 85, 'ai_auto', 0.30),
  ('edd8115b-bb18-4b5d-a7bc-48f42e303383', 86, 'ai_auto', 0.30),
  ('edd8115b-bb18-4b5d-a7bc-48f42e303383', 87, 'ai_auto', 0.30),
  ('edd8115b-bb18-4b5d-a7bc-48f42e303383', 432, 'ai_auto', 0.30),
  ('edd8115b-bb18-4b5d-a7bc-48f42e303383', 433, 'ai_auto', 0.30),
  ('edd8115b-bb18-4b5d-a7bc-48f42e303383', 434, 'ai_auto', 0.30);

-- Philips Healthcare (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('b6449a99-40a4-40b2-9d1f-ad398c37d57c', 436, 'ai_auto', 0.37),
  ('b6449a99-40a4-40b2-9d1f-ad398c37d57c', 81, 'ai_auto', 0.30),
  ('b6449a99-40a4-40b2-9d1f-ad398c37d57c', 82, 'ai_auto', 0.30),
  ('b6449a99-40a4-40b2-9d1f-ad398c37d57c', 83, 'ai_auto', 0.30),
  ('b6449a99-40a4-40b2-9d1f-ad398c37d57c', 84, 'ai_auto', 0.30),
  ('b6449a99-40a4-40b2-9d1f-ad398c37d57c', 85, 'ai_auto', 0.30),
  ('b6449a99-40a4-40b2-9d1f-ad398c37d57c', 86, 'ai_auto', 0.30),
  ('b6449a99-40a4-40b2-9d1f-ad398c37d57c', 87, 'ai_auto', 0.30),
  ('b6449a99-40a4-40b2-9d1f-ad398c37d57c', 432, 'ai_auto', 0.30),
  ('b6449a99-40a4-40b2-9d1f-ad398c37d57c', 433, 'ai_auto', 0.30);

-- Hologic (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('0c37dbc6-847e-4cd9-9db1-4abd7b911c15', 81, 'ai_auto', 0.30),
  ('0c37dbc6-847e-4cd9-9db1-4abd7b911c15', 82, 'ai_auto', 0.30),
  ('0c37dbc6-847e-4cd9-9db1-4abd7b911c15', 83, 'ai_auto', 0.30),
  ('0c37dbc6-847e-4cd9-9db1-4abd7b911c15', 84, 'ai_auto', 0.30),
  ('0c37dbc6-847e-4cd9-9db1-4abd7b911c15', 85, 'ai_auto', 0.30),
  ('0c37dbc6-847e-4cd9-9db1-4abd7b911c15', 86, 'ai_auto', 0.30),
  ('0c37dbc6-847e-4cd9-9db1-4abd7b911c15', 87, 'ai_auto', 0.30),
  ('0c37dbc6-847e-4cd9-9db1-4abd7b911c15', 432, 'ai_auto', 0.30),
  ('0c37dbc6-847e-4cd9-9db1-4abd7b911c15', 433, 'ai_auto', 0.30),
  ('0c37dbc6-847e-4cd9-9db1-4abd7b911c15', 434, 'ai_auto', 0.30);

-- Canon Medical (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('3e262010-8e99-434e-ab41-dcd032d1bbc4', 81, 'ai_auto', 0.30),
  ('3e262010-8e99-434e-ab41-dcd032d1bbc4', 82, 'ai_auto', 0.30),
  ('3e262010-8e99-434e-ab41-dcd032d1bbc4', 83, 'ai_auto', 0.30),
  ('3e262010-8e99-434e-ab41-dcd032d1bbc4', 84, 'ai_auto', 0.30),
  ('3e262010-8e99-434e-ab41-dcd032d1bbc4', 85, 'ai_auto', 0.30),
  ('3e262010-8e99-434e-ab41-dcd032d1bbc4', 86, 'ai_auto', 0.30),
  ('3e262010-8e99-434e-ab41-dcd032d1bbc4', 87, 'ai_auto', 0.30),
  ('3e262010-8e99-434e-ab41-dcd032d1bbc4', 432, 'ai_auto', 0.30),
  ('3e262010-8e99-434e-ab41-dcd032d1bbc4', 433, 'ai_auto', 0.30),
  ('3e262010-8e99-434e-ab41-dcd032d1bbc4', 434, 'ai_auto', 0.30);

-- Fujifilm Medical (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('8123d074-0c5d-48ff-aa2b-3a98eac7781e', 81, 'ai_auto', 0.30),
  ('8123d074-0c5d-48ff-aa2b-3a98eac7781e', 82, 'ai_auto', 0.30),
  ('8123d074-0c5d-48ff-aa2b-3a98eac7781e', 83, 'ai_auto', 0.30),
  ('8123d074-0c5d-48ff-aa2b-3a98eac7781e', 84, 'ai_auto', 0.30),
  ('8123d074-0c5d-48ff-aa2b-3a98eac7781e', 85, 'ai_auto', 0.30),
  ('8123d074-0c5d-48ff-aa2b-3a98eac7781e', 86, 'ai_auto', 0.30),
  ('8123d074-0c5d-48ff-aa2b-3a98eac7781e', 87, 'ai_auto', 0.30),
  ('8123d074-0c5d-48ff-aa2b-3a98eac7781e', 432, 'ai_auto', 0.30),
  ('8123d074-0c5d-48ff-aa2b-3a98eac7781e', 433, 'ai_auto', 0.30),
  ('8123d074-0c5d-48ff-aa2b-3a98eac7781e', 434, 'ai_auto', 0.30);

-- Carestream (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('7d4ff71c-56c3-4475-8bc7-1dfe8214bfda', 436, 'ai_auto', 0.37),
  ('7d4ff71c-56c3-4475-8bc7-1dfe8214bfda', 81, 'ai_auto', 0.30),
  ('7d4ff71c-56c3-4475-8bc7-1dfe8214bfda', 82, 'ai_auto', 0.30),
  ('7d4ff71c-56c3-4475-8bc7-1dfe8214bfda', 83, 'ai_auto', 0.30),
  ('7d4ff71c-56c3-4475-8bc7-1dfe8214bfda', 84, 'ai_auto', 0.30),
  ('7d4ff71c-56c3-4475-8bc7-1dfe8214bfda', 85, 'ai_auto', 0.30),
  ('7d4ff71c-56c3-4475-8bc7-1dfe8214bfda', 86, 'ai_auto', 0.30),
  ('7d4ff71c-56c3-4475-8bc7-1dfe8214bfda', 87, 'ai_auto', 0.30),
  ('7d4ff71c-56c3-4475-8bc7-1dfe8214bfda', 432, 'ai_auto', 0.30),
  ('7d4ff71c-56c3-4475-8bc7-1dfe8214bfda', 433, 'ai_auto', 0.30);

-- Mindray (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('0c23130b-276e-47e2-b191-ec41b8c83118', 83, 'ai_auto', 0.50),
  ('0c23130b-276e-47e2-b191-ec41b8c83118', 433, 'ai_auto', 0.40),
  ('0c23130b-276e-47e2-b191-ec41b8c83118', 81, 'ai_auto', 0.30),
  ('0c23130b-276e-47e2-b191-ec41b8c83118', 82, 'ai_auto', 0.30),
  ('0c23130b-276e-47e2-b191-ec41b8c83118', 84, 'ai_auto', 0.30),
  ('0c23130b-276e-47e2-b191-ec41b8c83118', 85, 'ai_auto', 0.30),
  ('0c23130b-276e-47e2-b191-ec41b8c83118', 86, 'ai_auto', 0.30),
  ('0c23130b-276e-47e2-b191-ec41b8c83118', 87, 'ai_auto', 0.30),
  ('0c23130b-276e-47e2-b191-ec41b8c83118', 432, 'ai_auto', 0.30),
  ('0c23130b-276e-47e2-b191-ec41b8c83118', 434, 'ai_auto', 0.30);

-- Samsung Medison (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('8ee7a8b3-aced-4773-8ca4-817c2f0adaa4', 81, 'ai_auto', 0.30),
  ('8ee7a8b3-aced-4773-8ca4-817c2f0adaa4', 82, 'ai_auto', 0.30),
  ('8ee7a8b3-aced-4773-8ca4-817c2f0adaa4', 83, 'ai_auto', 0.30),
  ('8ee7a8b3-aced-4773-8ca4-817c2f0adaa4', 84, 'ai_auto', 0.30),
  ('8ee7a8b3-aced-4773-8ca4-817c2f0adaa4', 85, 'ai_auto', 0.30),
  ('8ee7a8b3-aced-4773-8ca4-817c2f0adaa4', 86, 'ai_auto', 0.30),
  ('8ee7a8b3-aced-4773-8ca4-817c2f0adaa4', 87, 'ai_auto', 0.30),
  ('8ee7a8b3-aced-4773-8ca4-817c2f0adaa4', 432, 'ai_auto', 0.30),
  ('8ee7a8b3-aced-4773-8ca4-817c2f0adaa4', 433, 'ai_auto', 0.30),
  ('8ee7a8b3-aced-4773-8ca4-817c2f0adaa4', 434, 'ai_auto', 0.30);

-- Shimadzu Medical (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('7a8799be-8494-4673-a03b-0892daa9d055', 81, 'ai_auto', 0.30),
  ('7a8799be-8494-4673-a03b-0892daa9d055', 82, 'ai_auto', 0.30),
  ('7a8799be-8494-4673-a03b-0892daa9d055', 83, 'ai_auto', 0.30),
  ('7a8799be-8494-4673-a03b-0892daa9d055', 84, 'ai_auto', 0.30),
  ('7a8799be-8494-4673-a03b-0892daa9d055', 85, 'ai_auto', 0.30),
  ('7a8799be-8494-4673-a03b-0892daa9d055', 86, 'ai_auto', 0.30),
  ('7a8799be-8494-4673-a03b-0892daa9d055', 87, 'ai_auto', 0.30),
  ('7a8799be-8494-4673-a03b-0892daa9d055', 432, 'ai_auto', 0.30),
  ('7a8799be-8494-4673-a03b-0892daa9d055', 433, 'ai_auto', 0.30),
  ('7a8799be-8494-4673-a03b-0892daa9d055', 434, 'ai_auto', 0.30);

-- Roche Diagnostics (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('01b40e92-9314-4f53-afba-e5a91f4d5116', 81, 'ai_auto', 0.30),
  ('01b40e92-9314-4f53-afba-e5a91f4d5116', 82, 'ai_auto', 0.30),
  ('01b40e92-9314-4f53-afba-e5a91f4d5116', 83, 'ai_auto', 0.30),
  ('01b40e92-9314-4f53-afba-e5a91f4d5116', 84, 'ai_auto', 0.30),
  ('01b40e92-9314-4f53-afba-e5a91f4d5116', 85, 'ai_auto', 0.30),
  ('01b40e92-9314-4f53-afba-e5a91f4d5116', 86, 'ai_auto', 0.30),
  ('01b40e92-9314-4f53-afba-e5a91f4d5116', 87, 'ai_auto', 0.30),
  ('01b40e92-9314-4f53-afba-e5a91f4d5116', 432, 'ai_auto', 0.30),
  ('01b40e92-9314-4f53-afba-e5a91f4d5116', 433, 'ai_auto', 0.30),
  ('01b40e92-9314-4f53-afba-e5a91f4d5116', 434, 'ai_auto', 0.30);

-- Abbott Diagnostics (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('7842c2b2-d224-4dca-a7b1-b6967b5fd2c0', 81, 'ai_auto', 0.30),
  ('7842c2b2-d224-4dca-a7b1-b6967b5fd2c0', 82, 'ai_auto', 0.30),
  ('7842c2b2-d224-4dca-a7b1-b6967b5fd2c0', 83, 'ai_auto', 0.30),
  ('7842c2b2-d224-4dca-a7b1-b6967b5fd2c0', 84, 'ai_auto', 0.30),
  ('7842c2b2-d224-4dca-a7b1-b6967b5fd2c0', 85, 'ai_auto', 0.30),
  ('7842c2b2-d224-4dca-a7b1-b6967b5fd2c0', 86, 'ai_auto', 0.30),
  ('7842c2b2-d224-4dca-a7b1-b6967b5fd2c0', 87, 'ai_auto', 0.30),
  ('7842c2b2-d224-4dca-a7b1-b6967b5fd2c0', 432, 'ai_auto', 0.30),
  ('7842c2b2-d224-4dca-a7b1-b6967b5fd2c0', 433, 'ai_auto', 0.30),
  ('7842c2b2-d224-4dca-a7b1-b6967b5fd2c0', 434, 'ai_auto', 0.30);

-- Beckman Coulter (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('70046ae5-758d-4c6a-bb0c-85b59a9bf7bd', 81, 'ai_auto', 0.30),
  ('70046ae5-758d-4c6a-bb0c-85b59a9bf7bd', 82, 'ai_auto', 0.30),
  ('70046ae5-758d-4c6a-bb0c-85b59a9bf7bd', 83, 'ai_auto', 0.30),
  ('70046ae5-758d-4c6a-bb0c-85b59a9bf7bd', 84, 'ai_auto', 0.30),
  ('70046ae5-758d-4c6a-bb0c-85b59a9bf7bd', 85, 'ai_auto', 0.30),
  ('70046ae5-758d-4c6a-bb0c-85b59a9bf7bd', 86, 'ai_auto', 0.30),
  ('70046ae5-758d-4c6a-bb0c-85b59a9bf7bd', 87, 'ai_auto', 0.30),
  ('70046ae5-758d-4c6a-bb0c-85b59a9bf7bd', 432, 'ai_auto', 0.30),
  ('70046ae5-758d-4c6a-bb0c-85b59a9bf7bd', 433, 'ai_auto', 0.30),
  ('70046ae5-758d-4c6a-bb0c-85b59a9bf7bd', 434, 'ai_auto', 0.30);

-- bioMerieux (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('12576789-d8fd-4d0f-9d04-ff538ccb8c8a', 81, 'ai_auto', 0.30),
  ('12576789-d8fd-4d0f-9d04-ff538ccb8c8a', 82, 'ai_auto', 0.30),
  ('12576789-d8fd-4d0f-9d04-ff538ccb8c8a', 83, 'ai_auto', 0.30),
  ('12576789-d8fd-4d0f-9d04-ff538ccb8c8a', 84, 'ai_auto', 0.30),
  ('12576789-d8fd-4d0f-9d04-ff538ccb8c8a', 85, 'ai_auto', 0.30),
  ('12576789-d8fd-4d0f-9d04-ff538ccb8c8a', 86, 'ai_auto', 0.30),
  ('12576789-d8fd-4d0f-9d04-ff538ccb8c8a', 87, 'ai_auto', 0.30),
  ('12576789-d8fd-4d0f-9d04-ff538ccb8c8a', 432, 'ai_auto', 0.30),
  ('12576789-d8fd-4d0f-9d04-ff538ccb8c8a', 433, 'ai_auto', 0.30),
  ('12576789-d8fd-4d0f-9d04-ff538ccb8c8a', 434, 'ai_auto', 0.30);

-- Sysmex (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('5124a402-75c0-45e5-b75c-3a20697d8924', 81, 'ai_auto', 0.30),
  ('5124a402-75c0-45e5-b75c-3a20697d8924', 82, 'ai_auto', 0.30),
  ('5124a402-75c0-45e5-b75c-3a20697d8924', 83, 'ai_auto', 0.30),
  ('5124a402-75c0-45e5-b75c-3a20697d8924', 84, 'ai_auto', 0.30),
  ('5124a402-75c0-45e5-b75c-3a20697d8924', 85, 'ai_auto', 0.30),
  ('5124a402-75c0-45e5-b75c-3a20697d8924', 86, 'ai_auto', 0.30),
  ('5124a402-75c0-45e5-b75c-3a20697d8924', 87, 'ai_auto', 0.30),
  ('5124a402-75c0-45e5-b75c-3a20697d8924', 432, 'ai_auto', 0.30),
  ('5124a402-75c0-45e5-b75c-3a20697d8924', 433, 'ai_auto', 0.30),
  ('5124a402-75c0-45e5-b75c-3a20697d8924', 434, 'ai_auto', 0.30);

-- Quidel (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('eb20dfa4-7874-47f7-a1f4-8ffbe42d62b9', 81, 'ai_auto', 0.30),
  ('eb20dfa4-7874-47f7-a1f4-8ffbe42d62b9', 82, 'ai_auto', 0.30),
  ('eb20dfa4-7874-47f7-a1f4-8ffbe42d62b9', 83, 'ai_auto', 0.30),
  ('eb20dfa4-7874-47f7-a1f4-8ffbe42d62b9', 84, 'ai_auto', 0.30),
  ('eb20dfa4-7874-47f7-a1f4-8ffbe42d62b9', 85, 'ai_auto', 0.30),
  ('eb20dfa4-7874-47f7-a1f4-8ffbe42d62b9', 86, 'ai_auto', 0.30),
  ('eb20dfa4-7874-47f7-a1f4-8ffbe42d62b9', 87, 'ai_auto', 0.30),
  ('eb20dfa4-7874-47f7-a1f4-8ffbe42d62b9', 432, 'ai_auto', 0.30),
  ('eb20dfa4-7874-47f7-a1f4-8ffbe42d62b9', 433, 'ai_auto', 0.30),
  ('eb20dfa4-7874-47f7-a1f4-8ffbe42d62b9', 434, 'ai_auto', 0.30);

-- Cepheid (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('247fbd04-fbe6-4728-b041-1e89923ad3a1', 81, 'ai_auto', 0.30),
  ('247fbd04-fbe6-4728-b041-1e89923ad3a1', 82, 'ai_auto', 0.30),
  ('247fbd04-fbe6-4728-b041-1e89923ad3a1', 83, 'ai_auto', 0.30),
  ('247fbd04-fbe6-4728-b041-1e89923ad3a1', 84, 'ai_auto', 0.30),
  ('247fbd04-fbe6-4728-b041-1e89923ad3a1', 85, 'ai_auto', 0.30),
  ('247fbd04-fbe6-4728-b041-1e89923ad3a1', 86, 'ai_auto', 0.30),
  ('247fbd04-fbe6-4728-b041-1e89923ad3a1', 87, 'ai_auto', 0.30),
  ('247fbd04-fbe6-4728-b041-1e89923ad3a1', 432, 'ai_auto', 0.30),
  ('247fbd04-fbe6-4728-b041-1e89923ad3a1', 433, 'ai_auto', 0.30),
  ('247fbd04-fbe6-4728-b041-1e89923ad3a1', 434, 'ai_auto', 0.30);

-- Illumina (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('b60b6e2a-8de6-4a70-ac07-42732da32d89', 81, 'ai_auto', 0.30),
  ('b60b6e2a-8de6-4a70-ac07-42732da32d89', 82, 'ai_auto', 0.30),
  ('b60b6e2a-8de6-4a70-ac07-42732da32d89', 83, 'ai_auto', 0.30),
  ('b60b6e2a-8de6-4a70-ac07-42732da32d89', 84, 'ai_auto', 0.30),
  ('b60b6e2a-8de6-4a70-ac07-42732da32d89', 85, 'ai_auto', 0.30),
  ('b60b6e2a-8de6-4a70-ac07-42732da32d89', 86, 'ai_auto', 0.30),
  ('b60b6e2a-8de6-4a70-ac07-42732da32d89', 87, 'ai_auto', 0.30),
  ('b60b6e2a-8de6-4a70-ac07-42732da32d89', 432, 'ai_auto', 0.30),
  ('b60b6e2a-8de6-4a70-ac07-42732da32d89', 433, 'ai_auto', 0.30),
  ('b60b6e2a-8de6-4a70-ac07-42732da32d89', 434, 'ai_auto', 0.30);

-- Exact Sciences (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('e5266e24-a263-4467-bb91-7a0966555c51', 81, 'ai_auto', 0.30),
  ('e5266e24-a263-4467-bb91-7a0966555c51', 82, 'ai_auto', 0.30),
  ('e5266e24-a263-4467-bb91-7a0966555c51', 83, 'ai_auto', 0.30),
  ('e5266e24-a263-4467-bb91-7a0966555c51', 84, 'ai_auto', 0.30),
  ('e5266e24-a263-4467-bb91-7a0966555c51', 85, 'ai_auto', 0.30),
  ('e5266e24-a263-4467-bb91-7a0966555c51', 86, 'ai_auto', 0.30),
  ('e5266e24-a263-4467-bb91-7a0966555c51', 87, 'ai_auto', 0.30),
  ('e5266e24-a263-4467-bb91-7a0966555c51', 432, 'ai_auto', 0.30),
  ('e5266e24-a263-4467-bb91-7a0966555c51', 433, 'ai_auto', 0.30),
  ('e5266e24-a263-4467-bb91-7a0966555c51', 434, 'ai_auto', 0.30);

-- Guardant Health (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('0f689ea7-9cfa-4ba7-9ccb-026084fa5bbb', 81, 'ai_auto', 0.30),
  ('0f689ea7-9cfa-4ba7-9ccb-026084fa5bbb', 82, 'ai_auto', 0.30),
  ('0f689ea7-9cfa-4ba7-9ccb-026084fa5bbb', 83, 'ai_auto', 0.30),
  ('0f689ea7-9cfa-4ba7-9ccb-026084fa5bbb', 84, 'ai_auto', 0.30),
  ('0f689ea7-9cfa-4ba7-9ccb-026084fa5bbb', 85, 'ai_auto', 0.30),
  ('0f689ea7-9cfa-4ba7-9ccb-026084fa5bbb', 86, 'ai_auto', 0.30),
  ('0f689ea7-9cfa-4ba7-9ccb-026084fa5bbb', 87, 'ai_auto', 0.30),
  ('0f689ea7-9cfa-4ba7-9ccb-026084fa5bbb', 432, 'ai_auto', 0.30),
  ('0f689ea7-9cfa-4ba7-9ccb-026084fa5bbb', 433, 'ai_auto', 0.30),
  ('0f689ea7-9cfa-4ba7-9ccb-026084fa5bbb', 434, 'ai_auto', 0.30);

-- Lantheus (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('cb8cf500-efea-4343-a4ca-e074cfd68d9c', 81, 'ai_auto', 0.30),
  ('cb8cf500-efea-4343-a4ca-e074cfd68d9c', 82, 'ai_auto', 0.30),
  ('cb8cf500-efea-4343-a4ca-e074cfd68d9c', 83, 'ai_auto', 0.30),
  ('cb8cf500-efea-4343-a4ca-e074cfd68d9c', 84, 'ai_auto', 0.30),
  ('cb8cf500-efea-4343-a4ca-e074cfd68d9c', 85, 'ai_auto', 0.30),
  ('cb8cf500-efea-4343-a4ca-e074cfd68d9c', 86, 'ai_auto', 0.30),
  ('cb8cf500-efea-4343-a4ca-e074cfd68d9c', 87, 'ai_auto', 0.30),
  ('cb8cf500-efea-4343-a4ca-e074cfd68d9c', 432, 'ai_auto', 0.30),
  ('cb8cf500-efea-4343-a4ca-e074cfd68d9c', 433, 'ai_auto', 0.30),
  ('cb8cf500-efea-4343-a4ca-e074cfd68d9c', 434, 'ai_auto', 0.30);

-- Bracco (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('459dafd1-9362-4a86-b16a-4b57604ccbe6', 81, 'ai_auto', 0.30),
  ('459dafd1-9362-4a86-b16a-4b57604ccbe6', 82, 'ai_auto', 0.30),
  ('459dafd1-9362-4a86-b16a-4b57604ccbe6', 83, 'ai_auto', 0.30),
  ('459dafd1-9362-4a86-b16a-4b57604ccbe6', 84, 'ai_auto', 0.30),
  ('459dafd1-9362-4a86-b16a-4b57604ccbe6', 85, 'ai_auto', 0.30),
  ('459dafd1-9362-4a86-b16a-4b57604ccbe6', 86, 'ai_auto', 0.30),
  ('459dafd1-9362-4a86-b16a-4b57604ccbe6', 87, 'ai_auto', 0.30),
  ('459dafd1-9362-4a86-b16a-4b57604ccbe6', 432, 'ai_auto', 0.30),
  ('459dafd1-9362-4a86-b16a-4b57604ccbe6', 433, 'ai_auto', 0.30),
  ('459dafd1-9362-4a86-b16a-4b57604ccbe6', 434, 'ai_auto', 0.30);

-- Guerbet (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('1914dc43-ebec-4132-a7a0-310b2e1bff0a', 81, 'ai_auto', 0.30),
  ('1914dc43-ebec-4132-a7a0-310b2e1bff0a', 82, 'ai_auto', 0.30),
  ('1914dc43-ebec-4132-a7a0-310b2e1bff0a', 83, 'ai_auto', 0.30),
  ('1914dc43-ebec-4132-a7a0-310b2e1bff0a', 84, 'ai_auto', 0.30),
  ('1914dc43-ebec-4132-a7a0-310b2e1bff0a', 85, 'ai_auto', 0.30),
  ('1914dc43-ebec-4132-a7a0-310b2e1bff0a', 86, 'ai_auto', 0.30),
  ('1914dc43-ebec-4132-a7a0-310b2e1bff0a', 87, 'ai_auto', 0.30),
  ('1914dc43-ebec-4132-a7a0-310b2e1bff0a', 432, 'ai_auto', 0.30),
  ('1914dc43-ebec-4132-a7a0-310b2e1bff0a', 433, 'ai_auto', 0.30),
  ('1914dc43-ebec-4132-a7a0-310b2e1bff0a', 434, 'ai_auto', 0.30);

-- Varex Imaging (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('ad719467-d5c4-47d6-9cee-47abf8ef4ca5', 62, 'ai_auto', 0.70),
  ('ad719467-d5c4-47d6-9cee-47abf8ef4ca5', 81, 'ai_auto', 0.30),
  ('ad719467-d5c4-47d6-9cee-47abf8ef4ca5', 82, 'ai_auto', 0.30),
  ('ad719467-d5c4-47d6-9cee-47abf8ef4ca5', 83, 'ai_auto', 0.30),
  ('ad719467-d5c4-47d6-9cee-47abf8ef4ca5', 84, 'ai_auto', 0.30),
  ('ad719467-d5c4-47d6-9cee-47abf8ef4ca5', 85, 'ai_auto', 0.30),
  ('ad719467-d5c4-47d6-9cee-47abf8ef4ca5', 86, 'ai_auto', 0.30),
  ('ad719467-d5c4-47d6-9cee-47abf8ef4ca5', 87, 'ai_auto', 0.30),
  ('ad719467-d5c4-47d6-9cee-47abf8ef4ca5', 432, 'ai_auto', 0.30),
  ('ad719467-d5c4-47d6-9cee-47abf8ef4ca5', 433, 'ai_auto', 0.30);

-- 3M Healthcare (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('838ab8ff-3191-48d2-aa34-ecc0be8010a6', 64, 'ai_auto', 0.37),
  ('838ab8ff-3191-48d2-aa34-ecc0be8010a6', 65, 'ai_auto', 0.30),
  ('838ab8ff-3191-48d2-aa34-ecc0be8010a6', 66, 'ai_auto', 0.30),
  ('838ab8ff-3191-48d2-aa34-ecc0be8010a6', 67, 'ai_auto', 0.30),
  ('838ab8ff-3191-48d2-aa34-ecc0be8010a6', 68, 'ai_auto', 0.30),
  ('838ab8ff-3191-48d2-aa34-ecc0be8010a6', 69, 'ai_auto', 0.30),
  ('838ab8ff-3191-48d2-aa34-ecc0be8010a6', 70, 'ai_auto', 0.30),
  ('838ab8ff-3191-48d2-aa34-ecc0be8010a6', 417, 'ai_auto', 0.30),
  ('838ab8ff-3191-48d2-aa34-ecc0be8010a6', 418, 'ai_auto', 0.30),
  ('838ab8ff-3191-48d2-aa34-ecc0be8010a6', 419, 'ai_auto', 0.30);

-- Molnlycke (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('757cce6a-acd8-40e1-927e-8fa799efe2b8', 64, 'ai_auto', 0.30),
  ('757cce6a-acd8-40e1-927e-8fa799efe2b8', 65, 'ai_auto', 0.30),
  ('757cce6a-acd8-40e1-927e-8fa799efe2b8', 66, 'ai_auto', 0.30),
  ('757cce6a-acd8-40e1-927e-8fa799efe2b8', 67, 'ai_auto', 0.30),
  ('757cce6a-acd8-40e1-927e-8fa799efe2b8', 68, 'ai_auto', 0.30),
  ('757cce6a-acd8-40e1-927e-8fa799efe2b8', 69, 'ai_auto', 0.30),
  ('757cce6a-acd8-40e1-927e-8fa799efe2b8', 70, 'ai_auto', 0.30),
  ('757cce6a-acd8-40e1-927e-8fa799efe2b8', 417, 'ai_auto', 0.30),
  ('757cce6a-acd8-40e1-927e-8fa799efe2b8', 418, 'ai_auto', 0.30),
  ('757cce6a-acd8-40e1-927e-8fa799efe2b8', 419, 'ai_auto', 0.30);

-- ConvaTec (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('64653148-cde7-4467-915d-953b0c5c7a26', 64, 'ai_auto', 0.30),
  ('64653148-cde7-4467-915d-953b0c5c7a26', 65, 'ai_auto', 0.30),
  ('64653148-cde7-4467-915d-953b0c5c7a26', 66, 'ai_auto', 0.30),
  ('64653148-cde7-4467-915d-953b0c5c7a26', 67, 'ai_auto', 0.30),
  ('64653148-cde7-4467-915d-953b0c5c7a26', 68, 'ai_auto', 0.30),
  ('64653148-cde7-4467-915d-953b0c5c7a26', 69, 'ai_auto', 0.30),
  ('64653148-cde7-4467-915d-953b0c5c7a26', 70, 'ai_auto', 0.30),
  ('64653148-cde7-4467-915d-953b0c5c7a26', 417, 'ai_auto', 0.30),
  ('64653148-cde7-4467-915d-953b0c5c7a26', 418, 'ai_auto', 0.30),
  ('64653148-cde7-4467-915d-953b0c5c7a26', 419, 'ai_auto', 0.30);

-- Solventum (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('32f47a38-d229-4471-8dfc-c09dd43be554', 64, 'ai_auto', 0.30),
  ('32f47a38-d229-4471-8dfc-c09dd43be554', 65, 'ai_auto', 0.30),
  ('32f47a38-d229-4471-8dfc-c09dd43be554', 66, 'ai_auto', 0.30),
  ('32f47a38-d229-4471-8dfc-c09dd43be554', 67, 'ai_auto', 0.30),
  ('32f47a38-d229-4471-8dfc-c09dd43be554', 68, 'ai_auto', 0.30),
  ('32f47a38-d229-4471-8dfc-c09dd43be554', 69, 'ai_auto', 0.30),
  ('32f47a38-d229-4471-8dfc-c09dd43be554', 70, 'ai_auto', 0.30),
  ('32f47a38-d229-4471-8dfc-c09dd43be554', 417, 'ai_auto', 0.30),
  ('32f47a38-d229-4471-8dfc-c09dd43be554', 418, 'ai_auto', 0.30),
  ('32f47a38-d229-4471-8dfc-c09dd43be554', 419, 'ai_auto', 0.30);

-- Smith+Nephew Wound (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('95cfbf01-518e-4ad5-abd3-84194eb4f8d5', 64, 'ai_auto', 0.37),
  ('95cfbf01-518e-4ad5-abd3-84194eb4f8d5', 66, 'ai_auto', 0.35),
  ('95cfbf01-518e-4ad5-abd3-84194eb4f8d5', 65, 'ai_auto', 0.30),
  ('95cfbf01-518e-4ad5-abd3-84194eb4f8d5', 67, 'ai_auto', 0.30),
  ('95cfbf01-518e-4ad5-abd3-84194eb4f8d5', 68, 'ai_auto', 0.30),
  ('95cfbf01-518e-4ad5-abd3-84194eb4f8d5', 69, 'ai_auto', 0.30),
  ('95cfbf01-518e-4ad5-abd3-84194eb4f8d5', 70, 'ai_auto', 0.30),
  ('95cfbf01-518e-4ad5-abd3-84194eb4f8d5', 417, 'ai_auto', 0.30),
  ('95cfbf01-518e-4ad5-abd3-84194eb4f8d5', 418, 'ai_auto', 0.30),
  ('95cfbf01-518e-4ad5-abd3-84194eb4f8d5', 419, 'ai_auto', 0.30);

-- Coloplast (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('999eeabe-f5bd-48ae-b944-9fc476b7ae12', 64, 'ai_auto', 0.30),
  ('999eeabe-f5bd-48ae-b944-9fc476b7ae12', 65, 'ai_auto', 0.30),
  ('999eeabe-f5bd-48ae-b944-9fc476b7ae12', 66, 'ai_auto', 0.30),
  ('999eeabe-f5bd-48ae-b944-9fc476b7ae12', 67, 'ai_auto', 0.30),
  ('999eeabe-f5bd-48ae-b944-9fc476b7ae12', 68, 'ai_auto', 0.30),
  ('999eeabe-f5bd-48ae-b944-9fc476b7ae12', 69, 'ai_auto', 0.30),
  ('999eeabe-f5bd-48ae-b944-9fc476b7ae12', 70, 'ai_auto', 0.30),
  ('999eeabe-f5bd-48ae-b944-9fc476b7ae12', 417, 'ai_auto', 0.30),
  ('999eeabe-f5bd-48ae-b944-9fc476b7ae12', 418, 'ai_auto', 0.30),
  ('999eeabe-f5bd-48ae-b944-9fc476b7ae12', 419, 'ai_auto', 0.30);

-- Integra Wound Care (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('fd6f9e33-c5bc-454f-a871-782f4f184c4f', 64, 'ai_auto', 0.43),
  ('fd6f9e33-c5bc-454f-a871-782f4f184c4f', 66, 'ai_auto', 0.35),
  ('fd6f9e33-c5bc-454f-a871-782f4f184c4f', 65, 'ai_auto', 0.30),
  ('fd6f9e33-c5bc-454f-a871-782f4f184c4f', 67, 'ai_auto', 0.30),
  ('fd6f9e33-c5bc-454f-a871-782f4f184c4f', 68, 'ai_auto', 0.30),
  ('fd6f9e33-c5bc-454f-a871-782f4f184c4f', 69, 'ai_auto', 0.30),
  ('fd6f9e33-c5bc-454f-a871-782f4f184c4f', 70, 'ai_auto', 0.30),
  ('fd6f9e33-c5bc-454f-a871-782f4f184c4f', 417, 'ai_auto', 0.30),
  ('fd6f9e33-c5bc-454f-a871-782f4f184c4f', 418, 'ai_auto', 0.30),
  ('fd6f9e33-c5bc-454f-a871-782f4f184c4f', 419, 'ai_auto', 0.30);

-- Organogenesis (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('aaa3135b-1982-4b60-8560-7f0ae05b1eb2', 64, 'ai_auto', 0.30),
  ('aaa3135b-1982-4b60-8560-7f0ae05b1eb2', 65, 'ai_auto', 0.30),
  ('aaa3135b-1982-4b60-8560-7f0ae05b1eb2', 66, 'ai_auto', 0.30),
  ('aaa3135b-1982-4b60-8560-7f0ae05b1eb2', 67, 'ai_auto', 0.30),
  ('aaa3135b-1982-4b60-8560-7f0ae05b1eb2', 68, 'ai_auto', 0.30),
  ('aaa3135b-1982-4b60-8560-7f0ae05b1eb2', 69, 'ai_auto', 0.30),
  ('aaa3135b-1982-4b60-8560-7f0ae05b1eb2', 70, 'ai_auto', 0.30),
  ('aaa3135b-1982-4b60-8560-7f0ae05b1eb2', 417, 'ai_auto', 0.30),
  ('aaa3135b-1982-4b60-8560-7f0ae05b1eb2', 418, 'ai_auto', 0.30),
  ('aaa3135b-1982-4b60-8560-7f0ae05b1eb2', 419, 'ai_auto', 0.30);

-- MiMedx (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('58959a69-3ca5-471e-b0dc-a31cb8f78d77', 64, 'ai_auto', 0.30),
  ('58959a69-3ca5-471e-b0dc-a31cb8f78d77', 65, 'ai_auto', 0.30),
  ('58959a69-3ca5-471e-b0dc-a31cb8f78d77', 66, 'ai_auto', 0.30),
  ('58959a69-3ca5-471e-b0dc-a31cb8f78d77', 67, 'ai_auto', 0.30),
  ('58959a69-3ca5-471e-b0dc-a31cb8f78d77', 68, 'ai_auto', 0.30),
  ('58959a69-3ca5-471e-b0dc-a31cb8f78d77', 69, 'ai_auto', 0.30),
  ('58959a69-3ca5-471e-b0dc-a31cb8f78d77', 70, 'ai_auto', 0.30),
  ('58959a69-3ca5-471e-b0dc-a31cb8f78d77', 417, 'ai_auto', 0.30),
  ('58959a69-3ca5-471e-b0dc-a31cb8f78d77', 418, 'ai_auto', 0.30),
  ('58959a69-3ca5-471e-b0dc-a31cb8f78d77', 419, 'ai_auto', 0.30);

-- Derma Sciences (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('e69fe5cb-7117-486a-87bc-092bde7a709b', 64, 'ai_auto', 0.30),
  ('e69fe5cb-7117-486a-87bc-092bde7a709b', 65, 'ai_auto', 0.30),
  ('e69fe5cb-7117-486a-87bc-092bde7a709b', 66, 'ai_auto', 0.30),
  ('e69fe5cb-7117-486a-87bc-092bde7a709b', 67, 'ai_auto', 0.30),
  ('e69fe5cb-7117-486a-87bc-092bde7a709b', 68, 'ai_auto', 0.30),
  ('e69fe5cb-7117-486a-87bc-092bde7a709b', 69, 'ai_auto', 0.30),
  ('e69fe5cb-7117-486a-87bc-092bde7a709b', 70, 'ai_auto', 0.30),
  ('e69fe5cb-7117-486a-87bc-092bde7a709b', 417, 'ai_auto', 0.30),
  ('e69fe5cb-7117-486a-87bc-092bde7a709b', 418, 'ai_auto', 0.30),
  ('e69fe5cb-7117-486a-87bc-092bde7a709b', 419, 'ai_auto', 0.30);

-- Acelity (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('81fbaa72-329a-4b2f-b068-4bc8428001c1', 64, 'ai_auto', 0.30),
  ('81fbaa72-329a-4b2f-b068-4bc8428001c1', 65, 'ai_auto', 0.30),
  ('81fbaa72-329a-4b2f-b068-4bc8428001c1', 66, 'ai_auto', 0.30),
  ('81fbaa72-329a-4b2f-b068-4bc8428001c1', 67, 'ai_auto', 0.30),
  ('81fbaa72-329a-4b2f-b068-4bc8428001c1', 68, 'ai_auto', 0.30),
  ('81fbaa72-329a-4b2f-b068-4bc8428001c1', 69, 'ai_auto', 0.30),
  ('81fbaa72-329a-4b2f-b068-4bc8428001c1', 70, 'ai_auto', 0.30),
  ('81fbaa72-329a-4b2f-b068-4bc8428001c1', 417, 'ai_auto', 0.30),
  ('81fbaa72-329a-4b2f-b068-4bc8428001c1', 418, 'ai_auto', 0.30),
  ('81fbaa72-329a-4b2f-b068-4bc8428001c1', 419, 'ai_auto', 0.30);

-- DeRoyal (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('03028c24-c53d-4ba4-bbbe-94f03e3c9214', 64, 'ai_auto', 0.30),
  ('03028c24-c53d-4ba4-bbbe-94f03e3c9214', 65, 'ai_auto', 0.30),
  ('03028c24-c53d-4ba4-bbbe-94f03e3c9214', 66, 'ai_auto', 0.30),
  ('03028c24-c53d-4ba4-bbbe-94f03e3c9214', 67, 'ai_auto', 0.30),
  ('03028c24-c53d-4ba4-bbbe-94f03e3c9214', 68, 'ai_auto', 0.30),
  ('03028c24-c53d-4ba4-bbbe-94f03e3c9214', 69, 'ai_auto', 0.30),
  ('03028c24-c53d-4ba4-bbbe-94f03e3c9214', 70, 'ai_auto', 0.30),
  ('03028c24-c53d-4ba4-bbbe-94f03e3c9214', 417, 'ai_auto', 0.30),
  ('03028c24-c53d-4ba4-bbbe-94f03e3c9214', 418, 'ai_auto', 0.30),
  ('03028c24-c53d-4ba4-bbbe-94f03e3c9214', 419, 'ai_auto', 0.30);

-- Medela (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('9bf08ac1-04de-4556-87e1-a9ff5d60fa27', 64, 'ai_auto', 0.30),
  ('9bf08ac1-04de-4556-87e1-a9ff5d60fa27', 65, 'ai_auto', 0.30),
  ('9bf08ac1-04de-4556-87e1-a9ff5d60fa27', 66, 'ai_auto', 0.30),
  ('9bf08ac1-04de-4556-87e1-a9ff5d60fa27', 67, 'ai_auto', 0.30),
  ('9bf08ac1-04de-4556-87e1-a9ff5d60fa27', 68, 'ai_auto', 0.30),
  ('9bf08ac1-04de-4556-87e1-a9ff5d60fa27', 69, 'ai_auto', 0.30),
  ('9bf08ac1-04de-4556-87e1-a9ff5d60fa27', 70, 'ai_auto', 0.30),
  ('9bf08ac1-04de-4556-87e1-a9ff5d60fa27', 417, 'ai_auto', 0.30),
  ('9bf08ac1-04de-4556-87e1-a9ff5d60fa27', 418, 'ai_auto', 0.30),
  ('9bf08ac1-04de-4556-87e1-a9ff5d60fa27', 419, 'ai_auto', 0.30);

-- Hollister (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('f22a7645-a950-413c-819c-913d8a945b0e', 64, 'ai_auto', 0.30),
  ('f22a7645-a950-413c-819c-913d8a945b0e', 65, 'ai_auto', 0.30),
  ('f22a7645-a950-413c-819c-913d8a945b0e', 66, 'ai_auto', 0.30),
  ('f22a7645-a950-413c-819c-913d8a945b0e', 67, 'ai_auto', 0.30),
  ('f22a7645-a950-413c-819c-913d8a945b0e', 68, 'ai_auto', 0.30),
  ('f22a7645-a950-413c-819c-913d8a945b0e', 69, 'ai_auto', 0.30),
  ('f22a7645-a950-413c-819c-913d8a945b0e', 70, 'ai_auto', 0.30),
  ('f22a7645-a950-413c-819c-913d8a945b0e', 417, 'ai_auto', 0.30),
  ('f22a7645-a950-413c-819c-913d8a945b0e', 418, 'ai_auto', 0.30),
  ('f22a7645-a950-413c-819c-913d8a945b0e', 419, 'ai_auto', 0.30);

-- Ecolab Healthcare (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('ceffe619-a269-4ad3-b1ae-db20870b72ff', 64, 'ai_auto', 0.37),
  ('ceffe619-a269-4ad3-b1ae-db20870b72ff', 65, 'ai_auto', 0.30),
  ('ceffe619-a269-4ad3-b1ae-db20870b72ff', 66, 'ai_auto', 0.30),
  ('ceffe619-a269-4ad3-b1ae-db20870b72ff', 67, 'ai_auto', 0.30),
  ('ceffe619-a269-4ad3-b1ae-db20870b72ff', 68, 'ai_auto', 0.30),
  ('ceffe619-a269-4ad3-b1ae-db20870b72ff', 69, 'ai_auto', 0.30),
  ('ceffe619-a269-4ad3-b1ae-db20870b72ff', 70, 'ai_auto', 0.30),
  ('ceffe619-a269-4ad3-b1ae-db20870b72ff', 417, 'ai_auto', 0.30),
  ('ceffe619-a269-4ad3-b1ae-db20870b72ff', 418, 'ai_auto', 0.30),
  ('ceffe619-a269-4ad3-b1ae-db20870b72ff', 419, 'ai_auto', 0.30);

-- Diversey (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('51156109-7578-45e8-9690-3dacce3db918', 64, 'ai_auto', 0.30),
  ('51156109-7578-45e8-9690-3dacce3db918', 65, 'ai_auto', 0.30),
  ('51156109-7578-45e8-9690-3dacce3db918', 66, 'ai_auto', 0.30),
  ('51156109-7578-45e8-9690-3dacce3db918', 67, 'ai_auto', 0.30),
  ('51156109-7578-45e8-9690-3dacce3db918', 68, 'ai_auto', 0.30),
  ('51156109-7578-45e8-9690-3dacce3db918', 69, 'ai_auto', 0.30),
  ('51156109-7578-45e8-9690-3dacce3db918', 70, 'ai_auto', 0.30),
  ('51156109-7578-45e8-9690-3dacce3db918', 417, 'ai_auto', 0.30),
  ('51156109-7578-45e8-9690-3dacce3db918', 418, 'ai_auto', 0.30),
  ('51156109-7578-45e8-9690-3dacce3db918', 419, 'ai_auto', 0.30);

-- PDI Healthcare (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('6e6c98ee-fd1e-4b47-bfab-3209eabff5eb', 64, 'ai_auto', 0.37),
  ('6e6c98ee-fd1e-4b47-bfab-3209eabff5eb', 65, 'ai_auto', 0.30),
  ('6e6c98ee-fd1e-4b47-bfab-3209eabff5eb', 66, 'ai_auto', 0.30),
  ('6e6c98ee-fd1e-4b47-bfab-3209eabff5eb', 67, 'ai_auto', 0.30),
  ('6e6c98ee-fd1e-4b47-bfab-3209eabff5eb', 68, 'ai_auto', 0.30),
  ('6e6c98ee-fd1e-4b47-bfab-3209eabff5eb', 69, 'ai_auto', 0.30),
  ('6e6c98ee-fd1e-4b47-bfab-3209eabff5eb', 70, 'ai_auto', 0.30),
  ('6e6c98ee-fd1e-4b47-bfab-3209eabff5eb', 417, 'ai_auto', 0.30),
  ('6e6c98ee-fd1e-4b47-bfab-3209eabff5eb', 418, 'ai_auto', 0.30),
  ('6e6c98ee-fd1e-4b47-bfab-3209eabff5eb', 419, 'ai_auto', 0.30);

-- Clorox Healthcare (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('a35d829c-cb27-4be7-9cc2-666d183a5a11', 64, 'ai_auto', 0.37),
  ('a35d829c-cb27-4be7-9cc2-666d183a5a11', 65, 'ai_auto', 0.30),
  ('a35d829c-cb27-4be7-9cc2-666d183a5a11', 66, 'ai_auto', 0.30),
  ('a35d829c-cb27-4be7-9cc2-666d183a5a11', 67, 'ai_auto', 0.30),
  ('a35d829c-cb27-4be7-9cc2-666d183a5a11', 68, 'ai_auto', 0.30),
  ('a35d829c-cb27-4be7-9cc2-666d183a5a11', 69, 'ai_auto', 0.30),
  ('a35d829c-cb27-4be7-9cc2-666d183a5a11', 70, 'ai_auto', 0.30),
  ('a35d829c-cb27-4be7-9cc2-666d183a5a11', 417, 'ai_auto', 0.30),
  ('a35d829c-cb27-4be7-9cc2-666d183a5a11', 418, 'ai_auto', 0.30),
  ('a35d829c-cb27-4be7-9cc2-666d183a5a11', 419, 'ai_auto', 0.30);

-- STERIS (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('4b90eae6-a236-48e1-98d9-758138e4e57f', 64, 'ai_auto', 0.30),
  ('4b90eae6-a236-48e1-98d9-758138e4e57f', 65, 'ai_auto', 0.30),
  ('4b90eae6-a236-48e1-98d9-758138e4e57f', 66, 'ai_auto', 0.30),
  ('4b90eae6-a236-48e1-98d9-758138e4e57f', 67, 'ai_auto', 0.30),
  ('4b90eae6-a236-48e1-98d9-758138e4e57f', 68, 'ai_auto', 0.30),
  ('4b90eae6-a236-48e1-98d9-758138e4e57f', 69, 'ai_auto', 0.30),
  ('4b90eae6-a236-48e1-98d9-758138e4e57f', 70, 'ai_auto', 0.30),
  ('4b90eae6-a236-48e1-98d9-758138e4e57f', 417, 'ai_auto', 0.30),
  ('4b90eae6-a236-48e1-98d9-758138e4e57f', 418, 'ai_auto', 0.30),
  ('4b90eae6-a236-48e1-98d9-758138e4e57f', 419, 'ai_auto', 0.30);

-- Advanced Sterilization Products (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('ed1af328-ea8b-4d70-bdd4-fbeb16d9d73e', 68, 'ai_auto', 1.00),
  ('ed1af328-ea8b-4d70-bdd4-fbeb16d9d73e', 64, 'ai_auto', 0.37),
  ('ed1af328-ea8b-4d70-bdd4-fbeb16d9d73e', 65, 'ai_auto', 0.30),
  ('ed1af328-ea8b-4d70-bdd4-fbeb16d9d73e', 66, 'ai_auto', 0.30),
  ('ed1af328-ea8b-4d70-bdd4-fbeb16d9d73e', 67, 'ai_auto', 0.30),
  ('ed1af328-ea8b-4d70-bdd4-fbeb16d9d73e', 69, 'ai_auto', 0.30),
  ('ed1af328-ea8b-4d70-bdd4-fbeb16d9d73e', 70, 'ai_auto', 0.30),
  ('ed1af328-ea8b-4d70-bdd4-fbeb16d9d73e', 417, 'ai_auto', 0.30),
  ('ed1af328-ea8b-4d70-bdd4-fbeb16d9d73e', 418, 'ai_auto', 0.30),
  ('ed1af328-ea8b-4d70-bdd4-fbeb16d9d73e', 419, 'ai_auto', 0.30);

-- Becton Dickinson (8 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('d1c8b0a1-6742-4227-80e4-c081f0845e33', 153, 'ai_auto', 0.30),
  ('d1c8b0a1-6742-4227-80e4-c081f0845e33', 154, 'ai_auto', 0.30),
  ('d1c8b0a1-6742-4227-80e4-c081f0845e33', 155, 'ai_auto', 0.30),
  ('d1c8b0a1-6742-4227-80e4-c081f0845e33', 156, 'ai_auto', 0.30),
  ('d1c8b0a1-6742-4227-80e4-c081f0845e33', 498, 'ai_auto', 0.30),
  ('d1c8b0a1-6742-4227-80e4-c081f0845e33', 499, 'ai_auto', 0.30),
  ('d1c8b0a1-6742-4227-80e4-c081f0845e33', 500, 'ai_auto', 0.30),
  ('d1c8b0a1-6742-4227-80e4-c081f0845e33', 501, 'ai_auto', 0.30);

-- Baxter (8 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('0223d3fe-6787-4941-b37d-03d0d62b89c5', 153, 'ai_auto', 0.30),
  ('0223d3fe-6787-4941-b37d-03d0d62b89c5', 154, 'ai_auto', 0.30),
  ('0223d3fe-6787-4941-b37d-03d0d62b89c5', 155, 'ai_auto', 0.30),
  ('0223d3fe-6787-4941-b37d-03d0d62b89c5', 156, 'ai_auto', 0.30),
  ('0223d3fe-6787-4941-b37d-03d0d62b89c5', 498, 'ai_auto', 0.30),
  ('0223d3fe-6787-4941-b37d-03d0d62b89c5', 499, 'ai_auto', 0.30),
  ('0223d3fe-6787-4941-b37d-03d0d62b89c5', 500, 'ai_auto', 0.30),
  ('0223d3fe-6787-4941-b37d-03d0d62b89c5', 501, 'ai_auto', 0.30);

-- ICU Medical (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('a0b23301-1ac5-497a-9ee3-49e8efcb3e5a', 153, 'ai_auto', 0.30),
  ('a0b23301-1ac5-497a-9ee3-49e8efcb3e5a', 154, 'ai_auto', 0.30),
  ('a0b23301-1ac5-497a-9ee3-49e8efcb3e5a', 155, 'ai_auto', 0.30),
  ('a0b23301-1ac5-497a-9ee3-49e8efcb3e5a', 156, 'ai_auto', 0.30),
  ('a0b23301-1ac5-497a-9ee3-49e8efcb3e5a', 498, 'ai_auto', 0.30),
  ('a0b23301-1ac5-497a-9ee3-49e8efcb3e5a', 499, 'ai_auto', 0.30),
  ('a0b23301-1ac5-497a-9ee3-49e8efcb3e5a', 500, 'ai_auto', 0.30),
  ('a0b23301-1ac5-497a-9ee3-49e8efcb3e5a', 501, 'ai_auto', 0.30),
  ('a0b23301-1ac5-497a-9ee3-49e8efcb3e5a', 248, 'ai_auto', 0.10),
  ('a0b23301-1ac5-497a-9ee3-49e8efcb3e5a', 280, 'ai_auto', 0.10);

-- B. Braun (8 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('3e8cd804-1ba3-4763-a36f-7812ab5e8a18', 153, 'ai_auto', 0.30),
  ('3e8cd804-1ba3-4763-a36f-7812ab5e8a18', 154, 'ai_auto', 0.30),
  ('3e8cd804-1ba3-4763-a36f-7812ab5e8a18', 155, 'ai_auto', 0.30),
  ('3e8cd804-1ba3-4763-a36f-7812ab5e8a18', 156, 'ai_auto', 0.30),
  ('3e8cd804-1ba3-4763-a36f-7812ab5e8a18', 498, 'ai_auto', 0.30),
  ('3e8cd804-1ba3-4763-a36f-7812ab5e8a18', 499, 'ai_auto', 0.30),
  ('3e8cd804-1ba3-4763-a36f-7812ab5e8a18', 500, 'ai_auto', 0.30),
  ('3e8cd804-1ba3-4763-a36f-7812ab5e8a18', 501, 'ai_auto', 0.30);

-- Smiths Medical (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('e845c400-42a5-48e0-ae77-f43dc56a73ad', 153, 'ai_auto', 0.30),
  ('e845c400-42a5-48e0-ae77-f43dc56a73ad', 154, 'ai_auto', 0.30),
  ('e845c400-42a5-48e0-ae77-f43dc56a73ad', 155, 'ai_auto', 0.30),
  ('e845c400-42a5-48e0-ae77-f43dc56a73ad', 156, 'ai_auto', 0.30),
  ('e845c400-42a5-48e0-ae77-f43dc56a73ad', 498, 'ai_auto', 0.30),
  ('e845c400-42a5-48e0-ae77-f43dc56a73ad', 499, 'ai_auto', 0.30),
  ('e845c400-42a5-48e0-ae77-f43dc56a73ad', 500, 'ai_auto', 0.30),
  ('e845c400-42a5-48e0-ae77-f43dc56a73ad', 501, 'ai_auto', 0.30),
  ('e845c400-42a5-48e0-ae77-f43dc56a73ad', 280, 'ai_auto', 0.10),
  ('e845c400-42a5-48e0-ae77-f43dc56a73ad', 285, 'ai_auto', 0.10);

-- Fresenius Kabi (8 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('0f9e96fd-6685-4e97-9af7-0c3d638ae5b9', 153, 'ai_auto', 0.30),
  ('0f9e96fd-6685-4e97-9af7-0c3d638ae5b9', 154, 'ai_auto', 0.30),
  ('0f9e96fd-6685-4e97-9af7-0c3d638ae5b9', 155, 'ai_auto', 0.30),
  ('0f9e96fd-6685-4e97-9af7-0c3d638ae5b9', 156, 'ai_auto', 0.30),
  ('0f9e96fd-6685-4e97-9af7-0c3d638ae5b9', 498, 'ai_auto', 0.30),
  ('0f9e96fd-6685-4e97-9af7-0c3d638ae5b9', 499, 'ai_auto', 0.30),
  ('0f9e96fd-6685-4e97-9af7-0c3d638ae5b9', 500, 'ai_auto', 0.30),
  ('0f9e96fd-6685-4e97-9af7-0c3d638ae5b9', 501, 'ai_auto', 0.30);

-- Zyno Medical (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('02f20165-6382-4131-9d7d-8fb784239f7b', 153, 'ai_auto', 0.30),
  ('02f20165-6382-4131-9d7d-8fb784239f7b', 154, 'ai_auto', 0.30),
  ('02f20165-6382-4131-9d7d-8fb784239f7b', 155, 'ai_auto', 0.30),
  ('02f20165-6382-4131-9d7d-8fb784239f7b', 156, 'ai_auto', 0.30),
  ('02f20165-6382-4131-9d7d-8fb784239f7b', 498, 'ai_auto', 0.30),
  ('02f20165-6382-4131-9d7d-8fb784239f7b', 499, 'ai_auto', 0.30),
  ('02f20165-6382-4131-9d7d-8fb784239f7b', 500, 'ai_auto', 0.30),
  ('02f20165-6382-4131-9d7d-8fb784239f7b', 501, 'ai_auto', 0.30),
  ('02f20165-6382-4131-9d7d-8fb784239f7b', 280, 'ai_auto', 0.10),
  ('02f20165-6382-4131-9d7d-8fb784239f7b', 285, 'ai_auto', 0.10);

-- Ivenix (8 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('22f58ffb-e6e8-4f76-9d0f-9f1d3280b2b8', 153, 'ai_auto', 0.30),
  ('22f58ffb-e6e8-4f76-9d0f-9f1d3280b2b8', 154, 'ai_auto', 0.30),
  ('22f58ffb-e6e8-4f76-9d0f-9f1d3280b2b8', 155, 'ai_auto', 0.30),
  ('22f58ffb-e6e8-4f76-9d0f-9f1d3280b2b8', 156, 'ai_auto', 0.30),
  ('22f58ffb-e6e8-4f76-9d0f-9f1d3280b2b8', 498, 'ai_auto', 0.30),
  ('22f58ffb-e6e8-4f76-9d0f-9f1d3280b2b8', 499, 'ai_auto', 0.30),
  ('22f58ffb-e6e8-4f76-9d0f-9f1d3280b2b8', 500, 'ai_auto', 0.30),
  ('22f58ffb-e6e8-4f76-9d0f-9f1d3280b2b8', 501, 'ai_auto', 0.30);

-- Hospira (8 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('2ba0b774-7ac1-4ca0-bc3a-4179edf101fb', 153, 'ai_auto', 0.30),
  ('2ba0b774-7ac1-4ca0-bc3a-4179edf101fb', 154, 'ai_auto', 0.30),
  ('2ba0b774-7ac1-4ca0-bc3a-4179edf101fb', 155, 'ai_auto', 0.30),
  ('2ba0b774-7ac1-4ca0-bc3a-4179edf101fb', 156, 'ai_auto', 0.30),
  ('2ba0b774-7ac1-4ca0-bc3a-4179edf101fb', 498, 'ai_auto', 0.30),
  ('2ba0b774-7ac1-4ca0-bc3a-4179edf101fb', 499, 'ai_auto', 0.30),
  ('2ba0b774-7ac1-4ca0-bc3a-4179edf101fb', 500, 'ai_auto', 0.30),
  ('2ba0b774-7ac1-4ca0-bc3a-4179edf101fb', 501, 'ai_auto', 0.30);

-- Moog Medical (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('dab35a8b-1d47-418e-9255-bbeefa1e5218', 153, 'ai_auto', 0.30),
  ('dab35a8b-1d47-418e-9255-bbeefa1e5218', 154, 'ai_auto', 0.30),
  ('dab35a8b-1d47-418e-9255-bbeefa1e5218', 155, 'ai_auto', 0.30),
  ('dab35a8b-1d47-418e-9255-bbeefa1e5218', 156, 'ai_auto', 0.30),
  ('dab35a8b-1d47-418e-9255-bbeefa1e5218', 498, 'ai_auto', 0.30),
  ('dab35a8b-1d47-418e-9255-bbeefa1e5218', 499, 'ai_auto', 0.30),
  ('dab35a8b-1d47-418e-9255-bbeefa1e5218', 500, 'ai_auto', 0.30),
  ('dab35a8b-1d47-418e-9255-bbeefa1e5218', 501, 'ai_auto', 0.30),
  ('dab35a8b-1d47-418e-9255-bbeefa1e5218', 280, 'ai_auto', 0.10),
  ('dab35a8b-1d47-418e-9255-bbeefa1e5218', 285, 'ai_auto', 0.10);

-- Caesarea Medical Electronics (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('67ce4b9c-aaa5-41f0-85f4-6f2d636004bc', 153, 'ai_auto', 0.30),
  ('67ce4b9c-aaa5-41f0-85f4-6f2d636004bc', 154, 'ai_auto', 0.30),
  ('67ce4b9c-aaa5-41f0-85f4-6f2d636004bc', 155, 'ai_auto', 0.30),
  ('67ce4b9c-aaa5-41f0-85f4-6f2d636004bc', 156, 'ai_auto', 0.30),
  ('67ce4b9c-aaa5-41f0-85f4-6f2d636004bc', 498, 'ai_auto', 0.30),
  ('67ce4b9c-aaa5-41f0-85f4-6f2d636004bc', 499, 'ai_auto', 0.30),
  ('67ce4b9c-aaa5-41f0-85f4-6f2d636004bc', 500, 'ai_auto', 0.30),
  ('67ce4b9c-aaa5-41f0-85f4-6f2d636004bc', 501, 'ai_auto', 0.30),
  ('67ce4b9c-aaa5-41f0-85f4-6f2d636004bc', 280, 'ai_auto', 0.10),
  ('67ce4b9c-aaa5-41f0-85f4-6f2d636004bc', 285, 'ai_auto', 0.10);

-- Terumo Infusion (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('e7e21f9f-bf66-4895-9654-6b549c1b51ce', 153, 'ai_auto', 0.40),
  ('e7e21f9f-bf66-4895-9654-6b549c1b51ce', 154, 'ai_auto', 0.40),
  ('e7e21f9f-bf66-4895-9654-6b549c1b51ce', 155, 'ai_auto', 0.40),
  ('e7e21f9f-bf66-4895-9654-6b549c1b51ce', 156, 'ai_auto', 0.40),
  ('e7e21f9f-bf66-4895-9654-6b549c1b51ce', 498, 'ai_auto', 0.37),
  ('e7e21f9f-bf66-4895-9654-6b549c1b51ce', 501, 'ai_auto', 0.37),
  ('e7e21f9f-bf66-4895-9654-6b549c1b51ce', 499, 'ai_auto', 0.30),
  ('e7e21f9f-bf66-4895-9654-6b549c1b51ce', 500, 'ai_auto', 0.30),
  ('e7e21f9f-bf66-4895-9654-6b549c1b51ce', 102, 'ai_auto', 0.10),
  ('e7e21f9f-bf66-4895-9654-6b549c1b51ce', 256, 'ai_auto', 0.10);

-- RiteDose (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('4413347f-a5d0-4547-9b8b-cd6cb288fc36', 153, 'ai_auto', 0.30),
  ('4413347f-a5d0-4547-9b8b-cd6cb288fc36', 154, 'ai_auto', 0.30),
  ('4413347f-a5d0-4547-9b8b-cd6cb288fc36', 155, 'ai_auto', 0.30),
  ('4413347f-a5d0-4547-9b8b-cd6cb288fc36', 156, 'ai_auto', 0.30),
  ('4413347f-a5d0-4547-9b8b-cd6cb288fc36', 498, 'ai_auto', 0.30),
  ('4413347f-a5d0-4547-9b8b-cd6cb288fc36', 499, 'ai_auto', 0.30),
  ('4413347f-a5d0-4547-9b8b-cd6cb288fc36', 500, 'ai_auto', 0.30),
  ('4413347f-a5d0-4547-9b8b-cd6cb288fc36', 501, 'ai_auto', 0.30),
  ('4413347f-a5d0-4547-9b8b-cd6cb288fc36', 486, 'ai_auto', 0.12),
  ('4413347f-a5d0-4547-9b8b-cd6cb288fc36', 189, 'ai_auto', 0.10);

-- Grifols (8 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('09bdefa9-20bb-4c1c-8648-edb26dd57abc', 153, 'ai_auto', 0.30),
  ('09bdefa9-20bb-4c1c-8648-edb26dd57abc', 154, 'ai_auto', 0.30),
  ('09bdefa9-20bb-4c1c-8648-edb26dd57abc', 155, 'ai_auto', 0.30),
  ('09bdefa9-20bb-4c1c-8648-edb26dd57abc', 156, 'ai_auto', 0.30),
  ('09bdefa9-20bb-4c1c-8648-edb26dd57abc', 498, 'ai_auto', 0.30),
  ('09bdefa9-20bb-4c1c-8648-edb26dd57abc', 499, 'ai_auto', 0.30),
  ('09bdefa9-20bb-4c1c-8648-edb26dd57abc', 500, 'ai_auto', 0.30),
  ('09bdefa9-20bb-4c1c-8648-edb26dd57abc', 501, 'ai_auto', 0.30);

-- West Pharmaceutical Services (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('3286026d-7414-4e6b-9a25-47709364e159', 154, 'ai_auto', 0.40),
  ('3286026d-7414-4e6b-9a25-47709364e159', 153, 'ai_auto', 0.30),
  ('3286026d-7414-4e6b-9a25-47709364e159', 155, 'ai_auto', 0.30),
  ('3286026d-7414-4e6b-9a25-47709364e159', 156, 'ai_auto', 0.30),
  ('3286026d-7414-4e6b-9a25-47709364e159', 498, 'ai_auto', 0.30),
  ('3286026d-7414-4e6b-9a25-47709364e159', 499, 'ai_auto', 0.30),
  ('3286026d-7414-4e6b-9a25-47709364e159', 500, 'ai_auto', 0.30),
  ('3286026d-7414-4e6b-9a25-47709364e159', 501, 'ai_auto', 0.30),
  ('3286026d-7414-4e6b-9a25-47709364e159', 149, 'ai_auto', 0.12),
  ('3286026d-7414-4e6b-9a25-47709364e159', 492, 'ai_auto', 0.12);

-- Getinge (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('d05bb7c2-46fa-40fe-95d4-e25c120c4e39', 32, 'ai_auto', 0.30),
  ('d05bb7c2-46fa-40fe-95d4-e25c120c4e39', 33, 'ai_auto', 0.30),
  ('d05bb7c2-46fa-40fe-95d4-e25c120c4e39', 34, 'ai_auto', 0.30),
  ('d05bb7c2-46fa-40fe-95d4-e25c120c4e39', 35, 'ai_auto', 0.30),
  ('d05bb7c2-46fa-40fe-95d4-e25c120c4e39', 36, 'ai_auto', 0.30),
  ('d05bb7c2-46fa-40fe-95d4-e25c120c4e39', 37, 'ai_auto', 0.30),
  ('d05bb7c2-46fa-40fe-95d4-e25c120c4e39', 382, 'ai_auto', 0.30),
  ('d05bb7c2-46fa-40fe-95d4-e25c120c4e39', 383, 'ai_auto', 0.30),
  ('d05bb7c2-46fa-40fe-95d4-e25c120c4e39', 384, 'ai_auto', 0.30),
  ('d05bb7c2-46fa-40fe-95d4-e25c120c4e39', 385, 'ai_auto', 0.30);

-- Drager (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('6774e63c-77f0-42b3-9cc1-80b88215e412', 32, 'ai_auto', 0.30),
  ('6774e63c-77f0-42b3-9cc1-80b88215e412', 33, 'ai_auto', 0.30),
  ('6774e63c-77f0-42b3-9cc1-80b88215e412', 34, 'ai_auto', 0.30),
  ('6774e63c-77f0-42b3-9cc1-80b88215e412', 35, 'ai_auto', 0.30),
  ('6774e63c-77f0-42b3-9cc1-80b88215e412', 36, 'ai_auto', 0.30),
  ('6774e63c-77f0-42b3-9cc1-80b88215e412', 37, 'ai_auto', 0.30),
  ('6774e63c-77f0-42b3-9cc1-80b88215e412', 382, 'ai_auto', 0.30),
  ('6774e63c-77f0-42b3-9cc1-80b88215e412', 383, 'ai_auto', 0.30),
  ('6774e63c-77f0-42b3-9cc1-80b88215e412', 384, 'ai_auto', 0.30),
  ('6774e63c-77f0-42b3-9cc1-80b88215e412', 385, 'ai_auto', 0.30);

-- Fisher & Paykel Healthcare (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('7af813c1-4218-4268-b49d-79050dc9ebd4', 32, 'ai_auto', 0.30),
  ('7af813c1-4218-4268-b49d-79050dc9ebd4', 33, 'ai_auto', 0.30),
  ('7af813c1-4218-4268-b49d-79050dc9ebd4', 34, 'ai_auto', 0.30),
  ('7af813c1-4218-4268-b49d-79050dc9ebd4', 35, 'ai_auto', 0.30),
  ('7af813c1-4218-4268-b49d-79050dc9ebd4', 36, 'ai_auto', 0.30),
  ('7af813c1-4218-4268-b49d-79050dc9ebd4', 37, 'ai_auto', 0.30),
  ('7af813c1-4218-4268-b49d-79050dc9ebd4', 382, 'ai_auto', 0.30),
  ('7af813c1-4218-4268-b49d-79050dc9ebd4', 383, 'ai_auto', 0.30),
  ('7af813c1-4218-4268-b49d-79050dc9ebd4', 384, 'ai_auto', 0.30),
  ('7af813c1-4218-4268-b49d-79050dc9ebd4', 385, 'ai_auto', 0.30);

-- Vyaire Medical (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('52b65d4a-4678-47b6-bec4-cbe5a90433ef', 32, 'ai_auto', 0.30),
  ('52b65d4a-4678-47b6-bec4-cbe5a90433ef', 33, 'ai_auto', 0.30),
  ('52b65d4a-4678-47b6-bec4-cbe5a90433ef', 34, 'ai_auto', 0.30),
  ('52b65d4a-4678-47b6-bec4-cbe5a90433ef', 35, 'ai_auto', 0.30),
  ('52b65d4a-4678-47b6-bec4-cbe5a90433ef', 36, 'ai_auto', 0.30),
  ('52b65d4a-4678-47b6-bec4-cbe5a90433ef', 37, 'ai_auto', 0.30),
  ('52b65d4a-4678-47b6-bec4-cbe5a90433ef', 382, 'ai_auto', 0.30),
  ('52b65d4a-4678-47b6-bec4-cbe5a90433ef', 383, 'ai_auto', 0.30),
  ('52b65d4a-4678-47b6-bec4-cbe5a90433ef', 384, 'ai_auto', 0.30),
  ('52b65d4a-4678-47b6-bec4-cbe5a90433ef', 385, 'ai_auto', 0.30);

-- Masimo (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('1def45a5-e711-402a-b0c2-b4b0fb673466', 32, 'ai_auto', 0.30),
  ('1def45a5-e711-402a-b0c2-b4b0fb673466', 33, 'ai_auto', 0.30),
  ('1def45a5-e711-402a-b0c2-b4b0fb673466', 34, 'ai_auto', 0.30),
  ('1def45a5-e711-402a-b0c2-b4b0fb673466', 35, 'ai_auto', 0.30),
  ('1def45a5-e711-402a-b0c2-b4b0fb673466', 36, 'ai_auto', 0.30),
  ('1def45a5-e711-402a-b0c2-b4b0fb673466', 37, 'ai_auto', 0.30),
  ('1def45a5-e711-402a-b0c2-b4b0fb673466', 382, 'ai_auto', 0.30),
  ('1def45a5-e711-402a-b0c2-b4b0fb673466', 383, 'ai_auto', 0.30),
  ('1def45a5-e711-402a-b0c2-b4b0fb673466', 384, 'ai_auto', 0.30),
  ('1def45a5-e711-402a-b0c2-b4b0fb673466', 385, 'ai_auto', 0.30);

-- Medtronic Respiratory (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('987d8315-077f-44a6-bb0d-16b030a7d5ac', 36, 'ai_auto', 0.37),
  ('987d8315-077f-44a6-bb0d-16b030a7d5ac', 32, 'ai_auto', 0.30),
  ('987d8315-077f-44a6-bb0d-16b030a7d5ac', 33, 'ai_auto', 0.30),
  ('987d8315-077f-44a6-bb0d-16b030a7d5ac', 34, 'ai_auto', 0.30),
  ('987d8315-077f-44a6-bb0d-16b030a7d5ac', 35, 'ai_auto', 0.30),
  ('987d8315-077f-44a6-bb0d-16b030a7d5ac', 37, 'ai_auto', 0.30),
  ('987d8315-077f-44a6-bb0d-16b030a7d5ac', 382, 'ai_auto', 0.30),
  ('987d8315-077f-44a6-bb0d-16b030a7d5ac', 383, 'ai_auto', 0.30),
  ('987d8315-077f-44a6-bb0d-16b030a7d5ac', 384, 'ai_auto', 0.30),
  ('987d8315-077f-44a6-bb0d-16b030a7d5ac', 385, 'ai_auto', 0.30);

-- ResMed (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('b0084338-2ad2-42e9-8f43-cd7f9890ee5c', 32, 'ai_auto', 0.30),
  ('b0084338-2ad2-42e9-8f43-cd7f9890ee5c', 33, 'ai_auto', 0.30),
  ('b0084338-2ad2-42e9-8f43-cd7f9890ee5c', 34, 'ai_auto', 0.30),
  ('b0084338-2ad2-42e9-8f43-cd7f9890ee5c', 35, 'ai_auto', 0.30),
  ('b0084338-2ad2-42e9-8f43-cd7f9890ee5c', 36, 'ai_auto', 0.30),
  ('b0084338-2ad2-42e9-8f43-cd7f9890ee5c', 37, 'ai_auto', 0.30),
  ('b0084338-2ad2-42e9-8f43-cd7f9890ee5c', 382, 'ai_auto', 0.30),
  ('b0084338-2ad2-42e9-8f43-cd7f9890ee5c', 383, 'ai_auto', 0.30),
  ('b0084338-2ad2-42e9-8f43-cd7f9890ee5c', 384, 'ai_auto', 0.30),
  ('b0084338-2ad2-42e9-8f43-cd7f9890ee5c', 385, 'ai_auto', 0.30);

-- Philips Respironics (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('e6549419-c47b-4034-8f96-0fa758c9e3b9', 32, 'ai_auto', 0.30),
  ('e6549419-c47b-4034-8f96-0fa758c9e3b9', 33, 'ai_auto', 0.30),
  ('e6549419-c47b-4034-8f96-0fa758c9e3b9', 34, 'ai_auto', 0.30),
  ('e6549419-c47b-4034-8f96-0fa758c9e3b9', 35, 'ai_auto', 0.30),
  ('e6549419-c47b-4034-8f96-0fa758c9e3b9', 36, 'ai_auto', 0.30),
  ('e6549419-c47b-4034-8f96-0fa758c9e3b9', 37, 'ai_auto', 0.30),
  ('e6549419-c47b-4034-8f96-0fa758c9e3b9', 382, 'ai_auto', 0.30),
  ('e6549419-c47b-4034-8f96-0fa758c9e3b9', 383, 'ai_auto', 0.30),
  ('e6549419-c47b-4034-8f96-0fa758c9e3b9', 384, 'ai_auto', 0.30),
  ('e6549419-c47b-4034-8f96-0fa758c9e3b9', 385, 'ai_auto', 0.30);

-- Hamilton Medical (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('c238a178-d20a-4462-be43-84dc1cfeaead', 32, 'ai_auto', 0.30),
  ('c238a178-d20a-4462-be43-84dc1cfeaead', 33, 'ai_auto', 0.30),
  ('c238a178-d20a-4462-be43-84dc1cfeaead', 34, 'ai_auto', 0.30),
  ('c238a178-d20a-4462-be43-84dc1cfeaead', 35, 'ai_auto', 0.30),
  ('c238a178-d20a-4462-be43-84dc1cfeaead', 36, 'ai_auto', 0.30),
  ('c238a178-d20a-4462-be43-84dc1cfeaead', 37, 'ai_auto', 0.30),
  ('c238a178-d20a-4462-be43-84dc1cfeaead', 382, 'ai_auto', 0.30),
  ('c238a178-d20a-4462-be43-84dc1cfeaead', 383, 'ai_auto', 0.30),
  ('c238a178-d20a-4462-be43-84dc1cfeaead', 384, 'ai_auto', 0.30),
  ('c238a178-d20a-4462-be43-84dc1cfeaead', 385, 'ai_auto', 0.30);

-- Mindray Anesthesia (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('260096a1-6c31-449f-8dad-5f2de22e500b', 32, 'ai_auto', 0.40),
  ('260096a1-6c31-449f-8dad-5f2de22e500b', 33, 'ai_auto', 0.30),
  ('260096a1-6c31-449f-8dad-5f2de22e500b', 34, 'ai_auto', 0.30),
  ('260096a1-6c31-449f-8dad-5f2de22e500b', 35, 'ai_auto', 0.30),
  ('260096a1-6c31-449f-8dad-5f2de22e500b', 36, 'ai_auto', 0.30),
  ('260096a1-6c31-449f-8dad-5f2de22e500b', 37, 'ai_auto', 0.30),
  ('260096a1-6c31-449f-8dad-5f2de22e500b', 382, 'ai_auto', 0.30),
  ('260096a1-6c31-449f-8dad-5f2de22e500b', 383, 'ai_auto', 0.30),
  ('260096a1-6c31-449f-8dad-5f2de22e500b', 384, 'ai_auto', 0.30),
  ('260096a1-6c31-449f-8dad-5f2de22e500b', 385, 'ai_auto', 0.30);

-- GE Anesthesia (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('04b21bd4-76ab-48f4-b063-c760a7f2e5cf', 32, 'ai_auto', 0.40),
  ('04b21bd4-76ab-48f4-b063-c760a7f2e5cf', 33, 'ai_auto', 0.30),
  ('04b21bd4-76ab-48f4-b063-c760a7f2e5cf', 34, 'ai_auto', 0.30),
  ('04b21bd4-76ab-48f4-b063-c760a7f2e5cf', 35, 'ai_auto', 0.30),
  ('04b21bd4-76ab-48f4-b063-c760a7f2e5cf', 36, 'ai_auto', 0.30),
  ('04b21bd4-76ab-48f4-b063-c760a7f2e5cf', 37, 'ai_auto', 0.30),
  ('04b21bd4-76ab-48f4-b063-c760a7f2e5cf', 382, 'ai_auto', 0.30),
  ('04b21bd4-76ab-48f4-b063-c760a7f2e5cf', 383, 'ai_auto', 0.30),
  ('04b21bd4-76ab-48f4-b063-c760a7f2e5cf', 384, 'ai_auto', 0.30),
  ('04b21bd4-76ab-48f4-b063-c760a7f2e5cf', 385, 'ai_auto', 0.30);

-- Breas Medical (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('68d7cc2f-ddf2-43f9-b85a-4956168386b9', 32, 'ai_auto', 0.30),
  ('68d7cc2f-ddf2-43f9-b85a-4956168386b9', 33, 'ai_auto', 0.30),
  ('68d7cc2f-ddf2-43f9-b85a-4956168386b9', 34, 'ai_auto', 0.30),
  ('68d7cc2f-ddf2-43f9-b85a-4956168386b9', 35, 'ai_auto', 0.30),
  ('68d7cc2f-ddf2-43f9-b85a-4956168386b9', 36, 'ai_auto', 0.30),
  ('68d7cc2f-ddf2-43f9-b85a-4956168386b9', 37, 'ai_auto', 0.30),
  ('68d7cc2f-ddf2-43f9-b85a-4956168386b9', 382, 'ai_auto', 0.30),
  ('68d7cc2f-ddf2-43f9-b85a-4956168386b9', 383, 'ai_auto', 0.30),
  ('68d7cc2f-ddf2-43f9-b85a-4956168386b9', 384, 'ai_auto', 0.30),
  ('68d7cc2f-ddf2-43f9-b85a-4956168386b9', 385, 'ai_auto', 0.30);

-- Lowenstein Medical (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('5adf0368-a80f-4bc1-a700-0470770331f3', 32, 'ai_auto', 0.30),
  ('5adf0368-a80f-4bc1-a700-0470770331f3', 33, 'ai_auto', 0.30),
  ('5adf0368-a80f-4bc1-a700-0470770331f3', 34, 'ai_auto', 0.30),
  ('5adf0368-a80f-4bc1-a700-0470770331f3', 35, 'ai_auto', 0.30),
  ('5adf0368-a80f-4bc1-a700-0470770331f3', 36, 'ai_auto', 0.30),
  ('5adf0368-a80f-4bc1-a700-0470770331f3', 37, 'ai_auto', 0.30),
  ('5adf0368-a80f-4bc1-a700-0470770331f3', 382, 'ai_auto', 0.30),
  ('5adf0368-a80f-4bc1-a700-0470770331f3', 383, 'ai_auto', 0.30),
  ('5adf0368-a80f-4bc1-a700-0470770331f3', 384, 'ai_auto', 0.30),
  ('5adf0368-a80f-4bc1-a700-0470770331f3', 385, 'ai_auto', 0.30);

-- Nihon Kohden (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('fb342f81-3d31-4af2-8ba4-d34f2475231f', 32, 'ai_auto', 0.30),
  ('fb342f81-3d31-4af2-8ba4-d34f2475231f', 33, 'ai_auto', 0.30),
  ('fb342f81-3d31-4af2-8ba4-d34f2475231f', 34, 'ai_auto', 0.30),
  ('fb342f81-3d31-4af2-8ba4-d34f2475231f', 35, 'ai_auto', 0.30),
  ('fb342f81-3d31-4af2-8ba4-d34f2475231f', 36, 'ai_auto', 0.30),
  ('fb342f81-3d31-4af2-8ba4-d34f2475231f', 37, 'ai_auto', 0.30),
  ('fb342f81-3d31-4af2-8ba4-d34f2475231f', 382, 'ai_auto', 0.30),
  ('fb342f81-3d31-4af2-8ba4-d34f2475231f', 383, 'ai_auto', 0.30),
  ('fb342f81-3d31-4af2-8ba4-d34f2475231f', 384, 'ai_auto', 0.30),
  ('fb342f81-3d31-4af2-8ba4-d34f2475231f', 385, 'ai_auto', 0.30);

-- SenTec (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('7c59b995-e40f-4ec8-b3f4-c74f4729103c', 32, 'ai_auto', 0.30),
  ('7c59b995-e40f-4ec8-b3f4-c74f4729103c', 33, 'ai_auto', 0.30),
  ('7c59b995-e40f-4ec8-b3f4-c74f4729103c', 34, 'ai_auto', 0.30),
  ('7c59b995-e40f-4ec8-b3f4-c74f4729103c', 35, 'ai_auto', 0.30),
  ('7c59b995-e40f-4ec8-b3f4-c74f4729103c', 36, 'ai_auto', 0.30),
  ('7c59b995-e40f-4ec8-b3f4-c74f4729103c', 37, 'ai_auto', 0.30),
  ('7c59b995-e40f-4ec8-b3f4-c74f4729103c', 382, 'ai_auto', 0.30),
  ('7c59b995-e40f-4ec8-b3f4-c74f4729103c', 383, 'ai_auto', 0.30),
  ('7c59b995-e40f-4ec8-b3f4-c74f4729103c', 384, 'ai_auto', 0.30),
  ('7c59b995-e40f-4ec8-b3f4-c74f4729103c', 385, 'ai_auto', 0.30);

-- Nonin Medical (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('dfc642a0-55ad-46b2-814d-4baa8f41d567', 99, 'ai_auto', 0.30),
  ('dfc642a0-55ad-46b2-814d-4baa8f41d567', 100, 'ai_auto', 0.30),
  ('dfc642a0-55ad-46b2-814d-4baa8f41d567', 101, 'ai_auto', 0.30),
  ('dfc642a0-55ad-46b2-814d-4baa8f41d567', 102, 'ai_auto', 0.30),
  ('dfc642a0-55ad-46b2-814d-4baa8f41d567', 103, 'ai_auto', 0.30),
  ('dfc642a0-55ad-46b2-814d-4baa8f41d567', 446, 'ai_auto', 0.30),
  ('dfc642a0-55ad-46b2-814d-4baa8f41d567', 447, 'ai_auto', 0.30),
  ('dfc642a0-55ad-46b2-814d-4baa8f41d567', 448, 'ai_auto', 0.30),
  ('dfc642a0-55ad-46b2-814d-4baa8f41d567', 449, 'ai_auto', 0.30),
  ('dfc642a0-55ad-46b2-814d-4baa8f41d567', 450, 'ai_auto', 0.30);

-- Dexcom (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('8021637e-b34b-4361-998c-de249bcca77b', 99, 'ai_auto', 0.30),
  ('8021637e-b34b-4361-998c-de249bcca77b', 100, 'ai_auto', 0.30),
  ('8021637e-b34b-4361-998c-de249bcca77b', 101, 'ai_auto', 0.30),
  ('8021637e-b34b-4361-998c-de249bcca77b', 102, 'ai_auto', 0.30),
  ('8021637e-b34b-4361-998c-de249bcca77b', 103, 'ai_auto', 0.30),
  ('8021637e-b34b-4361-998c-de249bcca77b', 446, 'ai_auto', 0.30),
  ('8021637e-b34b-4361-998c-de249bcca77b', 447, 'ai_auto', 0.30),
  ('8021637e-b34b-4361-998c-de249bcca77b', 448, 'ai_auto', 0.30),
  ('8021637e-b34b-4361-998c-de249bcca77b', 449, 'ai_auto', 0.30),
  ('8021637e-b34b-4361-998c-de249bcca77b', 450, 'ai_auto', 0.30);

-- Abbott FreeStyle Libre (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('56fd7129-3ece-4116-952f-bcbef411f81e', 99, 'ai_auto', 0.30),
  ('56fd7129-3ece-4116-952f-bcbef411f81e', 100, 'ai_auto', 0.30),
  ('56fd7129-3ece-4116-952f-bcbef411f81e', 101, 'ai_auto', 0.30),
  ('56fd7129-3ece-4116-952f-bcbef411f81e', 102, 'ai_auto', 0.30),
  ('56fd7129-3ece-4116-952f-bcbef411f81e', 103, 'ai_auto', 0.30),
  ('56fd7129-3ece-4116-952f-bcbef411f81e', 446, 'ai_auto', 0.30),
  ('56fd7129-3ece-4116-952f-bcbef411f81e', 447, 'ai_auto', 0.30),
  ('56fd7129-3ece-4116-952f-bcbef411f81e', 448, 'ai_auto', 0.30),
  ('56fd7129-3ece-4116-952f-bcbef411f81e', 449, 'ai_auto', 0.30),
  ('56fd7129-3ece-4116-952f-bcbef411f81e', 450, 'ai_auto', 0.30);

-- Medtronic Diabetes (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('2387d5fd-4a0b-4111-b7fc-691dc899a7f7', 99, 'ai_auto', 0.30),
  ('2387d5fd-4a0b-4111-b7fc-691dc899a7f7', 100, 'ai_auto', 0.30),
  ('2387d5fd-4a0b-4111-b7fc-691dc899a7f7', 101, 'ai_auto', 0.30),
  ('2387d5fd-4a0b-4111-b7fc-691dc899a7f7', 102, 'ai_auto', 0.30),
  ('2387d5fd-4a0b-4111-b7fc-691dc899a7f7', 103, 'ai_auto', 0.30),
  ('2387d5fd-4a0b-4111-b7fc-691dc899a7f7', 446, 'ai_auto', 0.30),
  ('2387d5fd-4a0b-4111-b7fc-691dc899a7f7', 447, 'ai_auto', 0.30),
  ('2387d5fd-4a0b-4111-b7fc-691dc899a7f7', 448, 'ai_auto', 0.30),
  ('2387d5fd-4a0b-4111-b7fc-691dc899a7f7', 449, 'ai_auto', 0.30),
  ('2387d5fd-4a0b-4111-b7fc-691dc899a7f7', 450, 'ai_auto', 0.30);

-- Insulet (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('0e8197cb-539b-490f-ac20-d2f02c893a7f', 99, 'ai_auto', 0.30),
  ('0e8197cb-539b-490f-ac20-d2f02c893a7f', 100, 'ai_auto', 0.30),
  ('0e8197cb-539b-490f-ac20-d2f02c893a7f', 101, 'ai_auto', 0.30),
  ('0e8197cb-539b-490f-ac20-d2f02c893a7f', 102, 'ai_auto', 0.30),
  ('0e8197cb-539b-490f-ac20-d2f02c893a7f', 103, 'ai_auto', 0.30),
  ('0e8197cb-539b-490f-ac20-d2f02c893a7f', 446, 'ai_auto', 0.30),
  ('0e8197cb-539b-490f-ac20-d2f02c893a7f', 447, 'ai_auto', 0.30),
  ('0e8197cb-539b-490f-ac20-d2f02c893a7f', 448, 'ai_auto', 0.30),
  ('0e8197cb-539b-490f-ac20-d2f02c893a7f', 449, 'ai_auto', 0.30),
  ('0e8197cb-539b-490f-ac20-d2f02c893a7f', 450, 'ai_auto', 0.30);

-- Tandem Diabetes (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('129eeb62-d95a-4d10-8a58-5573be8cb80a', 99, 'ai_auto', 0.30),
  ('129eeb62-d95a-4d10-8a58-5573be8cb80a', 100, 'ai_auto', 0.30),
  ('129eeb62-d95a-4d10-8a58-5573be8cb80a', 101, 'ai_auto', 0.30),
  ('129eeb62-d95a-4d10-8a58-5573be8cb80a', 102, 'ai_auto', 0.30),
  ('129eeb62-d95a-4d10-8a58-5573be8cb80a', 103, 'ai_auto', 0.30),
  ('129eeb62-d95a-4d10-8a58-5573be8cb80a', 446, 'ai_auto', 0.30),
  ('129eeb62-d95a-4d10-8a58-5573be8cb80a', 447, 'ai_auto', 0.30),
  ('129eeb62-d95a-4d10-8a58-5573be8cb80a', 448, 'ai_auto', 0.30),
  ('129eeb62-d95a-4d10-8a58-5573be8cb80a', 449, 'ai_auto', 0.30),
  ('129eeb62-d95a-4d10-8a58-5573be8cb80a', 450, 'ai_auto', 0.30);

-- Roche Diabetes Care (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('2481b14f-76ab-4f78-ad22-4e4fb9e18559', 99, 'ai_auto', 0.30),
  ('2481b14f-76ab-4f78-ad22-4e4fb9e18559', 100, 'ai_auto', 0.30),
  ('2481b14f-76ab-4f78-ad22-4e4fb9e18559', 101, 'ai_auto', 0.30),
  ('2481b14f-76ab-4f78-ad22-4e4fb9e18559', 102, 'ai_auto', 0.30),
  ('2481b14f-76ab-4f78-ad22-4e4fb9e18559', 103, 'ai_auto', 0.30),
  ('2481b14f-76ab-4f78-ad22-4e4fb9e18559', 446, 'ai_auto', 0.30),
  ('2481b14f-76ab-4f78-ad22-4e4fb9e18559', 447, 'ai_auto', 0.30),
  ('2481b14f-76ab-4f78-ad22-4e4fb9e18559', 448, 'ai_auto', 0.30),
  ('2481b14f-76ab-4f78-ad22-4e4fb9e18559', 449, 'ai_auto', 0.30),
  ('2481b14f-76ab-4f78-ad22-4e4fb9e18559', 450, 'ai_auto', 0.30);

-- Ascensia (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('be30bfbe-4fff-4eb8-8e28-e285caabd298', 99, 'ai_auto', 0.30),
  ('be30bfbe-4fff-4eb8-8e28-e285caabd298', 100, 'ai_auto', 0.30),
  ('be30bfbe-4fff-4eb8-8e28-e285caabd298', 101, 'ai_auto', 0.30),
  ('be30bfbe-4fff-4eb8-8e28-e285caabd298', 102, 'ai_auto', 0.30),
  ('be30bfbe-4fff-4eb8-8e28-e285caabd298', 103, 'ai_auto', 0.30),
  ('be30bfbe-4fff-4eb8-8e28-e285caabd298', 446, 'ai_auto', 0.30),
  ('be30bfbe-4fff-4eb8-8e28-e285caabd298', 447, 'ai_auto', 0.30),
  ('be30bfbe-4fff-4eb8-8e28-e285caabd298', 448, 'ai_auto', 0.30),
  ('be30bfbe-4fff-4eb8-8e28-e285caabd298', 449, 'ai_auto', 0.30),
  ('be30bfbe-4fff-4eb8-8e28-e285caabd298', 450, 'ai_auto', 0.30);

-- LifeScan (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('6f239e05-e1ed-462a-92be-c68c1f4c8fe9', 99, 'ai_auto', 0.30),
  ('6f239e05-e1ed-462a-92be-c68c1f4c8fe9', 100, 'ai_auto', 0.30),
  ('6f239e05-e1ed-462a-92be-c68c1f4c8fe9', 101, 'ai_auto', 0.30),
  ('6f239e05-e1ed-462a-92be-c68c1f4c8fe9', 102, 'ai_auto', 0.30),
  ('6f239e05-e1ed-462a-92be-c68c1f4c8fe9', 103, 'ai_auto', 0.30),
  ('6f239e05-e1ed-462a-92be-c68c1f4c8fe9', 446, 'ai_auto', 0.30),
  ('6f239e05-e1ed-462a-92be-c68c1f4c8fe9', 447, 'ai_auto', 0.30),
  ('6f239e05-e1ed-462a-92be-c68c1f4c8fe9', 448, 'ai_auto', 0.30),
  ('6f239e05-e1ed-462a-92be-c68c1f4c8fe9', 449, 'ai_auto', 0.30),
  ('6f239e05-e1ed-462a-92be-c68c1f4c8fe9', 450, 'ai_auto', 0.30);

-- Senseonics (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('3cf30083-b812-4971-b96b-638d487d4d7f', 99, 'ai_auto', 0.30),
  ('3cf30083-b812-4971-b96b-638d487d4d7f', 100, 'ai_auto', 0.30),
  ('3cf30083-b812-4971-b96b-638d487d4d7f', 101, 'ai_auto', 0.30),
  ('3cf30083-b812-4971-b96b-638d487d4d7f', 102, 'ai_auto', 0.30),
  ('3cf30083-b812-4971-b96b-638d487d4d7f', 103, 'ai_auto', 0.30),
  ('3cf30083-b812-4971-b96b-638d487d4d7f', 446, 'ai_auto', 0.30),
  ('3cf30083-b812-4971-b96b-638d487d4d7f', 447, 'ai_auto', 0.30),
  ('3cf30083-b812-4971-b96b-638d487d4d7f', 448, 'ai_auto', 0.30),
  ('3cf30083-b812-4971-b96b-638d487d4d7f', 449, 'ai_auto', 0.30),
  ('3cf30083-b812-4971-b96b-638d487d4d7f', 450, 'ai_auto', 0.30);

-- Beta Bionics (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('e4702098-6930-4916-ab2c-be3f02a3d90b', 99, 'ai_auto', 0.30),
  ('e4702098-6930-4916-ab2c-be3f02a3d90b', 100, 'ai_auto', 0.30),
  ('e4702098-6930-4916-ab2c-be3f02a3d90b', 101, 'ai_auto', 0.30),
  ('e4702098-6930-4916-ab2c-be3f02a3d90b', 102, 'ai_auto', 0.30),
  ('e4702098-6930-4916-ab2c-be3f02a3d90b', 103, 'ai_auto', 0.30),
  ('e4702098-6930-4916-ab2c-be3f02a3d90b', 446, 'ai_auto', 0.30),
  ('e4702098-6930-4916-ab2c-be3f02a3d90b', 447, 'ai_auto', 0.30),
  ('e4702098-6930-4916-ab2c-be3f02a3d90b', 448, 'ai_auto', 0.30),
  ('e4702098-6930-4916-ab2c-be3f02a3d90b', 449, 'ai_auto', 0.30),
  ('e4702098-6930-4916-ab2c-be3f02a3d90b', 450, 'ai_auto', 0.30);

-- Bigfoot Biomedical (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('6fa607df-0437-48f1-a3c0-539a215b4129', 99, 'ai_auto', 0.30),
  ('6fa607df-0437-48f1-a3c0-539a215b4129', 100, 'ai_auto', 0.30),
  ('6fa607df-0437-48f1-a3c0-539a215b4129', 101, 'ai_auto', 0.30),
  ('6fa607df-0437-48f1-a3c0-539a215b4129', 102, 'ai_auto', 0.30),
  ('6fa607df-0437-48f1-a3c0-539a215b4129', 103, 'ai_auto', 0.30),
  ('6fa607df-0437-48f1-a3c0-539a215b4129', 446, 'ai_auto', 0.30),
  ('6fa607df-0437-48f1-a3c0-539a215b4129', 447, 'ai_auto', 0.30),
  ('6fa607df-0437-48f1-a3c0-539a215b4129', 448, 'ai_auto', 0.30),
  ('6fa607df-0437-48f1-a3c0-539a215b4129', 449, 'ai_auto', 0.30),
  ('6fa607df-0437-48f1-a3c0-539a215b4129', 450, 'ai_auto', 0.30);

-- Masimo Patient Monitoring (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('a4987cfc-89e4-43d9-87f7-3e18cd3006f5', 100, 'ai_auto', 0.40),
  ('a4987cfc-89e4-43d9-87f7-3e18cd3006f5', 103, 'ai_auto', 0.40),
  ('a4987cfc-89e4-43d9-87f7-3e18cd3006f5', 450, 'ai_auto', 0.37),
  ('a4987cfc-89e4-43d9-87f7-3e18cd3006f5', 99, 'ai_auto', 0.30),
  ('a4987cfc-89e4-43d9-87f7-3e18cd3006f5', 101, 'ai_auto', 0.30),
  ('a4987cfc-89e4-43d9-87f7-3e18cd3006f5', 102, 'ai_auto', 0.30),
  ('a4987cfc-89e4-43d9-87f7-3e18cd3006f5', 446, 'ai_auto', 0.30),
  ('a4987cfc-89e4-43d9-87f7-3e18cd3006f5', 447, 'ai_auto', 0.30),
  ('a4987cfc-89e4-43d9-87f7-3e18cd3006f5', 448, 'ai_auto', 0.30),
  ('a4987cfc-89e4-43d9-87f7-3e18cd3006f5', 449, 'ai_auto', 0.30);

-- Philips Patient Monitoring (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('d12c7bfb-a25e-452f-8081-55629a025000', 100, 'ai_auto', 0.40),
  ('d12c7bfb-a25e-452f-8081-55629a025000', 103, 'ai_auto', 0.40),
  ('d12c7bfb-a25e-452f-8081-55629a025000', 450, 'ai_auto', 0.37),
  ('d12c7bfb-a25e-452f-8081-55629a025000', 99, 'ai_auto', 0.30),
  ('d12c7bfb-a25e-452f-8081-55629a025000', 101, 'ai_auto', 0.30),
  ('d12c7bfb-a25e-452f-8081-55629a025000', 102, 'ai_auto', 0.30),
  ('d12c7bfb-a25e-452f-8081-55629a025000', 446, 'ai_auto', 0.30),
  ('d12c7bfb-a25e-452f-8081-55629a025000', 447, 'ai_auto', 0.30),
  ('d12c7bfb-a25e-452f-8081-55629a025000', 448, 'ai_auto', 0.30),
  ('d12c7bfb-a25e-452f-8081-55629a025000', 449, 'ai_auto', 0.30);

-- GE Patient Monitoring (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('e9c06c33-d230-44f5-ab33-102bcbe97f63', 100, 'ai_auto', 0.40),
  ('e9c06c33-d230-44f5-ab33-102bcbe97f63', 103, 'ai_auto', 0.40),
  ('e9c06c33-d230-44f5-ab33-102bcbe97f63', 450, 'ai_auto', 0.37),
  ('e9c06c33-d230-44f5-ab33-102bcbe97f63', 99, 'ai_auto', 0.30),
  ('e9c06c33-d230-44f5-ab33-102bcbe97f63', 101, 'ai_auto', 0.30),
  ('e9c06c33-d230-44f5-ab33-102bcbe97f63', 102, 'ai_auto', 0.30),
  ('e9c06c33-d230-44f5-ab33-102bcbe97f63', 446, 'ai_auto', 0.30),
  ('e9c06c33-d230-44f5-ab33-102bcbe97f63', 447, 'ai_auto', 0.30),
  ('e9c06c33-d230-44f5-ab33-102bcbe97f63', 448, 'ai_auto', 0.30),
  ('e9c06c33-d230-44f5-ab33-102bcbe97f63', 449, 'ai_auto', 0.30);

-- Nihon Kohden Monitoring (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('7ce289f0-fb3f-47dd-8e56-2832fac4cfba', 100, 'ai_auto', 0.40),
  ('7ce289f0-fb3f-47dd-8e56-2832fac4cfba', 450, 'ai_auto', 0.37),
  ('7ce289f0-fb3f-47dd-8e56-2832fac4cfba', 99, 'ai_auto', 0.30),
  ('7ce289f0-fb3f-47dd-8e56-2832fac4cfba', 101, 'ai_auto', 0.30),
  ('7ce289f0-fb3f-47dd-8e56-2832fac4cfba', 102, 'ai_auto', 0.30),
  ('7ce289f0-fb3f-47dd-8e56-2832fac4cfba', 103, 'ai_auto', 0.30),
  ('7ce289f0-fb3f-47dd-8e56-2832fac4cfba', 446, 'ai_auto', 0.30),
  ('7ce289f0-fb3f-47dd-8e56-2832fac4cfba', 447, 'ai_auto', 0.30),
  ('7ce289f0-fb3f-47dd-8e56-2832fac4cfba', 448, 'ai_auto', 0.30),
  ('7ce289f0-fb3f-47dd-8e56-2832fac4cfba', 449, 'ai_auto', 0.30);

-- Mindray Monitoring (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('fc2ae650-f4c1-46e1-ab2b-2ca3950e4e22', 100, 'ai_auto', 0.40),
  ('fc2ae650-f4c1-46e1-ab2b-2ca3950e4e22', 450, 'ai_auto', 0.37),
  ('fc2ae650-f4c1-46e1-ab2b-2ca3950e4e22', 99, 'ai_auto', 0.30),
  ('fc2ae650-f4c1-46e1-ab2b-2ca3950e4e22', 101, 'ai_auto', 0.30),
  ('fc2ae650-f4c1-46e1-ab2b-2ca3950e4e22', 102, 'ai_auto', 0.30),
  ('fc2ae650-f4c1-46e1-ab2b-2ca3950e4e22', 103, 'ai_auto', 0.30),
  ('fc2ae650-f4c1-46e1-ab2b-2ca3950e4e22', 446, 'ai_auto', 0.30),
  ('fc2ae650-f4c1-46e1-ab2b-2ca3950e4e22', 447, 'ai_auto', 0.30),
  ('fc2ae650-f4c1-46e1-ab2b-2ca3950e4e22', 448, 'ai_auto', 0.30),
  ('fc2ae650-f4c1-46e1-ab2b-2ca3950e4e22', 449, 'ai_auto', 0.30);

-- Spacelabs Healthcare (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('d17d59f7-e90a-4a98-bf09-30a72b7e0eba', 99, 'ai_auto', 0.30),
  ('d17d59f7-e90a-4a98-bf09-30a72b7e0eba', 100, 'ai_auto', 0.30),
  ('d17d59f7-e90a-4a98-bf09-30a72b7e0eba', 101, 'ai_auto', 0.30),
  ('d17d59f7-e90a-4a98-bf09-30a72b7e0eba', 102, 'ai_auto', 0.30),
  ('d17d59f7-e90a-4a98-bf09-30a72b7e0eba', 103, 'ai_auto', 0.30),
  ('d17d59f7-e90a-4a98-bf09-30a72b7e0eba', 446, 'ai_auto', 0.30),
  ('d17d59f7-e90a-4a98-bf09-30a72b7e0eba', 447, 'ai_auto', 0.30),
  ('d17d59f7-e90a-4a98-bf09-30a72b7e0eba', 448, 'ai_auto', 0.30),
  ('d17d59f7-e90a-4a98-bf09-30a72b7e0eba', 449, 'ai_auto', 0.30),
  ('d17d59f7-e90a-4a98-bf09-30a72b7e0eba', 450, 'ai_auto', 0.30);

-- Welch Allyn (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('bb5b9d17-f38d-407d-a759-52733fc89bea', 99, 'ai_auto', 0.30),
  ('bb5b9d17-f38d-407d-a759-52733fc89bea', 100, 'ai_auto', 0.30),
  ('bb5b9d17-f38d-407d-a759-52733fc89bea', 101, 'ai_auto', 0.30),
  ('bb5b9d17-f38d-407d-a759-52733fc89bea', 102, 'ai_auto', 0.30),
  ('bb5b9d17-f38d-407d-a759-52733fc89bea', 103, 'ai_auto', 0.30),
  ('bb5b9d17-f38d-407d-a759-52733fc89bea', 446, 'ai_auto', 0.30),
  ('bb5b9d17-f38d-407d-a759-52733fc89bea', 447, 'ai_auto', 0.30),
  ('bb5b9d17-f38d-407d-a759-52733fc89bea', 448, 'ai_auto', 0.30),
  ('bb5b9d17-f38d-407d-a759-52733fc89bea', 449, 'ai_auto', 0.30),
  ('bb5b9d17-f38d-407d-a759-52733fc89bea', 450, 'ai_auto', 0.30);

-- Natus Medical (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('b0ee1455-64b4-4657-9898-c8bfe51ee1dd', 99, 'ai_auto', 0.30),
  ('b0ee1455-64b4-4657-9898-c8bfe51ee1dd', 100, 'ai_auto', 0.30),
  ('b0ee1455-64b4-4657-9898-c8bfe51ee1dd', 101, 'ai_auto', 0.30),
  ('b0ee1455-64b4-4657-9898-c8bfe51ee1dd', 102, 'ai_auto', 0.30),
  ('b0ee1455-64b4-4657-9898-c8bfe51ee1dd', 103, 'ai_auto', 0.30),
  ('b0ee1455-64b4-4657-9898-c8bfe51ee1dd', 446, 'ai_auto', 0.30),
  ('b0ee1455-64b4-4657-9898-c8bfe51ee1dd', 447, 'ai_auto', 0.30),
  ('b0ee1455-64b4-4657-9898-c8bfe51ee1dd', 448, 'ai_auto', 0.30),
  ('b0ee1455-64b4-4657-9898-c8bfe51ee1dd', 449, 'ai_auto', 0.30),
  ('b0ee1455-64b4-4657-9898-c8bfe51ee1dd', 450, 'ai_auto', 0.30);

-- Olympus Endoscopy (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('8a7b097a-b12e-4333-a637-d12709316c50', 50, 'ai_auto', 1.00),
  ('8a7b097a-b12e-4333-a637-d12709316c50', 402, 'ai_auto', 0.40),
  ('8a7b097a-b12e-4333-a637-d12709316c50', 51, 'ai_auto', 0.30),
  ('8a7b097a-b12e-4333-a637-d12709316c50', 52, 'ai_auto', 0.30),
  ('8a7b097a-b12e-4333-a637-d12709316c50', 53, 'ai_auto', 0.30),
  ('8a7b097a-b12e-4333-a637-d12709316c50', 54, 'ai_auto', 0.30),
  ('8a7b097a-b12e-4333-a637-d12709316c50', 403, 'ai_auto', 0.30),
  ('8a7b097a-b12e-4333-a637-d12709316c50', 404, 'ai_auto', 0.30),
  ('8a7b097a-b12e-4333-a637-d12709316c50', 405, 'ai_auto', 0.30),
  ('8a7b097a-b12e-4333-a637-d12709316c50', 406, 'ai_auto', 0.30);

-- Boston Scientific Endoscopy (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('5056f135-ccb0-4330-8dfb-b85bcdb5ac8f', 50, 'ai_auto', 1.00),
  ('5056f135-ccb0-4330-8dfb-b85bcdb5ac8f', 402, 'ai_auto', 0.40),
  ('5056f135-ccb0-4330-8dfb-b85bcdb5ac8f', 51, 'ai_auto', 0.30),
  ('5056f135-ccb0-4330-8dfb-b85bcdb5ac8f', 52, 'ai_auto', 0.30),
  ('5056f135-ccb0-4330-8dfb-b85bcdb5ac8f', 53, 'ai_auto', 0.30),
  ('5056f135-ccb0-4330-8dfb-b85bcdb5ac8f', 54, 'ai_auto', 0.30),
  ('5056f135-ccb0-4330-8dfb-b85bcdb5ac8f', 403, 'ai_auto', 0.30),
  ('5056f135-ccb0-4330-8dfb-b85bcdb5ac8f', 404, 'ai_auto', 0.30),
  ('5056f135-ccb0-4330-8dfb-b85bcdb5ac8f', 405, 'ai_auto', 0.30),
  ('5056f135-ccb0-4330-8dfb-b85bcdb5ac8f', 406, 'ai_auto', 0.30);

-- Fujifilm Endoscopy (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('e9d985ea-a811-4f64-bdbb-d2f526b2b022', 50, 'ai_auto', 1.00),
  ('e9d985ea-a811-4f64-bdbb-d2f526b2b022', 402, 'ai_auto', 0.40),
  ('e9d985ea-a811-4f64-bdbb-d2f526b2b022', 51, 'ai_auto', 0.30),
  ('e9d985ea-a811-4f64-bdbb-d2f526b2b022', 52, 'ai_auto', 0.30),
  ('e9d985ea-a811-4f64-bdbb-d2f526b2b022', 53, 'ai_auto', 0.30),
  ('e9d985ea-a811-4f64-bdbb-d2f526b2b022', 54, 'ai_auto', 0.30),
  ('e9d985ea-a811-4f64-bdbb-d2f526b2b022', 403, 'ai_auto', 0.30),
  ('e9d985ea-a811-4f64-bdbb-d2f526b2b022', 404, 'ai_auto', 0.30),
  ('e9d985ea-a811-4f64-bdbb-d2f526b2b022', 405, 'ai_auto', 0.30),
  ('e9d985ea-a811-4f64-bdbb-d2f526b2b022', 406, 'ai_auto', 0.30);

-- Pentax Medical (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('545c5de8-ba24-43a1-8bc0-717260502a97', 50, 'ai_auto', 0.30),
  ('545c5de8-ba24-43a1-8bc0-717260502a97', 51, 'ai_auto', 0.30),
  ('545c5de8-ba24-43a1-8bc0-717260502a97', 52, 'ai_auto', 0.30),
  ('545c5de8-ba24-43a1-8bc0-717260502a97', 53, 'ai_auto', 0.30),
  ('545c5de8-ba24-43a1-8bc0-717260502a97', 54, 'ai_auto', 0.30),
  ('545c5de8-ba24-43a1-8bc0-717260502a97', 402, 'ai_auto', 0.30),
  ('545c5de8-ba24-43a1-8bc0-717260502a97', 403, 'ai_auto', 0.30),
  ('545c5de8-ba24-43a1-8bc0-717260502a97', 404, 'ai_auto', 0.30),
  ('545c5de8-ba24-43a1-8bc0-717260502a97', 405, 'ai_auto', 0.30),
  ('545c5de8-ba24-43a1-8bc0-717260502a97', 406, 'ai_auto', 0.30);

-- Karl Storz Endoscopy (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('8c1381df-6517-45e3-a627-955e55fbed90', 50, 'ai_auto', 1.00),
  ('8c1381df-6517-45e3-a627-955e55fbed90', 402, 'ai_auto', 0.40),
  ('8c1381df-6517-45e3-a627-955e55fbed90', 51, 'ai_auto', 0.30),
  ('8c1381df-6517-45e3-a627-955e55fbed90', 52, 'ai_auto', 0.30),
  ('8c1381df-6517-45e3-a627-955e55fbed90', 53, 'ai_auto', 0.30),
  ('8c1381df-6517-45e3-a627-955e55fbed90', 54, 'ai_auto', 0.30),
  ('8c1381df-6517-45e3-a627-955e55fbed90', 403, 'ai_auto', 0.30),
  ('8c1381df-6517-45e3-a627-955e55fbed90', 404, 'ai_auto', 0.30),
  ('8c1381df-6517-45e3-a627-955e55fbed90', 405, 'ai_auto', 0.30),
  ('8c1381df-6517-45e3-a627-955e55fbed90', 406, 'ai_auto', 0.30);

-- Medtronic GI (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('d2ded401-3d19-4c76-a917-7ecbaa4c4538', 50, 'ai_auto', 0.30),
  ('d2ded401-3d19-4c76-a917-7ecbaa4c4538', 51, 'ai_auto', 0.30),
  ('d2ded401-3d19-4c76-a917-7ecbaa4c4538', 52, 'ai_auto', 0.30),
  ('d2ded401-3d19-4c76-a917-7ecbaa4c4538', 53, 'ai_auto', 0.30),
  ('d2ded401-3d19-4c76-a917-7ecbaa4c4538', 54, 'ai_auto', 0.30),
  ('d2ded401-3d19-4c76-a917-7ecbaa4c4538', 402, 'ai_auto', 0.30),
  ('d2ded401-3d19-4c76-a917-7ecbaa4c4538', 403, 'ai_auto', 0.30),
  ('d2ded401-3d19-4c76-a917-7ecbaa4c4538', 404, 'ai_auto', 0.30),
  ('d2ded401-3d19-4c76-a917-7ecbaa4c4538', 405, 'ai_auto', 0.30),
  ('d2ded401-3d19-4c76-a917-7ecbaa4c4538', 406, 'ai_auto', 0.30);

-- Cook Medical GI (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('89bd1d0b-2877-4a78-8dec-917dc85edfd9', 50, 'ai_auto', 0.30),
  ('89bd1d0b-2877-4a78-8dec-917dc85edfd9', 51, 'ai_auto', 0.30),
  ('89bd1d0b-2877-4a78-8dec-917dc85edfd9', 52, 'ai_auto', 0.30),
  ('89bd1d0b-2877-4a78-8dec-917dc85edfd9', 53, 'ai_auto', 0.30),
  ('89bd1d0b-2877-4a78-8dec-917dc85edfd9', 54, 'ai_auto', 0.30),
  ('89bd1d0b-2877-4a78-8dec-917dc85edfd9', 402, 'ai_auto', 0.30),
  ('89bd1d0b-2877-4a78-8dec-917dc85edfd9', 403, 'ai_auto', 0.30),
  ('89bd1d0b-2877-4a78-8dec-917dc85edfd9', 404, 'ai_auto', 0.30),
  ('89bd1d0b-2877-4a78-8dec-917dc85edfd9', 405, 'ai_auto', 0.30),
  ('89bd1d0b-2877-4a78-8dec-917dc85edfd9', 406, 'ai_auto', 0.30);

-- ConMed GI (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('f05d2684-8516-4694-838c-e941e85bc79c', 50, 'ai_auto', 0.30),
  ('f05d2684-8516-4694-838c-e941e85bc79c', 51, 'ai_auto', 0.30),
  ('f05d2684-8516-4694-838c-e941e85bc79c', 52, 'ai_auto', 0.30),
  ('f05d2684-8516-4694-838c-e941e85bc79c', 53, 'ai_auto', 0.30),
  ('f05d2684-8516-4694-838c-e941e85bc79c', 54, 'ai_auto', 0.30),
  ('f05d2684-8516-4694-838c-e941e85bc79c', 402, 'ai_auto', 0.30),
  ('f05d2684-8516-4694-838c-e941e85bc79c', 403, 'ai_auto', 0.30),
  ('f05d2684-8516-4694-838c-e941e85bc79c', 404, 'ai_auto', 0.30),
  ('f05d2684-8516-4694-838c-e941e85bc79c', 405, 'ai_auto', 0.30),
  ('f05d2684-8516-4694-838c-e941e85bc79c', 406, 'ai_auto', 0.30);

-- Ambu (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('f1a54feb-fe4d-4df8-b62f-6df85d3b3fff', 50, 'ai_auto', 0.30),
  ('f1a54feb-fe4d-4df8-b62f-6df85d3b3fff', 51, 'ai_auto', 0.30),
  ('f1a54feb-fe4d-4df8-b62f-6df85d3b3fff', 52, 'ai_auto', 0.30),
  ('f1a54feb-fe4d-4df8-b62f-6df85d3b3fff', 53, 'ai_auto', 0.30),
  ('f1a54feb-fe4d-4df8-b62f-6df85d3b3fff', 54, 'ai_auto', 0.30),
  ('f1a54feb-fe4d-4df8-b62f-6df85d3b3fff', 402, 'ai_auto', 0.30),
  ('f1a54feb-fe4d-4df8-b62f-6df85d3b3fff', 403, 'ai_auto', 0.30),
  ('f1a54feb-fe4d-4df8-b62f-6df85d3b3fff', 404, 'ai_auto', 0.30),
  ('f1a54feb-fe4d-4df8-b62f-6df85d3b3fff', 405, 'ai_auto', 0.30),
  ('f1a54feb-fe4d-4df8-b62f-6df85d3b3fff', 406, 'ai_auto', 0.30);

-- US Endoscopy (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('ff566142-7563-45fb-aa5d-007c7f05647e', 50, 'ai_auto', 1.00),
  ('ff566142-7563-45fb-aa5d-007c7f05647e', 402, 'ai_auto', 0.40),
  ('ff566142-7563-45fb-aa5d-007c7f05647e', 51, 'ai_auto', 0.30),
  ('ff566142-7563-45fb-aa5d-007c7f05647e', 52, 'ai_auto', 0.30),
  ('ff566142-7563-45fb-aa5d-007c7f05647e', 53, 'ai_auto', 0.30),
  ('ff566142-7563-45fb-aa5d-007c7f05647e', 54, 'ai_auto', 0.30),
  ('ff566142-7563-45fb-aa5d-007c7f05647e', 403, 'ai_auto', 0.30),
  ('ff566142-7563-45fb-aa5d-007c7f05647e', 404, 'ai_auto', 0.30),
  ('ff566142-7563-45fb-aa5d-007c7f05647e', 405, 'ai_auto', 0.30),
  ('ff566142-7563-45fb-aa5d-007c7f05647e', 406, 'ai_auto', 0.30);

-- Endo-Technik (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('87450353-b953-426c-b623-090d3a5f7746', 50, 'ai_auto', 0.30),
  ('87450353-b953-426c-b623-090d3a5f7746', 51, 'ai_auto', 0.30),
  ('87450353-b953-426c-b623-090d3a5f7746', 52, 'ai_auto', 0.30),
  ('87450353-b953-426c-b623-090d3a5f7746', 53, 'ai_auto', 0.30),
  ('87450353-b953-426c-b623-090d3a5f7746', 54, 'ai_auto', 0.30),
  ('87450353-b953-426c-b623-090d3a5f7746', 402, 'ai_auto', 0.30),
  ('87450353-b953-426c-b623-090d3a5f7746', 403, 'ai_auto', 0.30),
  ('87450353-b953-426c-b623-090d3a5f7746', 404, 'ai_auto', 0.30),
  ('87450353-b953-426c-b623-090d3a5f7746', 405, 'ai_auto', 0.30),
  ('87450353-b953-426c-b623-090d3a5f7746', 406, 'ai_auto', 0.30);

-- STERIS Endoscopy (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('4f9c8415-20d5-4b25-9d42-dfd7ce568990', 50, 'ai_auto', 1.00),
  ('4f9c8415-20d5-4b25-9d42-dfd7ce568990', 402, 'ai_auto', 0.40),
  ('4f9c8415-20d5-4b25-9d42-dfd7ce568990', 51, 'ai_auto', 0.30),
  ('4f9c8415-20d5-4b25-9d42-dfd7ce568990', 52, 'ai_auto', 0.30),
  ('4f9c8415-20d5-4b25-9d42-dfd7ce568990', 53, 'ai_auto', 0.30),
  ('4f9c8415-20d5-4b25-9d42-dfd7ce568990', 54, 'ai_auto', 0.30),
  ('4f9c8415-20d5-4b25-9d42-dfd7ce568990', 403, 'ai_auto', 0.30),
  ('4f9c8415-20d5-4b25-9d42-dfd7ce568990', 404, 'ai_auto', 0.30),
  ('4f9c8415-20d5-4b25-9d42-dfd7ce568990', 405, 'ai_auto', 0.30),
  ('4f9c8415-20d5-4b25-9d42-dfd7ce568990', 406, 'ai_auto', 0.30);

-- Cantel Medical (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('4c2c7f2b-b2a0-4d09-8d3f-3a6ae72e8d61', 50, 'ai_auto', 0.30),
  ('4c2c7f2b-b2a0-4d09-8d3f-3a6ae72e8d61', 51, 'ai_auto', 0.30),
  ('4c2c7f2b-b2a0-4d09-8d3f-3a6ae72e8d61', 52, 'ai_auto', 0.30),
  ('4c2c7f2b-b2a0-4d09-8d3f-3a6ae72e8d61', 53, 'ai_auto', 0.30),
  ('4c2c7f2b-b2a0-4d09-8d3f-3a6ae72e8d61', 54, 'ai_auto', 0.30),
  ('4c2c7f2b-b2a0-4d09-8d3f-3a6ae72e8d61', 402, 'ai_auto', 0.30),
  ('4c2c7f2b-b2a0-4d09-8d3f-3a6ae72e8d61', 403, 'ai_auto', 0.30),
  ('4c2c7f2b-b2a0-4d09-8d3f-3a6ae72e8d61', 404, 'ai_auto', 0.30),
  ('4c2c7f2b-b2a0-4d09-8d3f-3a6ae72e8d61', 405, 'ai_auto', 0.30),
  ('4c2c7f2b-b2a0-4d09-8d3f-3a6ae72e8d61', 406, 'ai_auto', 0.30);

-- NovaBay Pharmaceuticals (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('3dc34120-78f4-4000-984e-180eea8b31b8', 50, 'ai_auto', 0.30),
  ('3dc34120-78f4-4000-984e-180eea8b31b8', 51, 'ai_auto', 0.30),
  ('3dc34120-78f4-4000-984e-180eea8b31b8', 52, 'ai_auto', 0.30),
  ('3dc34120-78f4-4000-984e-180eea8b31b8', 53, 'ai_auto', 0.30),
  ('3dc34120-78f4-4000-984e-180eea8b31b8', 54, 'ai_auto', 0.30),
  ('3dc34120-78f4-4000-984e-180eea8b31b8', 402, 'ai_auto', 0.30),
  ('3dc34120-78f4-4000-984e-180eea8b31b8', 403, 'ai_auto', 0.30),
  ('3dc34120-78f4-4000-984e-180eea8b31b8', 404, 'ai_auto', 0.30),
  ('3dc34120-78f4-4000-984e-180eea8b31b8', 405, 'ai_auto', 0.30),
  ('3dc34120-78f4-4000-984e-180eea8b31b8', 406, 'ai_auto', 0.30);

-- Cogentix Medical (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('48c433f4-08cc-4dbc-b11a-94e0ddaa03b4', 50, 'ai_auto', 0.30),
  ('48c433f4-08cc-4dbc-b11a-94e0ddaa03b4', 51, 'ai_auto', 0.30),
  ('48c433f4-08cc-4dbc-b11a-94e0ddaa03b4', 52, 'ai_auto', 0.30),
  ('48c433f4-08cc-4dbc-b11a-94e0ddaa03b4', 53, 'ai_auto', 0.30),
  ('48c433f4-08cc-4dbc-b11a-94e0ddaa03b4', 54, 'ai_auto', 0.30),
  ('48c433f4-08cc-4dbc-b11a-94e0ddaa03b4', 402, 'ai_auto', 0.30),
  ('48c433f4-08cc-4dbc-b11a-94e0ddaa03b4', 403, 'ai_auto', 0.30),
  ('48c433f4-08cc-4dbc-b11a-94e0ddaa03b4', 404, 'ai_auto', 0.30),
  ('48c433f4-08cc-4dbc-b11a-94e0ddaa03b4', 405, 'ai_auto', 0.30),
  ('48c433f4-08cc-4dbc-b11a-94e0ddaa03b4', 406, 'ai_auto', 0.30);

-- Medline Industries (8 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('f8aa4aad-8b9d-4a55-8796-ac33ed1493cd', 223, 'ai_auto', 0.37),
  ('f8aa4aad-8b9d-4a55-8796-ac33ed1493cd', 224, 'ai_auto', 0.30),
  ('f8aa4aad-8b9d-4a55-8796-ac33ed1493cd', 225, 'ai_auto', 0.30),
  ('f8aa4aad-8b9d-4a55-8796-ac33ed1493cd', 226, 'ai_auto', 0.30),
  ('f8aa4aad-8b9d-4a55-8796-ac33ed1493cd', 561, 'ai_auto', 0.30),
  ('f8aa4aad-8b9d-4a55-8796-ac33ed1493cd', 562, 'ai_auto', 0.30),
  ('f8aa4aad-8b9d-4a55-8796-ac33ed1493cd', 563, 'ai_auto', 0.30),
  ('f8aa4aad-8b9d-4a55-8796-ac33ed1493cd', 564, 'ai_auto', 0.30);

-- Owens & Minor (8 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('c58cd15e-8c0c-479c-b5ff-e21b5ffb4f74', 223, 'ai_auto', 0.30),
  ('c58cd15e-8c0c-479c-b5ff-e21b5ffb4f74', 224, 'ai_auto', 0.30),
  ('c58cd15e-8c0c-479c-b5ff-e21b5ffb4f74', 225, 'ai_auto', 0.30),
  ('c58cd15e-8c0c-479c-b5ff-e21b5ffb4f74', 226, 'ai_auto', 0.30),
  ('c58cd15e-8c0c-479c-b5ff-e21b5ffb4f74', 561, 'ai_auto', 0.30),
  ('c58cd15e-8c0c-479c-b5ff-e21b5ffb4f74', 562, 'ai_auto', 0.30),
  ('c58cd15e-8c0c-479c-b5ff-e21b5ffb4f74', 563, 'ai_auto', 0.30),
  ('c58cd15e-8c0c-479c-b5ff-e21b5ffb4f74', 564, 'ai_auto', 0.30);

-- Cardinal Health (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('b40625e3-93a1-4614-bfbe-5cfe17608d93', 223, 'ai_auto', 0.30),
  ('b40625e3-93a1-4614-bfbe-5cfe17608d93', 224, 'ai_auto', 0.30),
  ('b40625e3-93a1-4614-bfbe-5cfe17608d93', 225, 'ai_auto', 0.30),
  ('b40625e3-93a1-4614-bfbe-5cfe17608d93', 226, 'ai_auto', 0.30),
  ('b40625e3-93a1-4614-bfbe-5cfe17608d93', 561, 'ai_auto', 0.30),
  ('b40625e3-93a1-4614-bfbe-5cfe17608d93', 562, 'ai_auto', 0.30),
  ('b40625e3-93a1-4614-bfbe-5cfe17608d93', 563, 'ai_auto', 0.30),
  ('b40625e3-93a1-4614-bfbe-5cfe17608d93', 564, 'ai_auto', 0.30),
  ('b40625e3-93a1-4614-bfbe-5cfe17608d93', 252, 'ai_auto', 0.10),
  ('b40625e3-93a1-4614-bfbe-5cfe17608d93', 347, 'ai_auto', 0.10);

-- Henry Schein (8 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('3428fb68-5f18-4394-8996-0cce69d75b69', 223, 'ai_auto', 0.30),
  ('3428fb68-5f18-4394-8996-0cce69d75b69', 224, 'ai_auto', 0.30),
  ('3428fb68-5f18-4394-8996-0cce69d75b69', 225, 'ai_auto', 0.30),
  ('3428fb68-5f18-4394-8996-0cce69d75b69', 226, 'ai_auto', 0.30),
  ('3428fb68-5f18-4394-8996-0cce69d75b69', 561, 'ai_auto', 0.30),
  ('3428fb68-5f18-4394-8996-0cce69d75b69', 562, 'ai_auto', 0.30),
  ('3428fb68-5f18-4394-8996-0cce69d75b69', 563, 'ai_auto', 0.30),
  ('3428fb68-5f18-4394-8996-0cce69d75b69', 564, 'ai_auto', 0.30);

-- McKesson Medical-Surgical (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('3bcd555b-f112-40cf-af2a-810e0a57cbbe', 223, 'ai_auto', 0.43),
  ('3bcd555b-f112-40cf-af2a-810e0a57cbbe', 224, 'ai_auto', 0.30),
  ('3bcd555b-f112-40cf-af2a-810e0a57cbbe', 225, 'ai_auto', 0.30),
  ('3bcd555b-f112-40cf-af2a-810e0a57cbbe', 226, 'ai_auto', 0.30),
  ('3bcd555b-f112-40cf-af2a-810e0a57cbbe', 561, 'ai_auto', 0.30),
  ('3bcd555b-f112-40cf-af2a-810e0a57cbbe', 562, 'ai_auto', 0.30),
  ('3bcd555b-f112-40cf-af2a-810e0a57cbbe', 563, 'ai_auto', 0.30),
  ('3bcd555b-f112-40cf-af2a-810e0a57cbbe', 564, 'ai_auto', 0.30),
  ('3bcd555b-f112-40cf-af2a-810e0a57cbbe', 18, 'ai_auto', 0.10),
  ('3bcd555b-f112-40cf-af2a-810e0a57cbbe', 43, 'ai_auto', 0.10);

-- NDC (8 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('403a54d6-0525-4b38-9fdb-7d45a6532988', 223, 'ai_auto', 0.30),
  ('403a54d6-0525-4b38-9fdb-7d45a6532988', 224, 'ai_auto', 0.30),
  ('403a54d6-0525-4b38-9fdb-7d45a6532988', 225, 'ai_auto', 0.30),
  ('403a54d6-0525-4b38-9fdb-7d45a6532988', 226, 'ai_auto', 0.30),
  ('403a54d6-0525-4b38-9fdb-7d45a6532988', 561, 'ai_auto', 0.30),
  ('403a54d6-0525-4b38-9fdb-7d45a6532988', 562, 'ai_auto', 0.30),
  ('403a54d6-0525-4b38-9fdb-7d45a6532988', 563, 'ai_auto', 0.30),
  ('403a54d6-0525-4b38-9fdb-7d45a6532988', 564, 'ai_auto', 0.30);

-- Midmark (8 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('b0c84721-ccbd-45ef-9323-2fc4336c9dda', 223, 'ai_auto', 0.30),
  ('b0c84721-ccbd-45ef-9323-2fc4336c9dda', 224, 'ai_auto', 0.30),
  ('b0c84721-ccbd-45ef-9323-2fc4336c9dda', 225, 'ai_auto', 0.30),
  ('b0c84721-ccbd-45ef-9323-2fc4336c9dda', 226, 'ai_auto', 0.30),
  ('b0c84721-ccbd-45ef-9323-2fc4336c9dda', 561, 'ai_auto', 0.30),
  ('b0c84721-ccbd-45ef-9323-2fc4336c9dda', 562, 'ai_auto', 0.30),
  ('b0c84721-ccbd-45ef-9323-2fc4336c9dda', 563, 'ai_auto', 0.30),
  ('b0c84721-ccbd-45ef-9323-2fc4336c9dda', 564, 'ai_auto', 0.30);

-- Dukal (8 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('5476ee92-7bcb-4acb-838c-6c1f2926bebf', 223, 'ai_auto', 0.30),
  ('5476ee92-7bcb-4acb-838c-6c1f2926bebf', 224, 'ai_auto', 0.30),
  ('5476ee92-7bcb-4acb-838c-6c1f2926bebf', 225, 'ai_auto', 0.30),
  ('5476ee92-7bcb-4acb-838c-6c1f2926bebf', 226, 'ai_auto', 0.30),
  ('5476ee92-7bcb-4acb-838c-6c1f2926bebf', 561, 'ai_auto', 0.30),
  ('5476ee92-7bcb-4acb-838c-6c1f2926bebf', 562, 'ai_auto', 0.30),
  ('5476ee92-7bcb-4acb-838c-6c1f2926bebf', 563, 'ai_auto', 0.30),
  ('5476ee92-7bcb-4acb-838c-6c1f2926bebf', 564, 'ai_auto', 0.30);

-- Dynarex (8 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('5f6a0c89-8c5e-4f3e-bfea-ab0d027014e2', 223, 'ai_auto', 0.30),
  ('5f6a0c89-8c5e-4f3e-bfea-ab0d027014e2', 224, 'ai_auto', 0.30),
  ('5f6a0c89-8c5e-4f3e-bfea-ab0d027014e2', 225, 'ai_auto', 0.30),
  ('5f6a0c89-8c5e-4f3e-bfea-ab0d027014e2', 226, 'ai_auto', 0.30),
  ('5f6a0c89-8c5e-4f3e-bfea-ab0d027014e2', 561, 'ai_auto', 0.30),
  ('5f6a0c89-8c5e-4f3e-bfea-ab0d027014e2', 562, 'ai_auto', 0.30),
  ('5f6a0c89-8c5e-4f3e-bfea-ab0d027014e2', 563, 'ai_auto', 0.30),
  ('5f6a0c89-8c5e-4f3e-bfea-ab0d027014e2', 564, 'ai_auto', 0.30);

-- Halyard Health (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('02db8e5b-d093-488f-b95b-b6ec55f42e7f', 223, 'ai_auto', 0.30),
  ('02db8e5b-d093-488f-b95b-b6ec55f42e7f', 224, 'ai_auto', 0.30),
  ('02db8e5b-d093-488f-b95b-b6ec55f42e7f', 225, 'ai_auto', 0.30),
  ('02db8e5b-d093-488f-b95b-b6ec55f42e7f', 226, 'ai_auto', 0.30),
  ('02db8e5b-d093-488f-b95b-b6ec55f42e7f', 561, 'ai_auto', 0.30),
  ('02db8e5b-d093-488f-b95b-b6ec55f42e7f', 562, 'ai_auto', 0.30),
  ('02db8e5b-d093-488f-b95b-b6ec55f42e7f', 563, 'ai_auto', 0.30),
  ('02db8e5b-d093-488f-b95b-b6ec55f42e7f', 564, 'ai_auto', 0.30),
  ('02db8e5b-d093-488f-b95b-b6ec55f42e7f', 252, 'ai_auto', 0.10),
  ('02db8e5b-d093-488f-b95b-b6ec55f42e7f', 347, 'ai_auto', 0.10);

-- Ansell (8 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('33c06a6c-feab-4758-8ea5-0ffcdba1ca79', 223, 'ai_auto', 0.30),
  ('33c06a6c-feab-4758-8ea5-0ffcdba1ca79', 224, 'ai_auto', 0.30),
  ('33c06a6c-feab-4758-8ea5-0ffcdba1ca79', 225, 'ai_auto', 0.30),
  ('33c06a6c-feab-4758-8ea5-0ffcdba1ca79', 226, 'ai_auto', 0.30),
  ('33c06a6c-feab-4758-8ea5-0ffcdba1ca79', 561, 'ai_auto', 0.30),
  ('33c06a6c-feab-4758-8ea5-0ffcdba1ca79', 562, 'ai_auto', 0.30),
  ('33c06a6c-feab-4758-8ea5-0ffcdba1ca79', 563, 'ai_auto', 0.30),
  ('33c06a6c-feab-4758-8ea5-0ffcdba1ca79', 564, 'ai_auto', 0.30);

-- Molnlycke Distribution (8 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('63463eaa-4ddb-4452-8036-c59a7cfa2545', 226, 'ai_auto', 0.40),
  ('63463eaa-4ddb-4452-8036-c59a7cfa2545', 561, 'ai_auto', 0.40),
  ('63463eaa-4ddb-4452-8036-c59a7cfa2545', 223, 'ai_auto', 0.30),
  ('63463eaa-4ddb-4452-8036-c59a7cfa2545', 224, 'ai_auto', 0.30),
  ('63463eaa-4ddb-4452-8036-c59a7cfa2545', 225, 'ai_auto', 0.30),
  ('63463eaa-4ddb-4452-8036-c59a7cfa2545', 562, 'ai_auto', 0.30),
  ('63463eaa-4ddb-4452-8036-c59a7cfa2545', 563, 'ai_auto', 0.30),
  ('63463eaa-4ddb-4452-8036-c59a7cfa2545', 564, 'ai_auto', 0.30);

-- Encompass Group (8 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('df878956-d127-4bf5-a09d-188fd00532e2', 223, 'ai_auto', 0.30),
  ('df878956-d127-4bf5-a09d-188fd00532e2', 224, 'ai_auto', 0.30),
  ('df878956-d127-4bf5-a09d-188fd00532e2', 225, 'ai_auto', 0.30),
  ('df878956-d127-4bf5-a09d-188fd00532e2', 226, 'ai_auto', 0.30),
  ('df878956-d127-4bf5-a09d-188fd00532e2', 561, 'ai_auto', 0.30),
  ('df878956-d127-4bf5-a09d-188fd00532e2', 562, 'ai_auto', 0.30),
  ('df878956-d127-4bf5-a09d-188fd00532e2', 563, 'ai_auto', 0.30),
  ('df878956-d127-4bf5-a09d-188fd00532e2', 564, 'ai_auto', 0.30);

-- Standard Textile (8 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('2b1126a8-f875-4a14-952d-e06e3ae4dccb', 223, 'ai_auto', 0.30),
  ('2b1126a8-f875-4a14-952d-e06e3ae4dccb', 224, 'ai_auto', 0.30),
  ('2b1126a8-f875-4a14-952d-e06e3ae4dccb', 225, 'ai_auto', 0.30),
  ('2b1126a8-f875-4a14-952d-e06e3ae4dccb', 226, 'ai_auto', 0.30),
  ('2b1126a8-f875-4a14-952d-e06e3ae4dccb', 561, 'ai_auto', 0.30),
  ('2b1126a8-f875-4a14-952d-e06e3ae4dccb', 562, 'ai_auto', 0.30),
  ('2b1126a8-f875-4a14-952d-e06e3ae4dccb', 563, 'ai_auto', 0.30),
  ('2b1126a8-f875-4a14-952d-e06e3ae4dccb', 564, 'ai_auto', 0.30);

-- Bovie Medical (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('7b9fb966-34c9-44f0-a756-1bfbed062a9e', 223, 'ai_auto', 0.37),
  ('7b9fb966-34c9-44f0-a756-1bfbed062a9e', 224, 'ai_auto', 0.30),
  ('7b9fb966-34c9-44f0-a756-1bfbed062a9e', 225, 'ai_auto', 0.30),
  ('7b9fb966-34c9-44f0-a756-1bfbed062a9e', 226, 'ai_auto', 0.30),
  ('7b9fb966-34c9-44f0-a756-1bfbed062a9e', 561, 'ai_auto', 0.30),
  ('7b9fb966-34c9-44f0-a756-1bfbed062a9e', 562, 'ai_auto', 0.30),
  ('7b9fb966-34c9-44f0-a756-1bfbed062a9e', 563, 'ai_auto', 0.30),
  ('7b9fb966-34c9-44f0-a756-1bfbed062a9e', 564, 'ai_auto', 0.30),
  ('7b9fb966-34c9-44f0-a756-1bfbed062a9e', 280, 'ai_auto', 0.10),
  ('7b9fb966-34c9-44f0-a756-1bfbed062a9e', 285, 'ai_auto', 0.10);

-- Symmetry Surgical (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('f479718a-8f43-4f6b-a143-b612230046ee', 223, 'ai_auto', 0.37),
  ('f479718a-8f43-4f6b-a143-b612230046ee', 224, 'ai_auto', 0.30),
  ('f479718a-8f43-4f6b-a143-b612230046ee', 225, 'ai_auto', 0.30),
  ('f479718a-8f43-4f6b-a143-b612230046ee', 226, 'ai_auto', 0.30),
  ('f479718a-8f43-4f6b-a143-b612230046ee', 561, 'ai_auto', 0.30),
  ('f479718a-8f43-4f6b-a143-b612230046ee', 562, 'ai_auto', 0.30),
  ('f479718a-8f43-4f6b-a143-b612230046ee', 563, 'ai_auto', 0.30),
  ('f479718a-8f43-4f6b-a143-b612230046ee', 564, 'ai_auto', 0.30),
  ('f479718a-8f43-4f6b-a143-b612230046ee', 18, 'ai_auto', 0.10),
  ('f479718a-8f43-4f6b-a143-b612230046ee', 43, 'ai_auto', 0.10);

-- Sklar Instruments (9 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('1c27a66d-60a1-413b-9642-bd7b4a31d78b', 223, 'ai_auto', 0.30),
  ('1c27a66d-60a1-413b-9642-bd7b4a31d78b', 224, 'ai_auto', 0.30),
  ('1c27a66d-60a1-413b-9642-bd7b4a31d78b', 225, 'ai_auto', 0.30),
  ('1c27a66d-60a1-413b-9642-bd7b4a31d78b', 226, 'ai_auto', 0.30),
  ('1c27a66d-60a1-413b-9642-bd7b4a31d78b', 561, 'ai_auto', 0.30),
  ('1c27a66d-60a1-413b-9642-bd7b4a31d78b', 562, 'ai_auto', 0.30),
  ('1c27a66d-60a1-413b-9642-bd7b4a31d78b', 563, 'ai_auto', 0.30),
  ('1c27a66d-60a1-413b-9642-bd7b4a31d78b', 564, 'ai_auto', 0.30),
  ('1c27a66d-60a1-413b-9642-bd7b4a31d78b', 397, 'ai_auto', 0.10);

-- Bound Tree Medical (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('251ab31e-c5f8-432c-aaa3-bddd4623e8ba', 223, 'ai_auto', 0.37),
  ('251ab31e-c5f8-432c-aaa3-bddd4623e8ba', 224, 'ai_auto', 0.30),
  ('251ab31e-c5f8-432c-aaa3-bddd4623e8ba', 225, 'ai_auto', 0.30),
  ('251ab31e-c5f8-432c-aaa3-bddd4623e8ba', 226, 'ai_auto', 0.30),
  ('251ab31e-c5f8-432c-aaa3-bddd4623e8ba', 561, 'ai_auto', 0.30),
  ('251ab31e-c5f8-432c-aaa3-bddd4623e8ba', 562, 'ai_auto', 0.30),
  ('251ab31e-c5f8-432c-aaa3-bddd4623e8ba', 563, 'ai_auto', 0.30),
  ('251ab31e-c5f8-432c-aaa3-bddd4623e8ba', 564, 'ai_auto', 0.30),
  ('251ab31e-c5f8-432c-aaa3-bddd4623e8ba', 280, 'ai_auto', 0.10),
  ('251ab31e-c5f8-432c-aaa3-bddd4623e8ba', 285, 'ai_auto', 0.10);

-- MedAssets (9 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('d01c8338-f963-493e-85f0-bd1a63439b4b', 223, 'ai_auto', 0.37),
  ('d01c8338-f963-493e-85f0-bd1a63439b4b', 224, 'ai_auto', 0.30),
  ('d01c8338-f963-493e-85f0-bd1a63439b4b', 225, 'ai_auto', 0.30),
  ('d01c8338-f963-493e-85f0-bd1a63439b4b', 226, 'ai_auto', 0.30),
  ('d01c8338-f963-493e-85f0-bd1a63439b4b', 561, 'ai_auto', 0.30),
  ('d01c8338-f963-493e-85f0-bd1a63439b4b', 562, 'ai_auto', 0.30),
  ('d01c8338-f963-493e-85f0-bd1a63439b4b', 563, 'ai_auto', 0.30),
  ('d01c8338-f963-493e-85f0-bd1a63439b4b', 564, 'ai_auto', 0.30),
  ('d01c8338-f963-493e-85f0-bd1a63439b4b', 236, 'ai_auto', 0.15);

-- Abbott (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('132a5395-9715-4c2e-bfda-1d3a9e7307ab', 9, 'ai_auto', 0.30),
  ('132a5395-9715-4c2e-bfda-1d3a9e7307ab', 10, 'ai_auto', 0.30),
  ('132a5395-9715-4c2e-bfda-1d3a9e7307ab', 11, 'ai_auto', 0.30),
  ('132a5395-9715-4c2e-bfda-1d3a9e7307ab', 12, 'ai_auto', 0.30),
  ('132a5395-9715-4c2e-bfda-1d3a9e7307ab', 13, 'ai_auto', 0.30),
  ('132a5395-9715-4c2e-bfda-1d3a9e7307ab', 14, 'ai_auto', 0.30),
  ('132a5395-9715-4c2e-bfda-1d3a9e7307ab', 15, 'ai_auto', 0.30),
  ('132a5395-9715-4c2e-bfda-1d3a9e7307ab', 361, 'ai_auto', 0.30),
  ('132a5395-9715-4c2e-bfda-1d3a9e7307ab', 362, 'ai_auto', 0.30),
  ('132a5395-9715-4c2e-bfda-1d3a9e7307ab', 363, 'ai_auto', 0.30);

-- Concordance Healthcare Solutions (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('c24be343-1940-4604-9cde-69a4ee697647', 223, 'ai_auto', 0.30),
  ('c24be343-1940-4604-9cde-69a4ee697647', 224, 'ai_auto', 0.30),
  ('c24be343-1940-4604-9cde-69a4ee697647', 225, 'ai_auto', 0.30),
  ('c24be343-1940-4604-9cde-69a4ee697647', 226, 'ai_auto', 0.30),
  ('c24be343-1940-4604-9cde-69a4ee697647', 561, 'ai_auto', 0.30),
  ('c24be343-1940-4604-9cde-69a4ee697647', 562, 'ai_auto', 0.30),
  ('c24be343-1940-4604-9cde-69a4ee697647', 563, 'ai_auto', 0.30),
  ('c24be343-1940-4604-9cde-69a4ee697647', 564, 'ai_auto', 0.30),
  ('c24be343-1940-4604-9cde-69a4ee697647', 319, 'ai_auto', 0.13),
  ('c24be343-1940-4604-9cde-69a4ee697647', 174, 'ai_auto', 0.10);

-- Omnicell (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('58c5935e-1c5f-4116-b90a-543cd3fa06a0', 143, 'ai_auto', 0.70),
  ('58c5935e-1c5f-4116-b90a-543cd3fa06a0', 139, 'ai_auto', 0.40),
  ('58c5935e-1c5f-4116-b90a-543cd3fa06a0', 140, 'ai_auto', 0.33),
  ('58c5935e-1c5f-4116-b90a-543cd3fa06a0', 488, 'ai_auto', 0.33),
  ('58c5935e-1c5f-4116-b90a-543cd3fa06a0', 489, 'ai_auto', 0.33),
  ('58c5935e-1c5f-4116-b90a-543cd3fa06a0', 141, 'ai_auto', 0.30),
  ('58c5935e-1c5f-4116-b90a-543cd3fa06a0', 142, 'ai_auto', 0.30),
  ('58c5935e-1c5f-4116-b90a-543cd3fa06a0', 144, 'ai_auto', 0.30),
  ('58c5935e-1c5f-4116-b90a-543cd3fa06a0', 486, 'ai_auto', 0.30),
  ('58c5935e-1c5f-4116-b90a-543cd3fa06a0', 487, 'ai_auto', 0.30);

-- BD Pyxis (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('f86ffc86-1b3a-4894-9193-089f7744be84', 139, 'ai_auto', 0.37),
  ('f86ffc86-1b3a-4894-9193-089f7744be84', 142, 'ai_auto', 0.35),
  ('f86ffc86-1b3a-4894-9193-089f7744be84', 488, 'ai_auto', 0.33),
  ('f86ffc86-1b3a-4894-9193-089f7744be84', 489, 'ai_auto', 0.33),
  ('f86ffc86-1b3a-4894-9193-089f7744be84', 140, 'ai_auto', 0.30),
  ('f86ffc86-1b3a-4894-9193-089f7744be84', 141, 'ai_auto', 0.30),
  ('f86ffc86-1b3a-4894-9193-089f7744be84', 143, 'ai_auto', 0.30),
  ('f86ffc86-1b3a-4894-9193-089f7744be84', 144, 'ai_auto', 0.30),
  ('f86ffc86-1b3a-4894-9193-089f7744be84', 338, 'ai_auto', 0.30),
  ('f86ffc86-1b3a-4894-9193-089f7744be84', 486, 'ai_auto', 0.30);

-- Parata Systems (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('083789b0-138b-49f9-8008-e29e6a82066b', 110, 'ai_auto', 0.50),
  ('083789b0-138b-49f9-8008-e29e6a82066b', 141, 'ai_auto', 0.45),
  ('083789b0-138b-49f9-8008-e29e6a82066b', 142, 'ai_auto', 0.45),
  ('083789b0-138b-49f9-8008-e29e6a82066b', 140, 'ai_auto', 0.37),
  ('083789b0-138b-49f9-8008-e29e6a82066b', 144, 'ai_auto', 0.35),
  ('083789b0-138b-49f9-8008-e29e6a82066b', 139, 'ai_auto', 0.33),
  ('083789b0-138b-49f9-8008-e29e6a82066b', 486, 'ai_auto', 0.33),
  ('083789b0-138b-49f9-8008-e29e6a82066b', 489, 'ai_auto', 0.33),
  ('083789b0-138b-49f9-8008-e29e6a82066b', 143, 'ai_auto', 0.30),
  ('083789b0-138b-49f9-8008-e29e6a82066b', 487, 'ai_auto', 0.30);

-- ARxIUM (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('8df78131-df4c-4e18-855b-4562f65eb960', 91, 'ai_auto', 0.40),
  ('8df78131-df4c-4e18-855b-4562f65eb960', 140, 'ai_auto', 0.40),
  ('8df78131-df4c-4e18-855b-4562f65eb960', 144, 'ai_auto', 0.35),
  ('8df78131-df4c-4e18-855b-4562f65eb960', 139, 'ai_auto', 0.33),
  ('8df78131-df4c-4e18-855b-4562f65eb960', 489, 'ai_auto', 0.33),
  ('8df78131-df4c-4e18-855b-4562f65eb960', 141, 'ai_auto', 0.30),
  ('8df78131-df4c-4e18-855b-4562f65eb960', 142, 'ai_auto', 0.30),
  ('8df78131-df4c-4e18-855b-4562f65eb960', 143, 'ai_auto', 0.30),
  ('8df78131-df4c-4e18-855b-4562f65eb960', 486, 'ai_auto', 0.30),
  ('8df78131-df4c-4e18-855b-4562f65eb960', 487, 'ai_auto', 0.30);

-- ScriptPro (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('ccf4cca5-058c-423b-aa3c-0d4f11e13a07', 142, 'ai_auto', 0.35),
  ('ccf4cca5-058c-423b-aa3c-0d4f11e13a07', 139, 'ai_auto', 0.33),
  ('ccf4cca5-058c-423b-aa3c-0d4f11e13a07', 140, 'ai_auto', 0.33),
  ('ccf4cca5-058c-423b-aa3c-0d4f11e13a07', 489, 'ai_auto', 0.33),
  ('ccf4cca5-058c-423b-aa3c-0d4f11e13a07', 141, 'ai_auto', 0.30),
  ('ccf4cca5-058c-423b-aa3c-0d4f11e13a07', 143, 'ai_auto', 0.30),
  ('ccf4cca5-058c-423b-aa3c-0d4f11e13a07', 144, 'ai_auto', 0.30),
  ('ccf4cca5-058c-423b-aa3c-0d4f11e13a07', 486, 'ai_auto', 0.30),
  ('ccf4cca5-058c-423b-aa3c-0d4f11e13a07', 487, 'ai_auto', 0.30),
  ('ccf4cca5-058c-423b-aa3c-0d4f11e13a07', 488, 'ai_auto', 0.30);

-- Capsa Healthcare (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('0669ce21-513f-498b-b545-0f80351ec7cf', 139, 'ai_auto', 0.70),
  ('0669ce21-513f-498b-b545-0f80351ec7cf', 140, 'ai_auto', 0.37),
  ('0669ce21-513f-498b-b545-0f80351ec7cf', 144, 'ai_auto', 0.35),
  ('0669ce21-513f-498b-b545-0f80351ec7cf', 488, 'ai_auto', 0.33),
  ('0669ce21-513f-498b-b545-0f80351ec7cf', 489, 'ai_auto', 0.33),
  ('0669ce21-513f-498b-b545-0f80351ec7cf', 141, 'ai_auto', 0.30),
  ('0669ce21-513f-498b-b545-0f80351ec7cf', 142, 'ai_auto', 0.30),
  ('0669ce21-513f-498b-b545-0f80351ec7cf', 143, 'ai_auto', 0.30),
  ('0669ce21-513f-498b-b545-0f80351ec7cf', 486, 'ai_auto', 0.30),
  ('0669ce21-513f-498b-b545-0f80351ec7cf', 487, 'ai_auto', 0.30);

-- BD Alaris (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('ab315973-ea8f-45c3-bed7-3ce93a48f1e6', 145, 'ai_auto', 0.35),
  ('ab315973-ea8f-45c3-bed7-3ce93a48f1e6', 146, 'ai_auto', 0.35),
  ('ab315973-ea8f-45c3-bed7-3ce93a48f1e6', 491, 'ai_auto', 0.33),
  ('ab315973-ea8f-45c3-bed7-3ce93a48f1e6', 147, 'ai_auto', 0.30),
  ('ab315973-ea8f-45c3-bed7-3ce93a48f1e6', 148, 'ai_auto', 0.30),
  ('ab315973-ea8f-45c3-bed7-3ce93a48f1e6', 490, 'ai_auto', 0.30),
  ('ab315973-ea8f-45c3-bed7-3ce93a48f1e6', 492, 'ai_auto', 0.30),
  ('ab315973-ea8f-45c3-bed7-3ce93a48f1e6', 499, 'ai_auto', 0.12),
  ('ab315973-ea8f-45c3-bed7-3ce93a48f1e6', 153, 'ai_auto', 0.10),
  ('ab315973-ea8f-45c3-bed7-3ce93a48f1e6', 154, 'ai_auto', 0.10);

-- Baxter International (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('59cad0c7-8d0a-481d-be3c-e6158c92a46c', 102, 'ai_auto', 0.40),
  ('59cad0c7-8d0a-481d-be3c-e6158c92a46c', 147, 'ai_auto', 0.35),
  ('59cad0c7-8d0a-481d-be3c-e6158c92a46c', 491, 'ai_auto', 0.33),
  ('59cad0c7-8d0a-481d-be3c-e6158c92a46c', 145, 'ai_auto', 0.30),
  ('59cad0c7-8d0a-481d-be3c-e6158c92a46c', 146, 'ai_auto', 0.30),
  ('59cad0c7-8d0a-481d-be3c-e6158c92a46c', 148, 'ai_auto', 0.30),
  ('59cad0c7-8d0a-481d-be3c-e6158c92a46c', 490, 'ai_auto', 0.30),
  ('59cad0c7-8d0a-481d-be3c-e6158c92a46c', 492, 'ai_auto', 0.30),
  ('59cad0c7-8d0a-481d-be3c-e6158c92a46c', 157, 'ai_auto', 0.12),
  ('59cad0c7-8d0a-481d-be3c-e6158c92a46c', 168, 'ai_auto', 0.12);

-- B. Braun Medical (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('efd4132a-e706-441a-87bb-3b0b949a0c77', 155, 'ai_auto', 0.45),
  ('efd4132a-e706-441a-87bb-3b0b949a0c77', 26, 'ai_auto', 0.40),
  ('efd4132a-e706-441a-87bb-3b0b949a0c77', 91, 'ai_auto', 0.40),
  ('efd4132a-e706-441a-87bb-3b0b949a0c77', 145, 'ai_auto', 0.35),
  ('efd4132a-e706-441a-87bb-3b0b949a0c77', 146, 'ai_auto', 0.35),
  ('efd4132a-e706-441a-87bb-3b0b949a0c77', 147, 'ai_auto', 0.35),
  ('efd4132a-e706-441a-87bb-3b0b949a0c77', 491, 'ai_auto', 0.33),
  ('efd4132a-e706-441a-87bb-3b0b949a0c77', 148, 'ai_auto', 0.30),
  ('efd4132a-e706-441a-87bb-3b0b949a0c77', 490, 'ai_auto', 0.30),
  ('efd4132a-e706-441a-87bb-3b0b949a0c77', 492, 'ai_auto', 0.30);

-- DoseMe (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('29932852-10c3-46bc-9b72-29ee5690539b', 145, 'ai_auto', 0.35),
  ('29932852-10c3-46bc-9b72-29ee5690539b', 148, 'ai_auto', 0.33),
  ('29932852-10c3-46bc-9b72-29ee5690539b', 146, 'ai_auto', 0.30),
  ('29932852-10c3-46bc-9b72-29ee5690539b', 147, 'ai_auto', 0.30),
  ('29932852-10c3-46bc-9b72-29ee5690539b', 490, 'ai_auto', 0.30),
  ('29932852-10c3-46bc-9b72-29ee5690539b', 491, 'ai_auto', 0.30),
  ('29932852-10c3-46bc-9b72-29ee5690539b', 492, 'ai_auto', 0.30),
  ('29932852-10c3-46bc-9b72-29ee5690539b', 338, 'ai_auto', 0.13),
  ('29932852-10c3-46bc-9b72-29ee5690539b', 486, 'ai_auto', 0.12),
  ('29932852-10c3-46bc-9b72-29ee5690539b', 159, 'ai_auto', 0.10);

-- Omnicell IV Solutions (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('124e0e28-720d-4ec2-aef9-30b4263bd288', 91, 'ai_auto', 0.40),
  ('124e0e28-720d-4ec2-aef9-30b4263bd288', 145, 'ai_auto', 0.40),
  ('124e0e28-720d-4ec2-aef9-30b4263bd288', 147, 'ai_auto', 0.35),
  ('124e0e28-720d-4ec2-aef9-30b4263bd288', 146, 'ai_auto', 0.30),
  ('124e0e28-720d-4ec2-aef9-30b4263bd288', 148, 'ai_auto', 0.30),
  ('124e0e28-720d-4ec2-aef9-30b4263bd288', 490, 'ai_auto', 0.30),
  ('124e0e28-720d-4ec2-aef9-30b4263bd288', 491, 'ai_auto', 0.30),
  ('124e0e28-720d-4ec2-aef9-30b4263bd288', 492, 'ai_auto', 0.30),
  ('124e0e28-720d-4ec2-aef9-30b4263bd288', 156, 'ai_auto', 0.10),
  ('124e0e28-720d-4ec2-aef9-30b4263bd288', 193, 'ai_auto', 0.10);

-- Nuvara (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('03279ef0-d4c9-4861-9d83-fc5ae7752783', 164, 'ai_auto', 0.45),
  ('03279ef0-d4c9-4861-9d83-fc5ae7752783', 497, 'ai_auto', 0.35),
  ('03279ef0-d4c9-4861-9d83-fc5ae7752783', 152, 'ai_auto', 0.33),
  ('03279ef0-d4c9-4861-9d83-fc5ae7752783', 495, 'ai_auto', 0.33),
  ('03279ef0-d4c9-4861-9d83-fc5ae7752783', 149, 'ai_auto', 0.30),
  ('03279ef0-d4c9-4861-9d83-fc5ae7752783', 150, 'ai_auto', 0.30),
  ('03279ef0-d4c9-4861-9d83-fc5ae7752783', 151, 'ai_auto', 0.30),
  ('03279ef0-d4c9-4861-9d83-fc5ae7752783', 493, 'ai_auto', 0.30),
  ('03279ef0-d4c9-4861-9d83-fc5ae7752783', 494, 'ai_auto', 0.30),
  ('03279ef0-d4c9-4861-9d83-fc5ae7752783', 496, 'ai_auto', 0.30);

-- Sentry Data Systems (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('c562a615-ff65-4e9d-87d4-8726fa64d829', 164, 'ai_auto', 0.45),
  ('c562a615-ff65-4e9d-87d4-8726fa64d829', 187, 'ai_auto', 0.40),
  ('c562a615-ff65-4e9d-87d4-8726fa64d829', 150, 'ai_auto', 0.35),
  ('c562a615-ff65-4e9d-87d4-8726fa64d829', 149, 'ai_auto', 0.33),
  ('c562a615-ff65-4e9d-87d4-8726fa64d829', 493, 'ai_auto', 0.33),
  ('c562a615-ff65-4e9d-87d4-8726fa64d829', 151, 'ai_auto', 0.30),
  ('c562a615-ff65-4e9d-87d4-8726fa64d829', 152, 'ai_auto', 0.30),
  ('c562a615-ff65-4e9d-87d4-8726fa64d829', 494, 'ai_auto', 0.30),
  ('c562a615-ff65-4e9d-87d4-8726fa64d829', 495, 'ai_auto', 0.30),
  ('c562a615-ff65-4e9d-87d4-8726fa64d829', 496, 'ai_auto', 0.30);

-- Macro Helix (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('8c3a2ec1-0f30-4c49-b206-27ad1d4284ce', 164, 'ai_auto', 0.45),
  ('8c3a2ec1-0f30-4c49-b206-27ad1d4284ce', 217, 'ai_auto', 0.40),
  ('8c3a2ec1-0f30-4c49-b206-27ad1d4284ce', 497, 'ai_auto', 0.35),
  ('8c3a2ec1-0f30-4c49-b206-27ad1d4284ce', 149, 'ai_auto', 0.30),
  ('8c3a2ec1-0f30-4c49-b206-27ad1d4284ce', 150, 'ai_auto', 0.30),
  ('8c3a2ec1-0f30-4c49-b206-27ad1d4284ce', 151, 'ai_auto', 0.30),
  ('8c3a2ec1-0f30-4c49-b206-27ad1d4284ce', 152, 'ai_auto', 0.30),
  ('8c3a2ec1-0f30-4c49-b206-27ad1d4284ce', 493, 'ai_auto', 0.30),
  ('8c3a2ec1-0f30-4c49-b206-27ad1d4284ce', 494, 'ai_auto', 0.30),
  ('8c3a2ec1-0f30-4c49-b206-27ad1d4284ce', 495, 'ai_auto', 0.30);

-- Asembia (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('04c8a4c6-fc05-44c7-98d0-52470066be95', 149, 'ai_auto', 0.70),
  ('04c8a4c6-fc05-44c7-98d0-52470066be95', 493, 'ai_auto', 0.37),
  ('04c8a4c6-fc05-44c7-98d0-52470066be95', 150, 'ai_auto', 0.35),
  ('04c8a4c6-fc05-44c7-98d0-52470066be95', 494, 'ai_auto', 0.33),
  ('04c8a4c6-fc05-44c7-98d0-52470066be95', 495, 'ai_auto', 0.33),
  ('04c8a4c6-fc05-44c7-98d0-52470066be95', 151, 'ai_auto', 0.30),
  ('04c8a4c6-fc05-44c7-98d0-52470066be95', 152, 'ai_auto', 0.30),
  ('04c8a4c6-fc05-44c7-98d0-52470066be95', 496, 'ai_auto', 0.30),
  ('04c8a4c6-fc05-44c7-98d0-52470066be95', 497, 'ai_auto', 0.30),
  ('04c8a4c6-fc05-44c7-98d0-52470066be95', 338, 'ai_auto', 0.17);

-- Shields Health Solutions (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('bd65ee23-b805-49e1-8507-ba4c75ff6a11', 149, 'ai_auto', 0.37),
  ('bd65ee23-b805-49e1-8507-ba4c75ff6a11', 493, 'ai_auto', 0.37),
  ('bd65ee23-b805-49e1-8507-ba4c75ff6a11', 150, 'ai_auto', 0.35),
  ('bd65ee23-b805-49e1-8507-ba4c75ff6a11', 152, 'ai_auto', 0.33),
  ('bd65ee23-b805-49e1-8507-ba4c75ff6a11', 495, 'ai_auto', 0.33),
  ('bd65ee23-b805-49e1-8507-ba4c75ff6a11', 151, 'ai_auto', 0.30),
  ('bd65ee23-b805-49e1-8507-ba4c75ff6a11', 494, 'ai_auto', 0.30),
  ('bd65ee23-b805-49e1-8507-ba4c75ff6a11', 496, 'ai_auto', 0.30),
  ('bd65ee23-b805-49e1-8507-ba4c75ff6a11', 497, 'ai_auto', 0.30),
  ('bd65ee23-b805-49e1-8507-ba4c75ff6a11', 338, 'ai_auto', 0.23);

-- Verity Solutions (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('40f1901f-4eb5-400e-be00-f95082eafcdb', 164, 'ai_auto', 0.45),
  ('40f1901f-4eb5-400e-be00-f95082eafcdb', 150, 'ai_auto', 0.35),
  ('40f1901f-4eb5-400e-be00-f95082eafcdb', 497, 'ai_auto', 0.35),
  ('40f1901f-4eb5-400e-be00-f95082eafcdb', 506, 'ai_auto', 0.35),
  ('40f1901f-4eb5-400e-be00-f95082eafcdb', 149, 'ai_auto', 0.33),
  ('40f1901f-4eb5-400e-be00-f95082eafcdb', 493, 'ai_auto', 0.33),
  ('40f1901f-4eb5-400e-be00-f95082eafcdb', 151, 'ai_auto', 0.30),
  ('40f1901f-4eb5-400e-be00-f95082eafcdb', 152, 'ai_auto', 0.30),
  ('40f1901f-4eb5-400e-be00-f95082eafcdb', 494, 'ai_auto', 0.30),
  ('40f1901f-4eb5-400e-be00-f95082eafcdb', 495, 'ai_auto', 0.30);

-- RxStrategies (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('103a97c4-ab95-43d8-b31b-c2a98eefb6f1', 164, 'ai_auto', 0.45),
  ('103a97c4-ab95-43d8-b31b-c2a98eefb6f1', 149, 'ai_auto', 0.37),
  ('103a97c4-ab95-43d8-b31b-c2a98eefb6f1', 150, 'ai_auto', 0.35),
  ('103a97c4-ab95-43d8-b31b-c2a98eefb6f1', 497, 'ai_auto', 0.35),
  ('103a97c4-ab95-43d8-b31b-c2a98eefb6f1', 493, 'ai_auto', 0.33),
  ('103a97c4-ab95-43d8-b31b-c2a98eefb6f1', 494, 'ai_auto', 0.33),
  ('103a97c4-ab95-43d8-b31b-c2a98eefb6f1', 495, 'ai_auto', 0.33),
  ('103a97c4-ab95-43d8-b31b-c2a98eefb6f1', 151, 'ai_auto', 0.30),
  ('103a97c4-ab95-43d8-b31b-c2a98eefb6f1', 152, 'ai_auto', 0.30),
  ('103a97c4-ab95-43d8-b31b-c2a98eefb6f1', 496, 'ai_auto', 0.30);

-- Epic Systems (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('fbcafa68-320c-4066-9c7e-7ead58692124', 157, 'ai_auto', 0.43),
  ('fbcafa68-320c-4066-9c7e-7ead58692124', 196, 'ai_auto', 0.40),
  ('fbcafa68-320c-4066-9c7e-7ead58692124', 502, 'ai_auto', 0.40),
  ('fbcafa68-320c-4066-9c7e-7ead58692124', 159, 'ai_auto', 0.35),
  ('fbcafa68-320c-4066-9c7e-7ead58692124', 160, 'ai_auto', 0.35),
  ('fbcafa68-320c-4066-9c7e-7ead58692124', 505, 'ai_auto', 0.33),
  ('fbcafa68-320c-4066-9c7e-7ead58692124', 158, 'ai_auto', 0.30),
  ('fbcafa68-320c-4066-9c7e-7ead58692124', 161, 'ai_auto', 0.30),
  ('fbcafa68-320c-4066-9c7e-7ead58692124', 503, 'ai_auto', 0.30),
  ('fbcafa68-320c-4066-9c7e-7ead58692124', 504, 'ai_auto', 0.30);

-- Wolters Kluwer Health (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('dd58518c-65e1-4168-b997-733cca1307b8', 196, 'ai_auto', 0.40),
  ('dd58518c-65e1-4168-b997-733cca1307b8', 157, 'ai_auto', 0.37),
  ('dd58518c-65e1-4168-b997-733cca1307b8', 160, 'ai_auto', 0.35),
  ('dd58518c-65e1-4168-b997-733cca1307b8', 503, 'ai_auto', 0.33),
  ('dd58518c-65e1-4168-b997-733cca1307b8', 158, 'ai_auto', 0.30),
  ('dd58518c-65e1-4168-b997-733cca1307b8', 159, 'ai_auto', 0.30),
  ('dd58518c-65e1-4168-b997-733cca1307b8', 161, 'ai_auto', 0.30),
  ('dd58518c-65e1-4168-b997-733cca1307b8', 502, 'ai_auto', 0.30),
  ('dd58518c-65e1-4168-b997-733cca1307b8', 504, 'ai_auto', 0.30),
  ('dd58518c-65e1-4168-b997-733cca1307b8', 505, 'ai_auto', 0.30);

-- First Databank (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('e888488f-287f-480e-ac9b-992dfcaa90c3', 158, 'ai_auto', 0.70),
  ('e888488f-287f-480e-ac9b-992dfcaa90c3', 196, 'ai_auto', 0.40),
  ('e888488f-287f-480e-ac9b-992dfcaa90c3', 157, 'ai_auto', 0.37),
  ('e888488f-287f-480e-ac9b-992dfcaa90c3', 160, 'ai_auto', 0.35),
  ('e888488f-287f-480e-ac9b-992dfcaa90c3', 502, 'ai_auto', 0.35),
  ('e888488f-287f-480e-ac9b-992dfcaa90c3', 503, 'ai_auto', 0.33),
  ('e888488f-287f-480e-ac9b-992dfcaa90c3', 159, 'ai_auto', 0.30),
  ('e888488f-287f-480e-ac9b-992dfcaa90c3', 161, 'ai_auto', 0.30),
  ('e888488f-287f-480e-ac9b-992dfcaa90c3', 504, 'ai_auto', 0.30),
  ('e888488f-287f-480e-ac9b-992dfcaa90c3', 505, 'ai_auto', 0.30);

-- Cerner Pharmacy (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('4b8b6399-a030-4a01-a222-9bc814afc5f7', 157, 'ai_auto', 0.77),
  ('4b8b6399-a030-4a01-a222-9bc814afc5f7', 196, 'ai_auto', 0.40),
  ('4b8b6399-a030-4a01-a222-9bc814afc5f7', 160, 'ai_auto', 0.35),
  ('4b8b6399-a030-4a01-a222-9bc814afc5f7', 502, 'ai_auto', 0.35),
  ('4b8b6399-a030-4a01-a222-9bc814afc5f7', 505, 'ai_auto', 0.33),
  ('4b8b6399-a030-4a01-a222-9bc814afc5f7', 158, 'ai_auto', 0.30),
  ('4b8b6399-a030-4a01-a222-9bc814afc5f7', 159, 'ai_auto', 0.30),
  ('4b8b6399-a030-4a01-a222-9bc814afc5f7', 161, 'ai_auto', 0.30),
  ('4b8b6399-a030-4a01-a222-9bc814afc5f7', 503, 'ai_auto', 0.30),
  ('4b8b6399-a030-4a01-a222-9bc814afc5f7', 504, 'ai_auto', 0.30);

-- QS/1 (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('934b23c0-c05e-45f3-8a7d-1ded23843907', 157, 'ai_auto', 0.37),
  ('934b23c0-c05e-45f3-8a7d-1ded23843907', 502, 'ai_auto', 0.35),
  ('934b23c0-c05e-45f3-8a7d-1ded23843907', 504, 'ai_auto', 0.33),
  ('934b23c0-c05e-45f3-8a7d-1ded23843907', 505, 'ai_auto', 0.33),
  ('934b23c0-c05e-45f3-8a7d-1ded23843907', 158, 'ai_auto', 0.30),
  ('934b23c0-c05e-45f3-8a7d-1ded23843907', 159, 'ai_auto', 0.30),
  ('934b23c0-c05e-45f3-8a7d-1ded23843907', 160, 'ai_auto', 0.30),
  ('934b23c0-c05e-45f3-8a7d-1ded23843907', 161, 'ai_auto', 0.30),
  ('934b23c0-c05e-45f3-8a7d-1ded23843907', 503, 'ai_auto', 0.30),
  ('934b23c0-c05e-45f3-8a7d-1ded23843907', 168, 'ai_auto', 0.12);

-- Tabula Rasa HealthCare (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('5f70f66f-b065-4c10-b7b4-965607a0338d', 503, 'ai_auto', 0.37),
  ('5f70f66f-b065-4c10-b7b4-965607a0338d', 159, 'ai_auto', 0.35),
  ('5f70f66f-b065-4c10-b7b4-965607a0338d', 504, 'ai_auto', 0.33),
  ('5f70f66f-b065-4c10-b7b4-965607a0338d', 505, 'ai_auto', 0.33),
  ('5f70f66f-b065-4c10-b7b4-965607a0338d', 157, 'ai_auto', 0.30),
  ('5f70f66f-b065-4c10-b7b4-965607a0338d', 158, 'ai_auto', 0.30),
  ('5f70f66f-b065-4c10-b7b4-965607a0338d', 160, 'ai_auto', 0.30),
  ('5f70f66f-b065-4c10-b7b4-965607a0338d', 161, 'ai_auto', 0.30),
  ('5f70f66f-b065-4c10-b7b4-965607a0338d', 472, 'ai_auto', 0.30),
  ('5f70f66f-b065-4c10-b7b4-965607a0338d', 502, 'ai_auto', 0.30);

-- VisualDx (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('bb3cd299-dbfa-424d-9163-5552661d57ee', 503, 'ai_auto', 0.60),
  ('bb3cd299-dbfa-424d-9163-5552661d57ee', 91, 'ai_auto', 0.40),
  ('bb3cd299-dbfa-424d-9163-5552661d57ee', 196, 'ai_auto', 0.40),
  ('bb3cd299-dbfa-424d-9163-5552661d57ee', 160, 'ai_auto', 0.35),
  ('bb3cd299-dbfa-424d-9163-5552661d57ee', 157, 'ai_auto', 0.33),
  ('bb3cd299-dbfa-424d-9163-5552661d57ee', 158, 'ai_auto', 0.30),
  ('bb3cd299-dbfa-424d-9163-5552661d57ee', 159, 'ai_auto', 0.30),
  ('bb3cd299-dbfa-424d-9163-5552661d57ee', 161, 'ai_auto', 0.30),
  ('bb3cd299-dbfa-424d-9163-5552661d57ee', 502, 'ai_auto', 0.30),
  ('bb3cd299-dbfa-424d-9163-5552661d57ee', 504, 'ai_auto', 0.30);

-- Oracle Health (Cerner) (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('9d4084aa-be2e-4662-a637-3b55c15e756f', 172, 'ai_auto', 0.70),
  ('9d4084aa-be2e-4662-a637-3b55c15e756f', 338, 'ai_auto', 0.37),
  ('9d4084aa-be2e-4662-a637-3b55c15e756f', 513, 'ai_auto', 0.37),
  ('9d4084aa-be2e-4662-a637-3b55c15e756f', 171, 'ai_auto', 0.35),
  ('9d4084aa-be2e-4662-a637-3b55c15e756f', 515, 'ai_auto', 0.35),
  ('9d4084aa-be2e-4662-a637-3b55c15e756f', 516, 'ai_auto', 0.35),
  ('9d4084aa-be2e-4662-a637-3b55c15e756f', 517, 'ai_auto', 0.33),
  ('9d4084aa-be2e-4662-a637-3b55c15e756f', 514, 'ai_auto', 0.33),
  ('9d4084aa-be2e-4662-a637-3b55c15e756f', 173, 'ai_auto', 0.30),
  ('9d4084aa-be2e-4662-a637-3b55c15e756f', 174, 'ai_auto', 0.30);

-- MEDITECH (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('d704cdd6-a5e0-4066-a2f5-948264451864', 91, 'ai_auto', 0.40),
  ('d704cdd6-a5e0-4066-a2f5-948264451864', 171, 'ai_auto', 0.35),
  ('d704cdd6-a5e0-4066-a2f5-948264451864', 172, 'ai_auto', 0.35),
  ('d704cdd6-a5e0-4066-a2f5-948264451864', 515, 'ai_auto', 0.35),
  ('d704cdd6-a5e0-4066-a2f5-948264451864', 513, 'ai_auto', 0.33),
  ('d704cdd6-a5e0-4066-a2f5-948264451864', 517, 'ai_auto', 0.33),
  ('d704cdd6-a5e0-4066-a2f5-948264451864', 514, 'ai_auto', 0.33),
  ('d704cdd6-a5e0-4066-a2f5-948264451864', 173, 'ai_auto', 0.30),
  ('d704cdd6-a5e0-4066-a2f5-948264451864', 174, 'ai_auto', 0.30),
  ('d704cdd6-a5e0-4066-a2f5-948264451864', 338, 'ai_auto', 0.30);

-- Veradigm (Allscripts) (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('cc2f5a0f-6713-41b7-a2a9-be5c9d635a1f', 187, 'ai_auto', 0.45),
  ('cc2f5a0f-6713-41b7-a2a9-be5c9d635a1f', 171, 'ai_auto', 0.35),
  ('cc2f5a0f-6713-41b7-a2a9-be5c9d635a1f', 172, 'ai_auto', 0.35),
  ('cc2f5a0f-6713-41b7-a2a9-be5c9d635a1f', 515, 'ai_auto', 0.35),
  ('cc2f5a0f-6713-41b7-a2a9-be5c9d635a1f', 513, 'ai_auto', 0.33),
  ('cc2f5a0f-6713-41b7-a2a9-be5c9d635a1f', 517, 'ai_auto', 0.33),
  ('cc2f5a0f-6713-41b7-a2a9-be5c9d635a1f', 514, 'ai_auto', 0.33),
  ('cc2f5a0f-6713-41b7-a2a9-be5c9d635a1f', 173, 'ai_auto', 0.30),
  ('cc2f5a0f-6713-41b7-a2a9-be5c9d635a1f', 174, 'ai_auto', 0.30),
  ('cc2f5a0f-6713-41b7-a2a9-be5c9d635a1f', 516, 'ai_auto', 0.30);

-- athenahealth (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('7c8cf69b-0e10-4230-8c9a-396c1ef285c6', 171, 'ai_auto', 0.35),
  ('7c8cf69b-0e10-4230-8c9a-396c1ef285c6', 517, 'ai_auto', 0.33),
  ('7c8cf69b-0e10-4230-8c9a-396c1ef285c6', 172, 'ai_auto', 0.30),
  ('7c8cf69b-0e10-4230-8c9a-396c1ef285c6', 173, 'ai_auto', 0.30),
  ('7c8cf69b-0e10-4230-8c9a-396c1ef285c6', 174, 'ai_auto', 0.30),
  ('7c8cf69b-0e10-4230-8c9a-396c1ef285c6', 513, 'ai_auto', 0.30),
  ('7c8cf69b-0e10-4230-8c9a-396c1ef285c6', 514, 'ai_auto', 0.30),
  ('7c8cf69b-0e10-4230-8c9a-396c1ef285c6', 515, 'ai_auto', 0.30),
  ('7c8cf69b-0e10-4230-8c9a-396c1ef285c6', 516, 'ai_auto', 0.30),
  ('7c8cf69b-0e10-4230-8c9a-396c1ef285c6', 338, 'ai_auto', 0.20);

-- eClinicalWorks (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('9b7f1810-31ea-4918-b507-2e84df89723f', 172, 'ai_auto', 0.40),
  ('9b7f1810-31ea-4918-b507-2e84df89723f', 515, 'ai_auto', 0.40),
  ('9b7f1810-31ea-4918-b507-2e84df89723f', 513, 'ai_auto', 0.37),
  ('9b7f1810-31ea-4918-b507-2e84df89723f', 171, 'ai_auto', 0.35),
  ('9b7f1810-31ea-4918-b507-2e84df89723f', 514, 'ai_auto', 0.35),
  ('9b7f1810-31ea-4918-b507-2e84df89723f', 517, 'ai_auto', 0.33),
  ('9b7f1810-31ea-4918-b507-2e84df89723f', 173, 'ai_auto', 0.30),
  ('9b7f1810-31ea-4918-b507-2e84df89723f', 174, 'ai_auto', 0.30),
  ('9b7f1810-31ea-4918-b507-2e84df89723f', 516, 'ai_auto', 0.30),
  ('9b7f1810-31ea-4918-b507-2e84df89723f', 346, 'ai_auto', 0.17);

-- NextGen Healthcare (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('5887bdc5-1010-4039-9184-a523e65acc7e', 172, 'ai_auto', 0.70),
  ('5887bdc5-1010-4039-9184-a523e65acc7e', 174, 'ai_auto', 0.40),
  ('5887bdc5-1010-4039-9184-a523e65acc7e', 513, 'ai_auto', 0.37),
  ('5887bdc5-1010-4039-9184-a523e65acc7e', 171, 'ai_auto', 0.35),
  ('5887bdc5-1010-4039-9184-a523e65acc7e', 515, 'ai_auto', 0.35),
  ('5887bdc5-1010-4039-9184-a523e65acc7e', 516, 'ai_auto', 0.35),
  ('5887bdc5-1010-4039-9184-a523e65acc7e', 517, 'ai_auto', 0.33),
  ('5887bdc5-1010-4039-9184-a523e65acc7e', 514, 'ai_auto', 0.33),
  ('5887bdc5-1010-4039-9184-a523e65acc7e', 173, 'ai_auto', 0.30),
  ('5887bdc5-1010-4039-9184-a523e65acc7e', 533, 'ai_auto', 0.12);

-- CPSI (TruBridge) (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('1ff3af45-7d91-4e0b-8982-3eae38e69ee9', 277, 'ai_auto', 0.40),
  ('1ff3af45-7d91-4e0b-8982-3eae38e69ee9', 171, 'ai_auto', 0.35),
  ('1ff3af45-7d91-4e0b-8982-3eae38e69ee9', 517, 'ai_auto', 0.33),
  ('1ff3af45-7d91-4e0b-8982-3eae38e69ee9', 172, 'ai_auto', 0.30),
  ('1ff3af45-7d91-4e0b-8982-3eae38e69ee9', 173, 'ai_auto', 0.30),
  ('1ff3af45-7d91-4e0b-8982-3eae38e69ee9', 174, 'ai_auto', 0.30),
  ('1ff3af45-7d91-4e0b-8982-3eae38e69ee9', 513, 'ai_auto', 0.30),
  ('1ff3af45-7d91-4e0b-8982-3eae38e69ee9', 514, 'ai_auto', 0.30),
  ('1ff3af45-7d91-4e0b-8982-3eae38e69ee9', 515, 'ai_auto', 0.30),
  ('1ff3af45-7d91-4e0b-8982-3eae38e69ee9', 516, 'ai_auto', 0.30);

-- Waystar (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('caa2219a-c6a6-40fa-abd8-6cf9adb3df52', 177, 'ai_auto', 0.70),
  ('caa2219a-c6a6-40fa-abd8-6cf9adb3df52', 175, 'ai_auto', 0.30),
  ('caa2219a-c6a6-40fa-abd8-6cf9adb3df52', 176, 'ai_auto', 0.30),
  ('caa2219a-c6a6-40fa-abd8-6cf9adb3df52', 178, 'ai_auto', 0.30),
  ('caa2219a-c6a6-40fa-abd8-6cf9adb3df52', 179, 'ai_auto', 0.30),
  ('caa2219a-c6a6-40fa-abd8-6cf9adb3df52', 180, 'ai_auto', 0.30),
  ('caa2219a-c6a6-40fa-abd8-6cf9adb3df52', 181, 'ai_auto', 0.30),
  ('caa2219a-c6a6-40fa-abd8-6cf9adb3df52', 518, 'ai_auto', 0.30),
  ('caa2219a-c6a6-40fa-abd8-6cf9adb3df52', 519, 'ai_auto', 0.30),
  ('caa2219a-c6a6-40fa-abd8-6cf9adb3df52', 520, 'ai_auto', 0.30);

-- R1 RCM (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('70ed298b-5174-4d4e-99a9-76ffa3bce692', 181, 'ai_auto', 0.70),
  ('70ed298b-5174-4d4e-99a9-76ffa3bce692', 523, 'ai_auto', 0.37),
  ('70ed298b-5174-4d4e-99a9-76ffa3bce692', 175, 'ai_auto', 0.30),
  ('70ed298b-5174-4d4e-99a9-76ffa3bce692', 176, 'ai_auto', 0.30),
  ('70ed298b-5174-4d4e-99a9-76ffa3bce692', 177, 'ai_auto', 0.30),
  ('70ed298b-5174-4d4e-99a9-76ffa3bce692', 178, 'ai_auto', 0.30),
  ('70ed298b-5174-4d4e-99a9-76ffa3bce692', 179, 'ai_auto', 0.30),
  ('70ed298b-5174-4d4e-99a9-76ffa3bce692', 180, 'ai_auto', 0.30),
  ('70ed298b-5174-4d4e-99a9-76ffa3bce692', 518, 'ai_auto', 0.30),
  ('70ed298b-5174-4d4e-99a9-76ffa3bce692', 519, 'ai_auto', 0.30);

-- nThrive (FinThrive) (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('c66c21aa-8a5b-4328-96b5-cf66f2ad3549', 519, 'ai_auto', 0.60),
  ('c66c21aa-8a5b-4328-96b5-cf66f2ad3549', 185, 'ai_auto', 0.45),
  ('c66c21aa-8a5b-4328-96b5-cf66f2ad3549', 175, 'ai_auto', 0.30),
  ('c66c21aa-8a5b-4328-96b5-cf66f2ad3549', 176, 'ai_auto', 0.30),
  ('c66c21aa-8a5b-4328-96b5-cf66f2ad3549', 177, 'ai_auto', 0.30),
  ('c66c21aa-8a5b-4328-96b5-cf66f2ad3549', 178, 'ai_auto', 0.30),
  ('c66c21aa-8a5b-4328-96b5-cf66f2ad3549', 179, 'ai_auto', 0.30),
  ('c66c21aa-8a5b-4328-96b5-cf66f2ad3549', 180, 'ai_auto', 0.30),
  ('c66c21aa-8a5b-4328-96b5-cf66f2ad3549', 181, 'ai_auto', 0.30),
  ('c66c21aa-8a5b-4328-96b5-cf66f2ad3549', 518, 'ai_auto', 0.30);

-- Optum360 (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('41c52380-24e7-4caf-8f7d-c4e21c1ae1ec', 175, 'ai_auto', 0.70),
  ('41c52380-24e7-4caf-8f7d-c4e21c1ae1ec', 520, 'ai_auto', 0.35),
  ('41c52380-24e7-4caf-8f7d-c4e21c1ae1ec', 176, 'ai_auto', 0.30),
  ('41c52380-24e7-4caf-8f7d-c4e21c1ae1ec', 177, 'ai_auto', 0.30),
  ('41c52380-24e7-4caf-8f7d-c4e21c1ae1ec', 178, 'ai_auto', 0.30),
  ('41c52380-24e7-4caf-8f7d-c4e21c1ae1ec', 179, 'ai_auto', 0.30),
  ('41c52380-24e7-4caf-8f7d-c4e21c1ae1ec', 180, 'ai_auto', 0.30),
  ('41c52380-24e7-4caf-8f7d-c4e21c1ae1ec', 181, 'ai_auto', 0.30),
  ('41c52380-24e7-4caf-8f7d-c4e21c1ae1ec', 518, 'ai_auto', 0.30),
  ('41c52380-24e7-4caf-8f7d-c4e21c1ae1ec', 519, 'ai_auto', 0.30);

-- Experian Health (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('ed401ba8-35d3-4498-be21-6922bf787c9b', 178, 'ai_auto', 0.70),
  ('ed401ba8-35d3-4498-be21-6922bf787c9b', 215, 'ai_auto', 0.45),
  ('ed401ba8-35d3-4498-be21-6922bf787c9b', 179, 'ai_auto', 0.35),
  ('ed401ba8-35d3-4498-be21-6922bf787c9b', 522, 'ai_auto', 0.33),
  ('ed401ba8-35d3-4498-be21-6922bf787c9b', 175, 'ai_auto', 0.30),
  ('ed401ba8-35d3-4498-be21-6922bf787c9b', 176, 'ai_auto', 0.30),
  ('ed401ba8-35d3-4498-be21-6922bf787c9b', 177, 'ai_auto', 0.30),
  ('ed401ba8-35d3-4498-be21-6922bf787c9b', 180, 'ai_auto', 0.30),
  ('ed401ba8-35d3-4498-be21-6922bf787c9b', 181, 'ai_auto', 0.30),
  ('ed401ba8-35d3-4498-be21-6922bf787c9b', 518, 'ai_auto', 0.30);

-- Availity (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('6dc582bc-a780-408a-aa14-5107940b4c83', 177, 'ai_auto', 0.70),
  ('6dc582bc-a780-408a-aa14-5107940b4c83', 316, 'ai_auto', 0.40),
  ('6dc582bc-a780-408a-aa14-5107940b4c83', 175, 'ai_auto', 0.30),
  ('6dc582bc-a780-408a-aa14-5107940b4c83', 176, 'ai_auto', 0.30),
  ('6dc582bc-a780-408a-aa14-5107940b4c83', 178, 'ai_auto', 0.30),
  ('6dc582bc-a780-408a-aa14-5107940b4c83', 179, 'ai_auto', 0.30),
  ('6dc582bc-a780-408a-aa14-5107940b4c83', 180, 'ai_auto', 0.30),
  ('6dc582bc-a780-408a-aa14-5107940b4c83', 181, 'ai_auto', 0.30),
  ('6dc582bc-a780-408a-aa14-5107940b4c83', 518, 'ai_auto', 0.30),
  ('6dc582bc-a780-408a-aa14-5107940b4c83', 519, 'ai_auto', 0.30);

-- AGS Health (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('727c1857-f44a-4c44-a9d9-fe73dd3d39ec', 175, 'ai_auto', 0.70),
  ('727c1857-f44a-4c44-a9d9-fe73dd3d39ec', 172, 'ai_auto', 0.45),
  ('727c1857-f44a-4c44-a9d9-fe73dd3d39ec', 520, 'ai_auto', 0.35),
  ('727c1857-f44a-4c44-a9d9-fe73dd3d39ec', 176, 'ai_auto', 0.30),
  ('727c1857-f44a-4c44-a9d9-fe73dd3d39ec', 177, 'ai_auto', 0.30),
  ('727c1857-f44a-4c44-a9d9-fe73dd3d39ec', 178, 'ai_auto', 0.30),
  ('727c1857-f44a-4c44-a9d9-fe73dd3d39ec', 179, 'ai_auto', 0.30),
  ('727c1857-f44a-4c44-a9d9-fe73dd3d39ec', 180, 'ai_auto', 0.30),
  ('727c1857-f44a-4c44-a9d9-fe73dd3d39ec', 181, 'ai_auto', 0.30),
  ('727c1857-f44a-4c44-a9d9-fe73dd3d39ec', 518, 'ai_auto', 0.30);

-- Teladoc Health (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('10dfacc5-0646-4f4c-889d-fff2fd002c6f', 542, 'ai_auto', 0.37),
  ('10dfacc5-0646-4f4c-889d-fff2fd002c6f', 208, 'ai_auto', 0.35),
  ('10dfacc5-0646-4f4c-889d-fff2fd002c6f', 545, 'ai_auto', 0.35),
  ('10dfacc5-0646-4f4c-889d-fff2fd002c6f', 546, 'ai_auto', 0.33),
  ('10dfacc5-0646-4f4c-889d-fff2fd002c6f', 205, 'ai_auto', 0.30),
  ('10dfacc5-0646-4f4c-889d-fff2fd002c6f', 206, 'ai_auto', 0.30),
  ('10dfacc5-0646-4f4c-889d-fff2fd002c6f', 207, 'ai_auto', 0.30),
  ('10dfacc5-0646-4f4c-889d-fff2fd002c6f', 543, 'ai_auto', 0.30),
  ('10dfacc5-0646-4f4c-889d-fff2fd002c6f', 544, 'ai_auto', 0.30),
  ('10dfacc5-0646-4f4c-889d-fff2fd002c6f', 338, 'ai_auto', 0.23);

-- Amwell (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('2824a259-967c-429c-b7aa-656a782e8fb2', 546, 'ai_auto', 0.37),
  ('2824a259-967c-429c-b7aa-656a782e8fb2', 207, 'ai_auto', 0.35),
  ('2824a259-967c-429c-b7aa-656a782e8fb2', 208, 'ai_auto', 0.35),
  ('2824a259-967c-429c-b7aa-656a782e8fb2', 545, 'ai_auto', 0.35),
  ('2824a259-967c-429c-b7aa-656a782e8fb2', 205, 'ai_auto', 0.30),
  ('2824a259-967c-429c-b7aa-656a782e8fb2', 206, 'ai_auto', 0.30),
  ('2824a259-967c-429c-b7aa-656a782e8fb2', 338, 'ai_auto', 0.30),
  ('2824a259-967c-429c-b7aa-656a782e8fb2', 542, 'ai_auto', 0.30),
  ('2824a259-967c-429c-b7aa-656a782e8fb2', 543, 'ai_auto', 0.30),
  ('2824a259-967c-429c-b7aa-656a782e8fb2', 544, 'ai_auto', 0.30);

-- MDLive (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('8cb6149f-ad63-439d-acc3-27417c130002', 347, 'ai_auto', 0.40),
  ('8cb6149f-ad63-439d-acc3-27417c130002', 207, 'ai_auto', 0.35),
  ('8cb6149f-ad63-439d-acc3-27417c130002', 208, 'ai_auto', 0.35),
  ('8cb6149f-ad63-439d-acc3-27417c130002', 546, 'ai_auto', 0.33),
  ('8cb6149f-ad63-439d-acc3-27417c130002', 205, 'ai_auto', 0.30),
  ('8cb6149f-ad63-439d-acc3-27417c130002', 206, 'ai_auto', 0.30),
  ('8cb6149f-ad63-439d-acc3-27417c130002', 542, 'ai_auto', 0.30),
  ('8cb6149f-ad63-439d-acc3-27417c130002', 543, 'ai_auto', 0.30),
  ('8cb6149f-ad63-439d-acc3-27417c130002', 544, 'ai_auto', 0.30),
  ('8cb6149f-ad63-439d-acc3-27417c130002', 545, 'ai_auto', 0.30);

-- Doxy.me (9 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('4c535e86-df60-4ef6-858d-b4494981b6e0', 205, 'ai_auto', 0.70),
  ('4c535e86-df60-4ef6-858d-b4494981b6e0', 207, 'ai_auto', 0.35),
  ('4c535e86-df60-4ef6-858d-b4494981b6e0', 208, 'ai_auto', 0.35),
  ('4c535e86-df60-4ef6-858d-b4494981b6e0', 546, 'ai_auto', 0.33),
  ('4c535e86-df60-4ef6-858d-b4494981b6e0', 206, 'ai_auto', 0.30),
  ('4c535e86-df60-4ef6-858d-b4494981b6e0', 542, 'ai_auto', 0.30),
  ('4c535e86-df60-4ef6-858d-b4494981b6e0', 543, 'ai_auto', 0.30),
  ('4c535e86-df60-4ef6-858d-b4494981b6e0', 544, 'ai_auto', 0.30),
  ('4c535e86-df60-4ef6-858d-b4494981b6e0', 545, 'ai_auto', 0.30);

-- Caregility (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('07c39a2a-c3ad-4b12-aa25-f565af7bbd0c', 208, 'ai_auto', 0.70),
  ('07c39a2a-c3ad-4b12-aa25-f565af7bbd0c', 99, 'ai_auto', 0.40),
  ('07c39a2a-c3ad-4b12-aa25-f565af7bbd0c', 207, 'ai_auto', 0.35),
  ('07c39a2a-c3ad-4b12-aa25-f565af7bbd0c', 545, 'ai_auto', 0.35),
  ('07c39a2a-c3ad-4b12-aa25-f565af7bbd0c', 546, 'ai_auto', 0.33),
  ('07c39a2a-c3ad-4b12-aa25-f565af7bbd0c', 205, 'ai_auto', 0.30),
  ('07c39a2a-c3ad-4b12-aa25-f565af7bbd0c', 206, 'ai_auto', 0.30),
  ('07c39a2a-c3ad-4b12-aa25-f565af7bbd0c', 542, 'ai_auto', 0.30),
  ('07c39a2a-c3ad-4b12-aa25-f565af7bbd0c', 543, 'ai_auto', 0.30),
  ('07c39a2a-c3ad-4b12-aa25-f565af7bbd0c', 544, 'ai_auto', 0.30);

-- Bioventus (BioIntelliSense) (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('ec12c3ad-265f-4d02-9ee4-d5c83f020bc2', 207, 'ai_auto', 0.70),
  ('ec12c3ad-265f-4d02-9ee4-d5c83f020bc2', 542, 'ai_auto', 0.37),
  ('ec12c3ad-265f-4d02-9ee4-d5c83f020bc2', 205, 'ai_auto', 0.30),
  ('ec12c3ad-265f-4d02-9ee4-d5c83f020bc2', 206, 'ai_auto', 0.30),
  ('ec12c3ad-265f-4d02-9ee4-d5c83f020bc2', 208, 'ai_auto', 0.30),
  ('ec12c3ad-265f-4d02-9ee4-d5c83f020bc2', 543, 'ai_auto', 0.30),
  ('ec12c3ad-265f-4d02-9ee4-d5c83f020bc2', 544, 'ai_auto', 0.30),
  ('ec12c3ad-265f-4d02-9ee4-d5c83f020bc2', 545, 'ai_auto', 0.30),
  ('ec12c3ad-265f-4d02-9ee4-d5c83f020bc2', 546, 'ai_auto', 0.30),
  ('ec12c3ad-265f-4d02-9ee4-d5c83f020bc2', 47, 'ai_auto', 0.10);

-- Hims & Hers Health (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('1b5b0a59-f302-4d4d-bd0f-fe1896e100f1', 208, 'ai_auto', 0.35),
  ('1b5b0a59-f302-4d4d-bd0f-fe1896e100f1', 545, 'ai_auto', 0.35),
  ('1b5b0a59-f302-4d4d-bd0f-fe1896e100f1', 546, 'ai_auto', 0.33),
  ('1b5b0a59-f302-4d4d-bd0f-fe1896e100f1', 205, 'ai_auto', 0.30),
  ('1b5b0a59-f302-4d4d-bd0f-fe1896e100f1', 206, 'ai_auto', 0.30),
  ('1b5b0a59-f302-4d4d-bd0f-fe1896e100f1', 207, 'ai_auto', 0.30),
  ('1b5b0a59-f302-4d4d-bd0f-fe1896e100f1', 542, 'ai_auto', 0.30),
  ('1b5b0a59-f302-4d4d-bd0f-fe1896e100f1', 543, 'ai_auto', 0.30),
  ('1b5b0a59-f302-4d4d-bd0f-fe1896e100f1', 544, 'ai_auto', 0.30),
  ('1b5b0a59-f302-4d4d-bd0f-fe1896e100f1', 252, 'ai_auto', 0.15);

-- Health Catalyst (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('43b03a70-f165-4e60-8d86-883100fe1dc9', 187, 'ai_auto', 0.45),
  ('43b03a70-f165-4e60-8d86-883100fe1dc9', 533, 'ai_auto', 0.40),
  ('43b03a70-f165-4e60-8d86-883100fe1dc9', 194, 'ai_auto', 0.35),
  ('43b03a70-f165-4e60-8d86-883100fe1dc9', 196, 'ai_auto', 0.33),
  ('43b03a70-f165-4e60-8d86-883100fe1dc9', 536, 'ai_auto', 0.33),
  ('43b03a70-f165-4e60-8d86-883100fe1dc9', 192, 'ai_auto', 0.30),
  ('43b03a70-f165-4e60-8d86-883100fe1dc9', 193, 'ai_auto', 0.30),
  ('43b03a70-f165-4e60-8d86-883100fe1dc9', 195, 'ai_auto', 0.30),
  ('43b03a70-f165-4e60-8d86-883100fe1dc9', 197, 'ai_auto', 0.30),
  ('43b03a70-f165-4e60-8d86-883100fe1dc9', 530, 'ai_auto', 0.30);

-- Viz.ai (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('de722afb-4e2c-40b3-8bab-b02f65164349', 196, 'ai_auto', 0.70),
  ('de722afb-4e2c-40b3-8bab-b02f65164349', 62, 'ai_auto', 0.40),
  ('de722afb-4e2c-40b3-8bab-b02f65164349', 534, 'ai_auto', 0.35),
  ('de722afb-4e2c-40b3-8bab-b02f65164349', 531, 'ai_auto', 0.33),
  ('de722afb-4e2c-40b3-8bab-b02f65164349', 192, 'ai_auto', 0.30),
  ('de722afb-4e2c-40b3-8bab-b02f65164349', 193, 'ai_auto', 0.30),
  ('de722afb-4e2c-40b3-8bab-b02f65164349', 194, 'ai_auto', 0.30),
  ('de722afb-4e2c-40b3-8bab-b02f65164349', 195, 'ai_auto', 0.30),
  ('de722afb-4e2c-40b3-8bab-b02f65164349', 197, 'ai_auto', 0.30),
  ('de722afb-4e2c-40b3-8bab-b02f65164349', 530, 'ai_auto', 0.30);

-- Aidoc (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('0ad38b95-7fd2-4ae8-8214-947e4e8c6d5f', 62, 'ai_auto', 0.40),
  ('0ad38b95-7fd2-4ae8-8214-947e4e8c6d5f', 534, 'ai_auto', 0.35),
  ('0ad38b95-7fd2-4ae8-8214-947e4e8c6d5f', 192, 'ai_auto', 0.30),
  ('0ad38b95-7fd2-4ae8-8214-947e4e8c6d5f', 193, 'ai_auto', 0.30),
  ('0ad38b95-7fd2-4ae8-8214-947e4e8c6d5f', 194, 'ai_auto', 0.30),
  ('0ad38b95-7fd2-4ae8-8214-947e4e8c6d5f', 195, 'ai_auto', 0.30),
  ('0ad38b95-7fd2-4ae8-8214-947e4e8c6d5f', 196, 'ai_auto', 0.30),
  ('0ad38b95-7fd2-4ae8-8214-947e4e8c6d5f', 197, 'ai_auto', 0.30),
  ('0ad38b95-7fd2-4ae8-8214-947e4e8c6d5f', 530, 'ai_auto', 0.30),
  ('0ad38b95-7fd2-4ae8-8214-947e4e8c6d5f', 531, 'ai_auto', 0.30);

-- Tempus (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('c3493071-8a3c-4559-9574-b5cacc5be7e9', 187, 'ai_auto', 0.45),
  ('c3493071-8a3c-4559-9574-b5cacc5be7e9', 194, 'ai_auto', 0.35),
  ('c3493071-8a3c-4559-9574-b5cacc5be7e9', 196, 'ai_auto', 0.33),
  ('c3493071-8a3c-4559-9574-b5cacc5be7e9', 533, 'ai_auto', 0.33),
  ('c3493071-8a3c-4559-9574-b5cacc5be7e9', 536, 'ai_auto', 0.33),
  ('c3493071-8a3c-4559-9574-b5cacc5be7e9', 192, 'ai_auto', 0.30),
  ('c3493071-8a3c-4559-9574-b5cacc5be7e9', 193, 'ai_auto', 0.30),
  ('c3493071-8a3c-4559-9574-b5cacc5be7e9', 195, 'ai_auto', 0.30),
  ('c3493071-8a3c-4559-9574-b5cacc5be7e9', 197, 'ai_auto', 0.30),
  ('c3493071-8a3c-4559-9574-b5cacc5be7e9', 530, 'ai_auto', 0.30);

-- Innovaccer (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('92c20b2f-c034-4601-9be6-3f2f410f1301', 187, 'ai_auto', 0.45),
  ('92c20b2f-c034-4601-9be6-3f2f410f1301', 533, 'ai_auto', 0.40),
  ('92c20b2f-c034-4601-9be6-3f2f410f1301', 194, 'ai_auto', 0.35),
  ('92c20b2f-c034-4601-9be6-3f2f410f1301', 536, 'ai_auto', 0.33),
  ('92c20b2f-c034-4601-9be6-3f2f410f1301', 192, 'ai_auto', 0.30),
  ('92c20b2f-c034-4601-9be6-3f2f410f1301', 193, 'ai_auto', 0.30),
  ('92c20b2f-c034-4601-9be6-3f2f410f1301', 195, 'ai_auto', 0.30),
  ('92c20b2f-c034-4601-9be6-3f2f410f1301', 196, 'ai_auto', 0.30),
  ('92c20b2f-c034-4601-9be6-3f2f410f1301', 197, 'ai_auto', 0.30),
  ('92c20b2f-c034-4601-9be6-3f2f410f1301', 530, 'ai_auto', 0.30);

-- Qventus (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('55e862c2-fd39-46d2-9d4d-6deb7d27597b', 187, 'ai_auto', 0.45),
  ('55e862c2-fd39-46d2-9d4d-6deb7d27597b', 200, 'ai_auto', 0.45),
  ('55e862c2-fd39-46d2-9d4d-6deb7d27597b', 197, 'ai_auto', 0.40),
  ('55e862c2-fd39-46d2-9d4d-6deb7d27597b', 194, 'ai_auto', 0.35),
  ('55e862c2-fd39-46d2-9d4d-6deb7d27597b', 531, 'ai_auto', 0.33),
  ('55e862c2-fd39-46d2-9d4d-6deb7d27597b', 533, 'ai_auto', 0.33),
  ('55e862c2-fd39-46d2-9d4d-6deb7d27597b', 536, 'ai_auto', 0.33),
  ('55e862c2-fd39-46d2-9d4d-6deb7d27597b', 192, 'ai_auto', 0.30),
  ('55e862c2-fd39-46d2-9d4d-6deb7d27597b', 193, 'ai_auto', 0.30),
  ('55e862c2-fd39-46d2-9d4d-6deb7d27597b', 195, 'ai_auto', 0.30);

-- Olive AI (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('96e43c4f-27ae-40f9-bc23-38a292322e24', 192, 'ai_auto', 0.30),
  ('96e43c4f-27ae-40f9-bc23-38a292322e24', 193, 'ai_auto', 0.30),
  ('96e43c4f-27ae-40f9-bc23-38a292322e24', 194, 'ai_auto', 0.30),
  ('96e43c4f-27ae-40f9-bc23-38a292322e24', 195, 'ai_auto', 0.30),
  ('96e43c4f-27ae-40f9-bc23-38a292322e24', 196, 'ai_auto', 0.30),
  ('96e43c4f-27ae-40f9-bc23-38a292322e24', 197, 'ai_auto', 0.30),
  ('96e43c4f-27ae-40f9-bc23-38a292322e24', 530, 'ai_auto', 0.30),
  ('96e43c4f-27ae-40f9-bc23-38a292322e24', 531, 'ai_auto', 0.30),
  ('96e43c4f-27ae-40f9-bc23-38a292322e24', 532, 'ai_auto', 0.30),
  ('96e43c4f-27ae-40f9-bc23-38a292322e24', 533, 'ai_auto', 0.30);

-- Arcadia (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('bb089ad5-c7c9-4d0f-b2df-acf991ab12d2', 187, 'ai_auto', 0.45),
  ('bb089ad5-c7c9-4d0f-b2df-acf991ab12d2', 533, 'ai_auto', 0.40),
  ('bb089ad5-c7c9-4d0f-b2df-acf991ab12d2', 194, 'ai_auto', 0.35),
  ('bb089ad5-c7c9-4d0f-b2df-acf991ab12d2', 196, 'ai_auto', 0.33),
  ('bb089ad5-c7c9-4d0f-b2df-acf991ab12d2', 536, 'ai_auto', 0.33),
  ('bb089ad5-c7c9-4d0f-b2df-acf991ab12d2', 192, 'ai_auto', 0.30),
  ('bb089ad5-c7c9-4d0f-b2df-acf991ab12d2', 193, 'ai_auto', 0.30),
  ('bb089ad5-c7c9-4d0f-b2df-acf991ab12d2', 195, 'ai_auto', 0.30),
  ('bb089ad5-c7c9-4d0f-b2df-acf991ab12d2', 197, 'ai_auto', 0.30),
  ('bb089ad5-c7c9-4d0f-b2df-acf991ab12d2', 530, 'ai_auto', 0.30);

-- CrowdStrike (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('5723e459-9d72-4794-9942-f5693e157487', 216, 'ai_auto', 0.70),
  ('5723e459-9d72-4794-9942-f5693e157487', 554, 'ai_auto', 0.40),
  ('5723e459-9d72-4794-9942-f5693e157487', 215, 'ai_auto', 0.30),
  ('5723e459-9d72-4794-9942-f5693e157487', 217, 'ai_auto', 0.30),
  ('5723e459-9d72-4794-9942-f5693e157487', 218, 'ai_auto', 0.30),
  ('5723e459-9d72-4794-9942-f5693e157487', 552, 'ai_auto', 0.30),
  ('5723e459-9d72-4794-9942-f5693e157487', 553, 'ai_auto', 0.30),
  ('5723e459-9d72-4794-9942-f5693e157487', 555, 'ai_auto', 0.30),
  ('5723e459-9d72-4794-9942-f5693e157487', 556, 'ai_auto', 0.30),
  ('5723e459-9d72-4794-9942-f5693e157487', 331, 'ai_auto', 0.20);

-- Palo Alto Networks (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('67f134c1-7bf5-48cc-bc26-68495a09a859', 552, 'ai_auto', 0.40),
  ('67f134c1-7bf5-48cc-bc26-68495a09a859', 215, 'ai_auto', 0.30),
  ('67f134c1-7bf5-48cc-bc26-68495a09a859', 216, 'ai_auto', 0.30),
  ('67f134c1-7bf5-48cc-bc26-68495a09a859', 217, 'ai_auto', 0.30),
  ('67f134c1-7bf5-48cc-bc26-68495a09a859', 218, 'ai_auto', 0.30),
  ('67f134c1-7bf5-48cc-bc26-68495a09a859', 553, 'ai_auto', 0.30),
  ('67f134c1-7bf5-48cc-bc26-68495a09a859', 554, 'ai_auto', 0.30),
  ('67f134c1-7bf5-48cc-bc26-68495a09a859', 555, 'ai_auto', 0.30),
  ('67f134c1-7bf5-48cc-bc26-68495a09a859', 556, 'ai_auto', 0.30),
  ('67f134c1-7bf5-48cc-bc26-68495a09a859', 338, 'ai_auto', 0.17);

-- ClearDATA (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('5395c505-f797-42d8-b93b-deacd0634042', 553, 'ai_auto', 0.37),
  ('5395c505-f797-42d8-b93b-deacd0634042', 217, 'ai_auto', 0.35),
  ('5395c505-f797-42d8-b93b-deacd0634042', 552, 'ai_auto', 0.33),
  ('5395c505-f797-42d8-b93b-deacd0634042', 215, 'ai_auto', 0.30),
  ('5395c505-f797-42d8-b93b-deacd0634042', 216, 'ai_auto', 0.30),
  ('5395c505-f797-42d8-b93b-deacd0634042', 218, 'ai_auto', 0.30),
  ('5395c505-f797-42d8-b93b-deacd0634042', 554, 'ai_auto', 0.30),
  ('5395c505-f797-42d8-b93b-deacd0634042', 555, 'ai_auto', 0.30),
  ('5395c505-f797-42d8-b93b-deacd0634042', 556, 'ai_auto', 0.30),
  ('5395c505-f797-42d8-b93b-deacd0634042', 338, 'ai_auto', 0.17);

-- Fortified Health Security (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('8a4ad43c-5f2d-4331-8173-1c6e6ca21504', 552, 'ai_auto', 0.40),
  ('8a4ad43c-5f2d-4331-8173-1c6e6ca21504', 217, 'ai_auto', 0.35),
  ('8a4ad43c-5f2d-4331-8173-1c6e6ca21504', 555, 'ai_auto', 0.33),
  ('8a4ad43c-5f2d-4331-8173-1c6e6ca21504', 215, 'ai_auto', 0.30),
  ('8a4ad43c-5f2d-4331-8173-1c6e6ca21504', 216, 'ai_auto', 0.30),
  ('8a4ad43c-5f2d-4331-8173-1c6e6ca21504', 218, 'ai_auto', 0.30),
  ('8a4ad43c-5f2d-4331-8173-1c6e6ca21504', 553, 'ai_auto', 0.30),
  ('8a4ad43c-5f2d-4331-8173-1c6e6ca21504', 554, 'ai_auto', 0.30),
  ('8a4ad43c-5f2d-4331-8173-1c6e6ca21504', 556, 'ai_auto', 0.30),
  ('8a4ad43c-5f2d-4331-8173-1c6e6ca21504', 252, 'ai_auto', 0.15);

-- Imprivata (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('852ede3c-a3cf-4064-bd6a-85dd1a5f6915', 215, 'ai_auto', 0.70),
  ('852ede3c-a3cf-4064-bd6a-85dd1a5f6915', 91, 'ai_auto', 0.40),
  ('852ede3c-a3cf-4064-bd6a-85dd1a5f6915', 556, 'ai_auto', 0.37),
  ('852ede3c-a3cf-4064-bd6a-85dd1a5f6915', 555, 'ai_auto', 0.33),
  ('852ede3c-a3cf-4064-bd6a-85dd1a5f6915', 216, 'ai_auto', 0.30),
  ('852ede3c-a3cf-4064-bd6a-85dd1a5f6915', 217, 'ai_auto', 0.30),
  ('852ede3c-a3cf-4064-bd6a-85dd1a5f6915', 218, 'ai_auto', 0.30),
  ('852ede3c-a3cf-4064-bd6a-85dd1a5f6915', 552, 'ai_auto', 0.30),
  ('852ede3c-a3cf-4064-bd6a-85dd1a5f6915', 553, 'ai_auto', 0.30),
  ('852ede3c-a3cf-4064-bd6a-85dd1a5f6915', 554, 'ai_auto', 0.30);

-- Medigate (Claroty) (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('4e412451-4f7d-4d0c-a04a-e4c9bd0cc40d', 552, 'ai_auto', 0.60),
  ('4e412451-4f7d-4d0c-a04a-e4c9bd0cc40d', 215, 'ai_auto', 0.30),
  ('4e412451-4f7d-4d0c-a04a-e4c9bd0cc40d', 216, 'ai_auto', 0.30),
  ('4e412451-4f7d-4d0c-a04a-e4c9bd0cc40d', 217, 'ai_auto', 0.30),
  ('4e412451-4f7d-4d0c-a04a-e4c9bd0cc40d', 218, 'ai_auto', 0.30),
  ('4e412451-4f7d-4d0c-a04a-e4c9bd0cc40d', 553, 'ai_auto', 0.30),
  ('4e412451-4f7d-4d0c-a04a-e4c9bd0cc40d', 554, 'ai_auto', 0.30),
  ('4e412451-4f7d-4d0c-a04a-e4c9bd0cc40d', 555, 'ai_auto', 0.30),
  ('4e412451-4f7d-4d0c-a04a-e4c9bd0cc40d', 556, 'ai_auto', 0.30),
  ('4e412451-4f7d-4d0c-a04a-e4c9bd0cc40d', 338, 'ai_auto', 0.13);

-- Cynerio (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('d874fb0c-5044-4b7c-829f-33d4acb61ca2', 552, 'ai_auto', 0.40),
  ('d874fb0c-5044-4b7c-829f-33d4acb61ca2', 215, 'ai_auto', 0.30),
  ('d874fb0c-5044-4b7c-829f-33d4acb61ca2', 216, 'ai_auto', 0.30),
  ('d874fb0c-5044-4b7c-829f-33d4acb61ca2', 217, 'ai_auto', 0.30),
  ('d874fb0c-5044-4b7c-829f-33d4acb61ca2', 218, 'ai_auto', 0.30),
  ('d874fb0c-5044-4b7c-829f-33d4acb61ca2', 553, 'ai_auto', 0.30),
  ('d874fb0c-5044-4b7c-829f-33d4acb61ca2', 554, 'ai_auto', 0.30),
  ('d874fb0c-5044-4b7c-829f-33d4acb61ca2', 555, 'ai_auto', 0.30),
  ('d874fb0c-5044-4b7c-829f-33d4acb61ca2', 556, 'ai_auto', 0.30),
  ('d874fb0c-5044-4b7c-829f-33d4acb61ca2', 544, 'ai_auto', 0.12);

-- InterSystems (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('202863f5-a37d-468f-a955-69cccef190e6', 547, 'ai_auto', 0.37),
  ('202863f5-a37d-468f-a955-69cccef190e6', 212, 'ai_auto', 0.35),
  ('202863f5-a37d-468f-a955-69cccef190e6', 213, 'ai_auto', 0.35),
  ('202863f5-a37d-468f-a955-69cccef190e6', 214, 'ai_auto', 0.35),
  ('202863f5-a37d-468f-a955-69cccef190e6', 209, 'ai_auto', 0.30),
  ('202863f5-a37d-468f-a955-69cccef190e6', 210, 'ai_auto', 0.30),
  ('202863f5-a37d-468f-a955-69cccef190e6', 211, 'ai_auto', 0.30),
  ('202863f5-a37d-468f-a955-69cccef190e6', 548, 'ai_auto', 0.30),
  ('202863f5-a37d-468f-a955-69cccef190e6', 549, 'ai_auto', 0.30),
  ('202863f5-a37d-468f-a955-69cccef190e6', 550, 'ai_auto', 0.30);

-- Rhapsody (Lyniate) (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('4d0a87d7-019f-4e53-9c6d-00022f7f3549', 209, 'ai_auto', 0.50),
  ('4d0a87d7-019f-4e53-9c6d-00022f7f3549', 212, 'ai_auto', 0.35),
  ('4d0a87d7-019f-4e53-9c6d-00022f7f3549', 213, 'ai_auto', 0.35),
  ('4d0a87d7-019f-4e53-9c6d-00022f7f3549', 214, 'ai_auto', 0.35),
  ('4d0a87d7-019f-4e53-9c6d-00022f7f3549', 547, 'ai_auto', 0.33),
  ('4d0a87d7-019f-4e53-9c6d-00022f7f3549', 210, 'ai_auto', 0.30),
  ('4d0a87d7-019f-4e53-9c6d-00022f7f3549', 211, 'ai_auto', 0.30),
  ('4d0a87d7-019f-4e53-9c6d-00022f7f3549', 548, 'ai_auto', 0.30),
  ('4d0a87d7-019f-4e53-9c6d-00022f7f3549', 549, 'ai_auto', 0.30),
  ('4d0a87d7-019f-4e53-9c6d-00022f7f3549', 550, 'ai_auto', 0.30);

-- Redox (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('c75c47ad-76c7-472e-ae43-355da741b8cb', 211, 'ai_auto', 0.70),
  ('c75c47ad-76c7-472e-ae43-355da741b8cb', 209, 'ai_auto', 0.45),
  ('c75c47ad-76c7-472e-ae43-355da741b8cb', 214, 'ai_auto', 0.35),
  ('c75c47ad-76c7-472e-ae43-355da741b8cb', 210, 'ai_auto', 0.30),
  ('c75c47ad-76c7-472e-ae43-355da741b8cb', 212, 'ai_auto', 0.30),
  ('c75c47ad-76c7-472e-ae43-355da741b8cb', 213, 'ai_auto', 0.30),
  ('c75c47ad-76c7-472e-ae43-355da741b8cb', 547, 'ai_auto', 0.30),
  ('c75c47ad-76c7-472e-ae43-355da741b8cb', 548, 'ai_auto', 0.30),
  ('c75c47ad-76c7-472e-ae43-355da741b8cb', 549, 'ai_auto', 0.30),
  ('c75c47ad-76c7-472e-ae43-355da741b8cb', 550, 'ai_auto', 0.30);

-- Health Gorilla (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('29e609d6-2a11-4f07-908f-a00fbda6c17c', 547, 'ai_auto', 0.37),
  ('29e609d6-2a11-4f07-908f-a00fbda6c17c', 212, 'ai_auto', 0.35),
  ('29e609d6-2a11-4f07-908f-a00fbda6c17c', 213, 'ai_auto', 0.35),
  ('29e609d6-2a11-4f07-908f-a00fbda6c17c', 548, 'ai_auto', 0.33),
  ('29e609d6-2a11-4f07-908f-a00fbda6c17c', 209, 'ai_auto', 0.30),
  ('29e609d6-2a11-4f07-908f-a00fbda6c17c', 210, 'ai_auto', 0.30),
  ('29e609d6-2a11-4f07-908f-a00fbda6c17c', 211, 'ai_auto', 0.30),
  ('29e609d6-2a11-4f07-908f-a00fbda6c17c', 214, 'ai_auto', 0.30),
  ('29e609d6-2a11-4f07-908f-a00fbda6c17c', 549, 'ai_auto', 0.30),
  ('29e609d6-2a11-4f07-908f-a00fbda6c17c', 550, 'ai_auto', 0.30);

-- Smile Digital Health (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('bcb2b43d-dd02-41ba-87e2-40d81b79d2da', 209, 'ai_auto', 0.45),
  ('bcb2b43d-dd02-41ba-87e2-40d81b79d2da', 210, 'ai_auto', 0.40),
  ('bcb2b43d-dd02-41ba-87e2-40d81b79d2da', 316, 'ai_auto', 0.40),
  ('bcb2b43d-dd02-41ba-87e2-40d81b79d2da', 212, 'ai_auto', 0.35),
  ('bcb2b43d-dd02-41ba-87e2-40d81b79d2da', 213, 'ai_auto', 0.35),
  ('bcb2b43d-dd02-41ba-87e2-40d81b79d2da', 547, 'ai_auto', 0.33),
  ('bcb2b43d-dd02-41ba-87e2-40d81b79d2da', 211, 'ai_auto', 0.30),
  ('bcb2b43d-dd02-41ba-87e2-40d81b79d2da', 214, 'ai_auto', 0.30),
  ('bcb2b43d-dd02-41ba-87e2-40d81b79d2da', 548, 'ai_auto', 0.30),
  ('bcb2b43d-dd02-41ba-87e2-40d81b79d2da', 549, 'ai_auto', 0.30);

-- 1upHealth (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('dbff99ad-50dc-4ced-8b63-5737fa91acee', 209, 'ai_auto', 0.45),
  ('dbff99ad-50dc-4ced-8b63-5737fa91acee', 316, 'ai_auto', 0.40),
  ('dbff99ad-50dc-4ced-8b63-5737fa91acee', 212, 'ai_auto', 0.35),
  ('dbff99ad-50dc-4ced-8b63-5737fa91acee', 213, 'ai_auto', 0.35),
  ('dbff99ad-50dc-4ced-8b63-5737fa91acee', 547, 'ai_auto', 0.33),
  ('dbff99ad-50dc-4ced-8b63-5737fa91acee', 548, 'ai_auto', 0.33),
  ('dbff99ad-50dc-4ced-8b63-5737fa91acee', 210, 'ai_auto', 0.30),
  ('dbff99ad-50dc-4ced-8b63-5737fa91acee', 211, 'ai_auto', 0.30),
  ('dbff99ad-50dc-4ced-8b63-5737fa91acee', 214, 'ai_auto', 0.30),
  ('dbff99ad-50dc-4ced-8b63-5737fa91acee', 549, 'ai_auto', 0.30);

-- Particle Health (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('a442f570-25e8-4a98-b0ed-78bc289923c5', 547, 'ai_auto', 0.37),
  ('a442f570-25e8-4a98-b0ed-78bc289923c5', 212, 'ai_auto', 0.35),
  ('a442f570-25e8-4a98-b0ed-78bc289923c5', 213, 'ai_auto', 0.35),
  ('a442f570-25e8-4a98-b0ed-78bc289923c5', 209, 'ai_auto', 0.30),
  ('a442f570-25e8-4a98-b0ed-78bc289923c5', 210, 'ai_auto', 0.30),
  ('a442f570-25e8-4a98-b0ed-78bc289923c5', 211, 'ai_auto', 0.30),
  ('a442f570-25e8-4a98-b0ed-78bc289923c5', 214, 'ai_auto', 0.30),
  ('a442f570-25e8-4a98-b0ed-78bc289923c5', 548, 'ai_auto', 0.30),
  ('a442f570-25e8-4a98-b0ed-78bc289923c5', 549, 'ai_auto', 0.30),
  ('a442f570-25e8-4a98-b0ed-78bc289923c5', 550, 'ai_auto', 0.30);

-- Mirth (NextGen Connect) (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('c49592fe-27d1-4311-b2e0-3bce00b6ebfa', 209, 'ai_auto', 0.50),
  ('c49592fe-27d1-4311-b2e0-3bce00b6ebfa', 214, 'ai_auto', 0.35),
  ('c49592fe-27d1-4311-b2e0-3bce00b6ebfa', 210, 'ai_auto', 0.30),
  ('c49592fe-27d1-4311-b2e0-3bce00b6ebfa', 211, 'ai_auto', 0.30),
  ('c49592fe-27d1-4311-b2e0-3bce00b6ebfa', 212, 'ai_auto', 0.30),
  ('c49592fe-27d1-4311-b2e0-3bce00b6ebfa', 213, 'ai_auto', 0.30),
  ('c49592fe-27d1-4311-b2e0-3bce00b6ebfa', 547, 'ai_auto', 0.30),
  ('c49592fe-27d1-4311-b2e0-3bce00b6ebfa', 548, 'ai_auto', 0.30),
  ('c49592fe-27d1-4311-b2e0-3bce00b6ebfa', 549, 'ai_auto', 0.30),
  ('c49592fe-27d1-4311-b2e0-3bce00b6ebfa', 550, 'ai_auto', 0.30);

-- Zynx Health (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('5126c750-f781-4b4d-a9fb-7e0650a64294', 196, 'ai_auto', 0.70),
  ('5126c750-f781-4b4d-a9fb-7e0650a64294', 533, 'ai_auto', 0.37),
  ('5126c750-f781-4b4d-a9fb-7e0650a64294', 192, 'ai_auto', 0.30),
  ('5126c750-f781-4b4d-a9fb-7e0650a64294', 193, 'ai_auto', 0.30),
  ('5126c750-f781-4b4d-a9fb-7e0650a64294', 194, 'ai_auto', 0.30),
  ('5126c750-f781-4b4d-a9fb-7e0650a64294', 195, 'ai_auto', 0.30),
  ('5126c750-f781-4b4d-a9fb-7e0650a64294', 197, 'ai_auto', 0.30),
  ('5126c750-f781-4b4d-a9fb-7e0650a64294', 530, 'ai_auto', 0.30),
  ('5126c750-f781-4b4d-a9fb-7e0650a64294', 531, 'ai_auto', 0.30),
  ('5126c750-f781-4b4d-a9fb-7e0650a64294', 532, 'ai_auto', 0.30);

-- Elsevier Clinical Solutions (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('d8ead3a2-1255-4acf-a195-ae697956c2bf', 196, 'ai_auto', 0.43),
  ('d8ead3a2-1255-4acf-a195-ae697956c2bf', 192, 'ai_auto', 0.30),
  ('d8ead3a2-1255-4acf-a195-ae697956c2bf', 193, 'ai_auto', 0.30),
  ('d8ead3a2-1255-4acf-a195-ae697956c2bf', 194, 'ai_auto', 0.30),
  ('d8ead3a2-1255-4acf-a195-ae697956c2bf', 195, 'ai_auto', 0.30),
  ('d8ead3a2-1255-4acf-a195-ae697956c2bf', 197, 'ai_auto', 0.30),
  ('d8ead3a2-1255-4acf-a195-ae697956c2bf', 530, 'ai_auto', 0.30),
  ('d8ead3a2-1255-4acf-a195-ae697956c2bf', 531, 'ai_auto', 0.30),
  ('d8ead3a2-1255-4acf-a195-ae697956c2bf', 532, 'ai_auto', 0.30),
  ('d8ead3a2-1255-4acf-a195-ae697956c2bf', 533, 'ai_auto', 0.30);

-- Vigilanz (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('0a68e70c-cd09-4235-a79b-2ff3116bfd28', 160, 'ai_auto', 0.40),
  ('0a68e70c-cd09-4235-a79b-2ff3116bfd28', 196, 'ai_auto', 0.40),
  ('0a68e70c-cd09-4235-a79b-2ff3116bfd28', 292, 'ai_auto', 0.40),
  ('0a68e70c-cd09-4235-a79b-2ff3116bfd28', 531, 'ai_auto', 0.33),
  ('0a68e70c-cd09-4235-a79b-2ff3116bfd28', 532, 'ai_auto', 0.33),
  ('0a68e70c-cd09-4235-a79b-2ff3116bfd28', 192, 'ai_auto', 0.30),
  ('0a68e70c-cd09-4235-a79b-2ff3116bfd28', 193, 'ai_auto', 0.30),
  ('0a68e70c-cd09-4235-a79b-2ff3116bfd28', 194, 'ai_auto', 0.30),
  ('0a68e70c-cd09-4235-a79b-2ff3116bfd28', 195, 'ai_auto', 0.30),
  ('0a68e70c-cd09-4235-a79b-2ff3116bfd28', 197, 'ai_auto', 0.30);

-- Stanson Health (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('89931084-001c-4f03-b020-e5b2eeab97e3', 196, 'ai_auto', 0.70),
  ('89931084-001c-4f03-b020-e5b2eeab97e3', 533, 'ai_auto', 0.37),
  ('89931084-001c-4f03-b020-e5b2eeab97e3', 192, 'ai_auto', 0.30),
  ('89931084-001c-4f03-b020-e5b2eeab97e3', 193, 'ai_auto', 0.30),
  ('89931084-001c-4f03-b020-e5b2eeab97e3', 194, 'ai_auto', 0.30),
  ('89931084-001c-4f03-b020-e5b2eeab97e3', 195, 'ai_auto', 0.30),
  ('89931084-001c-4f03-b020-e5b2eeab97e3', 197, 'ai_auto', 0.30),
  ('89931084-001c-4f03-b020-e5b2eeab97e3', 530, 'ai_auto', 0.30),
  ('89931084-001c-4f03-b020-e5b2eeab97e3', 531, 'ai_auto', 0.30),
  ('89931084-001c-4f03-b020-e5b2eeab97e3', 532, 'ai_auto', 0.30);

-- DaVita Inc. (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('3d153bc7-317f-4ea3-ba4e-c25286132ebd', 249, 'ai_auto', 0.70),
  ('3d153bc7-317f-4ea3-ba4e-c25286132ebd', 251, 'ai_auto', 0.35),
  ('3d153bc7-317f-4ea3-ba4e-c25286132ebd', 590, 'ai_auto', 0.35),
  ('3d153bc7-317f-4ea3-ba4e-c25286132ebd', 246, 'ai_auto', 0.30),
  ('3d153bc7-317f-4ea3-ba4e-c25286132ebd', 247, 'ai_auto', 0.30),
  ('3d153bc7-317f-4ea3-ba4e-c25286132ebd', 248, 'ai_auto', 0.30),
  ('3d153bc7-317f-4ea3-ba4e-c25286132ebd', 250, 'ai_auto', 0.30),
  ('3d153bc7-317f-4ea3-ba4e-c25286132ebd', 586, 'ai_auto', 0.30),
  ('3d153bc7-317f-4ea3-ba4e-c25286132ebd', 587, 'ai_auto', 0.30),
  ('3d153bc7-317f-4ea3-ba4e-c25286132ebd', 588, 'ai_auto', 0.30);

-- Fresenius Medical Care (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('2a52e9f8-8549-46ad-bc04-48b4fb6496de', 249, 'ai_auto', 0.35),
  ('2a52e9f8-8549-46ad-bc04-48b4fb6496de', 246, 'ai_auto', 0.30),
  ('2a52e9f8-8549-46ad-bc04-48b4fb6496de', 247, 'ai_auto', 0.30),
  ('2a52e9f8-8549-46ad-bc04-48b4fb6496de', 248, 'ai_auto', 0.30),
  ('2a52e9f8-8549-46ad-bc04-48b4fb6496de', 250, 'ai_auto', 0.30),
  ('2a52e9f8-8549-46ad-bc04-48b4fb6496de', 251, 'ai_auto', 0.30),
  ('2a52e9f8-8549-46ad-bc04-48b4fb6496de', 586, 'ai_auto', 0.30),
  ('2a52e9f8-8549-46ad-bc04-48b4fb6496de', 587, 'ai_auto', 0.30),
  ('2a52e9f8-8549-46ad-bc04-48b4fb6496de', 588, 'ai_auto', 0.30),
  ('2a52e9f8-8549-46ad-bc04-48b4fb6496de', 589, 'ai_auto', 0.30);

-- U.S. Renal Care (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('54bf7fdf-8108-4db8-95cf-e43e5427e74e', 249, 'ai_auto', 0.70),
  ('54bf7fdf-8108-4db8-95cf-e43e5427e74e', 251, 'ai_auto', 0.35),
  ('54bf7fdf-8108-4db8-95cf-e43e5427e74e', 590, 'ai_auto', 0.35),
  ('54bf7fdf-8108-4db8-95cf-e43e5427e74e', 246, 'ai_auto', 0.30),
  ('54bf7fdf-8108-4db8-95cf-e43e5427e74e', 247, 'ai_auto', 0.30),
  ('54bf7fdf-8108-4db8-95cf-e43e5427e74e', 248, 'ai_auto', 0.30),
  ('54bf7fdf-8108-4db8-95cf-e43e5427e74e', 250, 'ai_auto', 0.30),
  ('54bf7fdf-8108-4db8-95cf-e43e5427e74e', 586, 'ai_auto', 0.30),
  ('54bf7fdf-8108-4db8-95cf-e43e5427e74e', 587, 'ai_auto', 0.30),
  ('54bf7fdf-8108-4db8-95cf-e43e5427e74e', 588, 'ai_auto', 0.30);

-- Satellite Healthcare (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('572b4d7e-d167-47a2-8ccb-bc399da0efb4', 249, 'ai_auto', 0.70),
  ('572b4d7e-d167-47a2-8ccb-bc399da0efb4', 251, 'ai_auto', 0.35),
  ('572b4d7e-d167-47a2-8ccb-bc399da0efb4', 587, 'ai_auto', 0.35),
  ('572b4d7e-d167-47a2-8ccb-bc399da0efb4', 590, 'ai_auto', 0.35),
  ('572b4d7e-d167-47a2-8ccb-bc399da0efb4', 591, 'ai_auto', 0.35),
  ('572b4d7e-d167-47a2-8ccb-bc399da0efb4', 246, 'ai_auto', 0.30),
  ('572b4d7e-d167-47a2-8ccb-bc399da0efb4', 247, 'ai_auto', 0.30),
  ('572b4d7e-d167-47a2-8ccb-bc399da0efb4', 248, 'ai_auto', 0.30),
  ('572b4d7e-d167-47a2-8ccb-bc399da0efb4', 250, 'ai_auto', 0.30),
  ('572b4d7e-d167-47a2-8ccb-bc399da0efb4', 586, 'ai_auto', 0.30);

-- Dialysis Clinic Inc. (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('a0f095d6-c5b9-4aff-a440-44d5841d893e', 249, 'ai_auto', 0.45),
  ('a0f095d6-c5b9-4aff-a440-44d5841d893e', 587, 'ai_auto', 0.35),
  ('a0f095d6-c5b9-4aff-a440-44d5841d893e', 591, 'ai_auto', 0.35),
  ('a0f095d6-c5b9-4aff-a440-44d5841d893e', 246, 'ai_auto', 0.30),
  ('a0f095d6-c5b9-4aff-a440-44d5841d893e', 247, 'ai_auto', 0.30),
  ('a0f095d6-c5b9-4aff-a440-44d5841d893e', 248, 'ai_auto', 0.30),
  ('a0f095d6-c5b9-4aff-a440-44d5841d893e', 250, 'ai_auto', 0.30),
  ('a0f095d6-c5b9-4aff-a440-44d5841d893e', 251, 'ai_auto', 0.30),
  ('a0f095d6-c5b9-4aff-a440-44d5841d893e', 586, 'ai_auto', 0.30),
  ('a0f095d6-c5b9-4aff-a440-44d5841d893e', 588, 'ai_auto', 0.30);

-- American Renal Associates (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('d14dd633-341c-4984-983c-e0e69ab12fdd', 249, 'ai_auto', 0.40),
  ('d14dd633-341c-4984-983c-e0e69ab12fdd', 251, 'ai_auto', 0.35),
  ('d14dd633-341c-4984-983c-e0e69ab12fdd', 590, 'ai_auto', 0.35),
  ('d14dd633-341c-4984-983c-e0e69ab12fdd', 246, 'ai_auto', 0.30),
  ('d14dd633-341c-4984-983c-e0e69ab12fdd', 247, 'ai_auto', 0.30),
  ('d14dd633-341c-4984-983c-e0e69ab12fdd', 248, 'ai_auto', 0.30),
  ('d14dd633-341c-4984-983c-e0e69ab12fdd', 250, 'ai_auto', 0.30),
  ('d14dd633-341c-4984-983c-e0e69ab12fdd', 586, 'ai_auto', 0.30),
  ('d14dd633-341c-4984-983c-e0e69ab12fdd', 587, 'ai_auto', 0.30),
  ('d14dd633-341c-4984-983c-e0e69ab12fdd', 588, 'ai_auto', 0.30);

-- LHC Group (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('ea53c61b-2067-468b-8b8a-32932de072fb', 252, 'ai_auto', 0.70),
  ('ea53c61b-2067-468b-8b8a-32932de072fb', 253, 'ai_auto', 0.70),
  ('ea53c61b-2067-468b-8b8a-32932de072fb', 344, 'ai_auto', 0.60),
  ('ea53c61b-2067-468b-8b8a-32932de072fb', 592, 'ai_auto', 0.37),
  ('ea53c61b-2067-468b-8b8a-32932de072fb', 254, 'ai_auto', 0.35),
  ('ea53c61b-2067-468b-8b8a-32932de072fb', 255, 'ai_auto', 0.35),
  ('ea53c61b-2067-468b-8b8a-32932de072fb', 256, 'ai_auto', 0.35),
  ('ea53c61b-2067-468b-8b8a-32932de072fb', 595, 'ai_auto', 0.35),
  ('ea53c61b-2067-468b-8b8a-32932de072fb', 596, 'ai_auto', 0.35),
  ('ea53c61b-2067-468b-8b8a-32932de072fb', 593, 'ai_auto', 0.33);

-- VITAS Healthcare (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('1ce5d523-efc3-4bf5-aaaf-0599fe46ed56', 253, 'ai_auto', 0.70),
  ('1ce5d523-efc3-4bf5-aaaf-0599fe46ed56', 592, 'ai_auto', 0.67),
  ('1ce5d523-efc3-4bf5-aaaf-0599fe46ed56', 255, 'ai_auto', 0.45),
  ('1ce5d523-efc3-4bf5-aaaf-0599fe46ed56', 252, 'ai_auto', 0.40),
  ('1ce5d523-efc3-4bf5-aaaf-0599fe46ed56', 593, 'ai_auto', 0.40),
  ('1ce5d523-efc3-4bf5-aaaf-0599fe46ed56', 596, 'ai_auto', 0.40),
  ('1ce5d523-efc3-4bf5-aaaf-0599fe46ed56', 254, 'ai_auto', 0.35),
  ('1ce5d523-efc3-4bf5-aaaf-0599fe46ed56', 595, 'ai_auto', 0.35),
  ('1ce5d523-efc3-4bf5-aaaf-0599fe46ed56', 256, 'ai_auto', 0.30),
  ('1ce5d523-efc3-4bf5-aaaf-0599fe46ed56', 594, 'ai_auto', 0.30);

-- Kindred at Home (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('b2be45bd-e424-456e-b44f-25539a61315d', 252, 'ai_auto', 0.80),
  ('b2be45bd-e424-456e-b44f-25539a61315d', 253, 'ai_auto', 0.70),
  ('b2be45bd-e424-456e-b44f-25539a61315d', 344, 'ai_auto', 0.67),
  ('b2be45bd-e424-456e-b44f-25539a61315d', 256, 'ai_auto', 0.45),
  ('b2be45bd-e424-456e-b44f-25539a61315d', 592, 'ai_auto', 0.37),
  ('b2be45bd-e424-456e-b44f-25539a61315d', 254, 'ai_auto', 0.35),
  ('b2be45bd-e424-456e-b44f-25539a61315d', 255, 'ai_auto', 0.35),
  ('b2be45bd-e424-456e-b44f-25539a61315d', 594, 'ai_auto', 0.35),
  ('b2be45bd-e424-456e-b44f-25539a61315d', 595, 'ai_auto', 0.35),
  ('b2be45bd-e424-456e-b44f-25539a61315d', 596, 'ai_auto', 0.35);

-- Enhabit Home Health & Hospice (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('9c467f2c-f65e-4977-b2b5-6ce672c5b05d', 252, 'ai_auto', 1.00),
  ('9c467f2c-f65e-4977-b2b5-6ce672c5b05d', 253, 'ai_auto', 1.00),
  ('9c467f2c-f65e-4977-b2b5-6ce672c5b05d', 344, 'ai_auto', 1.00),
  ('9c467f2c-f65e-4977-b2b5-6ce672c5b05d', 256, 'ai_auto', 0.45),
  ('9c467f2c-f65e-4977-b2b5-6ce672c5b05d', 254, 'ai_auto', 0.35),
  ('9c467f2c-f65e-4977-b2b5-6ce672c5b05d', 595, 'ai_auto', 0.35),
  ('9c467f2c-f65e-4977-b2b5-6ce672c5b05d', 592, 'ai_auto', 0.33),
  ('9c467f2c-f65e-4977-b2b5-6ce672c5b05d', 596, 'ai_auto', 0.33),
  ('9c467f2c-f65e-4977-b2b5-6ce672c5b05d', 255, 'ai_auto', 0.30),
  ('9c467f2c-f65e-4977-b2b5-6ce672c5b05d', 593, 'ai_auto', 0.30);

-- AccordantHealth (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('35c03fba-75c5-40e5-be34-9d0c1a21371a', 252, 'ai_auto', 0.80),
  ('35c03fba-75c5-40e5-be34-9d0c1a21371a', 256, 'ai_auto', 0.70),
  ('35c03fba-75c5-40e5-be34-9d0c1a21371a', 153, 'ai_auto', 0.40),
  ('35c03fba-75c5-40e5-be34-9d0c1a21371a', 254, 'ai_auto', 0.35),
  ('35c03fba-75c5-40e5-be34-9d0c1a21371a', 595, 'ai_auto', 0.35),
  ('35c03fba-75c5-40e5-be34-9d0c1a21371a', 592, 'ai_auto', 0.33),
  ('35c03fba-75c5-40e5-be34-9d0c1a21371a', 596, 'ai_auto', 0.33),
  ('35c03fba-75c5-40e5-be34-9d0c1a21371a', 253, 'ai_auto', 0.30),
  ('35c03fba-75c5-40e5-be34-9d0c1a21371a', 255, 'ai_auto', 0.30),
  ('35c03fba-75c5-40e5-be34-9d0c1a21371a', 593, 'ai_auto', 0.30);

-- Addus HomeCare (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('1e08ae69-e3fd-4297-aaf1-c7c88aaf4d7b', 252, 'ai_auto', 0.80),
  ('1e08ae69-e3fd-4297-aaf1-c7c88aaf4d7b', 253, 'ai_auto', 0.70),
  ('1e08ae69-e3fd-4297-aaf1-c7c88aaf4d7b', 255, 'ai_auto', 0.45),
  ('1e08ae69-e3fd-4297-aaf1-c7c88aaf4d7b', 256, 'ai_auto', 0.45),
  ('1e08ae69-e3fd-4297-aaf1-c7c88aaf4d7b', 592, 'ai_auto', 0.43),
  ('1e08ae69-e3fd-4297-aaf1-c7c88aaf4d7b', 596, 'ai_auto', 0.42),
  ('1e08ae69-e3fd-4297-aaf1-c7c88aaf4d7b', 593, 'ai_auto', 0.40),
  ('1e08ae69-e3fd-4297-aaf1-c7c88aaf4d7b', 344, 'ai_auto', 0.37),
  ('1e08ae69-e3fd-4297-aaf1-c7c88aaf4d7b', 254, 'ai_auto', 0.35),
  ('1e08ae69-e3fd-4297-aaf1-c7c88aaf4d7b', 595, 'ai_auto', 0.35);

-- Encompass Health (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('d57f0c55-d63c-4df9-9e68-ed501800362d', 252, 'ai_auto', 0.80),
  ('d57f0c55-d63c-4df9-9e68-ed501800362d', 253, 'ai_auto', 0.70),
  ('d57f0c55-d63c-4df9-9e68-ed501800362d', 344, 'ai_auto', 0.37),
  ('d57f0c55-d63c-4df9-9e68-ed501800362d', 254, 'ai_auto', 0.35),
  ('d57f0c55-d63c-4df9-9e68-ed501800362d', 256, 'ai_auto', 0.35),
  ('d57f0c55-d63c-4df9-9e68-ed501800362d', 255, 'ai_auto', 0.30),
  ('d57f0c55-d63c-4df9-9e68-ed501800362d', 592, 'ai_auto', 0.30),
  ('d57f0c55-d63c-4df9-9e68-ed501800362d', 593, 'ai_auto', 0.30),
  ('d57f0c55-d63c-4df9-9e68-ed501800362d', 594, 'ai_auto', 0.30),
  ('d57f0c55-d63c-4df9-9e68-ed501800362d', 595, 'ai_auto', 0.30);

-- Select Medical (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('8a229dc2-bd06-4cae-a266-1c718edf1a89', 254, 'ai_auto', 0.35),
  ('8a229dc2-bd06-4cae-a266-1c718edf1a89', 255, 'ai_auto', 0.35),
  ('8a229dc2-bd06-4cae-a266-1c718edf1a89', 592, 'ai_auto', 0.33),
  ('8a229dc2-bd06-4cae-a266-1c718edf1a89', 593, 'ai_auto', 0.33),
  ('8a229dc2-bd06-4cae-a266-1c718edf1a89', 596, 'ai_auto', 0.33),
  ('8a229dc2-bd06-4cae-a266-1c718edf1a89', 252, 'ai_auto', 0.30),
  ('8a229dc2-bd06-4cae-a266-1c718edf1a89', 253, 'ai_auto', 0.30),
  ('8a229dc2-bd06-4cae-a266-1c718edf1a89', 256, 'ai_auto', 0.30),
  ('8a229dc2-bd06-4cae-a266-1c718edf1a89', 594, 'ai_auto', 0.30),
  ('8a229dc2-bd06-4cae-a266-1c718edf1a89', 595, 'ai_auto', 0.30);

-- ATI Physical Therapy (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('7463612a-6cf0-40a0-85c0-b6ab26867be1', 254, 'ai_auto', 0.40),
  ('7463612a-6cf0-40a0-85c0-b6ab26867be1', 595, 'ai_auto', 0.35),
  ('7463612a-6cf0-40a0-85c0-b6ab26867be1', 592, 'ai_auto', 0.33),
  ('7463612a-6cf0-40a0-85c0-b6ab26867be1', 596, 'ai_auto', 0.33),
  ('7463612a-6cf0-40a0-85c0-b6ab26867be1', 252, 'ai_auto', 0.30),
  ('7463612a-6cf0-40a0-85c0-b6ab26867be1', 253, 'ai_auto', 0.30),
  ('7463612a-6cf0-40a0-85c0-b6ab26867be1', 255, 'ai_auto', 0.30),
  ('7463612a-6cf0-40a0-85c0-b6ab26867be1', 256, 'ai_auto', 0.30),
  ('7463612a-6cf0-40a0-85c0-b6ab26867be1', 593, 'ai_auto', 0.30),
  ('7463612a-6cf0-40a0-85c0-b6ab26867be1', 594, 'ai_auto', 0.30);

-- U.S. Physical Therapy (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('bf8e0393-4ed8-428f-b31b-f81e05ea181c', 211, 'ai_auto', 0.40),
  ('bf8e0393-4ed8-428f-b31b-f81e05ea181c', 252, 'ai_auto', 0.30),
  ('bf8e0393-4ed8-428f-b31b-f81e05ea181c', 253, 'ai_auto', 0.30),
  ('bf8e0393-4ed8-428f-b31b-f81e05ea181c', 254, 'ai_auto', 0.30),
  ('bf8e0393-4ed8-428f-b31b-f81e05ea181c', 255, 'ai_auto', 0.30),
  ('bf8e0393-4ed8-428f-b31b-f81e05ea181c', 256, 'ai_auto', 0.30),
  ('bf8e0393-4ed8-428f-b31b-f81e05ea181c', 592, 'ai_auto', 0.30),
  ('bf8e0393-4ed8-428f-b31b-f81e05ea181c', 593, 'ai_auto', 0.30),
  ('bf8e0393-4ed8-428f-b31b-f81e05ea181c', 594, 'ai_auto', 0.30),
  ('bf8e0393-4ed8-428f-b31b-f81e05ea181c', 595, 'ai_auto', 0.30);

-- Athletico Physical Therapy (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('f5616824-b382-473c-b8c8-262e999de25f', 254, 'ai_auto', 0.40),
  ('f5616824-b382-473c-b8c8-262e999de25f', 595, 'ai_auto', 0.35),
  ('f5616824-b382-473c-b8c8-262e999de25f', 592, 'ai_auto', 0.33),
  ('f5616824-b382-473c-b8c8-262e999de25f', 596, 'ai_auto', 0.33),
  ('f5616824-b382-473c-b8c8-262e999de25f', 252, 'ai_auto', 0.30),
  ('f5616824-b382-473c-b8c8-262e999de25f', 253, 'ai_auto', 0.30),
  ('f5616824-b382-473c-b8c8-262e999de25f', 255, 'ai_auto', 0.30),
  ('f5616824-b382-473c-b8c8-262e999de25f', 256, 'ai_auto', 0.30),
  ('f5616824-b382-473c-b8c8-262e999de25f', 593, 'ai_auto', 0.30),
  ('f5616824-b382-473c-b8c8-262e999de25f', 594, 'ai_auto', 0.30);

-- Pivot Physical Therapy (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('0c7c8e40-ed6d-4538-97c1-84fbcdd79cf6', 4, 'ai_auto', 0.40),
  ('0c7c8e40-ed6d-4538-97c1-84fbcdd79cf6', 254, 'ai_auto', 0.40),
  ('0c7c8e40-ed6d-4538-97c1-84fbcdd79cf6', 595, 'ai_auto', 0.35),
  ('0c7c8e40-ed6d-4538-97c1-84fbcdd79cf6', 592, 'ai_auto', 0.33),
  ('0c7c8e40-ed6d-4538-97c1-84fbcdd79cf6', 596, 'ai_auto', 0.33),
  ('0c7c8e40-ed6d-4538-97c1-84fbcdd79cf6', 252, 'ai_auto', 0.30),
  ('0c7c8e40-ed6d-4538-97c1-84fbcdd79cf6', 253, 'ai_auto', 0.30),
  ('0c7c8e40-ed6d-4538-97c1-84fbcdd79cf6', 255, 'ai_auto', 0.30),
  ('0c7c8e40-ed6d-4538-97c1-84fbcdd79cf6', 256, 'ai_auto', 0.30),
  ('0c7c8e40-ed6d-4538-97c1-84fbcdd79cf6', 593, 'ai_auto', 0.30);

-- RehabCare Group (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('463b52c0-313b-4a02-b784-eb34986358cb', 254, 'ai_auto', 0.50),
  ('463b52c0-313b-4a02-b784-eb34986358cb', 255, 'ai_auto', 0.40),
  ('463b52c0-313b-4a02-b784-eb34986358cb', 592, 'ai_auto', 0.40),
  ('463b52c0-313b-4a02-b784-eb34986358cb', 593, 'ai_auto', 0.40),
  ('463b52c0-313b-4a02-b784-eb34986358cb', 594, 'ai_auto', 0.38),
  ('463b52c0-313b-4a02-b784-eb34986358cb', 596, 'ai_auto', 0.38),
  ('463b52c0-313b-4a02-b784-eb34986358cb', 595, 'ai_auto', 0.35),
  ('463b52c0-313b-4a02-b784-eb34986358cb', 252, 'ai_auto', 0.30),
  ('463b52c0-313b-4a02-b784-eb34986358cb', 253, 'ai_auto', 0.30),
  ('463b52c0-313b-4a02-b784-eb34986358cb', 256, 'ai_auto', 0.30);

-- Quest Diagnostics (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('7e56913e-0182-4919-9c53-984bb2b532a0', 578, 'ai_auto', 0.37),
  ('7e56913e-0182-4919-9c53-984bb2b532a0', 579, 'ai_auto', 0.37),
  ('7e56913e-0182-4919-9c53-984bb2b532a0', 581, 'ai_auto', 0.37),
  ('7e56913e-0182-4919-9c53-984bb2b532a0', 240, 'ai_auto', 0.35),
  ('7e56913e-0182-4919-9c53-984bb2b532a0', 241, 'ai_auto', 0.35),
  ('7e56913e-0182-4919-9c53-984bb2b532a0', 242, 'ai_auto', 0.35),
  ('7e56913e-0182-4919-9c53-984bb2b532a0', 580, 'ai_auto', 0.33),
  ('7e56913e-0182-4919-9c53-984bb2b532a0', 338, 'ai_auto', 0.13),
  ('7e56913e-0182-4919-9c53-984bb2b532a0', 44, 'ai_auto', 0.10),
  ('7e56913e-0182-4919-9c53-984bb2b532a0', 59, 'ai_auto', 0.10);

-- Labcorp (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('4c9764da-423d-4bcd-87e5-dbce828db459', 240, 'ai_auto', 0.45),
  ('4c9764da-423d-4bcd-87e5-dbce828db459', 241, 'ai_auto', 0.45),
  ('4c9764da-423d-4bcd-87e5-dbce828db459', 578, 'ai_auto', 0.40),
  ('4c9764da-423d-4bcd-87e5-dbce828db459', 579, 'ai_auto', 0.40),
  ('4c9764da-423d-4bcd-87e5-dbce828db459', 580, 'ai_auto', 0.40),
  ('4c9764da-423d-4bcd-87e5-dbce828db459', 581, 'ai_auto', 0.33),
  ('4c9764da-423d-4bcd-87e5-dbce828db459', 242, 'ai_auto', 0.30),
  ('4c9764da-423d-4bcd-87e5-dbce828db459', 338, 'ai_auto', 0.17),
  ('4c9764da-423d-4bcd-87e5-dbce828db459', 107, 'ai_auto', 0.15),
  ('4c9764da-423d-4bcd-87e5-dbce828db459', 137, 'ai_auto', 0.15);

-- BioReference Laboratories (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('987bf9d3-39cc-429d-9021-8d91e96d7854', 240, 'ai_auto', 1.00),
  ('987bf9d3-39cc-429d-9021-8d91e96d7854', 342, 'ai_auto', 0.70),
  ('987bf9d3-39cc-429d-9021-8d91e96d7854', 241, 'ai_auto', 0.40),
  ('987bf9d3-39cc-429d-9021-8d91e96d7854', 578, 'ai_auto', 0.40),
  ('987bf9d3-39cc-429d-9021-8d91e96d7854', 579, 'ai_auto', 0.40),
  ('987bf9d3-39cc-429d-9021-8d91e96d7854', 580, 'ai_auto', 0.37),
  ('987bf9d3-39cc-429d-9021-8d91e96d7854', 581, 'ai_auto', 0.37),
  ('987bf9d3-39cc-429d-9021-8d91e96d7854', 242, 'ai_auto', 0.35),
  ('987bf9d3-39cc-429d-9021-8d91e96d7854', 138, 'ai_auto', 0.17),
  ('987bf9d3-39cc-429d-9021-8d91e96d7854', 338, 'ai_auto', 0.13);

-- ARUP Laboratories (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('685d44a3-b85f-4f56-827c-8c8a331c778e', 240, 'ai_auto', 0.80),
  ('685d44a3-b85f-4f56-827c-8c8a331c778e', 342, 'ai_auto', 0.70),
  ('685d44a3-b85f-4f56-827c-8c8a331c778e', 241, 'ai_auto', 0.45),
  ('685d44a3-b85f-4f56-827c-8c8a331c778e', 578, 'ai_auto', 0.40),
  ('685d44a3-b85f-4f56-827c-8c8a331c778e', 579, 'ai_auto', 0.40),
  ('685d44a3-b85f-4f56-827c-8c8a331c778e', 580, 'ai_auto', 0.40),
  ('685d44a3-b85f-4f56-827c-8c8a331c778e', 581, 'ai_auto', 0.37),
  ('685d44a3-b85f-4f56-827c-8c8a331c778e', 242, 'ai_auto', 0.30),
  ('685d44a3-b85f-4f56-827c-8c8a331c778e', 55, 'ai_auto', 0.15),
  ('685d44a3-b85f-4f56-827c-8c8a331c778e', 107, 'ai_auto', 0.15);

-- Sonic Healthcare (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('81432328-fa72-4a52-9198-1ccaae0c0dc6', 242, 'ai_auto', 0.40),
  ('81432328-fa72-4a52-9198-1ccaae0c0dc6', 578, 'ai_auto', 0.37),
  ('81432328-fa72-4a52-9198-1ccaae0c0dc6', 579, 'ai_auto', 0.37),
  ('81432328-fa72-4a52-9198-1ccaae0c0dc6', 240, 'ai_auto', 0.35),
  ('81432328-fa72-4a52-9198-1ccaae0c0dc6', 241, 'ai_auto', 0.35),
  ('81432328-fa72-4a52-9198-1ccaae0c0dc6', 580, 'ai_auto', 0.33),
  ('81432328-fa72-4a52-9198-1ccaae0c0dc6', 581, 'ai_auto', 0.33),
  ('81432328-fa72-4a52-9198-1ccaae0c0dc6', 252, 'ai_auto', 0.15),
  ('81432328-fa72-4a52-9198-1ccaae0c0dc6', 255, 'ai_auto', 0.15),
  ('81432328-fa72-4a52-9198-1ccaae0c0dc6', 592, 'ai_auto', 0.15);

-- Eurofins Scientific (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('8f615846-9940-491e-b76f-b967a26da0b2', 578, 'ai_auto', 0.37),
  ('8f615846-9940-491e-b76f-b967a26da0b2', 579, 'ai_auto', 0.37),
  ('8f615846-9940-491e-b76f-b967a26da0b2', 581, 'ai_auto', 0.37),
  ('8f615846-9940-491e-b76f-b967a26da0b2', 240, 'ai_auto', 0.35),
  ('8f615846-9940-491e-b76f-b967a26da0b2', 241, 'ai_auto', 0.35),
  ('8f615846-9940-491e-b76f-b967a26da0b2', 242, 'ai_auto', 0.35),
  ('8f615846-9940-491e-b76f-b967a26da0b2', 580, 'ai_auto', 0.33),
  ('8f615846-9940-491e-b76f-b967a26da0b2', 592, 'ai_auto', 0.12),
  ('8f615846-9940-491e-b76f-b967a26da0b2', 47, 'ai_auto', 0.10),
  ('8f615846-9940-491e-b76f-b967a26da0b2', 249, 'ai_auto', 0.10);

-- Mayo Clinic Laboratories (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('615a86ce-56e9-45cc-bf03-3a93b3db73cf', 240, 'ai_auto', 0.80),
  ('615a86ce-56e9-45cc-bf03-3a93b3db73cf', 342, 'ai_auto', 0.70),
  ('615a86ce-56e9-45cc-bf03-3a93b3db73cf', 241, 'ai_auto', 0.45),
  ('615a86ce-56e9-45cc-bf03-3a93b3db73cf', 578, 'ai_auto', 0.43),
  ('615a86ce-56e9-45cc-bf03-3a93b3db73cf', 579, 'ai_auto', 0.43),
  ('615a86ce-56e9-45cc-bf03-3a93b3db73cf', 580, 'ai_auto', 0.40),
  ('615a86ce-56e9-45cc-bf03-3a93b3db73cf', 581, 'ai_auto', 0.37),
  ('615a86ce-56e9-45cc-bf03-3a93b3db73cf', 242, 'ai_auto', 0.35),
  ('615a86ce-56e9-45cc-bf03-3a93b3db73cf', 338, 'ai_auto', 0.30),
  ('615a86ce-56e9-45cc-bf03-3a93b3db73cf', 138, 'ai_auto', 0.17);

-- PharMerica (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('9f858780-59d1-4494-91f9-4699b387b57a', 249, 'ai_auto', 0.35),
  ('9f858780-59d1-4494-91f9-4699b387b57a', 251, 'ai_auto', 0.35),
  ('9f858780-59d1-4494-91f9-4699b387b57a', 590, 'ai_auto', 0.35),
  ('9f858780-59d1-4494-91f9-4699b387b57a', 246, 'ai_auto', 0.30),
  ('9f858780-59d1-4494-91f9-4699b387b57a', 247, 'ai_auto', 0.30),
  ('9f858780-59d1-4494-91f9-4699b387b57a', 248, 'ai_auto', 0.30),
  ('9f858780-59d1-4494-91f9-4699b387b57a', 250, 'ai_auto', 0.30),
  ('9f858780-59d1-4494-91f9-4699b387b57a', 586, 'ai_auto', 0.30),
  ('9f858780-59d1-4494-91f9-4699b387b57a', 587, 'ai_auto', 0.30),
  ('9f858780-59d1-4494-91f9-4699b387b57a', 588, 'ai_auto', 0.30);

-- CVS Health / Coram (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('8306fa8f-cba6-44d5-8a36-95247ebe135c', 154, 'ai_auto', 0.40),
  ('8306fa8f-cba6-44d5-8a36-95247ebe135c', 249, 'ai_auto', 0.35),
  ('8306fa8f-cba6-44d5-8a36-95247ebe135c', 251, 'ai_auto', 0.35),
  ('8306fa8f-cba6-44d5-8a36-95247ebe135c', 590, 'ai_auto', 0.35),
  ('8306fa8f-cba6-44d5-8a36-95247ebe135c', 246, 'ai_auto', 0.30),
  ('8306fa8f-cba6-44d5-8a36-95247ebe135c', 247, 'ai_auto', 0.30),
  ('8306fa8f-cba6-44d5-8a36-95247ebe135c', 248, 'ai_auto', 0.30),
  ('8306fa8f-cba6-44d5-8a36-95247ebe135c', 250, 'ai_auto', 0.30),
  ('8306fa8f-cba6-44d5-8a36-95247ebe135c', 586, 'ai_auto', 0.30),
  ('8306fa8f-cba6-44d5-8a36-95247ebe135c', 587, 'ai_auto', 0.30);

-- Express Scripts (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('55867daf-4d2e-4374-9b7d-57e88c2ab982', 249, 'ai_auto', 0.35),
  ('55867daf-4d2e-4374-9b7d-57e88c2ab982', 251, 'ai_auto', 0.35),
  ('55867daf-4d2e-4374-9b7d-57e88c2ab982', 590, 'ai_auto', 0.35),
  ('55867daf-4d2e-4374-9b7d-57e88c2ab982', 246, 'ai_auto', 0.30),
  ('55867daf-4d2e-4374-9b7d-57e88c2ab982', 247, 'ai_auto', 0.30),
  ('55867daf-4d2e-4374-9b7d-57e88c2ab982', 248, 'ai_auto', 0.30),
  ('55867daf-4d2e-4374-9b7d-57e88c2ab982', 250, 'ai_auto', 0.30),
  ('55867daf-4d2e-4374-9b7d-57e88c2ab982', 586, 'ai_auto', 0.30),
  ('55867daf-4d2e-4374-9b7d-57e88c2ab982', 587, 'ai_auto', 0.30),
  ('55867daf-4d2e-4374-9b7d-57e88c2ab982', 588, 'ai_auto', 0.30);

-- OptumRx (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('6eb9f3ba-92c7-4e38-acf9-406536af779b', 249, 'ai_auto', 0.35),
  ('6eb9f3ba-92c7-4e38-acf9-406536af779b', 251, 'ai_auto', 0.35),
  ('6eb9f3ba-92c7-4e38-acf9-406536af779b', 590, 'ai_auto', 0.35),
  ('6eb9f3ba-92c7-4e38-acf9-406536af779b', 246, 'ai_auto', 0.30),
  ('6eb9f3ba-92c7-4e38-acf9-406536af779b', 247, 'ai_auto', 0.30),
  ('6eb9f3ba-92c7-4e38-acf9-406536af779b', 248, 'ai_auto', 0.30),
  ('6eb9f3ba-92c7-4e38-acf9-406536af779b', 250, 'ai_auto', 0.30),
  ('6eb9f3ba-92c7-4e38-acf9-406536af779b', 586, 'ai_auto', 0.30),
  ('6eb9f3ba-92c7-4e38-acf9-406536af779b', 587, 'ai_auto', 0.30),
  ('6eb9f3ba-92c7-4e38-acf9-406536af779b', 588, 'ai_auto', 0.30);

-- Rite Aid Health Alliance (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('ea410c35-74d7-42ad-9c79-9fa3f21050a3', 149, 'ai_auto', 0.40),
  ('ea410c35-74d7-42ad-9c79-9fa3f21050a3', 249, 'ai_auto', 0.35),
  ('ea410c35-74d7-42ad-9c79-9fa3f21050a3', 251, 'ai_auto', 0.35),
  ('ea410c35-74d7-42ad-9c79-9fa3f21050a3', 590, 'ai_auto', 0.35),
  ('ea410c35-74d7-42ad-9c79-9fa3f21050a3', 246, 'ai_auto', 0.30),
  ('ea410c35-74d7-42ad-9c79-9fa3f21050a3', 247, 'ai_auto', 0.30),
  ('ea410c35-74d7-42ad-9c79-9fa3f21050a3', 248, 'ai_auto', 0.30),
  ('ea410c35-74d7-42ad-9c79-9fa3f21050a3', 250, 'ai_auto', 0.30),
  ('ea410c35-74d7-42ad-9c79-9fa3f21050a3', 586, 'ai_auto', 0.30),
  ('ea410c35-74d7-42ad-9c79-9fa3f21050a3', 587, 'ai_auto', 0.30);

-- Cintas Corporation (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('92ac6aa9-58e7-4a30-a2c4-3d72fd69d6f6', 262, 'ai_auto', 0.70),
  ('92ac6aa9-58e7-4a30-a2c4-3d72fd69d6f6', 263, 'ai_auto', 0.70),
  ('92ac6aa9-58e7-4a30-a2c4-3d72fd69d6f6', 264, 'ai_auto', 0.35),
  ('92ac6aa9-58e7-4a30-a2c4-3d72fd69d6f6', 266, 'ai_auto', 0.35),
  ('92ac6aa9-58e7-4a30-a2c4-3d72fd69d6f6', 602, 'ai_auto', 0.33),
  ('92ac6aa9-58e7-4a30-a2c4-3d72fd69d6f6', 261, 'ai_auto', 0.30),
  ('92ac6aa9-58e7-4a30-a2c4-3d72fd69d6f6', 265, 'ai_auto', 0.30),
  ('92ac6aa9-58e7-4a30-a2c4-3d72fd69d6f6', 601, 'ai_auto', 0.30),
  ('92ac6aa9-58e7-4a30-a2c4-3d72fd69d6f6', 603, 'ai_auto', 0.30),
  ('92ac6aa9-58e7-4a30-a2c4-3d72fd69d6f6', 604, 'ai_auto', 0.30);

-- Unitex (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('5f723e9f-5d87-498e-877a-d2d8b718c7f2', 262, 'ai_auto', 0.70),
  ('5f723e9f-5d87-498e-877a-d2d8b718c7f2', 263, 'ai_auto', 0.70),
  ('5f723e9f-5d87-498e-877a-d2d8b718c7f2', 264, 'ai_auto', 0.35),
  ('5f723e9f-5d87-498e-877a-d2d8b718c7f2', 266, 'ai_auto', 0.35),
  ('5f723e9f-5d87-498e-877a-d2d8b718c7f2', 605, 'ai_auto', 0.33),
  ('5f723e9f-5d87-498e-877a-d2d8b718c7f2', 261, 'ai_auto', 0.30),
  ('5f723e9f-5d87-498e-877a-d2d8b718c7f2', 265, 'ai_auto', 0.30),
  ('5f723e9f-5d87-498e-877a-d2d8b718c7f2', 601, 'ai_auto', 0.30),
  ('5f723e9f-5d87-498e-877a-d2d8b718c7f2', 602, 'ai_auto', 0.30),
  ('5f723e9f-5d87-498e-877a-d2d8b718c7f2', 603, 'ai_auto', 0.30);

-- ImageFIRST (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('b669c33b-3496-4958-af8e-74a4b20a049c', 262, 'ai_auto', 0.70),
  ('b669c33b-3496-4958-af8e-74a4b20a049c', 263, 'ai_auto', 0.70),
  ('b669c33b-3496-4958-af8e-74a4b20a049c', 264, 'ai_auto', 0.35),
  ('b669c33b-3496-4958-af8e-74a4b20a049c', 266, 'ai_auto', 0.35),
  ('b669c33b-3496-4958-af8e-74a4b20a049c', 602, 'ai_auto', 0.33),
  ('b669c33b-3496-4958-af8e-74a4b20a049c', 261, 'ai_auto', 0.30),
  ('b669c33b-3496-4958-af8e-74a4b20a049c', 265, 'ai_auto', 0.30),
  ('b669c33b-3496-4958-af8e-74a4b20a049c', 601, 'ai_auto', 0.30),
  ('b669c33b-3496-4958-af8e-74a4b20a049c', 603, 'ai_auto', 0.30),
  ('b669c33b-3496-4958-af8e-74a4b20a049c', 604, 'ai_auto', 0.30);

-- Roscoe Company (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('f7a83c51-f3cc-4a1b-ac56-d020ed864522', 262, 'ai_auto', 0.70),
  ('f7a83c51-f3cc-4a1b-ac56-d020ed864522', 263, 'ai_auto', 0.70),
  ('f7a83c51-f3cc-4a1b-ac56-d020ed864522', 264, 'ai_auto', 0.35),
  ('f7a83c51-f3cc-4a1b-ac56-d020ed864522', 266, 'ai_auto', 0.35),
  ('f7a83c51-f3cc-4a1b-ac56-d020ed864522', 605, 'ai_auto', 0.33),
  ('f7a83c51-f3cc-4a1b-ac56-d020ed864522', 261, 'ai_auto', 0.30),
  ('f7a83c51-f3cc-4a1b-ac56-d020ed864522', 265, 'ai_auto', 0.30),
  ('f7a83c51-f3cc-4a1b-ac56-d020ed864522', 338, 'ai_auto', 0.30),
  ('f7a83c51-f3cc-4a1b-ac56-d020ed864522', 601, 'ai_auto', 0.30),
  ('f7a83c51-f3cc-4a1b-ac56-d020ed864522', 602, 'ai_auto', 0.30);

-- Aramark Healthcare+ (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('f72c93a4-ecd5-4a3b-89f2-3a9c1b17ad7d', 262, 'ai_auto', 0.70),
  ('f72c93a4-ecd5-4a3b-89f2-3a9c1b17ad7d', 264, 'ai_auto', 0.70),
  ('f72c93a4-ecd5-4a3b-89f2-3a9c1b17ad7d', 266, 'ai_auto', 0.35),
  ('f72c93a4-ecd5-4a3b-89f2-3a9c1b17ad7d', 261, 'ai_auto', 0.30),
  ('f72c93a4-ecd5-4a3b-89f2-3a9c1b17ad7d', 263, 'ai_auto', 0.30),
  ('f72c93a4-ecd5-4a3b-89f2-3a9c1b17ad7d', 265, 'ai_auto', 0.30),
  ('f72c93a4-ecd5-4a3b-89f2-3a9c1b17ad7d', 601, 'ai_auto', 0.30),
  ('f72c93a4-ecd5-4a3b-89f2-3a9c1b17ad7d', 602, 'ai_auto', 0.30),
  ('f72c93a4-ecd5-4a3b-89f2-3a9c1b17ad7d', 603, 'ai_auto', 0.30),
  ('f72c93a4-ecd5-4a3b-89f2-3a9c1b17ad7d', 604, 'ai_auto', 0.30);

-- Sodexo Healthcare (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('4033976e-7416-4987-af0a-88a0a2710d78', 264, 'ai_auto', 0.40),
  ('4033976e-7416-4987-af0a-88a0a2710d78', 605, 'ai_auto', 0.37),
  ('4033976e-7416-4987-af0a-88a0a2710d78', 266, 'ai_auto', 0.35),
  ('4033976e-7416-4987-af0a-88a0a2710d78', 261, 'ai_auto', 0.30),
  ('4033976e-7416-4987-af0a-88a0a2710d78', 262, 'ai_auto', 0.30),
  ('4033976e-7416-4987-af0a-88a0a2710d78', 263, 'ai_auto', 0.30),
  ('4033976e-7416-4987-af0a-88a0a2710d78', 265, 'ai_auto', 0.30),
  ('4033976e-7416-4987-af0a-88a0a2710d78', 601, 'ai_auto', 0.30),
  ('4033976e-7416-4987-af0a-88a0a2710d78', 602, 'ai_auto', 0.30),
  ('4033976e-7416-4987-af0a-88a0a2710d78', 603, 'ai_auto', 0.30);

-- Morrison Healthcare (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('c56196ba-9f91-4a81-8452-c0c1022ebae2', 264, 'ai_auto', 0.40),
  ('c56196ba-9f91-4a81-8452-c0c1022ebae2', 266, 'ai_auto', 0.35),
  ('c56196ba-9f91-4a81-8452-c0c1022ebae2', 604, 'ai_auto', 0.33),
  ('c56196ba-9f91-4a81-8452-c0c1022ebae2', 605, 'ai_auto', 0.33),
  ('c56196ba-9f91-4a81-8452-c0c1022ebae2', 261, 'ai_auto', 0.30),
  ('c56196ba-9f91-4a81-8452-c0c1022ebae2', 262, 'ai_auto', 0.30),
  ('c56196ba-9f91-4a81-8452-c0c1022ebae2', 263, 'ai_auto', 0.30),
  ('c56196ba-9f91-4a81-8452-c0c1022ebae2', 265, 'ai_auto', 0.30),
  ('c56196ba-9f91-4a81-8452-c0c1022ebae2', 601, 'ai_auto', 0.30),
  ('c56196ba-9f91-4a81-8452-c0c1022ebae2', 602, 'ai_auto', 0.30);

-- Compass Group / Healthcare (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('2cd63703-1664-4341-ae80-76e1a1375ff1', 264, 'ai_auto', 0.35),
  ('2cd63703-1664-4341-ae80-76e1a1375ff1', 604, 'ai_auto', 0.33),
  ('2cd63703-1664-4341-ae80-76e1a1375ff1', 605, 'ai_auto', 0.33),
  ('2cd63703-1664-4341-ae80-76e1a1375ff1', 261, 'ai_auto', 0.30),
  ('2cd63703-1664-4341-ae80-76e1a1375ff1', 262, 'ai_auto', 0.30),
  ('2cd63703-1664-4341-ae80-76e1a1375ff1', 263, 'ai_auto', 0.30),
  ('2cd63703-1664-4341-ae80-76e1a1375ff1', 265, 'ai_auto', 0.30),
  ('2cd63703-1664-4341-ae80-76e1a1375ff1', 266, 'ai_auto', 0.30),
  ('2cd63703-1664-4341-ae80-76e1a1375ff1', 601, 'ai_auto', 0.30),
  ('2cd63703-1664-4341-ae80-76e1a1375ff1', 602, 'ai_auto', 0.30);

-- HHS (Hospital Housekeeping Systems) (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('47129a01-4f35-4dd9-8c8f-25ec466ce9a1', 264, 'ai_auto', 0.40),
  ('47129a01-4f35-4dd9-8c8f-25ec466ce9a1', 605, 'ai_auto', 0.37),
  ('47129a01-4f35-4dd9-8c8f-25ec466ce9a1', 266, 'ai_auto', 0.35),
  ('47129a01-4f35-4dd9-8c8f-25ec466ce9a1', 261, 'ai_auto', 0.30),
  ('47129a01-4f35-4dd9-8c8f-25ec466ce9a1', 262, 'ai_auto', 0.30),
  ('47129a01-4f35-4dd9-8c8f-25ec466ce9a1', 263, 'ai_auto', 0.30),
  ('47129a01-4f35-4dd9-8c8f-25ec466ce9a1', 265, 'ai_auto', 0.30),
  ('47129a01-4f35-4dd9-8c8f-25ec466ce9a1', 601, 'ai_auto', 0.30),
  ('47129a01-4f35-4dd9-8c8f-25ec466ce9a1', 602, 'ai_auto', 0.30),
  ('47129a01-4f35-4dd9-8c8f-25ec466ce9a1', 603, 'ai_auto', 0.30);

-- Elior Group North America (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('1a63527d-91ed-4f3f-94ae-58e2d1e16b1a', 264, 'ai_auto', 0.70),
  ('1a63527d-91ed-4f3f-94ae-58e2d1e16b1a', 266, 'ai_auto', 0.35),
  ('1a63527d-91ed-4f3f-94ae-58e2d1e16b1a', 604, 'ai_auto', 0.33),
  ('1a63527d-91ed-4f3f-94ae-58e2d1e16b1a', 605, 'ai_auto', 0.33),
  ('1a63527d-91ed-4f3f-94ae-58e2d1e16b1a', 261, 'ai_auto', 0.30),
  ('1a63527d-91ed-4f3f-94ae-58e2d1e16b1a', 262, 'ai_auto', 0.30),
  ('1a63527d-91ed-4f3f-94ae-58e2d1e16b1a', 263, 'ai_auto', 0.30),
  ('1a63527d-91ed-4f3f-94ae-58e2d1e16b1a', 265, 'ai_auto', 0.30),
  ('1a63527d-91ed-4f3f-94ae-58e2d1e16b1a', 601, 'ai_auto', 0.30),
  ('1a63527d-91ed-4f3f-94ae-58e2d1e16b1a', 602, 'ai_auto', 0.30);

-- Canteen (Compass Group) (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('5a73363e-ccce-4541-989a-3a07e0063da8', 261, 'ai_auto', 0.30),
  ('5a73363e-ccce-4541-989a-3a07e0063da8', 262, 'ai_auto', 0.30),
  ('5a73363e-ccce-4541-989a-3a07e0063da8', 263, 'ai_auto', 0.30),
  ('5a73363e-ccce-4541-989a-3a07e0063da8', 264, 'ai_auto', 0.30),
  ('5a73363e-ccce-4541-989a-3a07e0063da8', 265, 'ai_auto', 0.30),
  ('5a73363e-ccce-4541-989a-3a07e0063da8', 266, 'ai_auto', 0.30),
  ('5a73363e-ccce-4541-989a-3a07e0063da8', 601, 'ai_auto', 0.30),
  ('5a73363e-ccce-4541-989a-3a07e0063da8', 602, 'ai_auto', 0.30),
  ('5a73363e-ccce-4541-989a-3a07e0063da8', 603, 'ai_auto', 0.30),
  ('5a73363e-ccce-4541-989a-3a07e0063da8', 604, 'ai_auto', 0.30);

-- ABM Healthcare (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('72b5a656-f09d-47ee-9b36-391955c851f8', 338, 'ai_auto', 0.37),
  ('72b5a656-f09d-47ee-9b36-391955c851f8', 264, 'ai_auto', 0.35),
  ('72b5a656-f09d-47ee-9b36-391955c851f8', 266, 'ai_auto', 0.35),
  ('72b5a656-f09d-47ee-9b36-391955c851f8', 261, 'ai_auto', 0.30),
  ('72b5a656-f09d-47ee-9b36-391955c851f8', 262, 'ai_auto', 0.30),
  ('72b5a656-f09d-47ee-9b36-391955c851f8', 263, 'ai_auto', 0.30),
  ('72b5a656-f09d-47ee-9b36-391955c851f8', 265, 'ai_auto', 0.30),
  ('72b5a656-f09d-47ee-9b36-391955c851f8', 601, 'ai_auto', 0.30),
  ('72b5a656-f09d-47ee-9b36-391955c851f8', 602, 'ai_auto', 0.30),
  ('72b5a656-f09d-47ee-9b36-391955c851f8', 603, 'ai_auto', 0.30);

-- Crothall Healthcare (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('b6834379-36d0-493b-b020-c0957be6fccd', 135, 'ai_auto', 0.40),
  ('b6834379-36d0-493b-b020-c0957be6fccd', 338, 'ai_auto', 0.37),
  ('b6834379-36d0-493b-b020-c0957be6fccd', 264, 'ai_auto', 0.35),
  ('b6834379-36d0-493b-b020-c0957be6fccd', 266, 'ai_auto', 0.35),
  ('b6834379-36d0-493b-b020-c0957be6fccd', 604, 'ai_auto', 0.33),
  ('b6834379-36d0-493b-b020-c0957be6fccd', 605, 'ai_auto', 0.33),
  ('b6834379-36d0-493b-b020-c0957be6fccd', 261, 'ai_auto', 0.30),
  ('b6834379-36d0-493b-b020-c0957be6fccd', 262, 'ai_auto', 0.30),
  ('b6834379-36d0-493b-b020-c0957be6fccd', 263, 'ai_auto', 0.30),
  ('b6834379-36d0-493b-b020-c0957be6fccd', 265, 'ai_auto', 0.30);

-- Xanitos (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('233d09ab-3981-427e-ad88-c05929d54ad5', 70, 'ai_auto', 0.40),
  ('233d09ab-3981-427e-ad88-c05929d54ad5', 261, 'ai_auto', 0.40),
  ('233d09ab-3981-427e-ad88-c05929d54ad5', 604, 'ai_auto', 0.37),
  ('233d09ab-3981-427e-ad88-c05929d54ad5', 264, 'ai_auto', 0.35),
  ('233d09ab-3981-427e-ad88-c05929d54ad5', 266, 'ai_auto', 0.35),
  ('233d09ab-3981-427e-ad88-c05929d54ad5', 605, 'ai_auto', 0.33),
  ('233d09ab-3981-427e-ad88-c05929d54ad5', 262, 'ai_auto', 0.30),
  ('233d09ab-3981-427e-ad88-c05929d54ad5', 263, 'ai_auto', 0.30),
  ('233d09ab-3981-427e-ad88-c05929d54ad5', 265, 'ai_auto', 0.30),
  ('233d09ab-3981-427e-ad88-c05929d54ad5', 601, 'ai_auto', 0.30);

-- Healthcare Services Group (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('fd0fcb95-aad0-4d8b-976d-ce2ae988a862', 264, 'ai_auto', 0.45),
  ('fd0fcb95-aad0-4d8b-976d-ce2ae988a862', 266, 'ai_auto', 0.45),
  ('fd0fcb95-aad0-4d8b-976d-ce2ae988a862', 605, 'ai_auto', 0.33),
  ('fd0fcb95-aad0-4d8b-976d-ce2ae988a862', 261, 'ai_auto', 0.30),
  ('fd0fcb95-aad0-4d8b-976d-ce2ae988a862', 262, 'ai_auto', 0.30),
  ('fd0fcb95-aad0-4d8b-976d-ce2ae988a862', 263, 'ai_auto', 0.30),
  ('fd0fcb95-aad0-4d8b-976d-ce2ae988a862', 265, 'ai_auto', 0.30),
  ('fd0fcb95-aad0-4d8b-976d-ce2ae988a862', 601, 'ai_auto', 0.30),
  ('fd0fcb95-aad0-4d8b-976d-ce2ae988a862', 602, 'ai_auto', 0.30),
  ('fd0fcb95-aad0-4d8b-976d-ce2ae988a862', 603, 'ai_auto', 0.30);

-- Diversey (Solenis) (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('f0cf2ddc-68aa-43a6-8ad1-e8e9c4194716', 70, 'ai_auto', 0.40),
  ('f0cf2ddc-68aa-43a6-8ad1-e8e9c4194716', 261, 'ai_auto', 0.30),
  ('f0cf2ddc-68aa-43a6-8ad1-e8e9c4194716', 262, 'ai_auto', 0.30),
  ('f0cf2ddc-68aa-43a6-8ad1-e8e9c4194716', 263, 'ai_auto', 0.30),
  ('f0cf2ddc-68aa-43a6-8ad1-e8e9c4194716', 264, 'ai_auto', 0.30),
  ('f0cf2ddc-68aa-43a6-8ad1-e8e9c4194716', 265, 'ai_auto', 0.30),
  ('f0cf2ddc-68aa-43a6-8ad1-e8e9c4194716', 266, 'ai_auto', 0.30),
  ('f0cf2ddc-68aa-43a6-8ad1-e8e9c4194716', 601, 'ai_auto', 0.30),
  ('f0cf2ddc-68aa-43a6-8ad1-e8e9c4194716', 602, 'ai_auto', 0.30),
  ('f0cf2ddc-68aa-43a6-8ad1-e8e9c4194716', 603, 'ai_auto', 0.30);

-- ServiceMaster Clean (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('61ec5694-0375-4db5-90aa-801878b3ecc3', 264, 'ai_auto', 0.35),
  ('61ec5694-0375-4db5-90aa-801878b3ecc3', 266, 'ai_auto', 0.35),
  ('61ec5694-0375-4db5-90aa-801878b3ecc3', 261, 'ai_auto', 0.30),
  ('61ec5694-0375-4db5-90aa-801878b3ecc3', 262, 'ai_auto', 0.30),
  ('61ec5694-0375-4db5-90aa-801878b3ecc3', 263, 'ai_auto', 0.30),
  ('61ec5694-0375-4db5-90aa-801878b3ecc3', 265, 'ai_auto', 0.30),
  ('61ec5694-0375-4db5-90aa-801878b3ecc3', 601, 'ai_auto', 0.30),
  ('61ec5694-0375-4db5-90aa-801878b3ecc3', 602, 'ai_auto', 0.30),
  ('61ec5694-0375-4db5-90aa-801878b3ecc3', 603, 'ai_auto', 0.30),
  ('61ec5694-0375-4db5-90aa-801878b3ecc3', 604, 'ai_auto', 0.30);

-- Stericycle (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('87c2079a-ea3f-48d8-aa15-a66a7c4fd0a9', 602, 'ai_auto', 0.60),
  ('87c2079a-ea3f-48d8-aa15-a66a7c4fd0a9', 264, 'ai_auto', 0.35),
  ('87c2079a-ea3f-48d8-aa15-a66a7c4fd0a9', 266, 'ai_auto', 0.35),
  ('87c2079a-ea3f-48d8-aa15-a66a7c4fd0a9', 261, 'ai_auto', 0.30),
  ('87c2079a-ea3f-48d8-aa15-a66a7c4fd0a9', 262, 'ai_auto', 0.30),
  ('87c2079a-ea3f-48d8-aa15-a66a7c4fd0a9', 263, 'ai_auto', 0.30),
  ('87c2079a-ea3f-48d8-aa15-a66a7c4fd0a9', 265, 'ai_auto', 0.30),
  ('87c2079a-ea3f-48d8-aa15-a66a7c4fd0a9', 601, 'ai_auto', 0.30),
  ('87c2079a-ea3f-48d8-aa15-a66a7c4fd0a9', 603, 'ai_auto', 0.30),
  ('87c2079a-ea3f-48d8-aa15-a66a7c4fd0a9', 604, 'ai_auto', 0.30);

-- Sharps Compliance (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('d634c5e6-86d6-4e79-8e8c-479b49c866fd', 602, 'ai_auto', 0.37),
  ('d634c5e6-86d6-4e79-8e8c-479b49c866fd', 311, 'ai_auto', 0.35),
  ('d634c5e6-86d6-4e79-8e8c-479b49c866fd', 605, 'ai_auto', 0.33),
  ('d634c5e6-86d6-4e79-8e8c-479b49c866fd', 261, 'ai_auto', 0.30),
  ('d634c5e6-86d6-4e79-8e8c-479b49c866fd', 262, 'ai_auto', 0.30),
  ('d634c5e6-86d6-4e79-8e8c-479b49c866fd', 263, 'ai_auto', 0.30),
  ('d634c5e6-86d6-4e79-8e8c-479b49c866fd', 264, 'ai_auto', 0.30),
  ('d634c5e6-86d6-4e79-8e8c-479b49c866fd', 265, 'ai_auto', 0.30),
  ('d634c5e6-86d6-4e79-8e8c-479b49c866fd', 266, 'ai_auto', 0.30),
  ('d634c5e6-86d6-4e79-8e8c-479b49c866fd', 601, 'ai_auto', 0.30);

-- Clean Harbors (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('8d81a697-c018-446d-8fcf-ce3721b4d685', 602, 'ai_auto', 0.37),
  ('8d81a697-c018-446d-8fcf-ce3721b4d685', 264, 'ai_auto', 0.35),
  ('8d81a697-c018-446d-8fcf-ce3721b4d685', 266, 'ai_auto', 0.35),
  ('8d81a697-c018-446d-8fcf-ce3721b4d685', 261, 'ai_auto', 0.30),
  ('8d81a697-c018-446d-8fcf-ce3721b4d685', 262, 'ai_auto', 0.30),
  ('8d81a697-c018-446d-8fcf-ce3721b4d685', 263, 'ai_auto', 0.30),
  ('8d81a697-c018-446d-8fcf-ce3721b4d685', 265, 'ai_auto', 0.30),
  ('8d81a697-c018-446d-8fcf-ce3721b4d685', 601, 'ai_auto', 0.30),
  ('8d81a697-c018-446d-8fcf-ce3721b4d685', 603, 'ai_auto', 0.30),
  ('8d81a697-c018-446d-8fcf-ce3721b4d685', 604, 'ai_auto', 0.30);

-- Daniels Health (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('b4a1ae06-8415-4f91-8aa3-e2d5ec273e41', 264, 'ai_auto', 0.35),
  ('b4a1ae06-8415-4f91-8aa3-e2d5ec273e41', 266, 'ai_auto', 0.35),
  ('b4a1ae06-8415-4f91-8aa3-e2d5ec273e41', 602, 'ai_auto', 0.33),
  ('b4a1ae06-8415-4f91-8aa3-e2d5ec273e41', 605, 'ai_auto', 0.33),
  ('b4a1ae06-8415-4f91-8aa3-e2d5ec273e41', 261, 'ai_auto', 0.30),
  ('b4a1ae06-8415-4f91-8aa3-e2d5ec273e41', 262, 'ai_auto', 0.30),
  ('b4a1ae06-8415-4f91-8aa3-e2d5ec273e41', 263, 'ai_auto', 0.30),
  ('b4a1ae06-8415-4f91-8aa3-e2d5ec273e41', 265, 'ai_auto', 0.30),
  ('b4a1ae06-8415-4f91-8aa3-e2d5ec273e41', 601, 'ai_auto', 0.30),
  ('b4a1ae06-8415-4f91-8aa3-e2d5ec273e41', 603, 'ai_auto', 0.30);

-- Triumvirate Environmental (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('e6ad2ec5-c522-4f7e-a0a2-2529ffcf1618', 602, 'ai_auto', 0.37),
  ('e6ad2ec5-c522-4f7e-a0a2-2529ffcf1618', 264, 'ai_auto', 0.35),
  ('e6ad2ec5-c522-4f7e-a0a2-2529ffcf1618', 266, 'ai_auto', 0.35),
  ('e6ad2ec5-c522-4f7e-a0a2-2529ffcf1618', 605, 'ai_auto', 0.33),
  ('e6ad2ec5-c522-4f7e-a0a2-2529ffcf1618', 261, 'ai_auto', 0.30),
  ('e6ad2ec5-c522-4f7e-a0a2-2529ffcf1618', 262, 'ai_auto', 0.30),
  ('e6ad2ec5-c522-4f7e-a0a2-2529ffcf1618', 263, 'ai_auto', 0.30),
  ('e6ad2ec5-c522-4f7e-a0a2-2529ffcf1618', 265, 'ai_auto', 0.30),
  ('e6ad2ec5-c522-4f7e-a0a2-2529ffcf1618', 601, 'ai_auto', 0.30),
  ('e6ad2ec5-c522-4f7e-a0a2-2529ffcf1618', 603, 'ai_auto', 0.30);

-- Biomedical Waste Solutions (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('9ddb2b8f-b184-4a51-b913-5b7f3c8e3cc7', 602, 'ai_auto', 0.50),
  ('9ddb2b8f-b184-4a51-b913-5b7f3c8e3cc7', 264, 'ai_auto', 0.35),
  ('9ddb2b8f-b184-4a51-b913-5b7f3c8e3cc7', 266, 'ai_auto', 0.35),
  ('9ddb2b8f-b184-4a51-b913-5b7f3c8e3cc7', 261, 'ai_auto', 0.30),
  ('9ddb2b8f-b184-4a51-b913-5b7f3c8e3cc7', 262, 'ai_auto', 0.30),
  ('9ddb2b8f-b184-4a51-b913-5b7f3c8e3cc7', 263, 'ai_auto', 0.30),
  ('9ddb2b8f-b184-4a51-b913-5b7f3c8e3cc7', 265, 'ai_auto', 0.30),
  ('9ddb2b8f-b184-4a51-b913-5b7f3c8e3cc7', 601, 'ai_auto', 0.30),
  ('9ddb2b8f-b184-4a51-b913-5b7f3c8e3cc7', 603, 'ai_auto', 0.30),
  ('9ddb2b8f-b184-4a51-b913-5b7f3c8e3cc7', 604, 'ai_auto', 0.30);

-- US Ecology (Republic Services) (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('db5208b9-e581-45c0-8fa0-54f0fa32dda7', 264, 'ai_auto', 0.40),
  ('db5208b9-e581-45c0-8fa0-54f0fa32dda7', 266, 'ai_auto', 0.40),
  ('db5208b9-e581-45c0-8fa0-54f0fa32dda7', 602, 'ai_auto', 0.37),
  ('db5208b9-e581-45c0-8fa0-54f0fa32dda7', 605, 'ai_auto', 0.33),
  ('db5208b9-e581-45c0-8fa0-54f0fa32dda7', 261, 'ai_auto', 0.30),
  ('db5208b9-e581-45c0-8fa0-54f0fa32dda7', 262, 'ai_auto', 0.30),
  ('db5208b9-e581-45c0-8fa0-54f0fa32dda7', 263, 'ai_auto', 0.30),
  ('db5208b9-e581-45c0-8fa0-54f0fa32dda7', 265, 'ai_auto', 0.30),
  ('db5208b9-e581-45c0-8fa0-54f0fa32dda7', 601, 'ai_auto', 0.30),
  ('db5208b9-e581-45c0-8fa0-54f0fa32dda7', 603, 'ai_auto', 0.30);

-- ModivCare (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('b3e58b51-e1b6-409f-800d-eaaff71c627a', 259, 'ai_auto', 0.70),
  ('b3e58b51-e1b6-409f-800d-eaaff71c627a', 135, 'ai_auto', 0.40),
  ('b3e58b51-e1b6-409f-800d-eaaff71c627a', 257, 'ai_auto', 0.40),
  ('b3e58b51-e1b6-409f-800d-eaaff71c627a', 600, 'ai_auto', 0.37),
  ('b3e58b51-e1b6-409f-800d-eaaff71c627a', 258, 'ai_auto', 0.35),
  ('b3e58b51-e1b6-409f-800d-eaaff71c627a', 260, 'ai_auto', 0.35),
  ('b3e58b51-e1b6-409f-800d-eaaff71c627a', 597, 'ai_auto', 0.35),
  ('b3e58b51-e1b6-409f-800d-eaaff71c627a', 599, 'ai_auto', 0.35),
  ('b3e58b51-e1b6-409f-800d-eaaff71c627a', 598, 'ai_auto', 0.30),
  ('b3e58b51-e1b6-409f-800d-eaaff71c627a', 338, 'ai_auto', 0.17);

-- MTM Inc. (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('acca1e34-9f6e-460e-b75b-97f871f268bf', 259, 'ai_auto', 0.70),
  ('acca1e34-9f6e-460e-b75b-97f871f268bf', 135, 'ai_auto', 0.40),
  ('acca1e34-9f6e-460e-b75b-97f871f268bf', 600, 'ai_auto', 0.37),
  ('acca1e34-9f6e-460e-b75b-97f871f268bf', 257, 'ai_auto', 0.35),
  ('acca1e34-9f6e-460e-b75b-97f871f268bf', 258, 'ai_auto', 0.35),
  ('acca1e34-9f6e-460e-b75b-97f871f268bf', 597, 'ai_auto', 0.35),
  ('acca1e34-9f6e-460e-b75b-97f871f268bf', 260, 'ai_auto', 0.30),
  ('acca1e34-9f6e-460e-b75b-97f871f268bf', 598, 'ai_auto', 0.30),
  ('acca1e34-9f6e-460e-b75b-97f871f268bf', 599, 'ai_auto', 0.30),
  ('acca1e34-9f6e-460e-b75b-97f871f268bf', 511, 'ai_auto', 0.10);

-- Access2Care (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('9316142f-2a4b-4389-9f62-21de01a9f91c', 259, 'ai_auto', 0.70),
  ('9316142f-2a4b-4389-9f62-21de01a9f91c', 135, 'ai_auto', 0.40),
  ('9316142f-2a4b-4389-9f62-21de01a9f91c', 600, 'ai_auto', 0.37),
  ('9316142f-2a4b-4389-9f62-21de01a9f91c', 257, 'ai_auto', 0.35),
  ('9316142f-2a4b-4389-9f62-21de01a9f91c', 258, 'ai_auto', 0.35),
  ('9316142f-2a4b-4389-9f62-21de01a9f91c', 597, 'ai_auto', 0.35),
  ('9316142f-2a4b-4389-9f62-21de01a9f91c', 260, 'ai_auto', 0.30),
  ('9316142f-2a4b-4389-9f62-21de01a9f91c', 598, 'ai_auto', 0.30),
  ('9316142f-2a4b-4389-9f62-21de01a9f91c', 599, 'ai_auto', 0.30),
  ('9316142f-2a4b-4389-9f62-21de01a9f91c', 338, 'ai_auto', 0.17);

-- Veyo (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('e309d642-7403-4fde-bb92-9a49eab4fa82', 259, 'ai_auto', 0.70),
  ('e309d642-7403-4fde-bb92-9a49eab4fa82', 135, 'ai_auto', 0.40),
  ('e309d642-7403-4fde-bb92-9a49eab4fa82', 600, 'ai_auto', 0.37),
  ('e309d642-7403-4fde-bb92-9a49eab4fa82', 257, 'ai_auto', 0.35),
  ('e309d642-7403-4fde-bb92-9a49eab4fa82', 258, 'ai_auto', 0.35),
  ('e309d642-7403-4fde-bb92-9a49eab4fa82', 597, 'ai_auto', 0.35),
  ('e309d642-7403-4fde-bb92-9a49eab4fa82', 260, 'ai_auto', 0.30),
  ('e309d642-7403-4fde-bb92-9a49eab4fa82', 598, 'ai_auto', 0.30),
  ('e309d642-7403-4fde-bb92-9a49eab4fa82', 599, 'ai_auto', 0.30),
  ('e309d642-7403-4fde-bb92-9a49eab4fa82', 338, 'ai_auto', 0.17);

-- SafeRide Health (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('30116bb4-5ee4-4a67-a07b-5efda5cd6878', 135, 'ai_auto', 0.40),
  ('30116bb4-5ee4-4a67-a07b-5efda5cd6878', 257, 'ai_auto', 0.40),
  ('30116bb4-5ee4-4a67-a07b-5efda5cd6878', 598, 'ai_auto', 0.40),
  ('30116bb4-5ee4-4a67-a07b-5efda5cd6878', 258, 'ai_auto', 0.35),
  ('30116bb4-5ee4-4a67-a07b-5efda5cd6878', 600, 'ai_auto', 0.33),
  ('30116bb4-5ee4-4a67-a07b-5efda5cd6878', 259, 'ai_auto', 0.33),
  ('30116bb4-5ee4-4a67-a07b-5efda5cd6878', 597, 'ai_auto', 0.33),
  ('30116bb4-5ee4-4a67-a07b-5efda5cd6878', 260, 'ai_auto', 0.30),
  ('30116bb4-5ee4-4a67-a07b-5efda5cd6878', 599, 'ai_auto', 0.30),
  ('30116bb4-5ee4-4a67-a07b-5efda5cd6878', 338, 'ai_auto', 0.23);

-- Crothall Healthcare (patient transport) (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('9115db18-5275-45ac-a13b-2fd7c3f09182', 135, 'ai_auto', 1.00),
  ('9115db18-5275-45ac-a13b-2fd7c3f09182', 257, 'ai_auto', 0.45),
  ('9115db18-5275-45ac-a13b-2fd7c3f09182', 597, 'ai_auto', 0.40),
  ('9115db18-5275-45ac-a13b-2fd7c3f09182', 600, 'ai_auto', 0.40),
  ('9115db18-5275-45ac-a13b-2fd7c3f09182', 260, 'ai_auto', 0.35),
  ('9115db18-5275-45ac-a13b-2fd7c3f09182', 599, 'ai_auto', 0.35),
  ('9115db18-5275-45ac-a13b-2fd7c3f09182', 258, 'ai_auto', 0.30),
  ('9115db18-5275-45ac-a13b-2fd7c3f09182', 259, 'ai_auto', 0.30),
  ('9115db18-5275-45ac-a13b-2fd7c3f09182', 598, 'ai_auto', 0.30),
  ('9115db18-5275-45ac-a13b-2fd7c3f09182', 331, 'ai_auto', 0.20);

-- AMR (American Medical Response) (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('557f06dc-64ea-46bc-a71c-96f6d36cca74', 259, 'ai_auto', 0.45),
  ('557f06dc-64ea-46bc-a71c-96f6d36cca74', 600, 'ai_auto', 0.43),
  ('557f06dc-64ea-46bc-a71c-96f6d36cca74', 135, 'ai_auto', 0.40),
  ('557f06dc-64ea-46bc-a71c-96f6d36cca74', 257, 'ai_auto', 0.40),
  ('557f06dc-64ea-46bc-a71c-96f6d36cca74', 597, 'ai_auto', 0.40),
  ('557f06dc-64ea-46bc-a71c-96f6d36cca74', 258, 'ai_auto', 0.35),
  ('557f06dc-64ea-46bc-a71c-96f6d36cca74', 260, 'ai_auto', 0.35),
  ('557f06dc-64ea-46bc-a71c-96f6d36cca74', 599, 'ai_auto', 0.35),
  ('557f06dc-64ea-46bc-a71c-96f6d36cca74', 598, 'ai_auto', 0.30),
  ('557f06dc-64ea-46bc-a71c-96f6d36cca74', 614, 'ai_auto', 0.20);

-- AMN Healthcare (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('705bc2d1-e857-4e09-baaf-d071d7f89a0d', 300, 'ai_auto', 0.40),
  ('705bc2d1-e857-4e09-baaf-d071d7f89a0d', 645, 'ai_auto', 0.40),
  ('705bc2d1-e857-4e09-baaf-d071d7f89a0d', 338, 'ai_auto', 0.37),
  ('705bc2d1-e857-4e09-baaf-d071d7f89a0d', 297, 'ai_auto', 0.35),
  ('705bc2d1-e857-4e09-baaf-d071d7f89a0d', 298, 'ai_auto', 0.35),
  ('705bc2d1-e857-4e09-baaf-d071d7f89a0d', 301, 'ai_auto', 0.35),
  ('705bc2d1-e857-4e09-baaf-d071d7f89a0d', 638, 'ai_auto', 0.33),
  ('705bc2d1-e857-4e09-baaf-d071d7f89a0d', 639, 'ai_auto', 0.33),
  ('705bc2d1-e857-4e09-baaf-d071d7f89a0d', 640, 'ai_auto', 0.33),
  ('705bc2d1-e857-4e09-baaf-d071d7f89a0d', 299, 'ai_auto', 0.30);

-- Aya Healthcare (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('97cc4ca2-57d4-438d-807f-abee61390d75', 639, 'ai_auto', 0.60),
  ('97cc4ca2-57d4-438d-807f-abee61390d75', 645, 'ai_auto', 0.40),
  ('97cc4ca2-57d4-438d-807f-abee61390d75', 640, 'ai_auto', 0.37),
  ('97cc4ca2-57d4-438d-807f-abee61390d75', 297, 'ai_auto', 0.35),
  ('97cc4ca2-57d4-438d-807f-abee61390d75', 298, 'ai_auto', 0.35),
  ('97cc4ca2-57d4-438d-807f-abee61390d75', 300, 'ai_auto', 0.35),
  ('97cc4ca2-57d4-438d-807f-abee61390d75', 301, 'ai_auto', 0.35),
  ('97cc4ca2-57d4-438d-807f-abee61390d75', 638, 'ai_auto', 0.33),
  ('97cc4ca2-57d4-438d-807f-abee61390d75', 299, 'ai_auto', 0.30),
  ('97cc4ca2-57d4-438d-807f-abee61390d75', 302, 'ai_auto', 0.30);

-- Cross Country Healthcare (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('08ba7491-a186-46f8-be38-c5e4109d928a', 300, 'ai_auto', 0.40),
  ('08ba7491-a186-46f8-be38-c5e4109d928a', 645, 'ai_auto', 0.40),
  ('08ba7491-a186-46f8-be38-c5e4109d928a', 297, 'ai_auto', 0.35),
  ('08ba7491-a186-46f8-be38-c5e4109d928a', 298, 'ai_auto', 0.35),
  ('08ba7491-a186-46f8-be38-c5e4109d928a', 301, 'ai_auto', 0.35),
  ('08ba7491-a186-46f8-be38-c5e4109d928a', 638, 'ai_auto', 0.33),
  ('08ba7491-a186-46f8-be38-c5e4109d928a', 639, 'ai_auto', 0.33),
  ('08ba7491-a186-46f8-be38-c5e4109d928a', 299, 'ai_auto', 0.30),
  ('08ba7491-a186-46f8-be38-c5e4109d928a', 302, 'ai_auto', 0.30),
  ('08ba7491-a186-46f8-be38-c5e4109d928a', 640, 'ai_auto', 0.30);

-- Medical Solutions (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('47960086-ac57-4dae-b7b7-d572512b2ffa', 300, 'ai_auto', 0.40),
  ('47960086-ac57-4dae-b7b7-d572512b2ffa', 645, 'ai_auto', 0.40),
  ('47960086-ac57-4dae-b7b7-d572512b2ffa', 639, 'ai_auto', 0.37),
  ('47960086-ac57-4dae-b7b7-d572512b2ffa', 297, 'ai_auto', 0.35),
  ('47960086-ac57-4dae-b7b7-d572512b2ffa', 298, 'ai_auto', 0.35),
  ('47960086-ac57-4dae-b7b7-d572512b2ffa', 301, 'ai_auto', 0.35),
  ('47960086-ac57-4dae-b7b7-d572512b2ffa', 638, 'ai_auto', 0.33),
  ('47960086-ac57-4dae-b7b7-d572512b2ffa', 299, 'ai_auto', 0.30),
  ('47960086-ac57-4dae-b7b7-d572512b2ffa', 302, 'ai_auto', 0.30),
  ('47960086-ac57-4dae-b7b7-d572512b2ffa', 640, 'ai_auto', 0.30);

-- CompHealth (CHG Healthcare) (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('2ca834d3-2aa3-448d-82c8-75fd4685470a', 300, 'ai_auto', 0.40),
  ('2ca834d3-2aa3-448d-82c8-75fd4685470a', 645, 'ai_auto', 0.40),
  ('2ca834d3-2aa3-448d-82c8-75fd4685470a', 639, 'ai_auto', 0.37),
  ('2ca834d3-2aa3-448d-82c8-75fd4685470a', 297, 'ai_auto', 0.35),
  ('2ca834d3-2aa3-448d-82c8-75fd4685470a', 298, 'ai_auto', 0.35),
  ('2ca834d3-2aa3-448d-82c8-75fd4685470a', 301, 'ai_auto', 0.35),
  ('2ca834d3-2aa3-448d-82c8-75fd4685470a', 299, 'ai_auto', 0.30),
  ('2ca834d3-2aa3-448d-82c8-75fd4685470a', 302, 'ai_auto', 0.30),
  ('2ca834d3-2aa3-448d-82c8-75fd4685470a', 638, 'ai_auto', 0.30),
  ('2ca834d3-2aa3-448d-82c8-75fd4685470a', 640, 'ai_auto', 0.30);

-- Supplemental Health Care (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('d390b264-9124-45d7-b107-6c4c712d6066', 300, 'ai_auto', 0.40),
  ('d390b264-9124-45d7-b107-6c4c712d6066', 645, 'ai_auto', 0.40),
  ('d390b264-9124-45d7-b107-6c4c712d6066', 297, 'ai_auto', 0.35),
  ('d390b264-9124-45d7-b107-6c4c712d6066', 298, 'ai_auto', 0.35),
  ('d390b264-9124-45d7-b107-6c4c712d6066', 301, 'ai_auto', 0.35),
  ('d390b264-9124-45d7-b107-6c4c712d6066', 638, 'ai_auto', 0.33),
  ('d390b264-9124-45d7-b107-6c4c712d6066', 639, 'ai_auto', 0.33),
  ('d390b264-9124-45d7-b107-6c4c712d6066', 299, 'ai_auto', 0.30),
  ('d390b264-9124-45d7-b107-6c4c712d6066', 302, 'ai_auto', 0.30),
  ('d390b264-9124-45d7-b107-6c4c712d6066', 640, 'ai_auto', 0.30);

-- Jackson Healthcare (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('14f5c942-3a04-4842-a653-68d251bde98d', 338, 'ai_auto', 0.37),
  ('14f5c942-3a04-4842-a653-68d251bde98d', 298, 'ai_auto', 0.35),
  ('14f5c942-3a04-4842-a653-68d251bde98d', 638, 'ai_auto', 0.33),
  ('14f5c942-3a04-4842-a653-68d251bde98d', 639, 'ai_auto', 0.33),
  ('14f5c942-3a04-4842-a653-68d251bde98d', 297, 'ai_auto', 0.30),
  ('14f5c942-3a04-4842-a653-68d251bde98d', 299, 'ai_auto', 0.30),
  ('14f5c942-3a04-4842-a653-68d251bde98d', 300, 'ai_auto', 0.30),
  ('14f5c942-3a04-4842-a653-68d251bde98d', 301, 'ai_auto', 0.30),
  ('14f5c942-3a04-4842-a653-68d251bde98d', 302, 'ai_auto', 0.30),
  ('14f5c942-3a04-4842-a653-68d251bde98d', 640, 'ai_auto', 0.30);

-- Fastaff Travel Nursing (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('5b5a31c1-ded6-475d-9858-67c5b4e67084', 638, 'ai_auto', 0.40),
  ('5b5a31c1-ded6-475d-9858-67c5b4e67084', 645, 'ai_auto', 0.40),
  ('5b5a31c1-ded6-475d-9858-67c5b4e67084', 639, 'ai_auto', 0.37),
  ('5b5a31c1-ded6-475d-9858-67c5b4e67084', 297, 'ai_auto', 0.35),
  ('5b5a31c1-ded6-475d-9858-67c5b4e67084', 298, 'ai_auto', 0.35),
  ('5b5a31c1-ded6-475d-9858-67c5b4e67084', 300, 'ai_auto', 0.35),
  ('5b5a31c1-ded6-475d-9858-67c5b4e67084', 301, 'ai_auto', 0.35),
  ('5b5a31c1-ded6-475d-9858-67c5b4e67084', 640, 'ai_auto', 0.33),
  ('5b5a31c1-ded6-475d-9858-67c5b4e67084', 299, 'ai_auto', 0.30),
  ('5b5a31c1-ded6-475d-9858-67c5b4e67084', 302, 'ai_auto', 0.30);

-- WittKieffer (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('acbd6be0-7b17-4267-9548-06c14aadfb9a', 302, 'ai_auto', 0.70),
  ('acbd6be0-7b17-4267-9548-06c14aadfb9a', 338, 'ai_auto', 0.60),
  ('acbd6be0-7b17-4267-9548-06c14aadfb9a', 297, 'ai_auto', 0.30),
  ('acbd6be0-7b17-4267-9548-06c14aadfb9a', 298, 'ai_auto', 0.30),
  ('acbd6be0-7b17-4267-9548-06c14aadfb9a', 299, 'ai_auto', 0.30),
  ('acbd6be0-7b17-4267-9548-06c14aadfb9a', 300, 'ai_auto', 0.30),
  ('acbd6be0-7b17-4267-9548-06c14aadfb9a', 301, 'ai_auto', 0.30),
  ('acbd6be0-7b17-4267-9548-06c14aadfb9a', 638, 'ai_auto', 0.30),
  ('acbd6be0-7b17-4267-9548-06c14aadfb9a', 639, 'ai_auto', 0.30),
  ('acbd6be0-7b17-4267-9548-06c14aadfb9a', 640, 'ai_auto', 0.30);

-- Korn Ferry Healthcare (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('bcbfe7ac-3ed6-473b-8801-762dc2542c52', 302, 'ai_auto', 0.70),
  ('bcbfe7ac-3ed6-473b-8801-762dc2542c52', 314, 'ai_auto', 0.45),
  ('bcbfe7ac-3ed6-473b-8801-762dc2542c52', 297, 'ai_auto', 0.30),
  ('bcbfe7ac-3ed6-473b-8801-762dc2542c52', 298, 'ai_auto', 0.30),
  ('bcbfe7ac-3ed6-473b-8801-762dc2542c52', 299, 'ai_auto', 0.30),
  ('bcbfe7ac-3ed6-473b-8801-762dc2542c52', 300, 'ai_auto', 0.30),
  ('bcbfe7ac-3ed6-473b-8801-762dc2542c52', 301, 'ai_auto', 0.30),
  ('bcbfe7ac-3ed6-473b-8801-762dc2542c52', 638, 'ai_auto', 0.30),
  ('bcbfe7ac-3ed6-473b-8801-762dc2542c52', 639, 'ai_auto', 0.30),
  ('bcbfe7ac-3ed6-473b-8801-762dc2542c52', 640, 'ai_auto', 0.30);

-- Spencer Stuart Healthcare (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('128c0668-ecc8-4e7f-919c-7301ea1ee644', 302, 'ai_auto', 0.70),
  ('128c0668-ecc8-4e7f-919c-7301ea1ee644', 338, 'ai_auto', 0.67),
  ('128c0668-ecc8-4e7f-919c-7301ea1ee644', 297, 'ai_auto', 0.30),
  ('128c0668-ecc8-4e7f-919c-7301ea1ee644', 298, 'ai_auto', 0.30),
  ('128c0668-ecc8-4e7f-919c-7301ea1ee644', 299, 'ai_auto', 0.30),
  ('128c0668-ecc8-4e7f-919c-7301ea1ee644', 300, 'ai_auto', 0.30),
  ('128c0668-ecc8-4e7f-919c-7301ea1ee644', 301, 'ai_auto', 0.30),
  ('128c0668-ecc8-4e7f-919c-7301ea1ee644', 638, 'ai_auto', 0.30),
  ('128c0668-ecc8-4e7f-919c-7301ea1ee644', 639, 'ai_auto', 0.30),
  ('128c0668-ecc8-4e7f-919c-7301ea1ee644', 640, 'ai_auto', 0.30);

-- Heidrick & Struggles (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('84f667ce-3387-46e7-a6c2-faaf24ddb687', 302, 'ai_auto', 0.70),
  ('84f667ce-3387-46e7-a6c2-faaf24ddb687', 338, 'ai_auto', 0.60),
  ('84f667ce-3387-46e7-a6c2-faaf24ddb687', 297, 'ai_auto', 0.30),
  ('84f667ce-3387-46e7-a6c2-faaf24ddb687', 298, 'ai_auto', 0.30),
  ('84f667ce-3387-46e7-a6c2-faaf24ddb687', 299, 'ai_auto', 0.30),
  ('84f667ce-3387-46e7-a6c2-faaf24ddb687', 300, 'ai_auto', 0.30),
  ('84f667ce-3387-46e7-a6c2-faaf24ddb687', 301, 'ai_auto', 0.30),
  ('84f667ce-3387-46e7-a6c2-faaf24ddb687', 638, 'ai_auto', 0.30),
  ('84f667ce-3387-46e7-a6c2-faaf24ddb687', 639, 'ai_auto', 0.30),
  ('84f667ce-3387-46e7-a6c2-faaf24ddb687', 640, 'ai_auto', 0.30);

-- B.E. Smith (AMN Healthcare) (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('9e79b87e-5a50-489f-b69e-80a7118e2496', 302, 'ai_auto', 0.70),
  ('9e79b87e-5a50-489f-b69e-80a7118e2496', 338, 'ai_auto', 0.37),
  ('9e79b87e-5a50-489f-b69e-80a7118e2496', 639, 'ai_auto', 0.33),
  ('9e79b87e-5a50-489f-b69e-80a7118e2496', 297, 'ai_auto', 0.30),
  ('9e79b87e-5a50-489f-b69e-80a7118e2496', 298, 'ai_auto', 0.30),
  ('9e79b87e-5a50-489f-b69e-80a7118e2496', 299, 'ai_auto', 0.30),
  ('9e79b87e-5a50-489f-b69e-80a7118e2496', 300, 'ai_auto', 0.30),
  ('9e79b87e-5a50-489f-b69e-80a7118e2496', 301, 'ai_auto', 0.30),
  ('9e79b87e-5a50-489f-b69e-80a7118e2496', 638, 'ai_auto', 0.30),
  ('9e79b87e-5a50-489f-b69e-80a7118e2496', 640, 'ai_auto', 0.30);

-- Tyler & Company (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('d172194f-9216-4ded-90c9-47c208c84d7c', 302, 'ai_auto', 0.70),
  ('d172194f-9216-4ded-90c9-47c208c84d7c', 338, 'ai_auto', 0.60),
  ('d172194f-9216-4ded-90c9-47c208c84d7c', 297, 'ai_auto', 0.30),
  ('d172194f-9216-4ded-90c9-47c208c84d7c', 298, 'ai_auto', 0.30),
  ('d172194f-9216-4ded-90c9-47c208c84d7c', 299, 'ai_auto', 0.30),
  ('d172194f-9216-4ded-90c9-47c208c84d7c', 300, 'ai_auto', 0.30),
  ('d172194f-9216-4ded-90c9-47c208c84d7c', 301, 'ai_auto', 0.30),
  ('d172194f-9216-4ded-90c9-47c208c84d7c', 638, 'ai_auto', 0.30),
  ('d172194f-9216-4ded-90c9-47c208c84d7c', 639, 'ai_auto', 0.30),
  ('d172194f-9216-4ded-90c9-47c208c84d7c', 640, 'ai_auto', 0.30);

-- Furst Group (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('7d0b9397-69b3-4c2e-8676-1e195ed5a7bc', 302, 'ai_auto', 0.70),
  ('7d0b9397-69b3-4c2e-8676-1e195ed5a7bc', 297, 'ai_auto', 0.30),
  ('7d0b9397-69b3-4c2e-8676-1e195ed5a7bc', 298, 'ai_auto', 0.30),
  ('7d0b9397-69b3-4c2e-8676-1e195ed5a7bc', 299, 'ai_auto', 0.30),
  ('7d0b9397-69b3-4c2e-8676-1e195ed5a7bc', 300, 'ai_auto', 0.30),
  ('7d0b9397-69b3-4c2e-8676-1e195ed5a7bc', 301, 'ai_auto', 0.30),
  ('7d0b9397-69b3-4c2e-8676-1e195ed5a7bc', 638, 'ai_auto', 0.30),
  ('7d0b9397-69b3-4c2e-8676-1e195ed5a7bc', 639, 'ai_auto', 0.30),
  ('7d0b9397-69b3-4c2e-8676-1e195ed5a7bc', 640, 'ai_auto', 0.30),
  ('7d0b9397-69b3-4c2e-8676-1e195ed5a7bc', 641, 'ai_auto', 0.30);

-- McKinsey & Company Healthcare (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('ce74ccf2-d131-4028-b8b7-c4149e2f798c', 338, 'ai_auto', 0.67),
  ('ce74ccf2-d131-4028-b8b7-c4149e2f798c', 303, 'ai_auto', 0.40),
  ('ce74ccf2-d131-4028-b8b7-c4149e2f798c', 304, 'ai_auto', 0.40),
  ('ce74ccf2-d131-4028-b8b7-c4149e2f798c', 316, 'ai_auto', 0.40),
  ('ce74ccf2-d131-4028-b8b7-c4149e2f798c', 650, 'ai_auto', 0.38),
  ('ce74ccf2-d131-4028-b8b7-c4149e2f798c', 306, 'ai_auto', 0.35),
  ('ce74ccf2-d131-4028-b8b7-c4149e2f798c', 646, 'ai_auto', 0.35),
  ('ce74ccf2-d131-4028-b8b7-c4149e2f798c', 648, 'ai_auto', 0.35),
  ('ce74ccf2-d131-4028-b8b7-c4149e2f798c', 305, 'ai_auto', 0.33),
  ('ce74ccf2-d131-4028-b8b7-c4149e2f798c', 307, 'ai_auto', 0.33);

-- Deloitte Health Care (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('1aeb03e1-19be-4e19-b291-30adbabb0ad0', 338, 'ai_auto', 0.67),
  ('1aeb03e1-19be-4e19-b291-30adbabb0ad0', 303, 'ai_auto', 0.40),
  ('1aeb03e1-19be-4e19-b291-30adbabb0ad0', 316, 'ai_auto', 0.40),
  ('1aeb03e1-19be-4e19-b291-30adbabb0ad0', 650, 'ai_auto', 0.38),
  ('1aeb03e1-19be-4e19-b291-30adbabb0ad0', 305, 'ai_auto', 0.37),
  ('1aeb03e1-19be-4e19-b291-30adbabb0ad0', 304, 'ai_auto', 0.35),
  ('1aeb03e1-19be-4e19-b291-30adbabb0ad0', 306, 'ai_auto', 0.35),
  ('1aeb03e1-19be-4e19-b291-30adbabb0ad0', 646, 'ai_auto', 0.35),
  ('1aeb03e1-19be-4e19-b291-30adbabb0ad0', 307, 'ai_auto', 0.33),
  ('1aeb03e1-19be-4e19-b291-30adbabb0ad0', 647, 'ai_auto', 0.33);

-- Huron Consulting Group (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('8f2b992c-d2c6-4ee4-8723-1fa0d7a2e72d', 303, 'ai_auto', 0.50),
  ('8f2b992c-d2c6-4ee4-8723-1fa0d7a2e72d', 304, 'ai_auto', 0.45),
  ('8f2b992c-d2c6-4ee4-8723-1fa0d7a2e72d', 306, 'ai_auto', 0.45),
  ('8f2b992c-d2c6-4ee4-8723-1fa0d7a2e72d', 646, 'ai_auto', 0.45),
  ('8f2b992c-d2c6-4ee4-8723-1fa0d7a2e72d', 305, 'ai_auto', 0.40),
  ('8f2b992c-d2c6-4ee4-8723-1fa0d7a2e72d', 307, 'ai_auto', 0.40),
  ('8f2b992c-d2c6-4ee4-8723-1fa0d7a2e72d', 647, 'ai_auto', 0.40),
  ('8f2b992c-d2c6-4ee4-8723-1fa0d7a2e72d', 650, 'ai_auto', 0.38),
  ('8f2b992c-d2c6-4ee4-8723-1fa0d7a2e72d', 648, 'ai_auto', 0.30),
  ('8f2b992c-d2c6-4ee4-8723-1fa0d7a2e72d', 649, 'ai_auto', 0.30);

-- Vizient Advisory Services (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('eba81ef6-b4b6-4b7e-ad49-3fa3f728112a', 305, 'ai_auto', 0.43),
  ('eba81ef6-b4b6-4b7e-ad49-3fa3f728112a', 187, 'ai_auto', 0.40),
  ('eba81ef6-b4b6-4b7e-ad49-3fa3f728112a', 649, 'ai_auto', 0.40),
  ('eba81ef6-b4b6-4b7e-ad49-3fa3f728112a', 303, 'ai_auto', 0.35),
  ('eba81ef6-b4b6-4b7e-ad49-3fa3f728112a', 304, 'ai_auto', 0.35),
  ('eba81ef6-b4b6-4b7e-ad49-3fa3f728112a', 306, 'ai_auto', 0.35),
  ('eba81ef6-b4b6-4b7e-ad49-3fa3f728112a', 646, 'ai_auto', 0.35),
  ('eba81ef6-b4b6-4b7e-ad49-3fa3f728112a', 307, 'ai_auto', 0.33),
  ('eba81ef6-b4b6-4b7e-ad49-3fa3f728112a', 647, 'ai_auto', 0.33),
  ('eba81ef6-b4b6-4b7e-ad49-3fa3f728112a', 650, 'ai_auto', 0.33);

-- Chartis Group (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('1a89e1f9-d54a-4342-b75b-05b28ce08df2', 338, 'ai_auto', 0.60),
  ('1a89e1f9-d54a-4342-b75b-05b28ce08df2', 303, 'ai_auto', 0.40),
  ('1a89e1f9-d54a-4342-b75b-05b28ce08df2', 304, 'ai_auto', 0.35),
  ('1a89e1f9-d54a-4342-b75b-05b28ce08df2', 306, 'ai_auto', 0.35),
  ('1a89e1f9-d54a-4342-b75b-05b28ce08df2', 646, 'ai_auto', 0.35),
  ('1a89e1f9-d54a-4342-b75b-05b28ce08df2', 305, 'ai_auto', 0.33),
  ('1a89e1f9-d54a-4342-b75b-05b28ce08df2', 307, 'ai_auto', 0.33),
  ('1a89e1f9-d54a-4342-b75b-05b28ce08df2', 647, 'ai_auto', 0.33),
  ('1a89e1f9-d54a-4342-b75b-05b28ce08df2', 650, 'ai_auto', 0.33),
  ('1a89e1f9-d54a-4342-b75b-05b28ce08df2', 648, 'ai_auto', 0.30);

-- Kaufman Hall (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('98be12cc-bf63-405f-b05b-c511aed5cc1b', 303, 'ai_auto', 0.40),
  ('98be12cc-bf63-405f-b05b-c511aed5cc1b', 304, 'ai_auto', 0.35),
  ('98be12cc-bf63-405f-b05b-c511aed5cc1b', 306, 'ai_auto', 0.35),
  ('98be12cc-bf63-405f-b05b-c511aed5cc1b', 646, 'ai_auto', 0.35),
  ('98be12cc-bf63-405f-b05b-c511aed5cc1b', 305, 'ai_auto', 0.33),
  ('98be12cc-bf63-405f-b05b-c511aed5cc1b', 307, 'ai_auto', 0.33),
  ('98be12cc-bf63-405f-b05b-c511aed5cc1b', 647, 'ai_auto', 0.33),
  ('98be12cc-bf63-405f-b05b-c511aed5cc1b', 650, 'ai_auto', 0.33),
  ('98be12cc-bf63-405f-b05b-c511aed5cc1b', 338, 'ai_auto', 0.30),
  ('98be12cc-bf63-405f-b05b-c511aed5cc1b', 648, 'ai_auto', 0.30);

-- Guidehouse Healthcare (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('ac77e32b-fee2-4018-98ee-e3577a8eda2f', 187, 'ai_auto', 0.40),
  ('ac77e32b-fee2-4018-98ee-e3577a8eda2f', 650, 'ai_auto', 0.40),
  ('ac77e32b-fee2-4018-98ee-e3577a8eda2f', 305, 'ai_auto', 0.37),
  ('ac77e32b-fee2-4018-98ee-e3577a8eda2f', 303, 'ai_auto', 0.35),
  ('ac77e32b-fee2-4018-98ee-e3577a8eda2f', 304, 'ai_auto', 0.35),
  ('ac77e32b-fee2-4018-98ee-e3577a8eda2f', 306, 'ai_auto', 0.35),
  ('ac77e32b-fee2-4018-98ee-e3577a8eda2f', 646, 'ai_auto', 0.35),
  ('ac77e32b-fee2-4018-98ee-e3577a8eda2f', 307, 'ai_auto', 0.33),
  ('ac77e32b-fee2-4018-98ee-e3577a8eda2f', 647, 'ai_auto', 0.33),
  ('ac77e32b-fee2-4018-98ee-e3577a8eda2f', 648, 'ai_auto', 0.30);

-- ECG Management Consultants (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('c5ee401b-5399-4349-811d-224f2bd09fe2', 338, 'ai_auto', 0.60),
  ('c5ee401b-5399-4349-811d-224f2bd09fe2', 303, 'ai_auto', 0.40),
  ('c5ee401b-5399-4349-811d-224f2bd09fe2', 304, 'ai_auto', 0.40),
  ('c5ee401b-5399-4349-811d-224f2bd09fe2', 306, 'ai_auto', 0.35),
  ('c5ee401b-5399-4349-811d-224f2bd09fe2', 646, 'ai_auto', 0.35),
  ('c5ee401b-5399-4349-811d-224f2bd09fe2', 305, 'ai_auto', 0.33),
  ('c5ee401b-5399-4349-811d-224f2bd09fe2', 307, 'ai_auto', 0.33),
  ('c5ee401b-5399-4349-811d-224f2bd09fe2', 647, 'ai_auto', 0.33),
  ('c5ee401b-5399-4349-811d-224f2bd09fe2', 650, 'ai_auto', 0.33),
  ('c5ee401b-5399-4349-811d-224f2bd09fe2', 648, 'ai_auto', 0.30);

-- Hall Render (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('0f0be446-7cbd-4044-aec6-4b9fa4bafa25', 308, 'ai_auto', 0.70),
  ('0f0be446-7cbd-4044-aec6-4b9fa4bafa25', 311, 'ai_auto', 0.45),
  ('0f0be446-7cbd-4044-aec6-4b9fa4bafa25', 655, 'ai_auto', 0.37),
  ('0f0be446-7cbd-4044-aec6-4b9fa4bafa25', 309, 'ai_auto', 0.35),
  ('0f0be446-7cbd-4044-aec6-4b9fa4bafa25', 310, 'ai_auto', 0.30),
  ('0f0be446-7cbd-4044-aec6-4b9fa4bafa25', 652, 'ai_auto', 0.30),
  ('0f0be446-7cbd-4044-aec6-4b9fa4bafa25', 653, 'ai_auto', 0.30),
  ('0f0be446-7cbd-4044-aec6-4b9fa4bafa25', 654, 'ai_auto', 0.30),
  ('0f0be446-7cbd-4044-aec6-4b9fa4bafa25', 656, 'ai_auto', 0.30),
  ('0f0be446-7cbd-4044-aec6-4b9fa4bafa25', 338, 'ai_auto', 0.17);

-- Polsinelli Healthcare (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('16b5ceb4-c424-4f8f-b6ff-60b2e8ae329e', 311, 'ai_auto', 0.45),
  ('16b5ceb4-c424-4f8f-b6ff-60b2e8ae329e', 655, 'ai_auto', 0.37),
  ('16b5ceb4-c424-4f8f-b6ff-60b2e8ae329e', 308, 'ai_auto', 0.35),
  ('16b5ceb4-c424-4f8f-b6ff-60b2e8ae329e', 309, 'ai_auto', 0.35),
  ('16b5ceb4-c424-4f8f-b6ff-60b2e8ae329e', 310, 'ai_auto', 0.30),
  ('16b5ceb4-c424-4f8f-b6ff-60b2e8ae329e', 652, 'ai_auto', 0.30),
  ('16b5ceb4-c424-4f8f-b6ff-60b2e8ae329e', 653, 'ai_auto', 0.30),
  ('16b5ceb4-c424-4f8f-b6ff-60b2e8ae329e', 654, 'ai_auto', 0.30),
  ('16b5ceb4-c424-4f8f-b6ff-60b2e8ae329e', 656, 'ai_auto', 0.30),
  ('16b5ceb4-c424-4f8f-b6ff-60b2e8ae329e', 338, 'ai_auto', 0.23);

-- Epstein Becker Green (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('4b31171c-8be7-4c87-b59b-190c4870a4c0', 311, 'ai_auto', 0.45),
  ('4b31171c-8be7-4c87-b59b-190c4870a4c0', 655, 'ai_auto', 0.37),
  ('4b31171c-8be7-4c87-b59b-190c4870a4c0', 308, 'ai_auto', 0.35),
  ('4b31171c-8be7-4c87-b59b-190c4870a4c0', 309, 'ai_auto', 0.35),
  ('4b31171c-8be7-4c87-b59b-190c4870a4c0', 310, 'ai_auto', 0.30),
  ('4b31171c-8be7-4c87-b59b-190c4870a4c0', 338, 'ai_auto', 0.30),
  ('4b31171c-8be7-4c87-b59b-190c4870a4c0', 652, 'ai_auto', 0.30),
  ('4b31171c-8be7-4c87-b59b-190c4870a4c0', 653, 'ai_auto', 0.30),
  ('4b31171c-8be7-4c87-b59b-190c4870a4c0', 654, 'ai_auto', 0.30),
  ('4b31171c-8be7-4c87-b59b-190c4870a4c0', 656, 'ai_auto', 0.30);

-- King & Spalding Healthcare (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('c7c2d51a-b054-4bd2-86b3-501cb6e34992', 308, 'ai_auto', 0.70),
  ('c7c2d51a-b054-4bd2-86b3-501cb6e34992', 311, 'ai_auto', 0.45),
  ('c7c2d51a-b054-4bd2-86b3-501cb6e34992', 655, 'ai_auto', 0.37),
  ('c7c2d51a-b054-4bd2-86b3-501cb6e34992', 309, 'ai_auto', 0.35),
  ('c7c2d51a-b054-4bd2-86b3-501cb6e34992', 310, 'ai_auto', 0.30),
  ('c7c2d51a-b054-4bd2-86b3-501cb6e34992', 652, 'ai_auto', 0.30),
  ('c7c2d51a-b054-4bd2-86b3-501cb6e34992', 653, 'ai_auto', 0.30),
  ('c7c2d51a-b054-4bd2-86b3-501cb6e34992', 654, 'ai_auto', 0.30),
  ('c7c2d51a-b054-4bd2-86b3-501cb6e34992', 656, 'ai_auto', 0.30),
  ('c7c2d51a-b054-4bd2-86b3-501cb6e34992', 338, 'ai_auto', 0.23);

-- Bass Berry & Sims (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('41013798-9741-4d53-9ae7-ad7800e12f7e', 308, 'ai_auto', 0.70),
  ('41013798-9741-4d53-9ae7-ad7800e12f7e', 311, 'ai_auto', 0.45),
  ('41013798-9741-4d53-9ae7-ad7800e12f7e', 655, 'ai_auto', 0.37),
  ('41013798-9741-4d53-9ae7-ad7800e12f7e', 309, 'ai_auto', 0.35),
  ('41013798-9741-4d53-9ae7-ad7800e12f7e', 310, 'ai_auto', 0.30),
  ('41013798-9741-4d53-9ae7-ad7800e12f7e', 338, 'ai_auto', 0.30),
  ('41013798-9741-4d53-9ae7-ad7800e12f7e', 652, 'ai_auto', 0.30),
  ('41013798-9741-4d53-9ae7-ad7800e12f7e', 653, 'ai_auto', 0.30),
  ('41013798-9741-4d53-9ae7-ad7800e12f7e', 654, 'ai_auto', 0.30),
  ('41013798-9741-4d53-9ae7-ad7800e12f7e', 656, 'ai_auto', 0.30);

-- Foley & Lardner Healthcare (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('822d13b6-ce20-44e9-8a99-ca9a27d02648', 311, 'ai_auto', 0.45),
  ('822d13b6-ce20-44e9-8a99-ca9a27d02648', 655, 'ai_auto', 0.37),
  ('822d13b6-ce20-44e9-8a99-ca9a27d02648', 308, 'ai_auto', 0.35),
  ('822d13b6-ce20-44e9-8a99-ca9a27d02648', 309, 'ai_auto', 0.35),
  ('822d13b6-ce20-44e9-8a99-ca9a27d02648', 310, 'ai_auto', 0.30),
  ('822d13b6-ce20-44e9-8a99-ca9a27d02648', 652, 'ai_auto', 0.30),
  ('822d13b6-ce20-44e9-8a99-ca9a27d02648', 653, 'ai_auto', 0.30),
  ('822d13b6-ce20-44e9-8a99-ca9a27d02648', 654, 'ai_auto', 0.30),
  ('822d13b6-ce20-44e9-8a99-ca9a27d02648', 656, 'ai_auto', 0.30),
  ('822d13b6-ce20-44e9-8a99-ca9a27d02648', 338, 'ai_auto', 0.23);

-- SAI Global / Compliance 360 (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('7f2c774f-2c37-4bfa-a252-dcf6dc7c952f', 311, 'ai_auto', 0.65),
  ('7f2c774f-2c37-4bfa-a252-dcf6dc7c952f', 655, 'ai_auto', 0.40),
  ('7f2c774f-2c37-4bfa-a252-dcf6dc7c952f', 308, 'ai_auto', 0.30),
  ('7f2c774f-2c37-4bfa-a252-dcf6dc7c952f', 309, 'ai_auto', 0.30),
  ('7f2c774f-2c37-4bfa-a252-dcf6dc7c952f', 310, 'ai_auto', 0.30),
  ('7f2c774f-2c37-4bfa-a252-dcf6dc7c952f', 652, 'ai_auto', 0.30),
  ('7f2c774f-2c37-4bfa-a252-dcf6dc7c952f', 653, 'ai_auto', 0.30),
  ('7f2c774f-2c37-4bfa-a252-dcf6dc7c952f', 654, 'ai_auto', 0.30),
  ('7f2c774f-2c37-4bfa-a252-dcf6dc7c952f', 656, 'ai_auto', 0.30),
  ('7f2c774f-2c37-4bfa-a252-dcf6dc7c952f', 662, 'ai_auto', 0.20);

-- Healthicity (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('b952b78a-1592-461c-a36a-d7a052a21031', 311, 'ai_auto', 0.60),
  ('b952b78a-1592-461c-a36a-d7a052a21031', 655, 'ai_auto', 0.37),
  ('b952b78a-1592-461c-a36a-d7a052a21031', 308, 'ai_auto', 0.35),
  ('b952b78a-1592-461c-a36a-d7a052a21031', 309, 'ai_auto', 0.30),
  ('b952b78a-1592-461c-a36a-d7a052a21031', 310, 'ai_auto', 0.30),
  ('b952b78a-1592-461c-a36a-d7a052a21031', 652, 'ai_auto', 0.30),
  ('b952b78a-1592-461c-a36a-d7a052a21031', 653, 'ai_auto', 0.30),
  ('b952b78a-1592-461c-a36a-d7a052a21031', 654, 'ai_auto', 0.30),
  ('b952b78a-1592-461c-a36a-d7a052a21031', 656, 'ai_auto', 0.30),
  ('b952b78a-1592-461c-a36a-d7a052a21031', 338, 'ai_auto', 0.23);

-- Vizient (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('97eb9aa8-4189-4299-bbb7-1b9e9b6bc59d', 187, 'ai_auto', 0.40),
  ('97eb9aa8-4189-4299-bbb7-1b9e9b6bc59d', 219, 'ai_auto', 0.35),
  ('97eb9aa8-4189-4299-bbb7-1b9e9b6bc59d', 220, 'ai_auto', 0.35),
  ('97eb9aa8-4189-4299-bbb7-1b9e9b6bc59d', 221, 'ai_auto', 0.35),
  ('97eb9aa8-4189-4299-bbb7-1b9e9b6bc59d', 559, 'ai_auto', 0.33),
  ('97eb9aa8-4189-4299-bbb7-1b9e9b6bc59d', 222, 'ai_auto', 0.30),
  ('97eb9aa8-4189-4299-bbb7-1b9e9b6bc59d', 557, 'ai_auto', 0.30),
  ('97eb9aa8-4189-4299-bbb7-1b9e9b6bc59d', 558, 'ai_auto', 0.30),
  ('97eb9aa8-4189-4299-bbb7-1b9e9b6bc59d', 560, 'ai_auto', 0.30),
  ('97eb9aa8-4189-4299-bbb7-1b9e9b6bc59d', 338, 'ai_auto', 0.17);

-- Premier Inc. (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('8a9c8584-2eb4-4e8a-b2a4-fdbd9984b8d4', 219, 'ai_auto', 0.30),
  ('8a9c8584-2eb4-4e8a-b2a4-fdbd9984b8d4', 220, 'ai_auto', 0.30),
  ('8a9c8584-2eb4-4e8a-b2a4-fdbd9984b8d4', 221, 'ai_auto', 0.30),
  ('8a9c8584-2eb4-4e8a-b2a4-fdbd9984b8d4', 222, 'ai_auto', 0.30),
  ('8a9c8584-2eb4-4e8a-b2a4-fdbd9984b8d4', 338, 'ai_auto', 0.30),
  ('8a9c8584-2eb4-4e8a-b2a4-fdbd9984b8d4', 557, 'ai_auto', 0.30),
  ('8a9c8584-2eb4-4e8a-b2a4-fdbd9984b8d4', 558, 'ai_auto', 0.30),
  ('8a9c8584-2eb4-4e8a-b2a4-fdbd9984b8d4', 559, 'ai_auto', 0.30),
  ('8a9c8584-2eb4-4e8a-b2a4-fdbd9984b8d4', 560, 'ai_auto', 0.30),
  ('8a9c8584-2eb4-4e8a-b2a4-fdbd9984b8d4', 235, 'ai_auto', 0.10);

-- HealthTrust Performance Group (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('70475190-b135-4282-8bba-87809327ca0c', 558, 'ai_auto', 0.37),
  ('70475190-b135-4282-8bba-87809327ca0c', 219, 'ai_auto', 0.30),
  ('70475190-b135-4282-8bba-87809327ca0c', 220, 'ai_auto', 0.30),
  ('70475190-b135-4282-8bba-87809327ca0c', 221, 'ai_auto', 0.30),
  ('70475190-b135-4282-8bba-87809327ca0c', 222, 'ai_auto', 0.30),
  ('70475190-b135-4282-8bba-87809327ca0c', 557, 'ai_auto', 0.30),
  ('70475190-b135-4282-8bba-87809327ca0c', 559, 'ai_auto', 0.30),
  ('70475190-b135-4282-8bba-87809327ca0c', 560, 'ai_auto', 0.30),
  ('70475190-b135-4282-8bba-87809327ca0c', 338, 'ai_auto', 0.20),
  ('70475190-b135-4282-8bba-87809327ca0c', 125, 'ai_auto', 0.10);

-- Intalere (now Vizient) (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('9f82b3f1-e1c7-4597-82ab-2c089cb22103', 307, 'ai_auto', 0.40),
  ('9f82b3f1-e1c7-4597-82ab-2c089cb22103', 219, 'ai_auto', 0.30),
  ('9f82b3f1-e1c7-4597-82ab-2c089cb22103', 220, 'ai_auto', 0.30),
  ('9f82b3f1-e1c7-4597-82ab-2c089cb22103', 221, 'ai_auto', 0.30),
  ('9f82b3f1-e1c7-4597-82ab-2c089cb22103', 222, 'ai_auto', 0.30),
  ('9f82b3f1-e1c7-4597-82ab-2c089cb22103', 557, 'ai_auto', 0.30),
  ('9f82b3f1-e1c7-4597-82ab-2c089cb22103', 558, 'ai_auto', 0.30),
  ('9f82b3f1-e1c7-4597-82ab-2c089cb22103', 559, 'ai_auto', 0.30),
  ('9f82b3f1-e1c7-4597-82ab-2c089cb22103', 560, 'ai_auto', 0.30),
  ('9f82b3f1-e1c7-4597-82ab-2c089cb22103', 701, 'ai_auto', 0.30);

-- ROi (Resource Optimization & Innovation) (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('985f0386-4f59-4455-a335-690053bb5312', 219, 'ai_auto', 0.30),
  ('985f0386-4f59-4455-a335-690053bb5312', 220, 'ai_auto', 0.30),
  ('985f0386-4f59-4455-a335-690053bb5312', 221, 'ai_auto', 0.30),
  ('985f0386-4f59-4455-a335-690053bb5312', 222, 'ai_auto', 0.30),
  ('985f0386-4f59-4455-a335-690053bb5312', 557, 'ai_auto', 0.30),
  ('985f0386-4f59-4455-a335-690053bb5312', 558, 'ai_auto', 0.30),
  ('985f0386-4f59-4455-a335-690053bb5312', 559, 'ai_auto', 0.30),
  ('985f0386-4f59-4455-a335-690053bb5312', 560, 'ai_auto', 0.30),
  ('985f0386-4f59-4455-a335-690053bb5312', 239, 'ai_auto', 0.15),
  ('985f0386-4f59-4455-a335-690053bb5312', 569, 'ai_auto', 0.12);

-- Provista (a Vizient company) (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('19c1075e-2b11-410a-ab92-9ac2ec373b93', 219, 'ai_auto', 0.30),
  ('19c1075e-2b11-410a-ab92-9ac2ec373b93', 220, 'ai_auto', 0.30),
  ('19c1075e-2b11-410a-ab92-9ac2ec373b93', 221, 'ai_auto', 0.30),
  ('19c1075e-2b11-410a-ab92-9ac2ec373b93', 222, 'ai_auto', 0.30),
  ('19c1075e-2b11-410a-ab92-9ac2ec373b93', 557, 'ai_auto', 0.30),
  ('19c1075e-2b11-410a-ab92-9ac2ec373b93', 558, 'ai_auto', 0.30),
  ('19c1075e-2b11-410a-ab92-9ac2ec373b93', 559, 'ai_auto', 0.30),
  ('19c1075e-2b11-410a-ab92-9ac2ec373b93', 560, 'ai_auto', 0.30),
  ('19c1075e-2b11-410a-ab92-9ac2ec373b93', 234, 'ai_auto', 0.15),
  ('19c1075e-2b11-410a-ab92-9ac2ec373b93', 47, 'ai_auto', 0.10);

-- Yankee Alliance (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('852eaf05-414d-44fa-80f9-fcd1000d975f', 307, 'ai_auto', 0.40),
  ('852eaf05-414d-44fa-80f9-fcd1000d975f', 219, 'ai_auto', 0.30),
  ('852eaf05-414d-44fa-80f9-fcd1000d975f', 220, 'ai_auto', 0.30),
  ('852eaf05-414d-44fa-80f9-fcd1000d975f', 221, 'ai_auto', 0.30),
  ('852eaf05-414d-44fa-80f9-fcd1000d975f', 222, 'ai_auto', 0.30),
  ('852eaf05-414d-44fa-80f9-fcd1000d975f', 338, 'ai_auto', 0.30),
  ('852eaf05-414d-44fa-80f9-fcd1000d975f', 557, 'ai_auto', 0.30),
  ('852eaf05-414d-44fa-80f9-fcd1000d975f', 558, 'ai_auto', 0.30),
  ('852eaf05-414d-44fa-80f9-fcd1000d975f', 559, 'ai_auto', 0.30),
  ('852eaf05-414d-44fa-80f9-fcd1000d975f', 560, 'ai_auto', 0.30);

-- Global Healthcare Exchange (GHX) (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('f9d83cae-dc11-48d6-82dd-8b79ce31a5ab', 187, 'ai_auto', 0.40),
  ('f9d83cae-dc11-48d6-82dd-8b79ce31a5ab', 559, 'ai_auto', 0.33),
  ('f9d83cae-dc11-48d6-82dd-8b79ce31a5ab', 219, 'ai_auto', 0.30),
  ('f9d83cae-dc11-48d6-82dd-8b79ce31a5ab', 220, 'ai_auto', 0.30),
  ('f9d83cae-dc11-48d6-82dd-8b79ce31a5ab', 221, 'ai_auto', 0.30),
  ('f9d83cae-dc11-48d6-82dd-8b79ce31a5ab', 222, 'ai_auto', 0.30),
  ('f9d83cae-dc11-48d6-82dd-8b79ce31a5ab', 557, 'ai_auto', 0.30),
  ('f9d83cae-dc11-48d6-82dd-8b79ce31a5ab', 558, 'ai_auto', 0.30),
  ('f9d83cae-dc11-48d6-82dd-8b79ce31a5ab', 560, 'ai_auto', 0.30),
  ('f9d83cae-dc11-48d6-82dd-8b79ce31a5ab', 338, 'ai_auto', 0.20);

-- UnitedHealthcare (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('6f9bdc0c-f79f-41f2-ad55-1f8289afc1c1', 319, 'ai_auto', 0.43),
  ('6f9bdc0c-f79f-41f2-ad55-1f8289afc1c1', 668, 'ai_auto', 0.37),
  ('6f9bdc0c-f79f-41f2-ad55-1f8289afc1c1', 666, 'ai_auto', 0.33),
  ('6f9bdc0c-f79f-41f2-ad55-1f8289afc1c1', 667, 'ai_auto', 0.33),
  ('6f9bdc0c-f79f-41f2-ad55-1f8289afc1c1', 663, 'ai_auto', 0.33),
  ('6f9bdc0c-f79f-41f2-ad55-1f8289afc1c1', 316, 'ai_auto', 0.30),
  ('6f9bdc0c-f79f-41f2-ad55-1f8289afc1c1', 317, 'ai_auto', 0.30),
  ('6f9bdc0c-f79f-41f2-ad55-1f8289afc1c1', 318, 'ai_auto', 0.30),
  ('6f9bdc0c-f79f-41f2-ad55-1f8289afc1c1', 664, 'ai_auto', 0.30),
  ('6f9bdc0c-f79f-41f2-ad55-1f8289afc1c1', 665, 'ai_auto', 0.30);

-- Anthem Blue Cross Blue Shield (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('55bb4605-fb7d-42d8-b262-cc667f930d43', 664, 'ai_auto', 0.35),
  ('55bb4605-fb7d-42d8-b262-cc667f930d43', 319, 'ai_auto', 0.33),
  ('55bb4605-fb7d-42d8-b262-cc667f930d43', 667, 'ai_auto', 0.33),
  ('55bb4605-fb7d-42d8-b262-cc667f930d43', 663, 'ai_auto', 0.33),
  ('55bb4605-fb7d-42d8-b262-cc667f930d43', 210, 'ai_auto', 0.30),
  ('55bb4605-fb7d-42d8-b262-cc667f930d43', 316, 'ai_auto', 0.30),
  ('55bb4605-fb7d-42d8-b262-cc667f930d43', 317, 'ai_auto', 0.30),
  ('55bb4605-fb7d-42d8-b262-cc667f930d43', 318, 'ai_auto', 0.30),
  ('55bb4605-fb7d-42d8-b262-cc667f930d43', 331, 'ai_auto', 0.30),
  ('55bb4605-fb7d-42d8-b262-cc667f930d43', 665, 'ai_auto', 0.30);

-- Aetna (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('1f688d63-5a58-4e3f-a9f1-6472ad585467', 664, 'ai_auto', 0.35),
  ('1f688d63-5a58-4e3f-a9f1-6472ad585467', 319, 'ai_auto', 0.33),
  ('1f688d63-5a58-4e3f-a9f1-6472ad585467', 316, 'ai_auto', 0.30),
  ('1f688d63-5a58-4e3f-a9f1-6472ad585467', 317, 'ai_auto', 0.30),
  ('1f688d63-5a58-4e3f-a9f1-6472ad585467', 318, 'ai_auto', 0.30),
  ('1f688d63-5a58-4e3f-a9f1-6472ad585467', 663, 'ai_auto', 0.30),
  ('1f688d63-5a58-4e3f-a9f1-6472ad585467', 665, 'ai_auto', 0.30),
  ('1f688d63-5a58-4e3f-a9f1-6472ad585467', 666, 'ai_auto', 0.30),
  ('1f688d63-5a58-4e3f-a9f1-6472ad585467', 667, 'ai_auto', 0.30),
  ('1f688d63-5a58-4e3f-a9f1-6472ad585467', 668, 'ai_auto', 0.30);

-- Cigna Healthcare (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('8513a9d9-f65d-4696-9638-5085ada00c87', 347, 'ai_auto', 0.50),
  ('8513a9d9-f65d-4696-9638-5085ada00c87', 319, 'ai_auto', 0.40),
  ('8513a9d9-f65d-4696-9638-5085ada00c87', 668, 'ai_auto', 0.37),
  ('8513a9d9-f65d-4696-9638-5085ada00c87', 664, 'ai_auto', 0.35),
  ('8513a9d9-f65d-4696-9638-5085ada00c87', 667, 'ai_auto', 0.33),
  ('8513a9d9-f65d-4696-9638-5085ada00c87', 663, 'ai_auto', 0.33),
  ('8513a9d9-f65d-4696-9638-5085ada00c87', 316, 'ai_auto', 0.30),
  ('8513a9d9-f65d-4696-9638-5085ada00c87', 317, 'ai_auto', 0.30),
  ('8513a9d9-f65d-4696-9638-5085ada00c87', 318, 'ai_auto', 0.30),
  ('8513a9d9-f65d-4696-9638-5085ada00c87', 665, 'ai_auto', 0.30);

-- Humana (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('1bdf7158-5773-4617-a8e2-14529bc36791', 667, 'ai_auto', 0.40),
  ('1bdf7158-5773-4617-a8e2-14529bc36791', 664, 'ai_auto', 0.35),
  ('1bdf7158-5773-4617-a8e2-14529bc36791', 319, 'ai_auto', 0.33),
  ('1bdf7158-5773-4617-a8e2-14529bc36791', 665, 'ai_auto', 0.33),
  ('1bdf7158-5773-4617-a8e2-14529bc36791', 668, 'ai_auto', 0.33),
  ('1bdf7158-5773-4617-a8e2-14529bc36791', 663, 'ai_auto', 0.33),
  ('1bdf7158-5773-4617-a8e2-14529bc36791', 316, 'ai_auto', 0.30),
  ('1bdf7158-5773-4617-a8e2-14529bc36791', 317, 'ai_auto', 0.30),
  ('1bdf7158-5773-4617-a8e2-14529bc36791', 318, 'ai_auto', 0.30),
  ('1bdf7158-5773-4617-a8e2-14529bc36791', 666, 'ai_auto', 0.30);

-- Kaiser Permanente (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('aff8860f-b015-4846-8da0-3bf3a7ac77e9', 668, 'ai_auto', 0.37),
  ('aff8860f-b015-4846-8da0-3bf3a7ac77e9', 319, 'ai_auto', 0.33),
  ('aff8860f-b015-4846-8da0-3bf3a7ac77e9', 667, 'ai_auto', 0.33),
  ('aff8860f-b015-4846-8da0-3bf3a7ac77e9', 663, 'ai_auto', 0.33),
  ('aff8860f-b015-4846-8da0-3bf3a7ac77e9', 316, 'ai_auto', 0.30),
  ('aff8860f-b015-4846-8da0-3bf3a7ac77e9', 317, 'ai_auto', 0.30),
  ('aff8860f-b015-4846-8da0-3bf3a7ac77e9', 318, 'ai_auto', 0.30),
  ('aff8860f-b015-4846-8da0-3bf3a7ac77e9', 664, 'ai_auto', 0.30),
  ('aff8860f-b015-4846-8da0-3bf3a7ac77e9', 665, 'ai_auto', 0.30),
  ('aff8860f-b015-4846-8da0-3bf3a7ac77e9', 666, 'ai_auto', 0.30);

-- Molina Healthcare (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('7a57ccdc-66ef-4a57-ab1f-6f62b9c785ae', 668, 'ai_auto', 0.47),
  ('7a57ccdc-66ef-4a57-ab1f-6f62b9c785ae', 319, 'ai_auto', 0.40),
  ('7a57ccdc-66ef-4a57-ab1f-6f62b9c785ae', 667, 'ai_auto', 0.37),
  ('7a57ccdc-66ef-4a57-ab1f-6f62b9c785ae', 663, 'ai_auto', 0.33),
  ('7a57ccdc-66ef-4a57-ab1f-6f62b9c785ae', 316, 'ai_auto', 0.30),
  ('7a57ccdc-66ef-4a57-ab1f-6f62b9c785ae', 317, 'ai_auto', 0.30),
  ('7a57ccdc-66ef-4a57-ab1f-6f62b9c785ae', 318, 'ai_auto', 0.30),
  ('7a57ccdc-66ef-4a57-ab1f-6f62b9c785ae', 664, 'ai_auto', 0.30),
  ('7a57ccdc-66ef-4a57-ab1f-6f62b9c785ae', 665, 'ai_auto', 0.30),
  ('7a57ccdc-66ef-4a57-ab1f-6f62b9c785ae', 666, 'ai_auto', 0.30);

-- Centene Corporation (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('f9c564c4-e1e7-4e1e-9d51-106bd7c0a781', 668, 'ai_auto', 0.60),
  ('f9c564c4-e1e7-4e1e-9d51-106bd7c0a781', 319, 'ai_auto', 0.33),
  ('f9c564c4-e1e7-4e1e-9d51-106bd7c0a781', 665, 'ai_auto', 0.33),
  ('f9c564c4-e1e7-4e1e-9d51-106bd7c0a781', 316, 'ai_auto', 0.30),
  ('f9c564c4-e1e7-4e1e-9d51-106bd7c0a781', 317, 'ai_auto', 0.30),
  ('f9c564c4-e1e7-4e1e-9d51-106bd7c0a781', 318, 'ai_auto', 0.30),
  ('f9c564c4-e1e7-4e1e-9d51-106bd7c0a781', 663, 'ai_auto', 0.30),
  ('f9c564c4-e1e7-4e1e-9d51-106bd7c0a781', 664, 'ai_auto', 0.30),
  ('f9c564c4-e1e7-4e1e-9d51-106bd7c0a781', 666, 'ai_auto', 0.30),
  ('f9c564c4-e1e7-4e1e-9d51-106bd7c0a781', 667, 'ai_auto', 0.30);

-- Iodine Software (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('7f32a8cd-b561-404c-8777-5185207f3abf', 172, 'ai_auto', 0.40),
  ('7f32a8cd-b561-404c-8777-5185207f3abf', 175, 'ai_auto', 0.40),
  ('7f32a8cd-b561-404c-8777-5185207f3abf', 326, 'ai_auto', 0.35),
  ('7f32a8cd-b561-404c-8777-5185207f3abf', 324, 'ai_auto', 0.30),
  ('7f32a8cd-b561-404c-8777-5185207f3abf', 325, 'ai_auto', 0.30),
  ('7f32a8cd-b561-404c-8777-5185207f3abf', 327, 'ai_auto', 0.30),
  ('7f32a8cd-b561-404c-8777-5185207f3abf', 675, 'ai_auto', 0.30),
  ('7f32a8cd-b561-404c-8777-5185207f3abf', 676, 'ai_auto', 0.30),
  ('7f32a8cd-b561-404c-8777-5185207f3abf', 677, 'ai_auto', 0.30),
  ('7f32a8cd-b561-404c-8777-5185207f3abf', 678, 'ai_auto', 0.30);

-- 3M Health Information Systems (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('24ca8113-e789-4da7-9004-c2f8403cc85b', 172, 'ai_auto', 0.40),
  ('24ca8113-e789-4da7-9004-c2f8403cc85b', 175, 'ai_auto', 0.40),
  ('24ca8113-e789-4da7-9004-c2f8403cc85b', 326, 'ai_auto', 0.35),
  ('24ca8113-e789-4da7-9004-c2f8403cc85b', 324, 'ai_auto', 0.30),
  ('24ca8113-e789-4da7-9004-c2f8403cc85b', 325, 'ai_auto', 0.30),
  ('24ca8113-e789-4da7-9004-c2f8403cc85b', 327, 'ai_auto', 0.30),
  ('24ca8113-e789-4da7-9004-c2f8403cc85b', 675, 'ai_auto', 0.30),
  ('24ca8113-e789-4da7-9004-c2f8403cc85b', 676, 'ai_auto', 0.30),
  ('24ca8113-e789-4da7-9004-c2f8403cc85b', 677, 'ai_auto', 0.30),
  ('24ca8113-e789-4da7-9004-c2f8403cc85b', 678, 'ai_auto', 0.30);

-- Nuance Communications (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('7262b920-0374-40e7-a1cd-43a4954ecb8f', 172, 'ai_auto', 0.40),
  ('7262b920-0374-40e7-a1cd-43a4954ecb8f', 324, 'ai_auto', 0.30),
  ('7262b920-0374-40e7-a1cd-43a4954ecb8f', 325, 'ai_auto', 0.30),
  ('7262b920-0374-40e7-a1cd-43a4954ecb8f', 326, 'ai_auto', 0.30),
  ('7262b920-0374-40e7-a1cd-43a4954ecb8f', 327, 'ai_auto', 0.30),
  ('7262b920-0374-40e7-a1cd-43a4954ecb8f', 675, 'ai_auto', 0.30),
  ('7262b920-0374-40e7-a1cd-43a4954ecb8f', 676, 'ai_auto', 0.30),
  ('7262b920-0374-40e7-a1cd-43a4954ecb8f', 677, 'ai_auto', 0.30),
  ('7262b920-0374-40e7-a1cd-43a4954ecb8f', 678, 'ai_auto', 0.30),
  ('7262b920-0374-40e7-a1cd-43a4954ecb8f', 679, 'ai_auto', 0.30);

-- RevSpring (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('27831eb3-f5fa-400a-b3bc-7b72ee59334d', 324, 'ai_auto', 0.30),
  ('27831eb3-f5fa-400a-b3bc-7b72ee59334d', 325, 'ai_auto', 0.30),
  ('27831eb3-f5fa-400a-b3bc-7b72ee59334d', 326, 'ai_auto', 0.30),
  ('27831eb3-f5fa-400a-b3bc-7b72ee59334d', 327, 'ai_auto', 0.30),
  ('27831eb3-f5fa-400a-b3bc-7b72ee59334d', 675, 'ai_auto', 0.30),
  ('27831eb3-f5fa-400a-b3bc-7b72ee59334d', 676, 'ai_auto', 0.30),
  ('27831eb3-f5fa-400a-b3bc-7b72ee59334d', 677, 'ai_auto', 0.30),
  ('27831eb3-f5fa-400a-b3bc-7b72ee59334d', 678, 'ai_auto', 0.30),
  ('27831eb3-f5fa-400a-b3bc-7b72ee59334d', 679, 'ai_auto', 0.30),
  ('27831eb3-f5fa-400a-b3bc-7b72ee59334d', 261, 'ai_auto', 0.20);

-- Dolbey (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('1319f7ab-6e19-427d-8a19-a91b1b8c497d', 91, 'ai_auto', 0.40),
  ('1319f7ab-6e19-427d-8a19-a91b1b8c497d', 175, 'ai_auto', 0.40),
  ('1319f7ab-6e19-427d-8a19-a91b1b8c497d', 326, 'ai_auto', 0.35),
  ('1319f7ab-6e19-427d-8a19-a91b1b8c497d', 679, 'ai_auto', 0.33),
  ('1319f7ab-6e19-427d-8a19-a91b1b8c497d', 324, 'ai_auto', 0.30),
  ('1319f7ab-6e19-427d-8a19-a91b1b8c497d', 325, 'ai_auto', 0.30),
  ('1319f7ab-6e19-427d-8a19-a91b1b8c497d', 327, 'ai_auto', 0.30),
  ('1319f7ab-6e19-427d-8a19-a91b1b8c497d', 519, 'ai_auto', 0.30),
  ('1319f7ab-6e19-427d-8a19-a91b1b8c497d', 675, 'ai_auto', 0.30),
  ('1319f7ab-6e19-427d-8a19-a91b1b8c497d', 676, 'ai_auto', 0.30);

-- VisitPay (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('cb4fc30b-2cc7-4d9c-9188-07dc0670fbcf', 322, 'ai_auto', 0.70),
  ('cb4fc30b-2cc7-4d9c-9188-07dc0670fbcf', 672, 'ai_auto', 0.43),
  ('cb4fc30b-2cc7-4d9c-9188-07dc0670fbcf', 320, 'ai_auto', 0.35),
  ('cb4fc30b-2cc7-4d9c-9188-07dc0670fbcf', 321, 'ai_auto', 0.35),
  ('cb4fc30b-2cc7-4d9c-9188-07dc0670fbcf', 674, 'ai_auto', 0.33),
  ('cb4fc30b-2cc7-4d9c-9188-07dc0670fbcf', 323, 'ai_auto', 0.30),
  ('cb4fc30b-2cc7-4d9c-9188-07dc0670fbcf', 670, 'ai_auto', 0.30),
  ('cb4fc30b-2cc7-4d9c-9188-07dc0670fbcf', 671, 'ai_auto', 0.30),
  ('cb4fc30b-2cc7-4d9c-9188-07dc0670fbcf', 673, 'ai_auto', 0.30),
  ('cb4fc30b-2cc7-4d9c-9188-07dc0670fbcf', 317, 'ai_auto', 0.25);

-- Flywire (9 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('acfb0b89-3a03-4098-9b6f-1c88b686b009', 322, 'ai_auto', 0.70),
  ('acfb0b89-3a03-4098-9b6f-1c88b686b009', 672, 'ai_auto', 0.37),
  ('acfb0b89-3a03-4098-9b6f-1c88b686b009', 320, 'ai_auto', 0.35),
  ('acfb0b89-3a03-4098-9b6f-1c88b686b009', 321, 'ai_auto', 0.35),
  ('acfb0b89-3a03-4098-9b6f-1c88b686b009', 671, 'ai_auto', 0.33),
  ('acfb0b89-3a03-4098-9b6f-1c88b686b009', 673, 'ai_auto', 0.33),
  ('acfb0b89-3a03-4098-9b6f-1c88b686b009', 674, 'ai_auto', 0.33),
  ('acfb0b89-3a03-4098-9b6f-1c88b686b009', 323, 'ai_auto', 0.30),
  ('acfb0b89-3a03-4098-9b6f-1c88b686b009', 670, 'ai_auto', 0.30);

-- ClearBalance (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('bda3568a-80a5-4723-8729-aca65e09f73b', 321, 'ai_auto', 0.70),
  ('bda3568a-80a5-4723-8729-aca65e09f73b', 672, 'ai_auto', 0.33),
  ('bda3568a-80a5-4723-8729-aca65e09f73b', 320, 'ai_auto', 0.30),
  ('bda3568a-80a5-4723-8729-aca65e09f73b', 322, 'ai_auto', 0.30),
  ('bda3568a-80a5-4723-8729-aca65e09f73b', 323, 'ai_auto', 0.30),
  ('bda3568a-80a5-4723-8729-aca65e09f73b', 670, 'ai_auto', 0.30),
  ('bda3568a-80a5-4723-8729-aca65e09f73b', 671, 'ai_auto', 0.30),
  ('bda3568a-80a5-4723-8729-aca65e09f73b', 673, 'ai_auto', 0.30),
  ('bda3568a-80a5-4723-8729-aca65e09f73b', 674, 'ai_auto', 0.30),
  ('bda3568a-80a5-4723-8729-aca65e09f73b', 338, 'ai_auto', 0.13);

-- Patientco (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('d0308b46-a535-4b21-9f9d-47a8653968d2', 321, 'ai_auto', 0.45),
  ('d0308b46-a535-4b21-9f9d-47a8653968d2', 672, 'ai_auto', 0.43),
  ('d0308b46-a535-4b21-9f9d-47a8653968d2', 320, 'ai_auto', 0.35),
  ('d0308b46-a535-4b21-9f9d-47a8653968d2', 322, 'ai_auto', 0.35),
  ('d0308b46-a535-4b21-9f9d-47a8653968d2', 674, 'ai_auto', 0.33),
  ('d0308b46-a535-4b21-9f9d-47a8653968d2', 323, 'ai_auto', 0.30),
  ('d0308b46-a535-4b21-9f9d-47a8653968d2', 670, 'ai_auto', 0.30),
  ('d0308b46-a535-4b21-9f9d-47a8653968d2', 671, 'ai_auto', 0.30),
  ('d0308b46-a535-4b21-9f9d-47a8653968d2', 673, 'ai_auto', 0.30),
  ('d0308b46-a535-4b21-9f9d-47a8653968d2', 28, 'ai_auto', 0.15);

-- AccessOne (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('e767fc17-1a46-48f1-b479-fb45ff6e8f2d', 321, 'ai_auto', 0.70),
  ('e767fc17-1a46-48f1-b479-fb45ff6e8f2d', 672, 'ai_auto', 0.37),
  ('e767fc17-1a46-48f1-b479-fb45ff6e8f2d', 320, 'ai_auto', 0.35),
  ('e767fc17-1a46-48f1-b479-fb45ff6e8f2d', 322, 'ai_auto', 0.35),
  ('e767fc17-1a46-48f1-b479-fb45ff6e8f2d', 674, 'ai_auto', 0.33),
  ('e767fc17-1a46-48f1-b479-fb45ff6e8f2d', 323, 'ai_auto', 0.30),
  ('e767fc17-1a46-48f1-b479-fb45ff6e8f2d', 670, 'ai_auto', 0.30),
  ('e767fc17-1a46-48f1-b479-fb45ff6e8f2d', 671, 'ai_auto', 0.30),
  ('e767fc17-1a46-48f1-b479-fb45ff6e8f2d', 673, 'ai_auto', 0.30),
  ('e767fc17-1a46-48f1-b479-fb45ff6e8f2d', 179, 'ai_auto', 0.15);

-- Aledade (9 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('64490911-a7d2-45e2-b072-2f31a6dc573c', 324, 'ai_auto', 0.30),
  ('64490911-a7d2-45e2-b072-2f31a6dc573c', 325, 'ai_auto', 0.30),
  ('64490911-a7d2-45e2-b072-2f31a6dc573c', 326, 'ai_auto', 0.30),
  ('64490911-a7d2-45e2-b072-2f31a6dc573c', 327, 'ai_auto', 0.30),
  ('64490911-a7d2-45e2-b072-2f31a6dc573c', 675, 'ai_auto', 0.30),
  ('64490911-a7d2-45e2-b072-2f31a6dc573c', 676, 'ai_auto', 0.30),
  ('64490911-a7d2-45e2-b072-2f31a6dc573c', 677, 'ai_auto', 0.30),
  ('64490911-a7d2-45e2-b072-2f31a6dc573c', 678, 'ai_auto', 0.30),
  ('64490911-a7d2-45e2-b072-2f31a6dc573c', 679, 'ai_auto', 0.30);

-- Signify Health (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('c2e3d57e-1a12-4cfb-8520-37b20c6569b4', 252, 'ai_auto', 0.50),
  ('c2e3d57e-1a12-4cfb-8520-37b20c6569b4', 187, 'ai_auto', 0.40),
  ('c2e3d57e-1a12-4cfb-8520-37b20c6569b4', 327, 'ai_auto', 0.35),
  ('c2e3d57e-1a12-4cfb-8520-37b20c6569b4', 324, 'ai_auto', 0.30),
  ('c2e3d57e-1a12-4cfb-8520-37b20c6569b4', 325, 'ai_auto', 0.30),
  ('c2e3d57e-1a12-4cfb-8520-37b20c6569b4', 326, 'ai_auto', 0.30),
  ('c2e3d57e-1a12-4cfb-8520-37b20c6569b4', 675, 'ai_auto', 0.30),
  ('c2e3d57e-1a12-4cfb-8520-37b20c6569b4', 676, 'ai_auto', 0.30),
  ('c2e3d57e-1a12-4cfb-8520-37b20c6569b4', 677, 'ai_auto', 0.30),
  ('c2e3d57e-1a12-4cfb-8520-37b20c6569b4', 678, 'ai_auto', 0.30);

-- Evolent Health (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('10b3ba45-a857-4784-8f5e-0ca16724812c', 324, 'ai_auto', 0.30),
  ('10b3ba45-a857-4784-8f5e-0ca16724812c', 325, 'ai_auto', 0.30),
  ('10b3ba45-a857-4784-8f5e-0ca16724812c', 326, 'ai_auto', 0.30),
  ('10b3ba45-a857-4784-8f5e-0ca16724812c', 327, 'ai_auto', 0.30),
  ('10b3ba45-a857-4784-8f5e-0ca16724812c', 675, 'ai_auto', 0.30),
  ('10b3ba45-a857-4784-8f5e-0ca16724812c', 676, 'ai_auto', 0.30),
  ('10b3ba45-a857-4784-8f5e-0ca16724812c', 677, 'ai_auto', 0.30),
  ('10b3ba45-a857-4784-8f5e-0ca16724812c', 678, 'ai_auto', 0.30),
  ('10b3ba45-a857-4784-8f5e-0ca16724812c', 679, 'ai_auto', 0.30),
  ('10b3ba45-a857-4784-8f5e-0ca16724812c', 338, 'ai_auto', 0.23);

-- Privia Health (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('0b5674fa-c227-4f14-a533-20e84b119299', 339, 'ai_auto', 0.40),
  ('0b5674fa-c227-4f14-a533-20e84b119299', 324, 'ai_auto', 0.30),
  ('0b5674fa-c227-4f14-a533-20e84b119299', 325, 'ai_auto', 0.30),
  ('0b5674fa-c227-4f14-a533-20e84b119299', 326, 'ai_auto', 0.30),
  ('0b5674fa-c227-4f14-a533-20e84b119299', 327, 'ai_auto', 0.30),
  ('0b5674fa-c227-4f14-a533-20e84b119299', 675, 'ai_auto', 0.30),
  ('0b5674fa-c227-4f14-a533-20e84b119299', 676, 'ai_auto', 0.30),
  ('0b5674fa-c227-4f14-a533-20e84b119299', 677, 'ai_auto', 0.30),
  ('0b5674fa-c227-4f14-a533-20e84b119299', 678, 'ai_auto', 0.30),
  ('0b5674fa-c227-4f14-a533-20e84b119299', 679, 'ai_auto', 0.30);

-- Lumeris (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('d625b1ee-4770-4352-b9ca-297aeb8ad32d', 187, 'ai_auto', 0.40),
  ('d625b1ee-4770-4352-b9ca-297aeb8ad32d', 327, 'ai_auto', 0.35),
  ('d625b1ee-4770-4352-b9ca-297aeb8ad32d', 679, 'ai_auto', 0.33),
  ('d625b1ee-4770-4352-b9ca-297aeb8ad32d', 324, 'ai_auto', 0.30),
  ('d625b1ee-4770-4352-b9ca-297aeb8ad32d', 325, 'ai_auto', 0.30),
  ('d625b1ee-4770-4352-b9ca-297aeb8ad32d', 326, 'ai_auto', 0.30),
  ('d625b1ee-4770-4352-b9ca-297aeb8ad32d', 533, 'ai_auto', 0.30),
  ('d625b1ee-4770-4352-b9ca-297aeb8ad32d', 675, 'ai_auto', 0.30),
  ('d625b1ee-4770-4352-b9ca-297aeb8ad32d', 676, 'ai_auto', 0.30),
  ('d625b1ee-4770-4352-b9ca-297aeb8ad32d', 677, 'ai_auto', 0.30);

-- Arcadian (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('22848b37-2aaf-40a6-b0c7-b53ed979c85c', 187, 'ai_auto', 0.40),
  ('22848b37-2aaf-40a6-b0c7-b53ed979c85c', 327, 'ai_auto', 0.35),
  ('22848b37-2aaf-40a6-b0c7-b53ed979c85c', 324, 'ai_auto', 0.30),
  ('22848b37-2aaf-40a6-b0c7-b53ed979c85c', 325, 'ai_auto', 0.30),
  ('22848b37-2aaf-40a6-b0c7-b53ed979c85c', 326, 'ai_auto', 0.30),
  ('22848b37-2aaf-40a6-b0c7-b53ed979c85c', 675, 'ai_auto', 0.30),
  ('22848b37-2aaf-40a6-b0c7-b53ed979c85c', 676, 'ai_auto', 0.30),
  ('22848b37-2aaf-40a6-b0c7-b53ed979c85c', 677, 'ai_auto', 0.30),
  ('22848b37-2aaf-40a6-b0c7-b53ed979c85c', 678, 'ai_auto', 0.30),
  ('22848b37-2aaf-40a6-b0c7-b53ed979c85c', 679, 'ai_auto', 0.30);

-- Caravan Health (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('56a7b061-e97f-4554-b41c-c6618fbf2f8f', 678, 'ai_auto', 0.35),
  ('56a7b061-e97f-4554-b41c-c6618fbf2f8f', 679, 'ai_auto', 0.33),
  ('56a7b061-e97f-4554-b41c-c6618fbf2f8f', 324, 'ai_auto', 0.30),
  ('56a7b061-e97f-4554-b41c-c6618fbf2f8f', 325, 'ai_auto', 0.30),
  ('56a7b061-e97f-4554-b41c-c6618fbf2f8f', 326, 'ai_auto', 0.30),
  ('56a7b061-e97f-4554-b41c-c6618fbf2f8f', 327, 'ai_auto', 0.30),
  ('56a7b061-e97f-4554-b41c-c6618fbf2f8f', 675, 'ai_auto', 0.30),
  ('56a7b061-e97f-4554-b41c-c6618fbf2f8f', 676, 'ai_auto', 0.30),
  ('56a7b061-e97f-4554-b41c-c6618fbf2f8f', 677, 'ai_auto', 0.30),
  ('56a7b061-e97f-4554-b41c-c6618fbf2f8f', 701, 'ai_auto', 0.30);

-- IQVIA (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('84d54c6e-7a17-4e76-8f3b-fdda0c23ebc9', 187, 'ai_auto', 0.40),
  ('84d54c6e-7a17-4e76-8f3b-fdda0c23ebc9', 691, 'ai_auto', 0.38),
  ('84d54c6e-7a17-4e76-8f3b-fdda0c23ebc9', 693, 'ai_auto', 0.37),
  ('84d54c6e-7a17-4e76-8f3b-fdda0c23ebc9', 332, 'ai_auto', 0.35),
  ('84d54c6e-7a17-4e76-8f3b-fdda0c23ebc9', 692, 'ai_auto', 0.35),
  ('84d54c6e-7a17-4e76-8f3b-fdda0c23ebc9', 331, 'ai_auto', 0.30),
  ('84d54c6e-7a17-4e76-8f3b-fdda0c23ebc9', 333, 'ai_auto', 0.30),
  ('84d54c6e-7a17-4e76-8f3b-fdda0c23ebc9', 334, 'ai_auto', 0.30),
  ('84d54c6e-7a17-4e76-8f3b-fdda0c23ebc9', 688, 'ai_auto', 0.30),
  ('84d54c6e-7a17-4e76-8f3b-fdda0c23ebc9', 689, 'ai_auto', 0.30);

-- Covance (Labcorp Drug Development) (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('95000689-d46a-4870-a8e5-daa96d576f30', 331, 'ai_auto', 0.40),
  ('95000689-d46a-4870-a8e5-daa96d576f30', 332, 'ai_auto', 0.35),
  ('95000689-d46a-4870-a8e5-daa96d576f30', 692, 'ai_auto', 0.35),
  ('95000689-d46a-4870-a8e5-daa96d576f30', 688, 'ai_auto', 0.33),
  ('95000689-d46a-4870-a8e5-daa96d576f30', 689, 'ai_auto', 0.33),
  ('95000689-d46a-4870-a8e5-daa96d576f30', 333, 'ai_auto', 0.30),
  ('95000689-d46a-4870-a8e5-daa96d576f30', 334, 'ai_auto', 0.30),
  ('95000689-d46a-4870-a8e5-daa96d576f30', 690, 'ai_auto', 0.30),
  ('95000689-d46a-4870-a8e5-daa96d576f30', 691, 'ai_auto', 0.30),
  ('95000689-d46a-4870-a8e5-daa96d576f30', 693, 'ai_auto', 0.30);

-- Parexel (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('75ff088d-8079-48e2-8a11-8ab2a6fe1d0a', 277, 'ai_auto', 0.40),
  ('75ff088d-8079-48e2-8a11-8ab2a6fe1d0a', 309, 'ai_auto', 0.40),
  ('75ff088d-8079-48e2-8a11-8ab2a6fe1d0a', 332, 'ai_auto', 0.35),
  ('75ff088d-8079-48e2-8a11-8ab2a6fe1d0a', 692, 'ai_auto', 0.35),
  ('75ff088d-8079-48e2-8a11-8ab2a6fe1d0a', 331, 'ai_auto', 0.30),
  ('75ff088d-8079-48e2-8a11-8ab2a6fe1d0a', 333, 'ai_auto', 0.30),
  ('75ff088d-8079-48e2-8a11-8ab2a6fe1d0a', 334, 'ai_auto', 0.30),
  ('75ff088d-8079-48e2-8a11-8ab2a6fe1d0a', 688, 'ai_auto', 0.30),
  ('75ff088d-8079-48e2-8a11-8ab2a6fe1d0a', 689, 'ai_auto', 0.30),
  ('75ff088d-8079-48e2-8a11-8ab2a6fe1d0a', 690, 'ai_auto', 0.30);

-- Syneos Health (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('824a025f-a4ff-4a84-af77-e58131c425fe', 331, 'ai_auto', 0.40),
  ('824a025f-a4ff-4a84-af77-e58131c425fe', 689, 'ai_auto', 0.33),
  ('824a025f-a4ff-4a84-af77-e58131c425fe', 692, 'ai_auto', 0.33),
  ('824a025f-a4ff-4a84-af77-e58131c425fe', 332, 'ai_auto', 0.30),
  ('824a025f-a4ff-4a84-af77-e58131c425fe', 333, 'ai_auto', 0.30),
  ('824a025f-a4ff-4a84-af77-e58131c425fe', 334, 'ai_auto', 0.30),
  ('824a025f-a4ff-4a84-af77-e58131c425fe', 688, 'ai_auto', 0.30),
  ('824a025f-a4ff-4a84-af77-e58131c425fe', 690, 'ai_auto', 0.30),
  ('824a025f-a4ff-4a84-af77-e58131c425fe', 691, 'ai_auto', 0.30),
  ('824a025f-a4ff-4a84-af77-e58131c425fe', 693, 'ai_auto', 0.30);

-- PPD (Thermo Fisher) (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('fe9edf36-36e4-4724-a4bd-a673f552d8b5', 329, 'ai_auto', 0.45),
  ('fe9edf36-36e4-4724-a4bd-a673f552d8b5', 331, 'ai_auto', 0.40),
  ('fe9edf36-36e4-4724-a4bd-a673f552d8b5', 689, 'ai_auto', 0.33),
  ('fe9edf36-36e4-4724-a4bd-a673f552d8b5', 692, 'ai_auto', 0.33),
  ('fe9edf36-36e4-4724-a4bd-a673f552d8b5', 332, 'ai_auto', 0.30),
  ('fe9edf36-36e4-4724-a4bd-a673f552d8b5', 333, 'ai_auto', 0.30),
  ('fe9edf36-36e4-4724-a4bd-a673f552d8b5', 334, 'ai_auto', 0.30),
  ('fe9edf36-36e4-4724-a4bd-a673f552d8b5', 688, 'ai_auto', 0.30),
  ('fe9edf36-36e4-4724-a4bd-a673f552d8b5', 690, 'ai_auto', 0.30),
  ('fe9edf36-36e4-4724-a4bd-a673f552d8b5', 691, 'ai_auto', 0.30);

-- Medpace (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('f66ff7ce-a006-46a8-9f41-81b85758c765', 332, 'ai_auto', 0.35),
  ('f66ff7ce-a006-46a8-9f41-81b85758c765', 692, 'ai_auto', 0.35),
  ('f66ff7ce-a006-46a8-9f41-81b85758c765', 331, 'ai_auto', 0.30),
  ('f66ff7ce-a006-46a8-9f41-81b85758c765', 333, 'ai_auto', 0.30),
  ('f66ff7ce-a006-46a8-9f41-81b85758c765', 334, 'ai_auto', 0.30),
  ('f66ff7ce-a006-46a8-9f41-81b85758c765', 688, 'ai_auto', 0.30),
  ('f66ff7ce-a006-46a8-9f41-81b85758c765', 689, 'ai_auto', 0.30),
  ('f66ff7ce-a006-46a8-9f41-81b85758c765', 690, 'ai_auto', 0.30),
  ('f66ff7ce-a006-46a8-9f41-81b85758c765', 691, 'ai_auto', 0.30),
  ('f66ff7ce-a006-46a8-9f41-81b85758c765', 693, 'ai_auto', 0.30);

-- PRA Health Sciences (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('2df4fee6-c51b-40c1-9966-8099b910d607', 693, 'ai_auto', 0.40),
  ('2df4fee6-c51b-40c1-9966-8099b910d607', 332, 'ai_auto', 0.35),
  ('2df4fee6-c51b-40c1-9966-8099b910d607', 690, 'ai_auto', 0.35),
  ('2df4fee6-c51b-40c1-9966-8099b910d607', 692, 'ai_auto', 0.35),
  ('2df4fee6-c51b-40c1-9966-8099b910d607', 331, 'ai_auto', 0.30),
  ('2df4fee6-c51b-40c1-9966-8099b910d607', 333, 'ai_auto', 0.30),
  ('2df4fee6-c51b-40c1-9966-8099b910d607', 334, 'ai_auto', 0.30),
  ('2df4fee6-c51b-40c1-9966-8099b910d607', 688, 'ai_auto', 0.30),
  ('2df4fee6-c51b-40c1-9966-8099b910d607', 689, 'ai_auto', 0.30),
  ('2df4fee6-c51b-40c1-9966-8099b910d607', 691, 'ai_auto', 0.30);

-- Elsevier Health (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('1bfe24b5-4676-4cdb-a98d-c67915defb75', 661, 'ai_auto', 0.35),
  ('1bfe24b5-4676-4cdb-a98d-c67915defb75', 315, 'ai_auto', 0.33),
  ('1bfe24b5-4676-4cdb-a98d-c67915defb75', 657, 'ai_auto', 0.33),
  ('1bfe24b5-4676-4cdb-a98d-c67915defb75', 312, 'ai_auto', 0.30),
  ('1bfe24b5-4676-4cdb-a98d-c67915defb75', 313, 'ai_auto', 0.30),
  ('1bfe24b5-4676-4cdb-a98d-c67915defb75', 314, 'ai_auto', 0.30),
  ('1bfe24b5-4676-4cdb-a98d-c67915defb75', 658, 'ai_auto', 0.30),
  ('1bfe24b5-4676-4cdb-a98d-c67915defb75', 659, 'ai_auto', 0.30),
  ('1bfe24b5-4676-4cdb-a98d-c67915defb75', 660, 'ai_auto', 0.30),
  ('1bfe24b5-4676-4cdb-a98d-c67915defb75', 662, 'ai_auto', 0.30);

-- CAE Healthcare (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('80b7361c-f92b-4dc2-8d14-645a66400e49', 312, 'ai_auto', 0.70),
  ('80b7361c-f92b-4dc2-8d14-645a66400e49', 203, 'ai_auto', 0.40),
  ('80b7361c-f92b-4dc2-8d14-645a66400e49', 657, 'ai_auto', 0.37),
  ('80b7361c-f92b-4dc2-8d14-645a66400e49', 659, 'ai_auto', 0.37),
  ('80b7361c-f92b-4dc2-8d14-645a66400e49', 660, 'ai_auto', 0.37),
  ('80b7361c-f92b-4dc2-8d14-645a66400e49', 313, 'ai_auto', 0.35),
  ('80b7361c-f92b-4dc2-8d14-645a66400e49', 662, 'ai_auto', 0.35),
  ('80b7361c-f92b-4dc2-8d14-645a66400e49', 315, 'ai_auto', 0.33),
  ('80b7361c-f92b-4dc2-8d14-645a66400e49', 314, 'ai_auto', 0.30),
  ('80b7361c-f92b-4dc2-8d14-645a66400e49', 658, 'ai_auto', 0.30);

-- Laerdal Medical (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('cffdc9e6-4f3d-4d52-a63f-6c33bf331857', 312, 'ai_auto', 0.70),
  ('cffdc9e6-4f3d-4d52-a63f-6c33bf331857', 203, 'ai_auto', 0.40),
  ('cffdc9e6-4f3d-4d52-a63f-6c33bf331857', 657, 'ai_auto', 0.37),
  ('cffdc9e6-4f3d-4d52-a63f-6c33bf331857', 658, 'ai_auto', 0.37),
  ('cffdc9e6-4f3d-4d52-a63f-6c33bf331857', 659, 'ai_auto', 0.37),
  ('cffdc9e6-4f3d-4d52-a63f-6c33bf331857', 660, 'ai_auto', 0.37),
  ('cffdc9e6-4f3d-4d52-a63f-6c33bf331857', 313, 'ai_auto', 0.35),
  ('cffdc9e6-4f3d-4d52-a63f-6c33bf331857', 662, 'ai_auto', 0.35),
  ('cffdc9e6-4f3d-4d52-a63f-6c33bf331857', 315, 'ai_auto', 0.33),
  ('cffdc9e6-4f3d-4d52-a63f-6c33bf331857', 314, 'ai_auto', 0.30);

-- Pri-Med (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('7fdac245-8996-4896-a329-e1a477a1c20f', 203, 'ai_auto', 0.40),
  ('7fdac245-8996-4896-a329-e1a477a1c20f', 313, 'ai_auto', 0.35),
  ('7fdac245-8996-4896-a329-e1a477a1c20f', 661, 'ai_auto', 0.35),
  ('7fdac245-8996-4896-a329-e1a477a1c20f', 658, 'ai_auto', 0.33),
  ('7fdac245-8996-4896-a329-e1a477a1c20f', 312, 'ai_auto', 0.30),
  ('7fdac245-8996-4896-a329-e1a477a1c20f', 314, 'ai_auto', 0.30),
  ('7fdac245-8996-4896-a329-e1a477a1c20f', 315, 'ai_auto', 0.30),
  ('7fdac245-8996-4896-a329-e1a477a1c20f', 657, 'ai_auto', 0.30),
  ('7fdac245-8996-4896-a329-e1a477a1c20f', 659, 'ai_auto', 0.30),
  ('7fdac245-8996-4896-a329-e1a477a1c20f', 660, 'ai_auto', 0.30);

-- Medscape Education (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('32a32e50-34cc-456c-825a-5d510f172279', 203, 'ai_auto', 1.00),
  ('32a32e50-34cc-456c-825a-5d510f172279', 313, 'ai_auto', 0.50),
  ('32a32e50-34cc-456c-825a-5d510f172279', 657, 'ai_auto', 0.33),
  ('32a32e50-34cc-456c-825a-5d510f172279', 312, 'ai_auto', 0.30),
  ('32a32e50-34cc-456c-825a-5d510f172279', 314, 'ai_auto', 0.30),
  ('32a32e50-34cc-456c-825a-5d510f172279', 315, 'ai_auto', 0.30),
  ('32a32e50-34cc-456c-825a-5d510f172279', 351, 'ai_auto', 0.30),
  ('32a32e50-34cc-456c-825a-5d510f172279', 658, 'ai_auto', 0.30),
  ('32a32e50-34cc-456c-825a-5d510f172279', 659, 'ai_auto', 0.30),
  ('32a32e50-34cc-456c-825a-5d510f172279', 660, 'ai_auto', 0.30);

-- Thermo Fisher Scientific (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('62a4f8c5-05e3-407f-afb2-0160bed08fee', 342, 'ai_auto', 0.40),
  ('62a4f8c5-05e3-407f-afb2-0160bed08fee', 335, 'ai_auto', 0.37),
  ('62a4f8c5-05e3-407f-afb2-0160bed08fee', 697, 'ai_auto', 0.37),
  ('62a4f8c5-05e3-407f-afb2-0160bed08fee', 337, 'ai_auto', 0.35),
  ('62a4f8c5-05e3-407f-afb2-0160bed08fee', 698, 'ai_auto', 0.35),
  ('62a4f8c5-05e3-407f-afb2-0160bed08fee', 699, 'ai_auto', 0.33),
  ('62a4f8c5-05e3-407f-afb2-0160bed08fee', 336, 'ai_auto', 0.30),
  ('62a4f8c5-05e3-407f-afb2-0160bed08fee', 694, 'ai_auto', 0.30),
  ('62a4f8c5-05e3-407f-afb2-0160bed08fee', 695, 'ai_auto', 0.30),
  ('62a4f8c5-05e3-407f-afb2-0160bed08fee', 696, 'ai_auto', 0.30);

-- Agilent Technologies (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('d54ec32f-466f-40ae-84f7-5ffbb4255d11', 342, 'ai_auto', 0.40),
  ('d54ec32f-466f-40ae-84f7-5ffbb4255d11', 335, 'ai_auto', 0.37),
  ('d54ec32f-466f-40ae-84f7-5ffbb4255d11', 337, 'ai_auto', 0.35),
  ('d54ec32f-466f-40ae-84f7-5ffbb4255d11', 697, 'ai_auto', 0.33),
  ('d54ec32f-466f-40ae-84f7-5ffbb4255d11', 699, 'ai_auto', 0.33),
  ('d54ec32f-466f-40ae-84f7-5ffbb4255d11', 336, 'ai_auto', 0.30),
  ('d54ec32f-466f-40ae-84f7-5ffbb4255d11', 694, 'ai_auto', 0.30),
  ('d54ec32f-466f-40ae-84f7-5ffbb4255d11', 695, 'ai_auto', 0.30),
  ('d54ec32f-466f-40ae-84f7-5ffbb4255d11', 696, 'ai_auto', 0.30),
  ('d54ec32f-466f-40ae-84f7-5ffbb4255d11', 698, 'ai_auto', 0.30);

-- PerkinElmer (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('7059f9a1-9a5f-4fbf-9b4f-740919830037', 342, 'ai_auto', 0.40),
  ('7059f9a1-9a5f-4fbf-9b4f-740919830037', 335, 'ai_auto', 0.37),
  ('7059f9a1-9a5f-4fbf-9b4f-740919830037', 337, 'ai_auto', 0.35),
  ('7059f9a1-9a5f-4fbf-9b4f-740919830037', 697, 'ai_auto', 0.33),
  ('7059f9a1-9a5f-4fbf-9b4f-740919830037', 699, 'ai_auto', 0.33),
  ('7059f9a1-9a5f-4fbf-9b4f-740919830037', 336, 'ai_auto', 0.30),
  ('7059f9a1-9a5f-4fbf-9b4f-740919830037', 694, 'ai_auto', 0.30),
  ('7059f9a1-9a5f-4fbf-9b4f-740919830037', 695, 'ai_auto', 0.30),
  ('7059f9a1-9a5f-4fbf-9b4f-740919830037', 696, 'ai_auto', 0.30),
  ('7059f9a1-9a5f-4fbf-9b4f-740919830037', 698, 'ai_auto', 0.30);

-- Bio-Rad Laboratories (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('e1a349cd-698a-498a-baeb-69ec575820cc', 342, 'ai_auto', 1.00),
  ('e1a349cd-698a-498a-baeb-69ec575820cc', 335, 'ai_auto', 0.43),
  ('e1a349cd-698a-498a-baeb-69ec575820cc', 337, 'ai_auto', 0.35),
  ('e1a349cd-698a-498a-baeb-69ec575820cc', 698, 'ai_auto', 0.35),
  ('e1a349cd-698a-498a-baeb-69ec575820cc', 697, 'ai_auto', 0.33),
  ('e1a349cd-698a-498a-baeb-69ec575820cc', 699, 'ai_auto', 0.33),
  ('e1a349cd-698a-498a-baeb-69ec575820cc', 336, 'ai_auto', 0.30),
  ('e1a349cd-698a-498a-baeb-69ec575820cc', 694, 'ai_auto', 0.30),
  ('e1a349cd-698a-498a-baeb-69ec575820cc', 695, 'ai_auto', 0.30),
  ('e1a349cd-698a-498a-baeb-69ec575820cc', 696, 'ai_auto', 0.30);

-- Brooks Automation (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('c368e963-7cea-46e6-90ed-7fe7bd2a4bd0', 336, 'ai_auto', 0.40),
  ('c368e963-7cea-46e6-90ed-7fe7bd2a4bd0', 337, 'ai_auto', 0.35),
  ('c368e963-7cea-46e6-90ed-7fe7bd2a4bd0', 335, 'ai_auto', 0.33),
  ('c368e963-7cea-46e6-90ed-7fe7bd2a4bd0', 696, 'ai_auto', 0.33),
  ('c368e963-7cea-46e6-90ed-7fe7bd2a4bd0', 697, 'ai_auto', 0.33),
  ('c368e963-7cea-46e6-90ed-7fe7bd2a4bd0', 699, 'ai_auto', 0.33),
  ('c368e963-7cea-46e6-90ed-7fe7bd2a4bd0', 694, 'ai_auto', 0.30),
  ('c368e963-7cea-46e6-90ed-7fe7bd2a4bd0', 695, 'ai_auto', 0.30),
  ('c368e963-7cea-46e6-90ed-7fe7bd2a4bd0', 698, 'ai_auto', 0.30),
  ('c368e963-7cea-46e6-90ed-7fe7bd2a4bd0', 338, 'ai_auto', 0.13);

-- BMES (Biomedical Equipment Services) (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('deada302-69b5-41ed-b01d-ddc3aeef7ad6', 288, 'ai_auto', 0.70),
  ('deada302-69b5-41ed-b01d-ddc3aeef7ad6', 289, 'ai_auto', 0.45),
  ('deada302-69b5-41ed-b01d-ddc3aeef7ad6', 290, 'ai_auto', 0.45),
  ('deada302-69b5-41ed-b01d-ddc3aeef7ad6', 628, 'ai_auto', 0.40),
  ('deada302-69b5-41ed-b01d-ddc3aeef7ad6', 629, 'ai_auto', 0.40),
  ('deada302-69b5-41ed-b01d-ddc3aeef7ad6', 631, 'ai_auto', 0.37),
  ('deada302-69b5-41ed-b01d-ddc3aeef7ad6', 630, 'ai_auto', 0.35),
  ('deada302-69b5-41ed-b01d-ddc3aeef7ad6', 291, 'ai_auto', 0.30),
  ('deada302-69b5-41ed-b01d-ddc3aeef7ad6', 626, 'ai_auto', 0.30),
  ('deada302-69b5-41ed-b01d-ddc3aeef7ad6', 627, 'ai_auto', 0.30);

-- TRIMEDX (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('b9142870-6304-49fc-9aaa-6e259fafe7ef', 288, 'ai_auto', 0.40),
  ('b9142870-6304-49fc-9aaa-6e259fafe7ef', 291, 'ai_auto', 0.37),
  ('b9142870-6304-49fc-9aaa-6e259fafe7ef', 627, 'ai_auto', 0.35),
  ('b9142870-6304-49fc-9aaa-6e259fafe7ef', 630, 'ai_auto', 0.35),
  ('b9142870-6304-49fc-9aaa-6e259fafe7ef', 289, 'ai_auto', 0.30),
  ('b9142870-6304-49fc-9aaa-6e259fafe7ef', 290, 'ai_auto', 0.30),
  ('b9142870-6304-49fc-9aaa-6e259fafe7ef', 626, 'ai_auto', 0.30),
  ('b9142870-6304-49fc-9aaa-6e259fafe7ef', 628, 'ai_auto', 0.30),
  ('b9142870-6304-49fc-9aaa-6e259fafe7ef', 629, 'ai_auto', 0.30),
  ('b9142870-6304-49fc-9aaa-6e259fafe7ef', 631, 'ai_auto', 0.30);

-- Sodexo Healthcare Technology Management (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('dee0eacd-9cbc-46f9-81da-fb0219831431', 627, 'ai_auto', 0.40),
  ('dee0eacd-9cbc-46f9-81da-fb0219831431', 291, 'ai_auto', 0.37),
  ('dee0eacd-9cbc-46f9-81da-fb0219831431', 338, 'ai_auto', 0.37),
  ('dee0eacd-9cbc-46f9-81da-fb0219831431', 288, 'ai_auto', 0.35),
  ('dee0eacd-9cbc-46f9-81da-fb0219831431', 289, 'ai_auto', 0.35),
  ('dee0eacd-9cbc-46f9-81da-fb0219831431', 290, 'ai_auto', 0.35),
  ('dee0eacd-9cbc-46f9-81da-fb0219831431', 628, 'ai_auto', 0.35),
  ('dee0eacd-9cbc-46f9-81da-fb0219831431', 630, 'ai_auto', 0.35),
  ('dee0eacd-9cbc-46f9-81da-fb0219831431', 629, 'ai_auto', 0.33),
  ('dee0eacd-9cbc-46f9-81da-fb0219831431', 631, 'ai_auto', 0.33);

-- Aramark Healthcare Technologies (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('f529ff5f-a87f-4906-81c7-587859a41c46', 288, 'ai_auto', 0.35),
  ('f529ff5f-a87f-4906-81c7-587859a41c46', 289, 'ai_auto', 0.35),
  ('f529ff5f-a87f-4906-81c7-587859a41c46', 290, 'ai_auto', 0.35),
  ('f529ff5f-a87f-4906-81c7-587859a41c46', 627, 'ai_auto', 0.35),
  ('f529ff5f-a87f-4906-81c7-587859a41c46', 628, 'ai_auto', 0.35),
  ('f529ff5f-a87f-4906-81c7-587859a41c46', 630, 'ai_auto', 0.35),
  ('f529ff5f-a87f-4906-81c7-587859a41c46', 291, 'ai_auto', 0.33),
  ('f529ff5f-a87f-4906-81c7-587859a41c46', 629, 'ai_auto', 0.33),
  ('f529ff5f-a87f-4906-81c7-587859a41c46', 631, 'ai_auto', 0.33),
  ('f529ff5f-a87f-4906-81c7-587859a41c46', 626, 'ai_auto', 0.30);

-- Crothall Healthcare Technology Solutions (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('6c8aa546-b4b7-4462-bedc-ece1f86ee51c', 288, 'ai_auto', 0.35),
  ('6c8aa546-b4b7-4462-bedc-ece1f86ee51c', 289, 'ai_auto', 0.35),
  ('6c8aa546-b4b7-4462-bedc-ece1f86ee51c', 290, 'ai_auto', 0.35),
  ('6c8aa546-b4b7-4462-bedc-ece1f86ee51c', 627, 'ai_auto', 0.35),
  ('6c8aa546-b4b7-4462-bedc-ece1f86ee51c', 291, 'ai_auto', 0.33),
  ('6c8aa546-b4b7-4462-bedc-ece1f86ee51c', 629, 'ai_auto', 0.33),
  ('6c8aa546-b4b7-4462-bedc-ece1f86ee51c', 626, 'ai_auto', 0.30),
  ('6c8aa546-b4b7-4462-bedc-ece1f86ee51c', 628, 'ai_auto', 0.30),
  ('6c8aa546-b4b7-4462-bedc-ece1f86ee51c', 630, 'ai_auto', 0.30),
  ('6c8aa546-b4b7-4462-bedc-ece1f86ee51c', 631, 'ai_auto', 0.30);

-- Renovo Solutions (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('5f5d9c79-63a2-40b5-8e9b-96bd57ffca4a', 291, 'ai_auto', 0.37),
  ('5f5d9c79-63a2-40b5-8e9b-96bd57ffca4a', 288, 'ai_auto', 0.35),
  ('5f5d9c79-63a2-40b5-8e9b-96bd57ffca4a', 627, 'ai_auto', 0.35),
  ('5f5d9c79-63a2-40b5-8e9b-96bd57ffca4a', 628, 'ai_auto', 0.35),
  ('5f5d9c79-63a2-40b5-8e9b-96bd57ffca4a', 630, 'ai_auto', 0.35),
  ('5f5d9c79-63a2-40b5-8e9b-96bd57ffca4a', 631, 'ai_auto', 0.33),
  ('5f5d9c79-63a2-40b5-8e9b-96bd57ffca4a', 626, 'ai_auto', 0.33),
  ('5f5d9c79-63a2-40b5-8e9b-96bd57ffca4a', 289, 'ai_auto', 0.30),
  ('5f5d9c79-63a2-40b5-8e9b-96bd57ffca4a', 290, 'ai_auto', 0.30),
  ('5f5d9c79-63a2-40b5-8e9b-96bd57ffca4a', 629, 'ai_auto', 0.30);

-- ECRI Institute (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('70d6ff73-6b48-4df2-9a44-17b20114b90b', 288, 'ai_auto', 0.35),
  ('70d6ff73-6b48-4df2-9a44-17b20114b90b', 289, 'ai_auto', 0.30),
  ('70d6ff73-6b48-4df2-9a44-17b20114b90b', 290, 'ai_auto', 0.30),
  ('70d6ff73-6b48-4df2-9a44-17b20114b90b', 291, 'ai_auto', 0.30),
  ('70d6ff73-6b48-4df2-9a44-17b20114b90b', 626, 'ai_auto', 0.30),
  ('70d6ff73-6b48-4df2-9a44-17b20114b90b', 627, 'ai_auto', 0.30),
  ('70d6ff73-6b48-4df2-9a44-17b20114b90b', 628, 'ai_auto', 0.30),
  ('70d6ff73-6b48-4df2-9a44-17b20114b90b', 629, 'ai_auto', 0.30),
  ('70d6ff73-6b48-4df2-9a44-17b20114b90b', 630, 'ai_auto', 0.30),
  ('70d6ff73-6b48-4df2-9a44-17b20114b90b', 631, 'ai_auto', 0.30);

-- Trane Technologies (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('2ea0b8a9-fadb-4f99-92dd-e525a13e76b8', 282, 'ai_auto', 0.70),
  ('2ea0b8a9-fadb-4f99-92dd-e525a13e76b8', 277, 'ai_auto', 0.45),
  ('2ea0b8a9-fadb-4f99-92dd-e525a13e76b8', 70, 'ai_auto', 0.40),
  ('2ea0b8a9-fadb-4f99-92dd-e525a13e76b8', 622, 'ai_auto', 0.35),
  ('2ea0b8a9-fadb-4f99-92dd-e525a13e76b8', 621, 'ai_auto', 0.33),
  ('2ea0b8a9-fadb-4f99-92dd-e525a13e76b8', 624, 'ai_auto', 0.33),
  ('2ea0b8a9-fadb-4f99-92dd-e525a13e76b8', 625, 'ai_auto', 0.33),
  ('2ea0b8a9-fadb-4f99-92dd-e525a13e76b8', 283, 'ai_auto', 0.30),
  ('2ea0b8a9-fadb-4f99-92dd-e525a13e76b8', 284, 'ai_auto', 0.30),
  ('2ea0b8a9-fadb-4f99-92dd-e525a13e76b8', 285, 'ai_auto', 0.30);

-- Johnson Controls (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('3469a319-31eb-468a-bd30-6b18b70206e5', 282, 'ai_auto', 0.70),
  ('3469a319-31eb-468a-bd30-6b18b70206e5', 621, 'ai_auto', 0.37),
  ('3469a319-31eb-468a-bd30-6b18b70206e5', 622, 'ai_auto', 0.35),
  ('3469a319-31eb-468a-bd30-6b18b70206e5', 283, 'ai_auto', 0.30),
  ('3469a319-31eb-468a-bd30-6b18b70206e5', 284, 'ai_auto', 0.30),
  ('3469a319-31eb-468a-bd30-6b18b70206e5', 285, 'ai_auto', 0.30),
  ('3469a319-31eb-468a-bd30-6b18b70206e5', 286, 'ai_auto', 0.30),
  ('3469a319-31eb-468a-bd30-6b18b70206e5', 287, 'ai_auto', 0.30),
  ('3469a319-31eb-468a-bd30-6b18b70206e5', 623, 'ai_auto', 0.30),
  ('3469a319-31eb-468a-bd30-6b18b70206e5', 624, 'ai_auto', 0.30);

-- Carrier Global (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('0dff9d1a-14c1-4dcd-87ec-732aa21fc8ce', 282, 'ai_auto', 0.70),
  ('0dff9d1a-14c1-4dcd-87ec-732aa21fc8ce', 623, 'ai_auto', 0.35),
  ('0dff9d1a-14c1-4dcd-87ec-732aa21fc8ce', 621, 'ai_auto', 0.33),
  ('0dff9d1a-14c1-4dcd-87ec-732aa21fc8ce', 624, 'ai_auto', 0.33),
  ('0dff9d1a-14c1-4dcd-87ec-732aa21fc8ce', 625, 'ai_auto', 0.33),
  ('0dff9d1a-14c1-4dcd-87ec-732aa21fc8ce', 283, 'ai_auto', 0.30),
  ('0dff9d1a-14c1-4dcd-87ec-732aa21fc8ce', 284, 'ai_auto', 0.30),
  ('0dff9d1a-14c1-4dcd-87ec-732aa21fc8ce', 285, 'ai_auto', 0.30),
  ('0dff9d1a-14c1-4dcd-87ec-732aa21fc8ce', 286, 'ai_auto', 0.30),
  ('0dff9d1a-14c1-4dcd-87ec-732aa21fc8ce', 287, 'ai_auto', 0.30);

-- Daikin Applied (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('6b2652be-ce6c-42f0-8c79-2cafa8690f8f', 282, 'ai_auto', 0.70),
  ('6b2652be-ce6c-42f0-8c79-2cafa8690f8f', 621, 'ai_auto', 0.33),
  ('6b2652be-ce6c-42f0-8c79-2cafa8690f8f', 624, 'ai_auto', 0.33),
  ('6b2652be-ce6c-42f0-8c79-2cafa8690f8f', 625, 'ai_auto', 0.33),
  ('6b2652be-ce6c-42f0-8c79-2cafa8690f8f', 283, 'ai_auto', 0.30),
  ('6b2652be-ce6c-42f0-8c79-2cafa8690f8f', 284, 'ai_auto', 0.30),
  ('6b2652be-ce6c-42f0-8c79-2cafa8690f8f', 285, 'ai_auto', 0.30),
  ('6b2652be-ce6c-42f0-8c79-2cafa8690f8f', 286, 'ai_auto', 0.30),
  ('6b2652be-ce6c-42f0-8c79-2cafa8690f8f', 287, 'ai_auto', 0.30),
  ('6b2652be-ce6c-42f0-8c79-2cafa8690f8f', 622, 'ai_auto', 0.30);

-- ENVIRCO (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('f1a9223d-b7d0-4c63-98e5-a9ff12c5ff4a', 621, 'ai_auto', 0.33),
  ('f1a9223d-b7d0-4c63-98e5-a9ff12c5ff4a', 624, 'ai_auto', 0.33),
  ('f1a9223d-b7d0-4c63-98e5-a9ff12c5ff4a', 625, 'ai_auto', 0.33),
  ('f1a9223d-b7d0-4c63-98e5-a9ff12c5ff4a', 282, 'ai_auto', 0.30),
  ('f1a9223d-b7d0-4c63-98e5-a9ff12c5ff4a', 283, 'ai_auto', 0.30),
  ('f1a9223d-b7d0-4c63-98e5-a9ff12c5ff4a', 284, 'ai_auto', 0.30),
  ('f1a9223d-b7d0-4c63-98e5-a9ff12c5ff4a', 285, 'ai_auto', 0.30),
  ('f1a9223d-b7d0-4c63-98e5-a9ff12c5ff4a', 286, 'ai_auto', 0.30),
  ('f1a9223d-b7d0-4c63-98e5-a9ff12c5ff4a', 287, 'ai_auto', 0.30),
  ('f1a9223d-b7d0-4c63-98e5-a9ff12c5ff4a', 622, 'ai_auto', 0.30);

-- Air Innovations (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('1010daed-90ae-4ada-838a-da62f649026a', 277, 'ai_auto', 0.45),
  ('1010daed-90ae-4ada-838a-da62f649026a', 621, 'ai_auto', 0.33),
  ('1010daed-90ae-4ada-838a-da62f649026a', 624, 'ai_auto', 0.33),
  ('1010daed-90ae-4ada-838a-da62f649026a', 625, 'ai_auto', 0.33),
  ('1010daed-90ae-4ada-838a-da62f649026a', 282, 'ai_auto', 0.30),
  ('1010daed-90ae-4ada-838a-da62f649026a', 283, 'ai_auto', 0.30),
  ('1010daed-90ae-4ada-838a-da62f649026a', 284, 'ai_auto', 0.30),
  ('1010daed-90ae-4ada-838a-da62f649026a', 285, 'ai_auto', 0.30),
  ('1010daed-90ae-4ada-838a-da62f649026a', 286, 'ai_auto', 0.30),
  ('1010daed-90ae-4ada-838a-da62f649026a', 287, 'ai_auto', 0.30);

-- HKS Architects (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('1529935b-6107-48ef-839a-1514d49acf88', 277, 'ai_auto', 0.70),
  ('1529935b-6107-48ef-839a-1514d49acf88', 617, 'ai_auto', 0.40),
  ('1529935b-6107-48ef-839a-1514d49acf88', 619, 'ai_auto', 0.37),
  ('1529935b-6107-48ef-839a-1514d49acf88', 280, 'ai_auto', 0.35),
  ('1529935b-6107-48ef-839a-1514d49acf88', 618, 'ai_auto', 0.33),
  ('1529935b-6107-48ef-839a-1514d49acf88', 620, 'ai_auto', 0.33),
  ('1529935b-6107-48ef-839a-1514d49acf88', 278, 'ai_auto', 0.30),
  ('1529935b-6107-48ef-839a-1514d49acf88', 279, 'ai_auto', 0.30),
  ('1529935b-6107-48ef-839a-1514d49acf88', 281, 'ai_auto', 0.30),
  ('1529935b-6107-48ef-839a-1514d49acf88', 616, 'ai_auto', 0.30);

-- Coupa (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('05e008f5-d9c5-4513-89d0-f89e123f57f8', 185, 'ai_auto', 0.40),
  ('05e008f5-d9c5-4513-89d0-f89e123f57f8', 238, 'ai_auto', 0.35),
  ('05e008f5-d9c5-4513-89d0-f89e123f57f8', 577, 'ai_auto', 0.33),
  ('05e008f5-d9c5-4513-89d0-f89e123f57f8', 237, 'ai_auto', 0.30),
  ('05e008f5-d9c5-4513-89d0-f89e123f57f8', 239, 'ai_auto', 0.30),
  ('05e008f5-d9c5-4513-89d0-f89e123f57f8', 573, 'ai_auto', 0.30),
  ('05e008f5-d9c5-4513-89d0-f89e123f57f8', 574, 'ai_auto', 0.30),
  ('05e008f5-d9c5-4513-89d0-f89e123f57f8', 575, 'ai_auto', 0.30),
  ('05e008f5-d9c5-4513-89d0-f89e123f57f8', 576, 'ai_auto', 0.30),
  ('05e008f5-d9c5-4513-89d0-f89e123f57f8', 338, 'ai_auto', 0.17);

-- HDR Inc. (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('53917593-96d2-4414-9653-82c869fc8a98', 277, 'ai_auto', 0.70),
  ('53917593-96d2-4414-9653-82c869fc8a98', 278, 'ai_auto', 0.70),
  ('53917593-96d2-4414-9653-82c869fc8a98', 617, 'ai_auto', 0.40),
  ('53917593-96d2-4414-9653-82c869fc8a98', 619, 'ai_auto', 0.37),
  ('53917593-96d2-4414-9653-82c869fc8a98', 620, 'ai_auto', 0.37),
  ('53917593-96d2-4414-9653-82c869fc8a98', 280, 'ai_auto', 0.35),
  ('53917593-96d2-4414-9653-82c869fc8a98', 616, 'ai_auto', 0.33),
  ('53917593-96d2-4414-9653-82c869fc8a98', 618, 'ai_auto', 0.33),
  ('53917593-96d2-4414-9653-82c869fc8a98', 279, 'ai_auto', 0.30),
  ('53917593-96d2-4414-9653-82c869fc8a98', 281, 'ai_auto', 0.30);

-- Perkins&Will (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('ac61220c-f5d0-424c-a5bb-aa4a4b6eff57', 277, 'ai_auto', 0.70),
  ('ac61220c-f5d0-424c-a5bb-aa4a4b6eff57', 617, 'ai_auto', 0.40),
  ('ac61220c-f5d0-424c-a5bb-aa4a4b6eff57', 619, 'ai_auto', 0.37),
  ('ac61220c-f5d0-424c-a5bb-aa4a4b6eff57', 618, 'ai_auto', 0.33),
  ('ac61220c-f5d0-424c-a5bb-aa4a4b6eff57', 278, 'ai_auto', 0.30),
  ('ac61220c-f5d0-424c-a5bb-aa4a4b6eff57', 279, 'ai_auto', 0.30),
  ('ac61220c-f5d0-424c-a5bb-aa4a4b6eff57', 280, 'ai_auto', 0.30),
  ('ac61220c-f5d0-424c-a5bb-aa4a4b6eff57', 281, 'ai_auto', 0.30),
  ('ac61220c-f5d0-424c-a5bb-aa4a4b6eff57', 616, 'ai_auto', 0.30),
  ('ac61220c-f5d0-424c-a5bb-aa4a4b6eff57', 620, 'ai_auto', 0.30);

-- SmithGroup (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('94dc9d1f-2a20-4f24-8afd-d4d85679141a', 277, 'ai_auto', 0.70),
  ('94dc9d1f-2a20-4f24-8afd-d4d85679141a', 280, 'ai_auto', 0.40),
  ('94dc9d1f-2a20-4f24-8afd-d4d85679141a', 281, 'ai_auto', 0.35),
  ('94dc9d1f-2a20-4f24-8afd-d4d85679141a', 617, 'ai_auto', 0.35),
  ('94dc9d1f-2a20-4f24-8afd-d4d85679141a', 618, 'ai_auto', 0.33),
  ('94dc9d1f-2a20-4f24-8afd-d4d85679141a', 619, 'ai_auto', 0.33),
  ('94dc9d1f-2a20-4f24-8afd-d4d85679141a', 620, 'ai_auto', 0.33),
  ('94dc9d1f-2a20-4f24-8afd-d4d85679141a', 278, 'ai_auto', 0.30),
  ('94dc9d1f-2a20-4f24-8afd-d4d85679141a', 279, 'ai_auto', 0.30),
  ('94dc9d1f-2a20-4f24-8afd-d4d85679141a', 616, 'ai_auto', 0.30);

-- Skanska USA (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('adf8a486-8c57-484a-a6d1-4ce4db3796cf', 278, 'ai_auto', 0.70),
  ('adf8a486-8c57-484a-a6d1-4ce4db3796cf', 280, 'ai_auto', 0.35),
  ('adf8a486-8c57-484a-a6d1-4ce4db3796cf', 617, 'ai_auto', 0.35),
  ('adf8a486-8c57-484a-a6d1-4ce4db3796cf', 616, 'ai_auto', 0.33),
  ('adf8a486-8c57-484a-a6d1-4ce4db3796cf', 277, 'ai_auto', 0.30),
  ('adf8a486-8c57-484a-a6d1-4ce4db3796cf', 279, 'ai_auto', 0.30),
  ('adf8a486-8c57-484a-a6d1-4ce4db3796cf', 281, 'ai_auto', 0.30),
  ('adf8a486-8c57-484a-a6d1-4ce4db3796cf', 618, 'ai_auto', 0.30),
  ('adf8a486-8c57-484a-a6d1-4ce4db3796cf', 619, 'ai_auto', 0.30),
  ('adf8a486-8c57-484a-a6d1-4ce4db3796cf', 620, 'ai_auto', 0.30);

-- McCarthy Building Companies (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('4385eefc-1712-4dde-a328-8793a6e5d40f', 278, 'ai_auto', 0.70),
  ('4385eefc-1712-4dde-a328-8793a6e5d40f', 280, 'ai_auto', 0.35),
  ('4385eefc-1712-4dde-a328-8793a6e5d40f', 617, 'ai_auto', 0.35),
  ('4385eefc-1712-4dde-a328-8793a6e5d40f', 616, 'ai_auto', 0.33),
  ('4385eefc-1712-4dde-a328-8793a6e5d40f', 277, 'ai_auto', 0.30),
  ('4385eefc-1712-4dde-a328-8793a6e5d40f', 279, 'ai_auto', 0.30),
  ('4385eefc-1712-4dde-a328-8793a6e5d40f', 281, 'ai_auto', 0.30),
  ('4385eefc-1712-4dde-a328-8793a6e5d40f', 618, 'ai_auto', 0.30),
  ('4385eefc-1712-4dde-a328-8793a6e5d40f', 619, 'ai_auto', 0.30),
  ('4385eefc-1712-4dde-a328-8793a6e5d40f', 620, 'ai_auto', 0.30);

-- Robins & Morton (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('671ed8ef-b68e-4ce9-aedf-5b9c156b56c4', 278, 'ai_auto', 0.70),
  ('671ed8ef-b68e-4ce9-aedf-5b9c156b56c4', 279, 'ai_auto', 0.70),
  ('671ed8ef-b68e-4ce9-aedf-5b9c156b56c4', 280, 'ai_auto', 0.35),
  ('671ed8ef-b68e-4ce9-aedf-5b9c156b56c4', 281, 'ai_auto', 0.35),
  ('671ed8ef-b68e-4ce9-aedf-5b9c156b56c4', 617, 'ai_auto', 0.35),
  ('671ed8ef-b68e-4ce9-aedf-5b9c156b56c4', 616, 'ai_auto', 0.33),
  ('671ed8ef-b68e-4ce9-aedf-5b9c156b56c4', 277, 'ai_auto', 0.30),
  ('671ed8ef-b68e-4ce9-aedf-5b9c156b56c4', 618, 'ai_auto', 0.30),
  ('671ed8ef-b68e-4ce9-aedf-5b9c156b56c4', 619, 'ai_auto', 0.30),
  ('671ed8ef-b68e-4ce9-aedf-5b9c156b56c4', 620, 'ai_auto', 0.30);

-- Ameresco (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('ba38be92-0c19-485f-b19f-fad6a6fb8db6', 622, 'ai_auto', 0.35),
  ('ba38be92-0c19-485f-b19f-fad6a6fb8db6', 282, 'ai_auto', 0.30),
  ('ba38be92-0c19-485f-b19f-fad6a6fb8db6', 283, 'ai_auto', 0.30),
  ('ba38be92-0c19-485f-b19f-fad6a6fb8db6', 284, 'ai_auto', 0.30),
  ('ba38be92-0c19-485f-b19f-fad6a6fb8db6', 285, 'ai_auto', 0.30),
  ('ba38be92-0c19-485f-b19f-fad6a6fb8db6', 286, 'ai_auto', 0.30),
  ('ba38be92-0c19-485f-b19f-fad6a6fb8db6', 287, 'ai_auto', 0.30),
  ('ba38be92-0c19-485f-b19f-fad6a6fb8db6', 621, 'ai_auto', 0.30),
  ('ba38be92-0c19-485f-b19f-fad6a6fb8db6', 623, 'ai_auto', 0.30),
  ('ba38be92-0c19-485f-b19f-fad6a6fb8db6', 624, 'ai_auto', 0.30);

-- Schneider Electric (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('6d8578c4-da26-4cee-a6c2-9dcd43835f0f', 622, 'ai_auto', 0.60),
  ('6d8578c4-da26-4cee-a6c2-9dcd43835f0f', 621, 'ai_auto', 0.40),
  ('6d8578c4-da26-4cee-a6c2-9dcd43835f0f', 284, 'ai_auto', 0.35),
  ('6d8578c4-da26-4cee-a6c2-9dcd43835f0f', 624, 'ai_auto', 0.33),
  ('6d8578c4-da26-4cee-a6c2-9dcd43835f0f', 625, 'ai_auto', 0.33),
  ('6d8578c4-da26-4cee-a6c2-9dcd43835f0f', 282, 'ai_auto', 0.30),
  ('6d8578c4-da26-4cee-a6c2-9dcd43835f0f', 283, 'ai_auto', 0.30),
  ('6d8578c4-da26-4cee-a6c2-9dcd43835f0f', 285, 'ai_auto', 0.30),
  ('6d8578c4-da26-4cee-a6c2-9dcd43835f0f', 286, 'ai_auto', 0.30),
  ('6d8578c4-da26-4cee-a6c2-9dcd43835f0f', 287, 'ai_auto', 0.30);

-- Honeywell Building Technologies (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('d1ecdedd-c8d1-437e-90a3-33a726597407', 621, 'ai_auto', 0.40),
  ('d1ecdedd-c8d1-437e-90a3-33a726597407', 622, 'ai_auto', 0.40),
  ('d1ecdedd-c8d1-437e-90a3-33a726597407', 282, 'ai_auto', 0.30),
  ('d1ecdedd-c8d1-437e-90a3-33a726597407', 283, 'ai_auto', 0.30),
  ('d1ecdedd-c8d1-437e-90a3-33a726597407', 284, 'ai_auto', 0.30),
  ('d1ecdedd-c8d1-437e-90a3-33a726597407', 285, 'ai_auto', 0.30),
  ('d1ecdedd-c8d1-437e-90a3-33a726597407', 286, 'ai_auto', 0.30),
  ('d1ecdedd-c8d1-437e-90a3-33a726597407', 287, 'ai_auto', 0.30),
  ('d1ecdedd-c8d1-437e-90a3-33a726597407', 623, 'ai_auto', 0.30),
  ('d1ecdedd-c8d1-437e-90a3-33a726597407', 624, 'ai_auto', 0.30);

-- Johnson Controls (Sustainability) (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('91abf015-ce93-4344-a491-164a44ca1b92', 622, 'ai_auto', 0.35),
  ('91abf015-ce93-4344-a491-164a44ca1b92', 621, 'ai_auto', 0.33),
  ('91abf015-ce93-4344-a491-164a44ca1b92', 282, 'ai_auto', 0.30),
  ('91abf015-ce93-4344-a491-164a44ca1b92', 283, 'ai_auto', 0.30),
  ('91abf015-ce93-4344-a491-164a44ca1b92', 284, 'ai_auto', 0.30),
  ('91abf015-ce93-4344-a491-164a44ca1b92', 285, 'ai_auto', 0.30),
  ('91abf015-ce93-4344-a491-164a44ca1b92', 286, 'ai_auto', 0.30),
  ('91abf015-ce93-4344-a491-164a44ca1b92', 287, 'ai_auto', 0.30),
  ('91abf015-ce93-4344-a491-164a44ca1b92', 623, 'ai_auto', 0.30),
  ('91abf015-ce93-4344-a491-164a44ca1b92', 624, 'ai_auto', 0.30);

-- Siemens Smart Infrastructure (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('f3bd7d85-c966-49f5-a9f3-897a922bab80', 622, 'ai_auto', 0.60),
  ('f3bd7d85-c966-49f5-a9f3-897a922bab80', 621, 'ai_auto', 0.33),
  ('f3bd7d85-c966-49f5-a9f3-897a922bab80', 282, 'ai_auto', 0.30),
  ('f3bd7d85-c966-49f5-a9f3-897a922bab80', 283, 'ai_auto', 0.30),
  ('f3bd7d85-c966-49f5-a9f3-897a922bab80', 284, 'ai_auto', 0.30),
  ('f3bd7d85-c966-49f5-a9f3-897a922bab80', 285, 'ai_auto', 0.30),
  ('f3bd7d85-c966-49f5-a9f3-897a922bab80', 286, 'ai_auto', 0.30),
  ('f3bd7d85-c966-49f5-a9f3-897a922bab80', 287, 'ai_auto', 0.30),
  ('f3bd7d85-c966-49f5-a9f3-897a922bab80', 623, 'ai_auto', 0.30),
  ('f3bd7d85-c966-49f5-a9f3-897a922bab80', 624, 'ai_auto', 0.30);

-- Practice Greenhealth (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('2ce65bdf-6e78-40af-8145-d482a6618ddc', 282, 'ai_auto', 0.30),
  ('2ce65bdf-6e78-40af-8145-d482a6618ddc', 283, 'ai_auto', 0.30),
  ('2ce65bdf-6e78-40af-8145-d482a6618ddc', 284, 'ai_auto', 0.30),
  ('2ce65bdf-6e78-40af-8145-d482a6618ddc', 285, 'ai_auto', 0.30),
  ('2ce65bdf-6e78-40af-8145-d482a6618ddc', 286, 'ai_auto', 0.30),
  ('2ce65bdf-6e78-40af-8145-d482a6618ddc', 287, 'ai_auto', 0.30),
  ('2ce65bdf-6e78-40af-8145-d482a6618ddc', 621, 'ai_auto', 0.30),
  ('2ce65bdf-6e78-40af-8145-d482a6618ddc', 622, 'ai_auto', 0.30),
  ('2ce65bdf-6e78-40af-8145-d482a6618ddc', 623, 'ai_auto', 0.30),
  ('2ce65bdf-6e78-40af-8145-d482a6618ddc', 624, 'ai_auto', 0.30);

-- Bernhard (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('3c3c538b-5139-49bd-afdd-ca5e29d2a54f', 622, 'ai_auto', 0.40),
  ('3c3c538b-5139-49bd-afdd-ca5e29d2a54f', 282, 'ai_auto', 0.30),
  ('3c3c538b-5139-49bd-afdd-ca5e29d2a54f', 283, 'ai_auto', 0.30),
  ('3c3c538b-5139-49bd-afdd-ca5e29d2a54f', 284, 'ai_auto', 0.30),
  ('3c3c538b-5139-49bd-afdd-ca5e29d2a54f', 285, 'ai_auto', 0.30),
  ('3c3c538b-5139-49bd-afdd-ca5e29d2a54f', 286, 'ai_auto', 0.30),
  ('3c3c538b-5139-49bd-afdd-ca5e29d2a54f', 287, 'ai_auto', 0.30),
  ('3c3c538b-5139-49bd-afdd-ca5e29d2a54f', 621, 'ai_auto', 0.30),
  ('3c3c538b-5139-49bd-afdd-ca5e29d2a54f', 623, 'ai_auto', 0.30),
  ('3c3c538b-5139-49bd-afdd-ca5e29d2a54f', 624, 'ai_auto', 0.30);

-- Securitas Healthcare (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('15ff4bd8-ade8-4513-b34a-8d1eb346b9f5', 634, 'ai_auto', 0.60),
  ('15ff4bd8-ade8-4513-b34a-8d1eb346b9f5', 233, 'ai_auto', 0.40),
  ('15ff4bd8-ade8-4513-b34a-8d1eb346b9f5', 236, 'ai_auto', 0.40),
  ('15ff4bd8-ade8-4513-b34a-8d1eb346b9f5', 294, 'ai_auto', 0.40),
  ('15ff4bd8-ade8-4513-b34a-8d1eb346b9f5', 632, 'ai_auto', 0.37),
  ('15ff4bd8-ade8-4513-b34a-8d1eb346b9f5', 636, 'ai_auto', 0.35),
  ('15ff4bd8-ade8-4513-b34a-8d1eb346b9f5', 296, 'ai_auto', 0.33),
  ('15ff4bd8-ade8-4513-b34a-8d1eb346b9f5', 637, 'ai_auto', 0.33),
  ('15ff4bd8-ade8-4513-b34a-8d1eb346b9f5', 292, 'ai_auto', 0.30),
  ('15ff4bd8-ade8-4513-b34a-8d1eb346b9f5', 293, 'ai_auto', 0.30);

-- Stanley Security (Securitas) (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('470ddb8e-a314-4d0d-bd7f-3491081cddad', 292, 'ai_auto', 0.70),
  ('470ddb8e-a314-4d0d-bd7f-3491081cddad', 293, 'ai_auto', 0.70),
  ('470ddb8e-a314-4d0d-bd7f-3491081cddad', 294, 'ai_auto', 0.45),
  ('470ddb8e-a314-4d0d-bd7f-3491081cddad', 637, 'ai_auto', 0.40),
  ('470ddb8e-a314-4d0d-bd7f-3491081cddad', 632, 'ai_auto', 0.37),
  ('470ddb8e-a314-4d0d-bd7f-3491081cddad', 634, 'ai_auto', 0.35),
  ('470ddb8e-a314-4d0d-bd7f-3491081cddad', 295, 'ai_auto', 0.30),
  ('470ddb8e-a314-4d0d-bd7f-3491081cddad', 296, 'ai_auto', 0.30),
  ('470ddb8e-a314-4d0d-bd7f-3491081cddad', 633, 'ai_auto', 0.30),
  ('470ddb8e-a314-4d0d-bd7f-3491081cddad', 635, 'ai_auto', 0.30);

-- CenTrak (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('851a7f34-f724-489a-97d8-f5ceb605d428', 294, 'ai_auto', 0.70),
  ('851a7f34-f724-489a-97d8-f5ceb605d428', 233, 'ai_auto', 0.40),
  ('851a7f34-f724-489a-97d8-f5ceb605d428', 236, 'ai_auto', 0.40),
  ('851a7f34-f724-489a-97d8-f5ceb605d428', 637, 'ai_auto', 0.33),
  ('851a7f34-f724-489a-97d8-f5ceb605d428', 292, 'ai_auto', 0.30),
  ('851a7f34-f724-489a-97d8-f5ceb605d428', 293, 'ai_auto', 0.30),
  ('851a7f34-f724-489a-97d8-f5ceb605d428', 295, 'ai_auto', 0.30),
  ('851a7f34-f724-489a-97d8-f5ceb605d428', 296, 'ai_auto', 0.30),
  ('851a7f34-f724-489a-97d8-f5ceb605d428', 632, 'ai_auto', 0.30),
  ('851a7f34-f724-489a-97d8-f5ceb605d428', 633, 'ai_auto', 0.30);

-- Rauland (AMETEK) (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('7c650428-061d-4d11-8faa-d153c66c43c4', 294, 'ai_auto', 0.40),
  ('7c650428-061d-4d11-8faa-d153c66c43c4', 636, 'ai_auto', 0.35),
  ('7c650428-061d-4d11-8faa-d153c66c43c4', 296, 'ai_auto', 0.33),
  ('7c650428-061d-4d11-8faa-d153c66c43c4', 632, 'ai_auto', 0.33),
  ('7c650428-061d-4d11-8faa-d153c66c43c4', 633, 'ai_auto', 0.33),
  ('7c650428-061d-4d11-8faa-d153c66c43c4', 637, 'ai_auto', 0.33),
  ('7c650428-061d-4d11-8faa-d153c66c43c4', 292, 'ai_auto', 0.30),
  ('7c650428-061d-4d11-8faa-d153c66c43c4', 293, 'ai_auto', 0.30),
  ('7c650428-061d-4d11-8faa-d153c66c43c4', 295, 'ai_auto', 0.30),
  ('7c650428-061d-4d11-8faa-d153c66c43c4', 634, 'ai_auto', 0.30);

-- Genetec (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('6768668f-e800-4f13-891a-9180ccc9bc82', 292, 'ai_auto', 0.70),
  ('6768668f-e800-4f13-891a-9180ccc9bc82', 293, 'ai_auto', 0.70),
  ('6768668f-e800-4f13-891a-9180ccc9bc82', 294, 'ai_auto', 0.35),
  ('6768668f-e800-4f13-891a-9180ccc9bc82', 637, 'ai_auto', 0.33),
  ('6768668f-e800-4f13-891a-9180ccc9bc82', 295, 'ai_auto', 0.30),
  ('6768668f-e800-4f13-891a-9180ccc9bc82', 296, 'ai_auto', 0.30),
  ('6768668f-e800-4f13-891a-9180ccc9bc82', 632, 'ai_auto', 0.30),
  ('6768668f-e800-4f13-891a-9180ccc9bc82', 633, 'ai_auto', 0.30),
  ('6768668f-e800-4f13-891a-9180ccc9bc82', 634, 'ai_auto', 0.30),
  ('6768668f-e800-4f13-891a-9180ccc9bc82', 635, 'ai_auto', 0.30);

-- Lenel S2 (Carrier) (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('ea83b464-f307-49d8-b5dd-56bad80f96bc', 293, 'ai_auto', 0.70),
  ('ea83b464-f307-49d8-b5dd-56bad80f96bc', 294, 'ai_auto', 0.35),
  ('ea83b464-f307-49d8-b5dd-56bad80f96bc', 634, 'ai_auto', 0.35),
  ('ea83b464-f307-49d8-b5dd-56bad80f96bc', 632, 'ai_auto', 0.33),
  ('ea83b464-f307-49d8-b5dd-56bad80f96bc', 637, 'ai_auto', 0.33),
  ('ea83b464-f307-49d8-b5dd-56bad80f96bc', 292, 'ai_auto', 0.30),
  ('ea83b464-f307-49d8-b5dd-56bad80f96bc', 295, 'ai_auto', 0.30),
  ('ea83b464-f307-49d8-b5dd-56bad80f96bc', 296, 'ai_auto', 0.30),
  ('ea83b464-f307-49d8-b5dd-56bad80f96bc', 633, 'ai_auto', 0.30),
  ('ea83b464-f307-49d8-b5dd-56bad80f96bc', 635, 'ai_auto', 0.30);

-- GNYHA Ventures / Nexera (9 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('d49ca243-c905-4aed-9451-3c7aaad4ebc7', 220, 'ai_auto', 0.70),
  ('d49ca243-c905-4aed-9451-3c7aaad4ebc7', 219, 'ai_auto', 0.35),
  ('d49ca243-c905-4aed-9451-3c7aaad4ebc7', 221, 'ai_auto', 0.35),
  ('d49ca243-c905-4aed-9451-3c7aaad4ebc7', 560, 'ai_auto', 0.35),
  ('d49ca243-c905-4aed-9451-3c7aaad4ebc7', 559, 'ai_auto', 0.33),
  ('d49ca243-c905-4aed-9451-3c7aaad4ebc7', 222, 'ai_auto', 0.30),
  ('d49ca243-c905-4aed-9451-3c7aaad4ebc7', 557, 'ai_auto', 0.30),
  ('d49ca243-c905-4aed-9451-3c7aaad4ebc7', 558, 'ai_auto', 0.30),
  ('d49ca243-c905-4aed-9451-3c7aaad4ebc7', 338, 'ai_auto', 0.13);

-- Yankee Alliance (now Vizient) (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('8302de80-8253-418d-a103-c5c6400f168e', 220, 'ai_auto', 0.70),
  ('8302de80-8253-418d-a103-c5c6400f168e', 219, 'ai_auto', 0.35),
  ('8302de80-8253-418d-a103-c5c6400f168e', 221, 'ai_auto', 0.35),
  ('8302de80-8253-418d-a103-c5c6400f168e', 559, 'ai_auto', 0.33),
  ('8302de80-8253-418d-a103-c5c6400f168e', 222, 'ai_auto', 0.30),
  ('8302de80-8253-418d-a103-c5c6400f168e', 557, 'ai_auto', 0.30),
  ('8302de80-8253-418d-a103-c5c6400f168e', 558, 'ai_auto', 0.30),
  ('8302de80-8253-418d-a103-c5c6400f168e', 560, 'ai_auto', 0.30),
  ('8302de80-8253-418d-a103-c5c6400f168e', 338, 'ai_auto', 0.13),
  ('8302de80-8253-418d-a103-c5c6400f168e', 289, 'ai_auto', 0.10);

-- McKesson (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('4eec56dc-cee1-49be-918b-9102d1e83b66', 229, 'ai_auto', 0.37),
  ('4eec56dc-cee1-49be-918b-9102d1e83b66', 566, 'ai_auto', 0.35),
  ('4eec56dc-cee1-49be-918b-9102d1e83b66', 565, 'ai_auto', 0.33),
  ('4eec56dc-cee1-49be-918b-9102d1e83b66', 227, 'ai_auto', 0.30),
  ('4eec56dc-cee1-49be-918b-9102d1e83b66', 228, 'ai_auto', 0.30),
  ('4eec56dc-cee1-49be-918b-9102d1e83b66', 230, 'ai_auto', 0.30),
  ('4eec56dc-cee1-49be-918b-9102d1e83b66', 231, 'ai_auto', 0.30),
  ('4eec56dc-cee1-49be-918b-9102d1e83b66', 567, 'ai_auto', 0.30),
  ('4eec56dc-cee1-49be-918b-9102d1e83b66', 338, 'ai_auto', 0.13),
  ('4eec56dc-cee1-49be-918b-9102d1e83b66', 224, 'ai_auto', 0.10);

-- AmerisourceBergen (Cencora) (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('7ba2202f-2ee8-4f49-a731-9216e69fe1c8', 149, 'ai_auto', 0.40),
  ('7ba2202f-2ee8-4f49-a731-9216e69fe1c8', 566, 'ai_auto', 0.35),
  ('7ba2202f-2ee8-4f49-a731-9216e69fe1c8', 229, 'ai_auto', 0.33),
  ('7ba2202f-2ee8-4f49-a731-9216e69fe1c8', 231, 'ai_auto', 0.33),
  ('7ba2202f-2ee8-4f49-a731-9216e69fe1c8', 565, 'ai_auto', 0.33),
  ('7ba2202f-2ee8-4f49-a731-9216e69fe1c8', 227, 'ai_auto', 0.30),
  ('7ba2202f-2ee8-4f49-a731-9216e69fe1c8', 228, 'ai_auto', 0.30),
  ('7ba2202f-2ee8-4f49-a731-9216e69fe1c8', 230, 'ai_auto', 0.30),
  ('7ba2202f-2ee8-4f49-a731-9216e69fe1c8', 567, 'ai_auto', 0.30),
  ('7ba2202f-2ee8-4f49-a731-9216e69fe1c8', 345, 'ai_auto', 0.15);

-- UPS Healthcare (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('d99b29a0-8e47-43cd-a394-74f1dcb76752', 231, 'ai_auto', 0.70),
  ('d99b29a0-8e47-43cd-a394-74f1dcb76752', 567, 'ai_auto', 0.37),
  ('d99b29a0-8e47-43cd-a394-74f1dcb76752', 566, 'ai_auto', 0.35),
  ('d99b29a0-8e47-43cd-a394-74f1dcb76752', 229, 'ai_auto', 0.33),
  ('d99b29a0-8e47-43cd-a394-74f1dcb76752', 565, 'ai_auto', 0.33),
  ('d99b29a0-8e47-43cd-a394-74f1dcb76752', 227, 'ai_auto', 0.30),
  ('d99b29a0-8e47-43cd-a394-74f1dcb76752', 228, 'ai_auto', 0.30),
  ('d99b29a0-8e47-43cd-a394-74f1dcb76752', 230, 'ai_auto', 0.30),
  ('d99b29a0-8e47-43cd-a394-74f1dcb76752', 174, 'ai_auto', 0.15),
  ('d99b29a0-8e47-43cd-a394-74f1dcb76752', 252, 'ai_auto', 0.15);

-- GHX (Global Healthcare Exchange) (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('a5859a2c-2318-4195-bf0b-186e98f85e01', 187, 'ai_auto', 0.40),
  ('a5859a2c-2318-4195-bf0b-186e98f85e01', 238, 'ai_auto', 0.35),
  ('a5859a2c-2318-4195-bf0b-186e98f85e01', 577, 'ai_auto', 0.33),
  ('a5859a2c-2318-4195-bf0b-186e98f85e01', 237, 'ai_auto', 0.30),
  ('a5859a2c-2318-4195-bf0b-186e98f85e01', 239, 'ai_auto', 0.30),
  ('a5859a2c-2318-4195-bf0b-186e98f85e01', 573, 'ai_auto', 0.30),
  ('a5859a2c-2318-4195-bf0b-186e98f85e01', 574, 'ai_auto', 0.30),
  ('a5859a2c-2318-4195-bf0b-186e98f85e01', 575, 'ai_auto', 0.30),
  ('a5859a2c-2318-4195-bf0b-186e98f85e01', 576, 'ai_auto', 0.30),
  ('a5859a2c-2318-4195-bf0b-186e98f85e01', 338, 'ai_auto', 0.23);

-- Jaggaer (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('eec4ff71-54cd-4f4f-b4a4-0bb2cfea5550', 91, 'ai_auto', 0.40),
  ('eec4ff71-54cd-4f4f-b4a4-0bb2cfea5550', 238, 'ai_auto', 0.35),
  ('eec4ff71-54cd-4f4f-b4a4-0bb2cfea5550', 577, 'ai_auto', 0.33),
  ('eec4ff71-54cd-4f4f-b4a4-0bb2cfea5550', 237, 'ai_auto', 0.30),
  ('eec4ff71-54cd-4f4f-b4a4-0bb2cfea5550', 239, 'ai_auto', 0.30),
  ('eec4ff71-54cd-4f4f-b4a4-0bb2cfea5550', 573, 'ai_auto', 0.30),
  ('eec4ff71-54cd-4f4f-b4a4-0bb2cfea5550', 574, 'ai_auto', 0.30),
  ('eec4ff71-54cd-4f4f-b4a4-0bb2cfea5550', 575, 'ai_auto', 0.30),
  ('eec4ff71-54cd-4f4f-b4a4-0bb2cfea5550', 576, 'ai_auto', 0.30),
  ('eec4ff71-54cd-4f4f-b4a4-0bb2cfea5550', 311, 'ai_auto', 0.15);

-- Prodigo Solutions (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('bf2d4ff7-6d44-4b75-98be-ce19ee984b7c', 238, 'ai_auto', 0.35),
  ('bf2d4ff7-6d44-4b75-98be-ce19ee984b7c', 573, 'ai_auto', 0.33),
  ('bf2d4ff7-6d44-4b75-98be-ce19ee984b7c', 577, 'ai_auto', 0.33),
  ('bf2d4ff7-6d44-4b75-98be-ce19ee984b7c', 237, 'ai_auto', 0.30),
  ('bf2d4ff7-6d44-4b75-98be-ce19ee984b7c', 239, 'ai_auto', 0.30),
  ('bf2d4ff7-6d44-4b75-98be-ce19ee984b7c', 574, 'ai_auto', 0.30),
  ('bf2d4ff7-6d44-4b75-98be-ce19ee984b7c', 575, 'ai_auto', 0.30),
  ('bf2d4ff7-6d44-4b75-98be-ce19ee984b7c', 576, 'ai_auto', 0.30),
  ('bf2d4ff7-6d44-4b75-98be-ce19ee984b7c', 338, 'ai_auto', 0.17),
  ('bf2d4ff7-6d44-4b75-98be-ce19ee984b7c', 185, 'ai_auto', 0.10);

-- Workday Strategic Sourcing (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('5e8af340-5152-4d82-930e-4ca3a7770f50', 237, 'ai_auto', 1.00),
  ('5e8af340-5152-4d82-930e-4ca3a7770f50', 187, 'ai_auto', 0.40),
  ('5e8af340-5152-4d82-930e-4ca3a7770f50', 238, 'ai_auto', 0.30),
  ('5e8af340-5152-4d82-930e-4ca3a7770f50', 239, 'ai_auto', 0.30),
  ('5e8af340-5152-4d82-930e-4ca3a7770f50', 573, 'ai_auto', 0.30),
  ('5e8af340-5152-4d82-930e-4ca3a7770f50', 574, 'ai_auto', 0.30),
  ('5e8af340-5152-4d82-930e-4ca3a7770f50', 575, 'ai_auto', 0.30),
  ('5e8af340-5152-4d82-930e-4ca3a7770f50', 576, 'ai_auto', 0.30),
  ('5e8af340-5152-4d82-930e-4ca3a7770f50', 577, 'ai_auto', 0.30),
  ('5e8af340-5152-4d82-930e-4ca3a7770f50', 338, 'ai_auto', 0.17);

-- Determine (Corcentric) (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('71626ced-b51d-4be9-b27c-c08a9a4c2d8f', 185, 'ai_auto', 0.40),
  ('71626ced-b51d-4be9-b27c-c08a9a4c2d8f', 238, 'ai_auto', 0.35),
  ('71626ced-b51d-4be9-b27c-c08a9a4c2d8f', 577, 'ai_auto', 0.33),
  ('71626ced-b51d-4be9-b27c-c08a9a4c2d8f', 237, 'ai_auto', 0.30),
  ('71626ced-b51d-4be9-b27c-c08a9a4c2d8f', 239, 'ai_auto', 0.30),
  ('71626ced-b51d-4be9-b27c-c08a9a4c2d8f', 573, 'ai_auto', 0.30),
  ('71626ced-b51d-4be9-b27c-c08a9a4c2d8f', 574, 'ai_auto', 0.30),
  ('71626ced-b51d-4be9-b27c-c08a9a4c2d8f', 575, 'ai_auto', 0.30),
  ('71626ced-b51d-4be9-b27c-c08a9a4c2d8f', 576, 'ai_auto', 0.30),
  ('71626ced-b51d-4be9-b27c-c08a9a4c2d8f', 47, 'ai_auto', 0.10);

-- Modern Healthcare (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('afd385a6-ef56-4892-9bd1-3e957ee04ea9', 773, 'ai_auto', 0.45),
  ('afd385a6-ef56-4892-9bd1-3e957ee04ea9', 775, 'ai_auto', 0.45),
  ('afd385a6-ef56-4892-9bd1-3e957ee04ea9', 776, 'ai_auto', 0.45),
  ('afd385a6-ef56-4892-9bd1-3e957ee04ea9', 778, 'ai_auto', 0.43),
  ('afd385a6-ef56-4892-9bd1-3e957ee04ea9', 771, 'ai_auto', 0.40),
  ('afd385a6-ef56-4892-9bd1-3e957ee04ea9', 349, 'ai_auto', 0.30),
  ('afd385a6-ef56-4892-9bd1-3e957ee04ea9', 772, 'ai_auto', 0.30),
  ('afd385a6-ef56-4892-9bd1-3e957ee04ea9', 774, 'ai_auto', 0.30),
  ('afd385a6-ef56-4892-9bd1-3e957ee04ea9', 777, 'ai_auto', 0.30),
  ('afd385a6-ef56-4892-9bd1-3e957ee04ea9', 780, 'ai_auto', 0.20);

-- Becker''s Healthcare (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('9de06a7c-2d79-4dd8-9c29-b778d479aeef', 773, 'ai_auto', 0.50),
  ('9de06a7c-2d79-4dd8-9c29-b778d479aeef', 775, 'ai_auto', 0.45),
  ('9de06a7c-2d79-4dd8-9c29-b778d479aeef', 776, 'ai_auto', 0.45),
  ('9de06a7c-2d79-4dd8-9c29-b778d479aeef', 778, 'ai_auto', 0.43),
  ('9de06a7c-2d79-4dd8-9c29-b778d479aeef', 771, 'ai_auto', 0.40),
  ('9de06a7c-2d79-4dd8-9c29-b778d479aeef', 349, 'ai_auto', 0.35),
  ('9de06a7c-2d79-4dd8-9c29-b778d479aeef', 772, 'ai_auto', 0.33),
  ('9de06a7c-2d79-4dd8-9c29-b778d479aeef', 774, 'ai_auto', 0.30),
  ('9de06a7c-2d79-4dd8-9c29-b778d479aeef', 777, 'ai_auto', 0.30),
  ('9de06a7c-2d79-4dd8-9c29-b778d479aeef', 780, 'ai_auto', 0.25);

-- Healthcare Dive (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('7757736f-95f4-4d26-936a-0d98472ae2ca', 773, 'ai_auto', 0.45),
  ('7757736f-95f4-4d26-936a-0d98472ae2ca', 316, 'ai_auto', 0.40),
  ('7757736f-95f4-4d26-936a-0d98472ae2ca', 771, 'ai_auto', 0.40),
  ('7757736f-95f4-4d26-936a-0d98472ae2ca', 775, 'ai_auto', 0.40),
  ('7757736f-95f4-4d26-936a-0d98472ae2ca', 776, 'ai_auto', 0.40),
  ('7757736f-95f4-4d26-936a-0d98472ae2ca', 778, 'ai_auto', 0.40),
  ('7757736f-95f4-4d26-936a-0d98472ae2ca', 349, 'ai_auto', 0.30),
  ('7757736f-95f4-4d26-936a-0d98472ae2ca', 772, 'ai_auto', 0.30),
  ('7757736f-95f4-4d26-936a-0d98472ae2ca', 774, 'ai_auto', 0.30),
  ('7757736f-95f4-4d26-936a-0d98472ae2ca', 777, 'ai_auto', 0.30);

-- Fierce Healthcare (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('f5d7ef33-edaf-45e8-81f1-52ef6e521fd3', 773, 'ai_auto', 0.50),
  ('f5d7ef33-edaf-45e8-81f1-52ef6e521fd3', 775, 'ai_auto', 0.45),
  ('f5d7ef33-edaf-45e8-81f1-52ef6e521fd3', 776, 'ai_auto', 0.45),
  ('f5d7ef33-edaf-45e8-81f1-52ef6e521fd3', 778, 'ai_auto', 0.43),
  ('f5d7ef33-edaf-45e8-81f1-52ef6e521fd3', 316, 'ai_auto', 0.40),
  ('f5d7ef33-edaf-45e8-81f1-52ef6e521fd3', 349, 'ai_auto', 0.40),
  ('f5d7ef33-edaf-45e8-81f1-52ef6e521fd3', 771, 'ai_auto', 0.40),
  ('f5d7ef33-edaf-45e8-81f1-52ef6e521fd3', 772, 'ai_auto', 0.33),
  ('f5d7ef33-edaf-45e8-81f1-52ef6e521fd3', 774, 'ai_auto', 0.30),
  ('f5d7ef33-edaf-45e8-81f1-52ef6e521fd3', 777, 'ai_auto', 0.30);

-- Health Affairs (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('f298db8b-a623-4f43-ad12-d273e070c5f6', 773, 'ai_auto', 0.50),
  ('f298db8b-a623-4f43-ad12-d273e070c5f6', 338, 'ai_auto', 0.37),
  ('f298db8b-a623-4f43-ad12-d273e070c5f6', 349, 'ai_auto', 0.35),
  ('f298db8b-a623-4f43-ad12-d273e070c5f6', 772, 'ai_auto', 0.33),
  ('f298db8b-a623-4f43-ad12-d273e070c5f6', 777, 'ai_auto', 0.33),
  ('f298db8b-a623-4f43-ad12-d273e070c5f6', 771, 'ai_auto', 0.30),
  ('f298db8b-a623-4f43-ad12-d273e070c5f6', 774, 'ai_auto', 0.30),
  ('f298db8b-a623-4f43-ad12-d273e070c5f6', 775, 'ai_auto', 0.30),
  ('f298db8b-a623-4f43-ad12-d273e070c5f6', 776, 'ai_auto', 0.30),
  ('f298db8b-a623-4f43-ad12-d273e070c5f6', 778, 'ai_auto', 0.30);

-- HFMA (Healthcare Financial Management Association) (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('abbb0027-d0a5-408c-b028-05c21338272e', 773, 'ai_auto', 0.45),
  ('abbb0027-d0a5-408c-b028-05c21338272e', 203, 'ai_auto', 0.40),
  ('abbb0027-d0a5-408c-b028-05c21338272e', 771, 'ai_auto', 0.40),
  ('abbb0027-d0a5-408c-b028-05c21338272e', 775, 'ai_auto', 0.40),
  ('abbb0027-d0a5-408c-b028-05c21338272e', 776, 'ai_auto', 0.40),
  ('abbb0027-d0a5-408c-b028-05c21338272e', 778, 'ai_auto', 0.37),
  ('abbb0027-d0a5-408c-b028-05c21338272e', 349, 'ai_auto', 0.35),
  ('abbb0027-d0a5-408c-b028-05c21338272e', 772, 'ai_auto', 0.33),
  ('abbb0027-d0a5-408c-b028-05c21338272e', 774, 'ai_auto', 0.30),
  ('abbb0027-d0a5-408c-b028-05c21338272e', 777, 'ai_auto', 0.30);

-- Advisory Board (Optum) (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('7525c069-27ab-4e5d-a2f2-e2f76d8d8ce3', 773, 'ai_auto', 0.40),
  ('7525c069-27ab-4e5d-a2f2-e2f76d8d8ce3', 349, 'ai_auto', 0.35),
  ('7525c069-27ab-4e5d-a2f2-e2f76d8d8ce3', 772, 'ai_auto', 0.33),
  ('7525c069-27ab-4e5d-a2f2-e2f76d8d8ce3', 777, 'ai_auto', 0.33),
  ('7525c069-27ab-4e5d-a2f2-e2f76d8d8ce3', 771, 'ai_auto', 0.30),
  ('7525c069-27ab-4e5d-a2f2-e2f76d8d8ce3', 774, 'ai_auto', 0.30),
  ('7525c069-27ab-4e5d-a2f2-e2f76d8d8ce3', 775, 'ai_auto', 0.30),
  ('7525c069-27ab-4e5d-a2f2-e2f76d8d8ce3', 776, 'ai_auto', 0.30),
  ('7525c069-27ab-4e5d-a2f2-e2f76d8d8ce3', 778, 'ai_auto', 0.30),
  ('7525c069-27ab-4e5d-a2f2-e2f76d8d8ce3', 793, 'ai_auto', 0.18);

-- AHA (American Hospital Association) (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('242b849d-7a51-438d-be99-b6559eeb0082', 764, 'ai_auto', 0.42),
  ('242b849d-7a51-438d-be99-b6559eeb0082', 769, 'ai_auto', 0.40),
  ('242b849d-7a51-438d-be99-b6559eeb0082', 338, 'ai_auto', 0.30),
  ('242b849d-7a51-438d-be99-b6559eeb0082', 348, 'ai_auto', 0.30),
  ('242b849d-7a51-438d-be99-b6559eeb0082', 762, 'ai_auto', 0.30),
  ('242b849d-7a51-438d-be99-b6559eeb0082', 763, 'ai_auto', 0.30),
  ('242b849d-7a51-438d-be99-b6559eeb0082', 765, 'ai_auto', 0.30),
  ('242b849d-7a51-438d-be99-b6559eeb0082', 766, 'ai_auto', 0.30),
  ('242b849d-7a51-438d-be99-b6559eeb0082', 767, 'ai_auto', 0.30),
  ('242b849d-7a51-438d-be99-b6559eeb0082', 768, 'ai_auto', 0.30);

-- AHRMM (Association for Health Resource & Materials Management) (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('b4209b16-5a7e-48ae-aa71-5af8eb75dc74', 203, 'ai_auto', 0.40),
  ('b4209b16-5a7e-48ae-aa71-5af8eb75dc74', 764, 'ai_auto', 0.40),
  ('b4209b16-5a7e-48ae-aa71-5af8eb75dc74', 762, 'ai_auto', 0.37),
  ('b4209b16-5a7e-48ae-aa71-5af8eb75dc74', 769, 'ai_auto', 0.33),
  ('b4209b16-5a7e-48ae-aa71-5af8eb75dc74', 348, 'ai_auto', 0.30),
  ('b4209b16-5a7e-48ae-aa71-5af8eb75dc74', 763, 'ai_auto', 0.30),
  ('b4209b16-5a7e-48ae-aa71-5af8eb75dc74', 765, 'ai_auto', 0.30),
  ('b4209b16-5a7e-48ae-aa71-5af8eb75dc74', 766, 'ai_auto', 0.30),
  ('b4209b16-5a7e-48ae-aa71-5af8eb75dc74', 767, 'ai_auto', 0.30),
  ('b4209b16-5a7e-48ae-aa71-5af8eb75dc74', 768, 'ai_auto', 0.30);

-- ACHE (American College of Healthcare Executives) (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('3dbe0ac8-8151-474b-946f-ee946080f4e8', 203, 'ai_auto', 0.40),
  ('3dbe0ac8-8151-474b-946f-ee946080f4e8', 314, 'ai_auto', 0.40),
  ('3dbe0ac8-8151-474b-946f-ee946080f4e8', 764, 'ai_auto', 0.38),
  ('3dbe0ac8-8151-474b-946f-ee946080f4e8', 348, 'ai_auto', 0.30),
  ('3dbe0ac8-8151-474b-946f-ee946080f4e8', 762, 'ai_auto', 0.30),
  ('3dbe0ac8-8151-474b-946f-ee946080f4e8', 763, 'ai_auto', 0.30),
  ('3dbe0ac8-8151-474b-946f-ee946080f4e8', 765, 'ai_auto', 0.30),
  ('3dbe0ac8-8151-474b-946f-ee946080f4e8', 766, 'ai_auto', 0.30),
  ('3dbe0ac8-8151-474b-946f-ee946080f4e8', 767, 'ai_auto', 0.30),
  ('3dbe0ac8-8151-474b-946f-ee946080f4e8', 768, 'ai_auto', 0.30);

-- HIMSS (Healthcare Information and Management Systems Society) (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('68784446-5c81-4cb0-a9e6-52d7aab75e86', 764, 'ai_auto', 0.42),
  ('68784446-5c81-4cb0-a9e6-52d7aab75e86', 203, 'ai_auto', 0.40),
  ('68784446-5c81-4cb0-a9e6-52d7aab75e86', 767, 'ai_auto', 0.37),
  ('68784446-5c81-4cb0-a9e6-52d7aab75e86', 348, 'ai_auto', 0.30),
  ('68784446-5c81-4cb0-a9e6-52d7aab75e86', 762, 'ai_auto', 0.30),
  ('68784446-5c81-4cb0-a9e6-52d7aab75e86', 763, 'ai_auto', 0.30),
  ('68784446-5c81-4cb0-a9e6-52d7aab75e86', 765, 'ai_auto', 0.30),
  ('68784446-5c81-4cb0-a9e6-52d7aab75e86', 766, 'ai_auto', 0.30),
  ('68784446-5c81-4cb0-a9e6-52d7aab75e86', 768, 'ai_auto', 0.30),
  ('68784446-5c81-4cb0-a9e6-52d7aab75e86', 769, 'ai_auto', 0.30);

-- SHSMD (Society for Health Care Strategy & Market Development) (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('65685ad8-41fe-48d9-baa9-f7221bcdbff8', 764, 'ai_auto', 0.38),
  ('65685ad8-41fe-48d9-baa9-f7221bcdbff8', 348, 'ai_auto', 0.30),
  ('65685ad8-41fe-48d9-baa9-f7221bcdbff8', 762, 'ai_auto', 0.30),
  ('65685ad8-41fe-48d9-baa9-f7221bcdbff8', 763, 'ai_auto', 0.30),
  ('65685ad8-41fe-48d9-baa9-f7221bcdbff8', 765, 'ai_auto', 0.30),
  ('65685ad8-41fe-48d9-baa9-f7221bcdbff8', 766, 'ai_auto', 0.30),
  ('65685ad8-41fe-48d9-baa9-f7221bcdbff8', 767, 'ai_auto', 0.30),
  ('65685ad8-41fe-48d9-baa9-f7221bcdbff8', 768, 'ai_auto', 0.30),
  ('65685ad8-41fe-48d9-baa9-f7221bcdbff8', 769, 'ai_auto', 0.30),
  ('65685ad8-41fe-48d9-baa9-f7221bcdbff8', 770, 'ai_auto', 0.30);

-- AONE (American Organization for Nursing Leadership) (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('fc6ede54-1201-422e-ba8f-167842fa9dc8', 314, 'ai_auto', 0.50),
  ('fc6ede54-1201-422e-ba8f-167842fa9dc8', 203, 'ai_auto', 0.40),
  ('fc6ede54-1201-422e-ba8f-167842fa9dc8', 765, 'ai_auto', 0.40),
  ('fc6ede54-1201-422e-ba8f-167842fa9dc8', 769, 'ai_auto', 0.33),
  ('fc6ede54-1201-422e-ba8f-167842fa9dc8', 764, 'ai_auto', 0.33),
  ('fc6ede54-1201-422e-ba8f-167842fa9dc8', 348, 'ai_auto', 0.30),
  ('fc6ede54-1201-422e-ba8f-167842fa9dc8', 762, 'ai_auto', 0.30),
  ('fc6ede54-1201-422e-ba8f-167842fa9dc8', 763, 'ai_auto', 0.30),
  ('fc6ede54-1201-422e-ba8f-167842fa9dc8', 766, 'ai_auto', 0.30),
  ('fc6ede54-1201-422e-ba8f-167842fa9dc8', 767, 'ai_auto', 0.30);

-- HLTH (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('c1e01278-364a-4fd4-a621-873f3e754cfe', 316, 'ai_auto', 0.40),
  ('c1e01278-364a-4fd4-a621-873f3e754cfe', 780, 'ai_auto', 0.35),
  ('c1e01278-364a-4fd4-a621-873f3e754cfe', 785, 'ai_auto', 0.33),
  ('c1e01278-364a-4fd4-a621-873f3e754cfe', 350, 'ai_auto', 0.30),
  ('c1e01278-364a-4fd4-a621-873f3e754cfe', 779, 'ai_auto', 0.30),
  ('c1e01278-364a-4fd4-a621-873f3e754cfe', 781, 'ai_auto', 0.30),
  ('c1e01278-364a-4fd4-a621-873f3e754cfe', 782, 'ai_auto', 0.30),
  ('c1e01278-364a-4fd4-a621-873f3e754cfe', 783, 'ai_auto', 0.30),
  ('c1e01278-364a-4fd4-a621-873f3e754cfe', 784, 'ai_auto', 0.30),
  ('c1e01278-364a-4fd4-a621-873f3e754cfe', 786, 'ai_auto', 0.30);

-- HIMSS Global Health Conference (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('5b9be5d3-8904-4377-8c9d-d3f1783a355d', 780, 'ai_auto', 0.45),
  ('5b9be5d3-8904-4377-8c9d-d3f1783a355d', 785, 'ai_auto', 0.38),
  ('5b9be5d3-8904-4377-8c9d-d3f1783a355d', 350, 'ai_auto', 0.30),
  ('5b9be5d3-8904-4377-8c9d-d3f1783a355d', 779, 'ai_auto', 0.30),
  ('5b9be5d3-8904-4377-8c9d-d3f1783a355d', 781, 'ai_auto', 0.30),
  ('5b9be5d3-8904-4377-8c9d-d3f1783a355d', 782, 'ai_auto', 0.30),
  ('5b9be5d3-8904-4377-8c9d-d3f1783a355d', 783, 'ai_auto', 0.30),
  ('5b9be5d3-8904-4377-8c9d-d3f1783a355d', 784, 'ai_auto', 0.30),
  ('5b9be5d3-8904-4377-8c9d-d3f1783a355d', 786, 'ai_auto', 0.30),
  ('5b9be5d3-8904-4377-8c9d-d3f1783a355d', 773, 'ai_auto', 0.20);

-- Becker''s Hospital Review Conference (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('7e557294-f871-4290-baac-9c9bfad66d28', 350, 'ai_auto', 0.45),
  ('7e557294-f871-4290-baac-9c9bfad66d28', 780, 'ai_auto', 0.40),
  ('7e557294-f871-4290-baac-9c9bfad66d28', 784, 'ai_auto', 0.35),
  ('7e557294-f871-4290-baac-9c9bfad66d28', 785, 'ai_auto', 0.35),
  ('7e557294-f871-4290-baac-9c9bfad66d28', 779, 'ai_auto', 0.33),
  ('7e557294-f871-4290-baac-9c9bfad66d28', 781, 'ai_auto', 0.30),
  ('7e557294-f871-4290-baac-9c9bfad66d28', 782, 'ai_auto', 0.30),
  ('7e557294-f871-4290-baac-9c9bfad66d28', 783, 'ai_auto', 0.30),
  ('7e557294-f871-4290-baac-9c9bfad66d28', 786, 'ai_auto', 0.30),
  ('7e557294-f871-4290-baac-9c9bfad66d28', 764, 'ai_auto', 0.17);

-- HFMA Annual Conference (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('51849166-6ec1-4677-bc15-c76398e2d035', 780, 'ai_auto', 0.35),
  ('51849166-6ec1-4677-bc15-c76398e2d035', 785, 'ai_auto', 0.33),
  ('51849166-6ec1-4677-bc15-c76398e2d035', 350, 'ai_auto', 0.30),
  ('51849166-6ec1-4677-bc15-c76398e2d035', 779, 'ai_auto', 0.30),
  ('51849166-6ec1-4677-bc15-c76398e2d035', 781, 'ai_auto', 0.30),
  ('51849166-6ec1-4677-bc15-c76398e2d035', 782, 'ai_auto', 0.30),
  ('51849166-6ec1-4677-bc15-c76398e2d035', 783, 'ai_auto', 0.30),
  ('51849166-6ec1-4677-bc15-c76398e2d035', 784, 'ai_auto', 0.30),
  ('51849166-6ec1-4677-bc15-c76398e2d035', 786, 'ai_auto', 0.30),
  ('51849166-6ec1-4677-bc15-c76398e2d035', 764, 'ai_auto', 0.10);

-- ViVE (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('bcc69270-0c25-4775-a062-04d669a60eea', 780, 'ai_auto', 0.35),
  ('bcc69270-0c25-4775-a062-04d669a60eea', 785, 'ai_auto', 0.33),
  ('bcc69270-0c25-4775-a062-04d669a60eea', 350, 'ai_auto', 0.30),
  ('bcc69270-0c25-4775-a062-04d669a60eea', 779, 'ai_auto', 0.30),
  ('bcc69270-0c25-4775-a062-04d669a60eea', 781, 'ai_auto', 0.30),
  ('bcc69270-0c25-4775-a062-04d669a60eea', 782, 'ai_auto', 0.30),
  ('bcc69270-0c25-4775-a062-04d669a60eea', 783, 'ai_auto', 0.30),
  ('bcc69270-0c25-4775-a062-04d669a60eea', 784, 'ai_auto', 0.30),
  ('bcc69270-0c25-4775-a062-04d669a60eea', 786, 'ai_auto', 0.30),
  ('bcc69270-0c25-4775-a062-04d669a60eea', 764, 'ai_auto', 0.10);

-- AHRMM Conference (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('c406fe76-3588-4c9c-a122-84bea90b602c', 779, 'ai_auto', 0.37),
  ('c406fe76-3588-4c9c-a122-84bea90b602c', 350, 'ai_auto', 0.30),
  ('c406fe76-3588-4c9c-a122-84bea90b602c', 780, 'ai_auto', 0.30),
  ('c406fe76-3588-4c9c-a122-84bea90b602c', 781, 'ai_auto', 0.30),
  ('c406fe76-3588-4c9c-a122-84bea90b602c', 782, 'ai_auto', 0.30),
  ('c406fe76-3588-4c9c-a122-84bea90b602c', 783, 'ai_auto', 0.30),
  ('c406fe76-3588-4c9c-a122-84bea90b602c', 784, 'ai_auto', 0.30),
  ('c406fe76-3588-4c9c-a122-84bea90b602c', 785, 'ai_auto', 0.30),
  ('c406fe76-3588-4c9c-a122-84bea90b602c', 786, 'ai_auto', 0.30),
  ('c406fe76-3588-4c9c-a122-84bea90b602c', 762, 'ai_auto', 0.12);

-- Hillrom (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('c7173466-235d-495c-ade8-c69eabcde13f', 95, 'ai_auto', 0.70),
  ('c7173466-235d-495c-ade8-c69eabcde13f', 441, 'ai_auto', 0.40),
  ('c7173466-235d-495c-ade8-c69eabcde13f', 94, 'ai_auto', 0.35),
  ('c7173466-235d-495c-ade8-c69eabcde13f', 98, 'ai_auto', 0.35),
  ('c7173466-235d-495c-ade8-c69eabcde13f', 443, 'ai_auto', 0.33),
  ('c7173466-235d-495c-ade8-c69eabcde13f', 93, 'ai_auto', 0.30),
  ('c7173466-235d-495c-ade8-c69eabcde13f', 96, 'ai_auto', 0.30),
  ('c7173466-235d-495c-ade8-c69eabcde13f', 97, 'ai_auto', 0.30),
  ('c7173466-235d-495c-ade8-c69eabcde13f', 442, 'ai_auto', 0.30),
  ('c7173466-235d-495c-ade8-c69eabcde13f', 444, 'ai_auto', 0.30);

-- Skytron (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('583b8354-194e-461c-bcc5-afddb0c0d6fa', 95, 'ai_auto', 0.70),
  ('583b8354-194e-461c-bcc5-afddb0c0d6fa', 96, 'ai_auto', 0.70),
  ('583b8354-194e-461c-bcc5-afddb0c0d6fa', 441, 'ai_auto', 0.60),
  ('583b8354-194e-461c-bcc5-afddb0c0d6fa', 94, 'ai_auto', 0.40),
  ('583b8354-194e-461c-bcc5-afddb0c0d6fa', 98, 'ai_auto', 0.35),
  ('583b8354-194e-461c-bcc5-afddb0c0d6fa', 443, 'ai_auto', 0.33),
  ('583b8354-194e-461c-bcc5-afddb0c0d6fa', 93, 'ai_auto', 0.30),
  ('583b8354-194e-461c-bcc5-afddb0c0d6fa', 97, 'ai_auto', 0.30),
  ('583b8354-194e-461c-bcc5-afddb0c0d6fa', 442, 'ai_auto', 0.30),
  ('583b8354-194e-461c-bcc5-afddb0c0d6fa', 444, 'ai_auto', 0.30);

-- MAQUET (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('677d4f7f-a7a5-467f-9029-4d747263d55a', 94, 'ai_auto', 0.70),
  ('677d4f7f-a7a5-467f-9029-4d747263d55a', 95, 'ai_auto', 0.70),
  ('677d4f7f-a7a5-467f-9029-4d747263d55a', 443, 'ai_auto', 0.33),
  ('677d4f7f-a7a5-467f-9029-4d747263d55a', 93, 'ai_auto', 0.30),
  ('677d4f7f-a7a5-467f-9029-4d747263d55a', 96, 'ai_auto', 0.30),
  ('677d4f7f-a7a5-467f-9029-4d747263d55a', 97, 'ai_auto', 0.30),
  ('677d4f7f-a7a5-467f-9029-4d747263d55a', 98, 'ai_auto', 0.30),
  ('677d4f7f-a7a5-467f-9029-4d747263d55a', 441, 'ai_auto', 0.30),
  ('677d4f7f-a7a5-467f-9029-4d747263d55a', 442, 'ai_auto', 0.30),
  ('677d4f7f-a7a5-467f-9029-4d747263d55a', 444, 'ai_auto', 0.30);

-- Mizuho OSI (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('72e735f4-b91f-493a-bbb9-23b8d46268c9', 94, 'ai_auto', 0.70),
  ('72e735f4-b91f-493a-bbb9-23b8d46268c9', 2, 'ai_auto', 0.40),
  ('72e735f4-b91f-493a-bbb9-23b8d46268c9', 98, 'ai_auto', 0.35),
  ('72e735f4-b91f-493a-bbb9-23b8d46268c9', 441, 'ai_auto', 0.35),
  ('72e735f4-b91f-493a-bbb9-23b8d46268c9', 443, 'ai_auto', 0.33),
  ('72e735f4-b91f-493a-bbb9-23b8d46268c9', 93, 'ai_auto', 0.30),
  ('72e735f4-b91f-493a-bbb9-23b8d46268c9', 95, 'ai_auto', 0.30),
  ('72e735f4-b91f-493a-bbb9-23b8d46268c9', 96, 'ai_auto', 0.30),
  ('72e735f4-b91f-493a-bbb9-23b8d46268c9', 97, 'ai_auto', 0.30),
  ('72e735f4-b91f-493a-bbb9-23b8d46268c9', 379, 'ai_auto', 0.30);

-- Advanced Sterilization Products (ASP) (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('c3139c05-606d-4a80-a8cf-7835c9c09c03', 68, 'ai_auto', 1.00),
  ('c3139c05-606d-4a80-a8cf-7835c9c09c03', 69, 'ai_auto', 0.40),
  ('c3139c05-606d-4a80-a8cf-7835c9c09c03', 98, 'ai_auto', 0.35),
  ('c3139c05-606d-4a80-a8cf-7835c9c09c03', 441, 'ai_auto', 0.35),
  ('c3139c05-606d-4a80-a8cf-7835c9c09c03', 97, 'ai_auto', 0.33),
  ('c3139c05-606d-4a80-a8cf-7835c9c09c03', 93, 'ai_auto', 0.30),
  ('c3139c05-606d-4a80-a8cf-7835c9c09c03', 94, 'ai_auto', 0.30),
  ('c3139c05-606d-4a80-a8cf-7835c9c09c03', 95, 'ai_auto', 0.30),
  ('c3139c05-606d-4a80-a8cf-7835c9c09c03', 96, 'ai_auto', 0.30),
  ('c3139c05-606d-4a80-a8cf-7835c9c09c03', 442, 'ai_auto', 0.30);

-- Belimed (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('2f9f31fc-a5c2-4d4f-817e-3d5cb7b02958', 97, 'ai_auto', 0.37),
  ('2f9f31fc-a5c2-4d4f-817e-3d5cb7b02958', 445, 'ai_auto', 0.33),
  ('2f9f31fc-a5c2-4d4f-817e-3d5cb7b02958', 93, 'ai_auto', 0.30),
  ('2f9f31fc-a5c2-4d4f-817e-3d5cb7b02958', 94, 'ai_auto', 0.30),
  ('2f9f31fc-a5c2-4d4f-817e-3d5cb7b02958', 95, 'ai_auto', 0.30),
  ('2f9f31fc-a5c2-4d4f-817e-3d5cb7b02958', 96, 'ai_auto', 0.30),
  ('2f9f31fc-a5c2-4d4f-817e-3d5cb7b02958', 98, 'ai_auto', 0.30),
  ('2f9f31fc-a5c2-4d4f-817e-3d5cb7b02958', 441, 'ai_auto', 0.30),
  ('2f9f31fc-a5c2-4d4f-817e-3d5cb7b02958', 442, 'ai_auto', 0.30),
  ('2f9f31fc-a5c2-4d4f-817e-3d5cb7b02958', 443, 'ai_auto', 0.30);

-- Tuttnauer (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('9d6e1f4e-dc75-4664-9481-75aaf8d38c41', 68, 'ai_auto', 0.40),
  ('9d6e1f4e-dc75-4664-9481-75aaf8d38c41', 97, 'ai_auto', 0.33),
  ('9d6e1f4e-dc75-4664-9481-75aaf8d38c41', 445, 'ai_auto', 0.33),
  ('9d6e1f4e-dc75-4664-9481-75aaf8d38c41', 93, 'ai_auto', 0.30),
  ('9d6e1f4e-dc75-4664-9481-75aaf8d38c41', 94, 'ai_auto', 0.30),
  ('9d6e1f4e-dc75-4664-9481-75aaf8d38c41', 95, 'ai_auto', 0.30),
  ('9d6e1f4e-dc75-4664-9481-75aaf8d38c41', 96, 'ai_auto', 0.30),
  ('9d6e1f4e-dc75-4664-9481-75aaf8d38c41', 98, 'ai_auto', 0.30),
  ('9d6e1f4e-dc75-4664-9481-75aaf8d38c41', 441, 'ai_auto', 0.30),
  ('9d6e1f4e-dc75-4664-9481-75aaf8d38c41', 442, 'ai_auto', 0.30);

-- Sterilog (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('cc3d6562-aa17-49ec-b7c1-a8b9f2ea815c', 97, 'ai_auto', 0.37),
  ('cc3d6562-aa17-49ec-b7c1-a8b9f2ea815c', 93, 'ai_auto', 0.30),
  ('cc3d6562-aa17-49ec-b7c1-a8b9f2ea815c', 94, 'ai_auto', 0.30),
  ('cc3d6562-aa17-49ec-b7c1-a8b9f2ea815c', 95, 'ai_auto', 0.30),
  ('cc3d6562-aa17-49ec-b7c1-a8b9f2ea815c', 96, 'ai_auto', 0.30),
  ('cc3d6562-aa17-49ec-b7c1-a8b9f2ea815c', 98, 'ai_auto', 0.30),
  ('cc3d6562-aa17-49ec-b7c1-a8b9f2ea815c', 441, 'ai_auto', 0.30),
  ('cc3d6562-aa17-49ec-b7c1-a8b9f2ea815c', 442, 'ai_auto', 0.30),
  ('cc3d6562-aa17-49ec-b7c1-a8b9f2ea815c', 443, 'ai_auto', 0.30),
  ('cc3d6562-aa17-49ec-b7c1-a8b9f2ea815c', 444, 'ai_auto', 0.30);

-- Philips (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('0c0e742a-d4f7-44fe-a93a-dc4d636de8ca', 100, 'ai_auto', 0.35),
  ('0c0e742a-d4f7-44fe-a93a-dc4d636de8ca', 103, 'ai_auto', 0.35),
  ('0c0e742a-d4f7-44fe-a93a-dc4d636de8ca', 447, 'ai_auto', 0.35),
  ('0c0e742a-d4f7-44fe-a93a-dc4d636de8ca', 450, 'ai_auto', 0.33),
  ('0c0e742a-d4f7-44fe-a93a-dc4d636de8ca', 99, 'ai_auto', 0.30),
  ('0c0e742a-d4f7-44fe-a93a-dc4d636de8ca', 101, 'ai_auto', 0.30),
  ('0c0e742a-d4f7-44fe-a93a-dc4d636de8ca', 102, 'ai_auto', 0.30),
  ('0c0e742a-d4f7-44fe-a93a-dc4d636de8ca', 446, 'ai_auto', 0.30),
  ('0c0e742a-d4f7-44fe-a93a-dc4d636de8ca', 448, 'ai_auto', 0.30),
  ('0c0e742a-d4f7-44fe-a93a-dc4d636de8ca', 449, 'ai_auto', 0.30);

-- Rauland-Borg (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('88aabf0e-a97a-4802-b777-e0601eddab6a', 446, 'ai_auto', 0.40),
  ('88aabf0e-a97a-4802-b777-e0601eddab6a', 100, 'ai_auto', 0.35),
  ('88aabf0e-a97a-4802-b777-e0601eddab6a', 102, 'ai_auto', 0.35),
  ('88aabf0e-a97a-4802-b777-e0601eddab6a', 447, 'ai_auto', 0.35),
  ('88aabf0e-a97a-4802-b777-e0601eddab6a', 449, 'ai_auto', 0.33),
  ('88aabf0e-a97a-4802-b777-e0601eddab6a', 99, 'ai_auto', 0.30),
  ('88aabf0e-a97a-4802-b777-e0601eddab6a', 101, 'ai_auto', 0.30),
  ('88aabf0e-a97a-4802-b777-e0601eddab6a', 103, 'ai_auto', 0.30),
  ('88aabf0e-a97a-4802-b777-e0601eddab6a', 448, 'ai_auto', 0.30),
  ('88aabf0e-a97a-4802-b777-e0601eddab6a', 450, 'ai_auto', 0.30);

-- Cisco (9 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('27f990c6-e8a3-477c-9a90-227d7944c864', 172, 'ai_auto', 0.35),
  ('27f990c6-e8a3-477c-9a90-227d7944c864', 174, 'ai_auto', 0.35),
  ('27f990c6-e8a3-477c-9a90-227d7944c864', 515, 'ai_auto', 0.35),
  ('27f990c6-e8a3-477c-9a90-227d7944c864', 513, 'ai_auto', 0.33),
  ('27f990c6-e8a3-477c-9a90-227d7944c864', 514, 'ai_auto', 0.33),
  ('27f990c6-e8a3-477c-9a90-227d7944c864', 171, 'ai_auto', 0.30),
  ('27f990c6-e8a3-477c-9a90-227d7944c864', 173, 'ai_auto', 0.30),
  ('27f990c6-e8a3-477c-9a90-227d7944c864', 516, 'ai_auto', 0.30),
  ('27f990c6-e8a3-477c-9a90-227d7944c864', 517, 'ai_auto', 0.30);

-- HP Healthcare (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('0c1d4050-a007-4f1b-8efc-c113266e6bcd', 174, 'ai_auto', 0.45),
  ('0c1d4050-a007-4f1b-8efc-c113266e6bcd', 171, 'ai_auto', 0.30),
  ('0c1d4050-a007-4f1b-8efc-c113266e6bcd', 172, 'ai_auto', 0.30),
  ('0c1d4050-a007-4f1b-8efc-c113266e6bcd', 173, 'ai_auto', 0.30),
  ('0c1d4050-a007-4f1b-8efc-c113266e6bcd', 513, 'ai_auto', 0.30),
  ('0c1d4050-a007-4f1b-8efc-c113266e6bcd', 514, 'ai_auto', 0.30),
  ('0c1d4050-a007-4f1b-8efc-c113266e6bcd', 515, 'ai_auto', 0.30),
  ('0c1d4050-a007-4f1b-8efc-c113266e6bcd', 516, 'ai_auto', 0.30),
  ('0c1d4050-a007-4f1b-8efc-c113266e6bcd', 517, 'ai_auto', 0.30),
  ('0c1d4050-a007-4f1b-8efc-c113266e6bcd', 252, 'ai_auto', 0.15);

-- Ergotron (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('aa96e810-5c85-4d49-b4cd-b72418d53c1b', 277, 'ai_auto', 0.40),
  ('aa96e810-5c85-4d49-b4cd-b72418d53c1b', 172, 'ai_auto', 0.35),
  ('aa96e810-5c85-4d49-b4cd-b72418d53c1b', 174, 'ai_auto', 0.35),
  ('aa96e810-5c85-4d49-b4cd-b72418d53c1b', 515, 'ai_auto', 0.35),
  ('aa96e810-5c85-4d49-b4cd-b72418d53c1b', 513, 'ai_auto', 0.33),
  ('aa96e810-5c85-4d49-b4cd-b72418d53c1b', 514, 'ai_auto', 0.33),
  ('aa96e810-5c85-4d49-b4cd-b72418d53c1b', 171, 'ai_auto', 0.30),
  ('aa96e810-5c85-4d49-b4cd-b72418d53c1b', 173, 'ai_auto', 0.30),
  ('aa96e810-5c85-4d49-b4cd-b72418d53c1b', 516, 'ai_auto', 0.30),
  ('aa96e810-5c85-4d49-b4cd-b72418d53c1b', 517, 'ai_auto', 0.30);

-- Juniper Networks (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('ea2d2794-31f7-40e2-b10e-2c4a84c2d756', 172, 'ai_auto', 0.35),
  ('ea2d2794-31f7-40e2-b10e-2c4a84c2d756', 515, 'ai_auto', 0.35),
  ('ea2d2794-31f7-40e2-b10e-2c4a84c2d756', 513, 'ai_auto', 0.33),
  ('ea2d2794-31f7-40e2-b10e-2c4a84c2d756', 514, 'ai_auto', 0.33),
  ('ea2d2794-31f7-40e2-b10e-2c4a84c2d756', 171, 'ai_auto', 0.30),
  ('ea2d2794-31f7-40e2-b10e-2c4a84c2d756', 173, 'ai_auto', 0.30),
  ('ea2d2794-31f7-40e2-b10e-2c4a84c2d756', 174, 'ai_auto', 0.30),
  ('ea2d2794-31f7-40e2-b10e-2c4a84c2d756', 516, 'ai_auto', 0.30),
  ('ea2d2794-31f7-40e2-b10e-2c4a84c2d756', 517, 'ai_auto', 0.30),
  ('ea2d2794-31f7-40e2-b10e-2c4a84c2d756', 333, 'ai_auto', 0.15);

-- Extreme Networks (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('31e2eccc-ea0d-49c9-a2fc-d9b87c08af91', 174, 'ai_auto', 0.35),
  ('31e2eccc-ea0d-49c9-a2fc-d9b87c08af91', 171, 'ai_auto', 0.30),
  ('31e2eccc-ea0d-49c9-a2fc-d9b87c08af91', 172, 'ai_auto', 0.30),
  ('31e2eccc-ea0d-49c9-a2fc-d9b87c08af91', 173, 'ai_auto', 0.30),
  ('31e2eccc-ea0d-49c9-a2fc-d9b87c08af91', 513, 'ai_auto', 0.30),
  ('31e2eccc-ea0d-49c9-a2fc-d9b87c08af91', 514, 'ai_auto', 0.30),
  ('31e2eccc-ea0d-49c9-a2fc-d9b87c08af91', 515, 'ai_auto', 0.30),
  ('31e2eccc-ea0d-49c9-a2fc-d9b87c08af91', 516, 'ai_auto', 0.30),
  ('31e2eccc-ea0d-49c9-a2fc-d9b87c08af91', 517, 'ai_auto', 0.30),
  ('31e2eccc-ea0d-49c9-a2fc-d9b87c08af91', 333, 'ai_auto', 0.15);

-- Aruba Networks (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('7451a043-ca76-48a0-81f0-eb2fac156b27', 172, 'ai_auto', 0.35),
  ('7451a043-ca76-48a0-81f0-eb2fac156b27', 515, 'ai_auto', 0.35),
  ('7451a043-ca76-48a0-81f0-eb2fac156b27', 513, 'ai_auto', 0.33),
  ('7451a043-ca76-48a0-81f0-eb2fac156b27', 514, 'ai_auto', 0.33),
  ('7451a043-ca76-48a0-81f0-eb2fac156b27', 171, 'ai_auto', 0.30),
  ('7451a043-ca76-48a0-81f0-eb2fac156b27', 173, 'ai_auto', 0.30),
  ('7451a043-ca76-48a0-81f0-eb2fac156b27', 174, 'ai_auto', 0.30),
  ('7451a043-ca76-48a0-81f0-eb2fac156b27', 516, 'ai_auto', 0.30),
  ('7451a043-ca76-48a0-81f0-eb2fac156b27', 517, 'ai_auto', 0.30),
  ('7451a043-ca76-48a0-81f0-eb2fac156b27', 333, 'ai_auto', 0.15);

-- Rubbermaid Healthcare (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('9cca95fa-bc7d-4e9e-bf4b-377a324b5c63', 174, 'ai_auto', 0.45),
  ('9cca95fa-bc7d-4e9e-bf4b-377a324b5c63', 172, 'ai_auto', 0.35),
  ('9cca95fa-bc7d-4e9e-bf4b-377a324b5c63', 515, 'ai_auto', 0.35),
  ('9cca95fa-bc7d-4e9e-bf4b-377a324b5c63', 513, 'ai_auto', 0.33),
  ('9cca95fa-bc7d-4e9e-bf4b-377a324b5c63', 514, 'ai_auto', 0.33),
  ('9cca95fa-bc7d-4e9e-bf4b-377a324b5c63', 171, 'ai_auto', 0.30),
  ('9cca95fa-bc7d-4e9e-bf4b-377a324b5c63', 173, 'ai_auto', 0.30),
  ('9cca95fa-bc7d-4e9e-bf4b-377a324b5c63', 516, 'ai_auto', 0.30),
  ('9cca95fa-bc7d-4e9e-bf4b-377a324b5c63', 517, 'ai_auto', 0.30),
  ('9cca95fa-bc7d-4e9e-bf4b-377a324b5c63', 255, 'ai_auto', 0.15);

-- Horiba Medical (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('be6b6f66-1b6d-4c8c-83aa-554dcf95d0f2', 112, 'ai_auto', 0.70),
  ('be6b6f66-1b6d-4c8c-83aa-554dcf95d0f2', 113, 'ai_auto', 0.70),
  ('be6b6f66-1b6d-4c8c-83aa-554dcf95d0f2', 342, 'ai_auto', 0.40),
  ('be6b6f66-1b6d-4c8c-83aa-554dcf95d0f2', 114, 'ai_auto', 0.30),
  ('be6b6f66-1b6d-4c8c-83aa-554dcf95d0f2', 115, 'ai_auto', 0.30),
  ('be6b6f66-1b6d-4c8c-83aa-554dcf95d0f2', 458, 'ai_auto', 0.30),
  ('be6b6f66-1b6d-4c8c-83aa-554dcf95d0f2', 459, 'ai_auto', 0.30),
  ('be6b6f66-1b6d-4c8c-83aa-554dcf95d0f2', 460, 'ai_auto', 0.30),
  ('be6b6f66-1b6d-4c8c-83aa-554dcf95d0f2', 461, 'ai_auto', 0.30),
  ('be6b6f66-1b6d-4c8c-83aa-554dcf95d0f2', 107, 'ai_auto', 0.10);

-- Leica Biosystems (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('28ac276e-e015-4955-b17f-a3f22fa5187e', 116, 'ai_auto', 0.70),
  ('28ac276e-e015-4955-b17f-a3f22fa5187e', 117, 'ai_auto', 0.70),
  ('28ac276e-e015-4955-b17f-a3f22fa5187e', 462, 'ai_auto', 0.60),
  ('28ac276e-e015-4955-b17f-a3f22fa5187e', 118, 'ai_auto', 0.35),
  ('28ac276e-e015-4955-b17f-a3f22fa5187e', 465, 'ai_auto', 0.35),
  ('28ac276e-e015-4955-b17f-a3f22fa5187e', 119, 'ai_auto', 0.30),
  ('28ac276e-e015-4955-b17f-a3f22fa5187e', 463, 'ai_auto', 0.30),
  ('28ac276e-e015-4955-b17f-a3f22fa5187e', 464, 'ai_auto', 0.30),
  ('28ac276e-e015-4955-b17f-a3f22fa5187e', 120, 'ai_auto', 0.15),
  ('28ac276e-e015-4955-b17f-a3f22fa5187e', 466, 'ai_auto', 0.12);

-- Sakura Finetek (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('48249d71-3c95-40f6-bf09-1d0668fd69c2', 118, 'ai_auto', 0.35),
  ('48249d71-3c95-40f6-bf09-1d0668fd69c2', 462, 'ai_auto', 0.35),
  ('48249d71-3c95-40f6-bf09-1d0668fd69c2', 116, 'ai_auto', 0.30),
  ('48249d71-3c95-40f6-bf09-1d0668fd69c2', 117, 'ai_auto', 0.30),
  ('48249d71-3c95-40f6-bf09-1d0668fd69c2', 119, 'ai_auto', 0.30),
  ('48249d71-3c95-40f6-bf09-1d0668fd69c2', 463, 'ai_auto', 0.30),
  ('48249d71-3c95-40f6-bf09-1d0668fd69c2', 464, 'ai_auto', 0.30),
  ('48249d71-3c95-40f6-bf09-1d0668fd69c2', 465, 'ai_auto', 0.30),
  ('48249d71-3c95-40f6-bf09-1d0668fd69c2', 482, 'ai_auto', 0.12),
  ('48249d71-3c95-40f6-bf09-1d0668fd69c2', 120, 'ai_auto', 0.10);

-- Ventana Medical Systems (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('0cc16950-f48f-4918-bc01-accb504b5a37', 116, 'ai_auto', 0.35),
  ('0cc16950-f48f-4918-bc01-accb504b5a37', 117, 'ai_auto', 0.35),
  ('0cc16950-f48f-4918-bc01-accb504b5a37', 465, 'ai_auto', 0.35),
  ('0cc16950-f48f-4918-bc01-accb504b5a37', 471, 'ai_auto', 0.35),
  ('0cc16950-f48f-4918-bc01-accb504b5a37', 118, 'ai_auto', 0.30),
  ('0cc16950-f48f-4918-bc01-accb504b5a37', 119, 'ai_auto', 0.30),
  ('0cc16950-f48f-4918-bc01-accb504b5a37', 462, 'ai_auto', 0.30),
  ('0cc16950-f48f-4918-bc01-accb504b5a37', 463, 'ai_auto', 0.30),
  ('0cc16950-f48f-4918-bc01-accb504b5a37', 464, 'ai_auto', 0.30),
  ('0cc16950-f48f-4918-bc01-accb504b5a37', 120, 'ai_auto', 0.20);

-- Hamamatsu Photonics (9 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('77547169-42b2-4589-b4d9-1bde89d0e1aa', 117, 'ai_auto', 0.70),
  ('77547169-42b2-4589-b4d9-1bde89d0e1aa', 62, 'ai_auto', 0.40),
  ('77547169-42b2-4589-b4d9-1bde89d0e1aa', 116, 'ai_auto', 0.35),
  ('77547169-42b2-4589-b4d9-1bde89d0e1aa', 119, 'ai_auto', 0.35),
  ('77547169-42b2-4589-b4d9-1bde89d0e1aa', 465, 'ai_auto', 0.35),
  ('77547169-42b2-4589-b4d9-1bde89d0e1aa', 118, 'ai_auto', 0.30),
  ('77547169-42b2-4589-b4d9-1bde89d0e1aa', 462, 'ai_auto', 0.30),
  ('77547169-42b2-4589-b4d9-1bde89d0e1aa', 463, 'ai_auto', 0.30),
  ('77547169-42b2-4589-b4d9-1bde89d0e1aa', 464, 'ai_auto', 0.30);

-- Proscia (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('44ed5bf0-5732-47cd-89d1-0554717317bf', 117, 'ai_auto', 0.70),
  ('44ed5bf0-5732-47cd-89d1-0554717317bf', 116, 'ai_auto', 0.35),
  ('44ed5bf0-5732-47cd-89d1-0554717317bf', 119, 'ai_auto', 0.35),
  ('44ed5bf0-5732-47cd-89d1-0554717317bf', 465, 'ai_auto', 0.35),
  ('44ed5bf0-5732-47cd-89d1-0554717317bf', 118, 'ai_auto', 0.30),
  ('44ed5bf0-5732-47cd-89d1-0554717317bf', 462, 'ai_auto', 0.30),
  ('44ed5bf0-5732-47cd-89d1-0554717317bf', 463, 'ai_auto', 0.30),
  ('44ed5bf0-5732-47cd-89d1-0554717317bf', 464, 'ai_auto', 0.30),
  ('44ed5bf0-5732-47cd-89d1-0554717317bf', 128, 'ai_auto', 0.10),
  ('44ed5bf0-5732-47cd-89d1-0554717317bf', 461, 'ai_auto', 0.10);

-- Precipio Diagnostics (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('7f35f2c2-bfc2-4ede-99a9-0bccfd2e5444', 116, 'ai_auto', 0.35),
  ('7f35f2c2-bfc2-4ede-99a9-0bccfd2e5444', 117, 'ai_auto', 0.35),
  ('7f35f2c2-bfc2-4ede-99a9-0bccfd2e5444', 465, 'ai_auto', 0.35),
  ('7f35f2c2-bfc2-4ede-99a9-0bccfd2e5444', 118, 'ai_auto', 0.30),
  ('7f35f2c2-bfc2-4ede-99a9-0bccfd2e5444', 119, 'ai_auto', 0.30),
  ('7f35f2c2-bfc2-4ede-99a9-0bccfd2e5444', 462, 'ai_auto', 0.30),
  ('7f35f2c2-bfc2-4ede-99a9-0bccfd2e5444', 463, 'ai_auto', 0.30),
  ('7f35f2c2-bfc2-4ede-99a9-0bccfd2e5444', 464, 'ai_auto', 0.30),
  ('7f35f2c2-bfc2-4ede-99a9-0bccfd2e5444', 123, 'ai_auto', 0.20),
  ('7f35f2c2-bfc2-4ede-99a9-0bccfd2e5444', 126, 'ai_auto', 0.20);

-- BD (Becton Dickinson) (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('be4bfca1-0cd3-44a2-9bb6-d6a531338c8e', 120, 'ai_auto', 0.70),
  ('be4bfca1-0cd3-44a2-9bb6-d6a531338c8e', 466, 'ai_auto', 0.60),
  ('be4bfca1-0cd3-44a2-9bb6-d6a531338c8e', 121, 'ai_auto', 0.30),
  ('be4bfca1-0cd3-44a2-9bb6-d6a531338c8e', 122, 'ai_auto', 0.30),
  ('be4bfca1-0cd3-44a2-9bb6-d6a531338c8e', 123, 'ai_auto', 0.30),
  ('be4bfca1-0cd3-44a2-9bb6-d6a531338c8e', 467, 'ai_auto', 0.30),
  ('be4bfca1-0cd3-44a2-9bb6-d6a531338c8e', 468, 'ai_auto', 0.30),
  ('be4bfca1-0cd3-44a2-9bb6-d6a531338c8e', 469, 'ai_auto', 0.30),
  ('be4bfca1-0cd3-44a2-9bb6-d6a531338c8e', 128, 'ai_auto', 0.10),
  ('be4bfca1-0cd3-44a2-9bb6-d6a531338c8e', 130, 'ai_auto', 0.10);

-- Bruker (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('d5259bc8-7a51-41fa-9a7f-9c0695df9888', 121, 'ai_auto', 0.40),
  ('d5259bc8-7a51-41fa-9a7f-9c0695df9888', 468, 'ai_auto', 0.40),
  ('d5259bc8-7a51-41fa-9a7f-9c0695df9888', 120, 'ai_auto', 0.35),
  ('d5259bc8-7a51-41fa-9a7f-9c0695df9888', 459, 'ai_auto', 0.35),
  ('d5259bc8-7a51-41fa-9a7f-9c0695df9888', 466, 'ai_auto', 0.33),
  ('d5259bc8-7a51-41fa-9a7f-9c0695df9888', 122, 'ai_auto', 0.30),
  ('d5259bc8-7a51-41fa-9a7f-9c0695df9888', 123, 'ai_auto', 0.30),
  ('d5259bc8-7a51-41fa-9a7f-9c0695df9888', 467, 'ai_auto', 0.30),
  ('d5259bc8-7a51-41fa-9a7f-9c0695df9888', 469, 'ai_auto', 0.30),
  ('d5259bc8-7a51-41fa-9a7f-9c0695df9888', 482, 'ai_auto', 0.12);

-- Accelerate Diagnostics (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('efa8b13c-ba3f-4dff-9302-89ffe1c7dd2c', 122, 'ai_auto', 0.70),
  ('efa8b13c-ba3f-4dff-9302-89ffe1c7dd2c', 121, 'ai_auto', 0.40),
  ('efa8b13c-ba3f-4dff-9302-89ffe1c7dd2c', 123, 'ai_auto', 0.40),
  ('efa8b13c-ba3f-4dff-9302-89ffe1c7dd2c', 466, 'ai_auto', 0.37),
  ('efa8b13c-ba3f-4dff-9302-89ffe1c7dd2c', 120, 'ai_auto', 0.35),
  ('efa8b13c-ba3f-4dff-9302-89ffe1c7dd2c', 467, 'ai_auto', 0.33),
  ('efa8b13c-ba3f-4dff-9302-89ffe1c7dd2c', 468, 'ai_auto', 0.30),
  ('efa8b13c-ba3f-4dff-9302-89ffe1c7dd2c', 469, 'ai_auto', 0.30),
  ('efa8b13c-ba3f-4dff-9302-89ffe1c7dd2c', 126, 'ai_auto', 0.15),
  ('efa8b13c-ba3f-4dff-9302-89ffe1c7dd2c', 131, 'ai_auto', 0.15);

-- Luminex (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('54a6e9ef-0281-40d6-b717-f1f97938ff53', 469, 'ai_auto', 0.40),
  ('54a6e9ef-0281-40d6-b717-f1f97938ff53', 120, 'ai_auto', 0.30),
  ('54a6e9ef-0281-40d6-b717-f1f97938ff53', 121, 'ai_auto', 0.30),
  ('54a6e9ef-0281-40d6-b717-f1f97938ff53', 122, 'ai_auto', 0.30),
  ('54a6e9ef-0281-40d6-b717-f1f97938ff53', 123, 'ai_auto', 0.30),
  ('54a6e9ef-0281-40d6-b717-f1f97938ff53', 466, 'ai_auto', 0.30),
  ('54a6e9ef-0281-40d6-b717-f1f97938ff53', 467, 'ai_auto', 0.30),
  ('54a6e9ef-0281-40d6-b717-f1f97938ff53', 468, 'ai_auto', 0.30),
  ('54a6e9ef-0281-40d6-b717-f1f97938ff53', 127, 'ai_auto', 0.10),
  ('54a6e9ef-0281-40d6-b717-f1f97938ff53', 475, 'ai_auto', 0.10);

-- Nova Biomedical (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('5cc91a3c-c2cb-499e-8977-c6f063a2d3c0', 133, 'ai_auto', 0.42),
  ('5cc91a3c-c2cb-499e-8977-c6f063a2d3c0', 478, 'ai_auto', 0.40),
  ('5cc91a3c-c2cb-499e-8977-c6f063a2d3c0', 479, 'ai_auto', 0.35),
  ('5cc91a3c-c2cb-499e-8977-c6f063a2d3c0', 131, 'ai_auto', 0.30),
  ('5cc91a3c-c2cb-499e-8977-c6f063a2d3c0', 132, 'ai_auto', 0.30),
  ('5cc91a3c-c2cb-499e-8977-c6f063a2d3c0', 480, 'ai_auto', 0.30),
  ('5cc91a3c-c2cb-499e-8977-c6f063a2d3c0', 481, 'ai_auto', 0.30),
  ('5cc91a3c-c2cb-499e-8977-c6f063a2d3c0', 285, 'ai_auto', 0.15),
  ('5cc91a3c-c2cb-499e-8977-c6f063a2d3c0', 128, 'ai_auto', 0.10),
  ('5cc91a3c-c2cb-499e-8977-c6f063a2d3c0', 130, 'ai_auto', 0.10);

-- Instrumentation Laboratory (Werfen) (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('aea805ee-6605-455d-bf88-6e698c97862f', 478, 'ai_auto', 0.37),
  ('aea805ee-6605-455d-bf88-6e698c97862f', 479, 'ai_auto', 0.35),
  ('aea805ee-6605-455d-bf88-6e698c97862f', 481, 'ai_auto', 0.35),
  ('aea805ee-6605-455d-bf88-6e698c97862f', 131, 'ai_auto', 0.30),
  ('aea805ee-6605-455d-bf88-6e698c97862f', 132, 'ai_auto', 0.30),
  ('aea805ee-6605-455d-bf88-6e698c97862f', 133, 'ai_auto', 0.30),
  ('aea805ee-6605-455d-bf88-6e698c97862f', 480, 'ai_auto', 0.30),
  ('aea805ee-6605-455d-bf88-6e698c97862f', 338, 'ai_auto', 0.17),
  ('aea805ee-6605-455d-bf88-6e698c97862f', 137, 'ai_auto', 0.15),
  ('aea805ee-6605-455d-bf88-6e698c97862f', 482, 'ai_auto', 0.15);

-- Radiometer (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('b35f2b25-47e8-423a-9b77-283a3b113d5f', 478, 'ai_auto', 0.60),
  ('b35f2b25-47e8-423a-9b77-283a3b113d5f', 479, 'ai_auto', 0.35),
  ('b35f2b25-47e8-423a-9b77-283a3b113d5f', 481, 'ai_auto', 0.35),
  ('b35f2b25-47e8-423a-9b77-283a3b113d5f', 131, 'ai_auto', 0.30),
  ('b35f2b25-47e8-423a-9b77-283a3b113d5f', 132, 'ai_auto', 0.30),
  ('b35f2b25-47e8-423a-9b77-283a3b113d5f', 133, 'ai_auto', 0.30),
  ('b35f2b25-47e8-423a-9b77-283a3b113d5f', 480, 'ai_auto', 0.30),
  ('b35f2b25-47e8-423a-9b77-283a3b113d5f', 125, 'ai_auto', 0.15),
  ('b35f2b25-47e8-423a-9b77-283a3b113d5f', 122, 'ai_auto', 0.10),
  ('b35f2b25-47e8-423a-9b77-283a3b113d5f', 128, 'ai_auto', 0.10);

-- Roche Molecular Diagnostics (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('a65b5d53-65c0-42c8-81f1-611a950b413f', 127, 'ai_auto', 0.50),
  ('a65b5d53-65c0-42c8-81f1-611a950b413f', 124, 'ai_auto', 0.40),
  ('a65b5d53-65c0-42c8-81f1-611a950b413f', 126, 'ai_auto', 0.40),
  ('a65b5d53-65c0-42c8-81f1-611a950b413f', 471, 'ai_auto', 0.40),
  ('a65b5d53-65c0-42c8-81f1-611a950b413f', 473, 'ai_auto', 0.33),
  ('a65b5d53-65c0-42c8-81f1-611a950b413f', 474, 'ai_auto', 0.33),
  ('a65b5d53-65c0-42c8-81f1-611a950b413f', 125, 'ai_auto', 0.30),
  ('a65b5d53-65c0-42c8-81f1-611a950b413f', 470, 'ai_auto', 0.30),
  ('a65b5d53-65c0-42c8-81f1-611a950b413f', 472, 'ai_auto', 0.30),
  ('a65b5d53-65c0-42c8-81f1-611a950b413f', 123, 'ai_auto', 0.15);

-- BioFire Diagnostics (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('6b14207b-d0d8-4692-a9dd-1e86d2c1fc9d', 121, 'ai_auto', 0.45),
  ('6b14207b-d0d8-4692-a9dd-1e86d2c1fc9d', 124, 'ai_auto', 0.40),
  ('6b14207b-d0d8-4692-a9dd-1e86d2c1fc9d', 126, 'ai_auto', 0.40),
  ('6b14207b-d0d8-4692-a9dd-1e86d2c1fc9d', 471, 'ai_auto', 0.40),
  ('6b14207b-d0d8-4692-a9dd-1e86d2c1fc9d', 125, 'ai_auto', 0.30),
  ('6b14207b-d0d8-4692-a9dd-1e86d2c1fc9d', 127, 'ai_auto', 0.30),
  ('6b14207b-d0d8-4692-a9dd-1e86d2c1fc9d', 470, 'ai_auto', 0.30),
  ('6b14207b-d0d8-4692-a9dd-1e86d2c1fc9d', 472, 'ai_auto', 0.30),
  ('6b14207b-d0d8-4692-a9dd-1e86d2c1fc9d', 473, 'ai_auto', 0.30),
  ('6b14207b-d0d8-4692-a9dd-1e86d2c1fc9d', 474, 'ai_auto', 0.30);

-- QIAGEN (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('eb3fa852-d3f3-40e4-824c-31a40d0a2764', 124, 'ai_auto', 0.40),
  ('eb3fa852-d3f3-40e4-824c-31a40d0a2764', 126, 'ai_auto', 0.35),
  ('eb3fa852-d3f3-40e4-824c-31a40d0a2764', 127, 'ai_auto', 0.35),
  ('eb3fa852-d3f3-40e4-824c-31a40d0a2764', 471, 'ai_auto', 0.35),
  ('eb3fa852-d3f3-40e4-824c-31a40d0a2764', 473, 'ai_auto', 0.33),
  ('eb3fa852-d3f3-40e4-824c-31a40d0a2764', 474, 'ai_auto', 0.33),
  ('eb3fa852-d3f3-40e4-824c-31a40d0a2764', 125, 'ai_auto', 0.30),
  ('eb3fa852-d3f3-40e4-824c-31a40d0a2764', 470, 'ai_auto', 0.30),
  ('eb3fa852-d3f3-40e4-824c-31a40d0a2764', 472, 'ai_auto', 0.30),
  ('eb3fa852-d3f3-40e4-824c-31a40d0a2764', 112, 'ai_auto', 0.10);

-- Immucor (9 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('7645f05a-6466-4c9f-90c3-a6fbc994b67f', 129, 'ai_auto', 0.70),
  ('7645f05a-6466-4c9f-90c3-a6fbc994b67f', 128, 'ai_auto', 0.35),
  ('7645f05a-6466-4c9f-90c3-a6fbc994b67f', 130, 'ai_auto', 0.35),
  ('7645f05a-6466-4c9f-90c3-a6fbc994b67f', 476, 'ai_auto', 0.33),
  ('7645f05a-6466-4c9f-90c3-a6fbc994b67f', 475, 'ai_auto', 0.30),
  ('7645f05a-6466-4c9f-90c3-a6fbc994b67f', 477, 'ai_auto', 0.30),
  ('7645f05a-6466-4c9f-90c3-a6fbc994b67f', 466, 'ai_auto', 0.12),
  ('7645f05a-6466-4c9f-90c3-a6fbc994b67f', 120, 'ai_auto', 0.10),
  ('7645f05a-6466-4c9f-90c3-a6fbc994b67f', 331, 'ai_auto', 0.10);

-- Haemonetics (9 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('48c44082-69fb-434b-8ad3-f249da0eab51', 128, 'ai_auto', 0.70),
  ('48c44082-69fb-434b-8ad3-f249da0eab51', 130, 'ai_auto', 0.35),
  ('48c44082-69fb-434b-8ad3-f249da0eab51', 476, 'ai_auto', 0.33),
  ('48c44082-69fb-434b-8ad3-f249da0eab51', 129, 'ai_auto', 0.30),
  ('48c44082-69fb-434b-8ad3-f249da0eab51', 475, 'ai_auto', 0.30),
  ('48c44082-69fb-434b-8ad3-f249da0eab51', 477, 'ai_auto', 0.30),
  ('48c44082-69fb-434b-8ad3-f249da0eab51', 119, 'ai_auto', 0.10),
  ('48c44082-69fb-434b-8ad3-f249da0eab51', 134, 'ai_auto', 0.10),
  ('48c44082-69fb-434b-8ad3-f249da0eab51', 234, 'ai_auto', 0.10);

-- Terumo BCT (7 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('6c4c3720-30bb-4927-90de-434764d75d79', 475, 'ai_auto', 0.60),
  ('6c4c3720-30bb-4927-90de-434764d75d79', 128, 'ai_auto', 0.35),
  ('6c4c3720-30bb-4927-90de-434764d75d79', 130, 'ai_auto', 0.35),
  ('6c4c3720-30bb-4927-90de-434764d75d79', 477, 'ai_auto', 0.33),
  ('6c4c3720-30bb-4927-90de-434764d75d79', 129, 'ai_auto', 0.30),
  ('6c4c3720-30bb-4927-90de-434764d75d79', 476, 'ai_auto', 0.30),
  ('6c4c3720-30bb-4927-90de-434764d75d79', 134, 'ai_auto', 0.10);

-- Hill-Rom (Hillrom) (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('12ad2f69-f817-45f8-b1f9-6ea792055786', 24, 'ai_auto', 0.90),
  ('12ad2f69-f817-45f8-b1f9-6ea792055786', 99, 'ai_auto', 0.40),
  ('12ad2f69-f817-45f8-b1f9-6ea792055786', 100, 'ai_auto', 0.40),
  ('12ad2f69-f817-45f8-b1f9-6ea792055786', 28, 'ai_auto', 0.35),
  ('12ad2f69-f817-45f8-b1f9-6ea792055786', 29, 'ai_auto', 0.35),
  ('12ad2f69-f817-45f8-b1f9-6ea792055786', 378, 'ai_auto', 0.35),
  ('12ad2f69-f817-45f8-b1f9-6ea792055786', 379, 'ai_auto', 0.35),
  ('12ad2f69-f817-45f8-b1f9-6ea792055786', 25, 'ai_auto', 0.30),
  ('12ad2f69-f817-45f8-b1f9-6ea792055786', 26, 'ai_auto', 0.30),
  ('12ad2f69-f817-45f8-b1f9-6ea792055786', 27, 'ai_auto', 0.30);

-- Arjo (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('eea1feeb-cf6f-4448-81aa-2b27613dc24d', 28, 'ai_auto', 0.35),
  ('eea1feeb-cf6f-4448-81aa-2b27613dc24d', 379, 'ai_auto', 0.35),
  ('eea1feeb-cf6f-4448-81aa-2b27613dc24d', 24, 'ai_auto', 0.30),
  ('eea1feeb-cf6f-4448-81aa-2b27613dc24d', 25, 'ai_auto', 0.30),
  ('eea1feeb-cf6f-4448-81aa-2b27613dc24d', 26, 'ai_auto', 0.30),
  ('eea1feeb-cf6f-4448-81aa-2b27613dc24d', 27, 'ai_auto', 0.30),
  ('eea1feeb-cf6f-4448-81aa-2b27613dc24d', 29, 'ai_auto', 0.30),
  ('eea1feeb-cf6f-4448-81aa-2b27613dc24d', 30, 'ai_auto', 0.30),
  ('eea1feeb-cf6f-4448-81aa-2b27613dc24d', 31, 'ai_auto', 0.30),
  ('eea1feeb-cf6f-4448-81aa-2b27613dc24d', 376, 'ai_auto', 0.30);

-- 3M Health Care (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('ef7dde63-b616-45fe-880f-472f9c0f91a9', 28, 'ai_auto', 0.70),
  ('ef7dde63-b616-45fe-880f-472f9c0f91a9', 70, 'ai_auto', 0.45),
  ('ef7dde63-b616-45fe-880f-472f9c0f91a9', 175, 'ai_auto', 0.40),
  ('ef7dde63-b616-45fe-880f-472f9c0f91a9', 31, 'ai_auto', 0.35),
  ('ef7dde63-b616-45fe-880f-472f9c0f91a9', 379, 'ai_auto', 0.35),
  ('ef7dde63-b616-45fe-880f-472f9c0f91a9', 24, 'ai_auto', 0.30),
  ('ef7dde63-b616-45fe-880f-472f9c0f91a9', 25, 'ai_auto', 0.30),
  ('ef7dde63-b616-45fe-880f-472f9c0f91a9', 26, 'ai_auto', 0.30),
  ('ef7dde63-b616-45fe-880f-472f9c0f91a9', 27, 'ai_auto', 0.30),
  ('ef7dde63-b616-45fe-880f-472f9c0f91a9', 29, 'ai_auto', 0.30);

-- Apex Medical (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('e0a85bc0-23de-46c0-a910-eb6b8318878c', 27, 'ai_auto', 0.70),
  ('e0a85bc0-23de-46c0-a910-eb6b8318878c', 25, 'ai_auto', 0.40),
  ('e0a85bc0-23de-46c0-a910-eb6b8318878c', 381, 'ai_auto', 0.37),
  ('e0a85bc0-23de-46c0-a910-eb6b8318878c', 24, 'ai_auto', 0.30),
  ('e0a85bc0-23de-46c0-a910-eb6b8318878c', 26, 'ai_auto', 0.30),
  ('e0a85bc0-23de-46c0-a910-eb6b8318878c', 28, 'ai_auto', 0.30),
  ('e0a85bc0-23de-46c0-a910-eb6b8318878c', 29, 'ai_auto', 0.30),
  ('e0a85bc0-23de-46c0-a910-eb6b8318878c', 30, 'ai_auto', 0.30),
  ('e0a85bc0-23de-46c0-a910-eb6b8318878c', 31, 'ai_auto', 0.30),
  ('e0a85bc0-23de-46c0-a910-eb6b8318878c', 376, 'ai_auto', 0.30);

-- MicroVention (Terumo) (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('ae6d3923-137a-41d8-a827-227ce2f58b07', 38, 'ai_auto', 0.70),
  ('ae6d3923-137a-41d8-a827-227ce2f58b07', 390, 'ai_auto', 0.60),
  ('ae6d3923-137a-41d8-a827-227ce2f58b07', 13, 'ai_auto', 0.45),
  ('ae6d3923-137a-41d8-a827-227ce2f58b07', 39, 'ai_auto', 0.35),
  ('ae6d3923-137a-41d8-a827-227ce2f58b07', 40, 'ai_auto', 0.35),
  ('ae6d3923-137a-41d8-a827-227ce2f58b07', 391, 'ai_auto', 0.35),
  ('ae6d3923-137a-41d8-a827-227ce2f58b07', 393, 'ai_auto', 0.35),
  ('ae6d3923-137a-41d8-a827-227ce2f58b07', 389, 'ai_auto', 0.30),
  ('ae6d3923-137a-41d8-a827-227ce2f58b07', 41, 'ai_auto', 0.30),
  ('ae6d3923-137a-41d8-a827-227ce2f58b07', 42, 'ai_auto', 0.30);

-- Penumbra Inc. (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('b080e353-28e4-4e74-af3f-60b537a7fe29', 38, 'ai_auto', 0.70),
  ('b080e353-28e4-4e74-af3f-60b537a7fe29', 13, 'ai_auto', 0.45),
  ('b080e353-28e4-4e74-af3f-60b537a7fe29', 277, 'ai_auto', 0.40),
  ('b080e353-28e4-4e74-af3f-60b537a7fe29', 393, 'ai_auto', 0.40),
  ('b080e353-28e4-4e74-af3f-60b537a7fe29', 39, 'ai_auto', 0.35),
  ('b080e353-28e4-4e74-af3f-60b537a7fe29', 40, 'ai_auto', 0.35),
  ('b080e353-28e4-4e74-af3f-60b537a7fe29', 389, 'ai_auto', 0.30),
  ('b080e353-28e4-4e74-af3f-60b537a7fe29', 41, 'ai_auto', 0.30),
  ('b080e353-28e4-4e74-af3f-60b537a7fe29', 42, 'ai_auto', 0.30),
  ('b080e353-28e4-4e74-af3f-60b537a7fe29', 390, 'ai_auto', 0.30);

-- Nevro Corp. (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('0d58a90e-ce58-4a50-85e5-aaa8fa708386', 389, 'ai_auto', 0.60),
  ('0d58a90e-ce58-4a50-85e5-aaa8fa708386', 391, 'ai_auto', 0.35),
  ('0d58a90e-ce58-4a50-85e5-aaa8fa708386', 388, 'ai_auto', 0.33),
  ('0d58a90e-ce58-4a50-85e5-aaa8fa708386', 38, 'ai_auto', 0.30),
  ('0d58a90e-ce58-4a50-85e5-aaa8fa708386', 39, 'ai_auto', 0.30),
  ('0d58a90e-ce58-4a50-85e5-aaa8fa708386', 40, 'ai_auto', 0.30),
  ('0d58a90e-ce58-4a50-85e5-aaa8fa708386', 41, 'ai_auto', 0.30),
  ('0d58a90e-ce58-4a50-85e5-aaa8fa708386', 42, 'ai_auto', 0.30),
  ('0d58a90e-ce58-4a50-85e5-aaa8fa708386', 390, 'ai_auto', 0.30),
  ('0d58a90e-ce58-4a50-85e5-aaa8fa708386', 392, 'ai_auto', 0.30);

-- Nuvectra Corporation (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('7a3056b5-a9a8-41e7-88ff-be1e7b66eab4', 74, 'ai_auto', 0.45),
  ('7a3056b5-a9a8-41e7-88ff-be1e7b66eab4', 389, 'ai_auto', 0.40),
  ('7a3056b5-a9a8-41e7-88ff-be1e7b66eab4', 40, 'ai_auto', 0.35),
  ('7a3056b5-a9a8-41e7-88ff-be1e7b66eab4', 388, 'ai_auto', 0.33),
  ('7a3056b5-a9a8-41e7-88ff-be1e7b66eab4', 38, 'ai_auto', 0.30),
  ('7a3056b5-a9a8-41e7-88ff-be1e7b66eab4', 39, 'ai_auto', 0.30),
  ('7a3056b5-a9a8-41e7-88ff-be1e7b66eab4', 41, 'ai_auto', 0.30),
  ('7a3056b5-a9a8-41e7-88ff-be1e7b66eab4', 42, 'ai_auto', 0.30),
  ('7a3056b5-a9a8-41e7-88ff-be1e7b66eab4', 390, 'ai_auto', 0.30),
  ('7a3056b5-a9a8-41e7-88ff-be1e7b66eab4', 391, 'ai_auto', 0.30);

-- Axonics Modulation Technologies (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('5b2b4f58-6ba6-4af3-b8ea-3b57d85a782e', 42, 'ai_auto', 0.70),
  ('5b2b4f58-6ba6-4af3-b8ea-3b57d85a782e', 40, 'ai_auto', 0.35),
  ('5b2b4f58-6ba6-4af3-b8ea-3b57d85a782e', 391, 'ai_auto', 0.35),
  ('5b2b4f58-6ba6-4af3-b8ea-3b57d85a782e', 389, 'ai_auto', 0.30),
  ('5b2b4f58-6ba6-4af3-b8ea-3b57d85a782e', 38, 'ai_auto', 0.30),
  ('5b2b4f58-6ba6-4af3-b8ea-3b57d85a782e', 39, 'ai_auto', 0.30),
  ('5b2b4f58-6ba6-4af3-b8ea-3b57d85a782e', 41, 'ai_auto', 0.30),
  ('5b2b4f58-6ba6-4af3-b8ea-3b57d85a782e', 390, 'ai_auto', 0.30),
  ('5b2b4f58-6ba6-4af3-b8ea-3b57d85a782e', 388, 'ai_auto', 0.30),
  ('5b2b4f58-6ba6-4af3-b8ea-3b57d85a782e', 392, 'ai_auto', 0.30);

-- Cerenovus (J&J subsidiary excluded — using Balt instead) (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('da1aecfc-f2cf-423f-890b-66c01b9cc448', 38, 'ai_auto', 0.70),
  ('da1aecfc-f2cf-423f-890b-66c01b9cc448', 390, 'ai_auto', 0.60),
  ('da1aecfc-f2cf-423f-890b-66c01b9cc448', 13, 'ai_auto', 0.45),
  ('da1aecfc-f2cf-423f-890b-66c01b9cc448', 39, 'ai_auto', 0.40),
  ('da1aecfc-f2cf-423f-890b-66c01b9cc448', 277, 'ai_auto', 0.40),
  ('da1aecfc-f2cf-423f-890b-66c01b9cc448', 40, 'ai_auto', 0.35),
  ('da1aecfc-f2cf-423f-890b-66c01b9cc448', 393, 'ai_auto', 0.35),
  ('da1aecfc-f2cf-423f-890b-66c01b9cc448', 389, 'ai_auto', 0.30),
  ('da1aecfc-f2cf-423f-890b-66c01b9cc448', 41, 'ai_auto', 0.30),
  ('da1aecfc-f2cf-423f-890b-66c01b9cc448', 42, 'ai_auto', 0.30);

-- Nalu Medical (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('645ae0bf-81e1-4882-b5f6-543cc0e19f32', 39, 'ai_auto', 0.35),
  ('645ae0bf-81e1-4882-b5f6-543cc0e19f32', 40, 'ai_auto', 0.35),
  ('645ae0bf-81e1-4882-b5f6-543cc0e19f32', 393, 'ai_auto', 0.35),
  ('645ae0bf-81e1-4882-b5f6-543cc0e19f32', 389, 'ai_auto', 0.33),
  ('645ae0bf-81e1-4882-b5f6-543cc0e19f32', 388, 'ai_auto', 0.33),
  ('645ae0bf-81e1-4882-b5f6-543cc0e19f32', 38, 'ai_auto', 0.30),
  ('645ae0bf-81e1-4882-b5f6-543cc0e19f32', 41, 'ai_auto', 0.30),
  ('645ae0bf-81e1-4882-b5f6-543cc0e19f32', 42, 'ai_auto', 0.30),
  ('645ae0bf-81e1-4882-b5f6-543cc0e19f32', 390, 'ai_auto', 0.30),
  ('645ae0bf-81e1-4882-b5f6-543cc0e19f32', 391, 'ai_auto', 0.30);

-- Alcon (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('c8b0505b-42fe-4c37-99a9-a014034a3005', 43, 'ai_auto', 0.35),
  ('c8b0505b-42fe-4c37-99a9-a014034a3005', 44, 'ai_auto', 0.35),
  ('c8b0505b-42fe-4c37-99a9-a014034a3005', 46, 'ai_auto', 0.35),
  ('c8b0505b-42fe-4c37-99a9-a014034a3005', 394, 'ai_auto', 0.35),
  ('c8b0505b-42fe-4c37-99a9-a014034a3005', 45, 'ai_auto', 0.30),
  ('c8b0505b-42fe-4c37-99a9-a014034a3005', 395, 'ai_auto', 0.30),
  ('c8b0505b-42fe-4c37-99a9-a014034a3005', 396, 'ai_auto', 0.30),
  ('c8b0505b-42fe-4c37-99a9-a014034a3005', 397, 'ai_auto', 0.30),
  ('c8b0505b-42fe-4c37-99a9-a014034a3005', 25, 'ai_auto', 0.15),
  ('c8b0505b-42fe-4c37-99a9-a014034a3005', 47, 'ai_auto', 0.12);

-- Bausch + Lomb (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('c426fe28-9bf6-461c-b8b8-a3e3bf66ae62', 43, 'ai_auto', 0.35),
  ('c426fe28-9bf6-461c-b8b8-a3e3bf66ae62', 44, 'ai_auto', 0.35),
  ('c426fe28-9bf6-461c-b8b8-a3e3bf66ae62', 46, 'ai_auto', 0.35),
  ('c426fe28-9bf6-461c-b8b8-a3e3bf66ae62', 394, 'ai_auto', 0.35),
  ('c426fe28-9bf6-461c-b8b8-a3e3bf66ae62', 45, 'ai_auto', 0.30),
  ('c426fe28-9bf6-461c-b8b8-a3e3bf66ae62', 395, 'ai_auto', 0.30),
  ('c426fe28-9bf6-461c-b8b8-a3e3bf66ae62', 396, 'ai_auto', 0.30),
  ('c426fe28-9bf6-461c-b8b8-a3e3bf66ae62', 397, 'ai_auto', 0.30),
  ('c426fe28-9bf6-461c-b8b8-a3e3bf66ae62', 25, 'ai_auto', 0.15),
  ('c426fe28-9bf6-461c-b8b8-a3e3bf66ae62', 18, 'ai_auto', 0.10);

-- Carl Zeiss Meditec (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('f4693baa-bf3d-4e12-91e6-43d136021f65', 45, 'ai_auto', 0.45),
  ('f4693baa-bf3d-4e12-91e6-43d136021f65', 43, 'ai_auto', 0.35),
  ('f4693baa-bf3d-4e12-91e6-43d136021f65', 394, 'ai_auto', 0.35),
  ('f4693baa-bf3d-4e12-91e6-43d136021f65', 395, 'ai_auto', 0.35),
  ('f4693baa-bf3d-4e12-91e6-43d136021f65', 396, 'ai_auto', 0.35),
  ('f4693baa-bf3d-4e12-91e6-43d136021f65', 44, 'ai_auto', 0.30),
  ('f4693baa-bf3d-4e12-91e6-43d136021f65', 46, 'ai_auto', 0.30),
  ('f4693baa-bf3d-4e12-91e6-43d136021f65', 397, 'ai_auto', 0.30),
  ('f4693baa-bf3d-4e12-91e6-43d136021f65', 47, 'ai_auto', 0.12),
  ('f4693baa-bf3d-4e12-91e6-43d136021f65', 373, 'ai_auto', 0.12);

-- HOYA Surgical Optics (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('beb10b76-35e5-43e2-8697-dfa073f31e3b', 43, 'ai_auto', 0.40),
  ('beb10b76-35e5-43e2-8697-dfa073f31e3b', 394, 'ai_auto', 0.40),
  ('beb10b76-35e5-43e2-8697-dfa073f31e3b', 46, 'ai_auto', 0.35),
  ('beb10b76-35e5-43e2-8697-dfa073f31e3b', 44, 'ai_auto', 0.30),
  ('beb10b76-35e5-43e2-8697-dfa073f31e3b', 45, 'ai_auto', 0.30),
  ('beb10b76-35e5-43e2-8697-dfa073f31e3b', 395, 'ai_auto', 0.30),
  ('beb10b76-35e5-43e2-8697-dfa073f31e3b', 396, 'ai_auto', 0.30),
  ('beb10b76-35e5-43e2-8697-dfa073f31e3b', 397, 'ai_auto', 0.30),
  ('beb10b76-35e5-43e2-8697-dfa073f31e3b', 18, 'ai_auto', 0.15),
  ('beb10b76-35e5-43e2-8697-dfa073f31e3b', 374, 'ai_auto', 0.15);

-- Topcon Healthcare (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('02ddedf2-9d36-419d-9c3b-dff50ba0ec82', 62, 'ai_auto', 0.45),
  ('02ddedf2-9d36-419d-9c3b-dff50ba0ec82', 395, 'ai_auto', 0.40),
  ('02ddedf2-9d36-419d-9c3b-dff50ba0ec82', 394, 'ai_auto', 0.35),
  ('02ddedf2-9d36-419d-9c3b-dff50ba0ec82', 396, 'ai_auto', 0.35),
  ('02ddedf2-9d36-419d-9c3b-dff50ba0ec82', 43, 'ai_auto', 0.30),
  ('02ddedf2-9d36-419d-9c3b-dff50ba0ec82', 44, 'ai_auto', 0.30),
  ('02ddedf2-9d36-419d-9c3b-dff50ba0ec82', 45, 'ai_auto', 0.30),
  ('02ddedf2-9d36-419d-9c3b-dff50ba0ec82', 46, 'ai_auto', 0.30),
  ('02ddedf2-9d36-419d-9c3b-dff50ba0ec82', 397, 'ai_auto', 0.30),
  ('02ddedf2-9d36-419d-9c3b-dff50ba0ec82', 338, 'ai_auto', 0.23);

-- Haag-Streit (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('161de9ff-b9f0-4bfe-b646-eff9ec3172e1', 43, 'ai_auto', 0.35),
  ('161de9ff-b9f0-4bfe-b646-eff9ec3172e1', 44, 'ai_auto', 0.35),
  ('161de9ff-b9f0-4bfe-b646-eff9ec3172e1', 45, 'ai_auto', 0.30),
  ('161de9ff-b9f0-4bfe-b646-eff9ec3172e1', 46, 'ai_auto', 0.30),
  ('161de9ff-b9f0-4bfe-b646-eff9ec3172e1', 394, 'ai_auto', 0.30),
  ('161de9ff-b9f0-4bfe-b646-eff9ec3172e1', 395, 'ai_auto', 0.30),
  ('161de9ff-b9f0-4bfe-b646-eff9ec3172e1', 396, 'ai_auto', 0.30),
  ('161de9ff-b9f0-4bfe-b646-eff9ec3172e1', 397, 'ai_auto', 0.30),
  ('161de9ff-b9f0-4bfe-b646-eff9ec3172e1', 14, 'ai_auto', 0.10),
  ('161de9ff-b9f0-4bfe-b646-eff9ec3172e1', 16, 'ai_auto', 0.10);

-- Glaukos Corporation (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('3b41cf28-4f32-480c-ae3b-487544a7c7e3', 396, 'ai_auto', 0.40),
  ('3b41cf28-4f32-480c-ae3b-487544a7c7e3', 43, 'ai_auto', 0.30),
  ('3b41cf28-4f32-480c-ae3b-487544a7c7e3', 44, 'ai_auto', 0.30),
  ('3b41cf28-4f32-480c-ae3b-487544a7c7e3', 45, 'ai_auto', 0.30),
  ('3b41cf28-4f32-480c-ae3b-487544a7c7e3', 46, 'ai_auto', 0.30),
  ('3b41cf28-4f32-480c-ae3b-487544a7c7e3', 394, 'ai_auto', 0.30),
  ('3b41cf28-4f32-480c-ae3b-487544a7c7e3', 395, 'ai_auto', 0.30),
  ('3b41cf28-4f32-480c-ae3b-487544a7c7e3', 397, 'ai_auto', 0.30),
  ('3b41cf28-4f32-480c-ae3b-487544a7c7e3', 17, 'ai_auto', 0.12),
  ('3b41cf28-4f32-480c-ae3b-487544a7c7e3', 47, 'ai_auto', 0.12);

-- RxSight (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('f947b4b2-4229-4b20-86b0-8323424dc56d', 46, 'ai_auto', 0.35),
  ('f947b4b2-4229-4b20-86b0-8323424dc56d', 394, 'ai_auto', 0.35),
  ('f947b4b2-4229-4b20-86b0-8323424dc56d', 43, 'ai_auto', 0.30),
  ('f947b4b2-4229-4b20-86b0-8323424dc56d', 44, 'ai_auto', 0.30),
  ('f947b4b2-4229-4b20-86b0-8323424dc56d', 45, 'ai_auto', 0.30),
  ('f947b4b2-4229-4b20-86b0-8323424dc56d', 395, 'ai_auto', 0.30),
  ('f947b4b2-4229-4b20-86b0-8323424dc56d', 396, 'ai_auto', 0.30),
  ('f947b4b2-4229-4b20-86b0-8323424dc56d', 397, 'ai_auto', 0.30),
  ('f947b4b2-4229-4b20-86b0-8323424dc56d', 14, 'ai_auto', 0.10),
  ('f947b4b2-4229-4b20-86b0-8323424dc56d', 16, 'ai_auto', 0.10);

-- Stryker ENT (Entellus — now acquired) (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('13a40159-69b0-4d75-b4c1-f4748c8a9be7', 47, 'ai_auto', 0.43),
  ('13a40159-69b0-4d75-b4c1-f4748c8a9be7', 399, 'ai_auto', 0.40),
  ('13a40159-69b0-4d75-b4c1-f4748c8a9be7', 400, 'ai_auto', 0.40),
  ('13a40159-69b0-4d75-b4c1-f4748c8a9be7', 48, 'ai_auto', 0.33),
  ('13a40159-69b0-4d75-b4c1-f4748c8a9be7', 49, 'ai_auto', 0.33),
  ('13a40159-69b0-4d75-b4c1-f4748c8a9be7', 398, 'ai_auto', 0.30),
  ('13a40159-69b0-4d75-b4c1-f4748c8a9be7', 401, 'ai_auto', 0.30),
  ('13a40159-69b0-4d75-b4c1-f4748c8a9be7', 17, 'ai_auto', 0.12),
  ('13a40159-69b0-4d75-b4c1-f4748c8a9be7', 20, 'ai_auto', 0.10),
  ('13a40159-69b0-4d75-b4c1-f4748c8a9be7', 39, 'ai_auto', 0.10);

-- Olympus Medical (ENT) (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('ace8e770-dde6-440c-9265-8159c4c8aaf2', 49, 'ai_auto', 0.47),
  ('ace8e770-dde6-440c-9265-8159c4c8aaf2', 20, 'ai_auto', 0.45),
  ('ace8e770-dde6-440c-9265-8159c4c8aaf2', 47, 'ai_auto', 0.43),
  ('ace8e770-dde6-440c-9265-8159c4c8aaf2', 400, 'ai_auto', 0.43),
  ('ace8e770-dde6-440c-9265-8159c4c8aaf2', 48, 'ai_auto', 0.33),
  ('ace8e770-dde6-440c-9265-8159c4c8aaf2', 399, 'ai_auto', 0.33),
  ('ace8e770-dde6-440c-9265-8159c4c8aaf2', 398, 'ai_auto', 0.30),
  ('ace8e770-dde6-440c-9265-8159c4c8aaf2', 401, 'ai_auto', 0.30),
  ('ace8e770-dde6-440c-9265-8159c4c8aaf2', 373, 'ai_auto', 0.12),
  ('ace8e770-dde6-440c-9265-8159c4c8aaf2', 14, 'ai_auto', 0.10);

-- Cochlear Limited (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('607ada85-f2eb-49b6-9a04-2297c0782d93', 398, 'ai_auto', 0.70),
  ('607ada85-f2eb-49b6-9a04-2297c0782d93', 400, 'ai_auto', 0.37),
  ('607ada85-f2eb-49b6-9a04-2297c0782d93', 401, 'ai_auto', 0.35),
  ('607ada85-f2eb-49b6-9a04-2297c0782d93', 47, 'ai_auto', 0.33),
  ('607ada85-f2eb-49b6-9a04-2297c0782d93', 48, 'ai_auto', 0.33),
  ('607ada85-f2eb-49b6-9a04-2297c0782d93', 49, 'ai_auto', 0.30),
  ('607ada85-f2eb-49b6-9a04-2297c0782d93', 399, 'ai_auto', 0.30),
  ('607ada85-f2eb-49b6-9a04-2297c0782d93', 28, 'ai_auto', 0.10),
  ('607ada85-f2eb-49b6-9a04-2297c0782d93', 80, 'ai_auto', 0.10),
  ('607ada85-f2eb-49b6-9a04-2297c0782d93', 354, 'ai_auto', 0.10);

-- MED-EL (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('45a811bc-3b62-48bb-a1c1-f195722c3a33', 398, 'ai_auto', 0.60),
  ('45a811bc-3b62-48bb-a1c1-f195722c3a33', 48, 'ai_auto', 0.37),
  ('45a811bc-3b62-48bb-a1c1-f195722c3a33', 401, 'ai_auto', 0.35),
  ('45a811bc-3b62-48bb-a1c1-f195722c3a33', 47, 'ai_auto', 0.33),
  ('45a811bc-3b62-48bb-a1c1-f195722c3a33', 49, 'ai_auto', 0.30),
  ('45a811bc-3b62-48bb-a1c1-f195722c3a33', 399, 'ai_auto', 0.30),
  ('45a811bc-3b62-48bb-a1c1-f195722c3a33', 400, 'ai_auto', 0.30),
  ('45a811bc-3b62-48bb-a1c1-f195722c3a33', 218, 'ai_auto', 0.15),
  ('45a811bc-3b62-48bb-a1c1-f195722c3a33', 20, 'ai_auto', 0.10),
  ('45a811bc-3b62-48bb-a1c1-f195722c3a33', 39, 'ai_auto', 0.10);

-- Sonova (Advanced Bionics) (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('a2c49942-8a3b-4aa0-98df-4fe0b2d4130d', 400, 'ai_auto', 0.37),
  ('a2c49942-8a3b-4aa0-98df-4fe0b2d4130d', 398, 'ai_auto', 0.35),
  ('a2c49942-8a3b-4aa0-98df-4fe0b2d4130d', 401, 'ai_auto', 0.35),
  ('a2c49942-8a3b-4aa0-98df-4fe0b2d4130d', 47, 'ai_auto', 0.33),
  ('a2c49942-8a3b-4aa0-98df-4fe0b2d4130d', 48, 'ai_auto', 0.33),
  ('a2c49942-8a3b-4aa0-98df-4fe0b2d4130d', 49, 'ai_auto', 0.30),
  ('a2c49942-8a3b-4aa0-98df-4fe0b2d4130d', 399, 'ai_auto', 0.30),
  ('a2c49942-8a3b-4aa0-98df-4fe0b2d4130d', 64, 'ai_auto', 0.12),
  ('a2c49942-8a3b-4aa0-98df-4fe0b2d4130d', 362, 'ai_auto', 0.10),
  ('a2c49942-8a3b-4aa0-98df-4fe0b2d4130d', 378, 'ai_auto', 0.10);

-- Intersect ENT (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('882414e0-88e3-42ef-97f2-a77b71e6c3ad', 47, 'ai_auto', 0.37),
  ('882414e0-88e3-42ef-97f2-a77b71e6c3ad', 400, 'ai_auto', 0.37),
  ('882414e0-88e3-42ef-97f2-a77b71e6c3ad', 398, 'ai_auto', 0.35),
  ('882414e0-88e3-42ef-97f2-a77b71e6c3ad', 49, 'ai_auto', 0.33),
  ('882414e0-88e3-42ef-97f2-a77b71e6c3ad', 399, 'ai_auto', 0.33),
  ('882414e0-88e3-42ef-97f2-a77b71e6c3ad', 48, 'ai_auto', 0.30),
  ('882414e0-88e3-42ef-97f2-a77b71e6c3ad', 401, 'ai_auto', 0.30),
  ('882414e0-88e3-42ef-97f2-a77b71e6c3ad', 14, 'ai_auto', 0.10),
  ('882414e0-88e3-42ef-97f2-a77b71e6c3ad', 16, 'ai_auto', 0.10),
  ('882414e0-88e3-42ef-97f2-a77b71e6c3ad', 57, 'ai_auto', 0.10);

-- Acclarent (acquired by J&J — using Fiagon instead) (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('237c7a73-28db-416f-a2e5-641852a35ac3', 400, 'ai_auto', 0.47),
  ('237c7a73-28db-416f-a2e5-641852a35ac3', 47, 'ai_auto', 0.40),
  ('237c7a73-28db-416f-a2e5-641852a35ac3', 49, 'ai_auto', 0.33),
  ('237c7a73-28db-416f-a2e5-641852a35ac3', 399, 'ai_auto', 0.33),
  ('237c7a73-28db-416f-a2e5-641852a35ac3', 48, 'ai_auto', 0.30),
  ('237c7a73-28db-416f-a2e5-641852a35ac3', 398, 'ai_auto', 0.30),
  ('237c7a73-28db-416f-a2e5-641852a35ac3', 401, 'ai_auto', 0.30),
  ('237c7a73-28db-416f-a2e5-641852a35ac3', 7, 'ai_auto', 0.20),
  ('237c7a73-28db-416f-a2e5-641852a35ac3', 17, 'ai_auto', 0.12),
  ('237c7a73-28db-416f-a2e5-641852a35ac3', 30, 'ai_auto', 0.10);

-- Straumann Group (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('34cdcb28-7b4f-46ea-aa8b-da4f77c1ee0d', 3, 'ai_auto', 0.75),
  ('34cdcb28-7b4f-46ea-aa8b-da4f77c1ee0d', 60, 'ai_auto', 0.35),
  ('34cdcb28-7b4f-46ea-aa8b-da4f77c1ee0d', 412, 'ai_auto', 0.35),
  ('34cdcb28-7b4f-46ea-aa8b-da4f77c1ee0d', 413, 'ai_auto', 0.35),
  ('34cdcb28-7b4f-46ea-aa8b-da4f77c1ee0d', 415, 'ai_auto', 0.35),
  ('34cdcb28-7b4f-46ea-aa8b-da4f77c1ee0d', 61, 'ai_auto', 0.30),
  ('34cdcb28-7b4f-46ea-aa8b-da4f77c1ee0d', 62, 'ai_auto', 0.30),
  ('34cdcb28-7b4f-46ea-aa8b-da4f77c1ee0d', 63, 'ai_auto', 0.30),
  ('34cdcb28-7b4f-46ea-aa8b-da4f77c1ee0d', 414, 'ai_auto', 0.30),
  ('34cdcb28-7b4f-46ea-aa8b-da4f77c1ee0d', 416, 'ai_auto', 0.30);

-- Dentsply Sirona (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('46fcfcff-3956-4e3e-a4f1-19853fa0fcb6', 61, 'ai_auto', 0.70),
  ('46fcfcff-3956-4e3e-a4f1-19853fa0fcb6', 62, 'ai_auto', 0.70),
  ('46fcfcff-3956-4e3e-a4f1-19853fa0fcb6', 412, 'ai_auto', 0.60),
  ('46fcfcff-3956-4e3e-a4f1-19853fa0fcb6', 413, 'ai_auto', 0.40),
  ('46fcfcff-3956-4e3e-a4f1-19853fa0fcb6', 60, 'ai_auto', 0.35),
  ('46fcfcff-3956-4e3e-a4f1-19853fa0fcb6', 415, 'ai_auto', 0.35),
  ('46fcfcff-3956-4e3e-a4f1-19853fa0fcb6', 63, 'ai_auto', 0.30),
  ('46fcfcff-3956-4e3e-a4f1-19853fa0fcb6', 414, 'ai_auto', 0.30),
  ('46fcfcff-3956-4e3e-a4f1-19853fa0fcb6', 416, 'ai_auto', 0.30),
  ('46fcfcff-3956-4e3e-a4f1-19853fa0fcb6', 400, 'ai_auto', 0.18);

-- Envista Holdings (Nobel Biocare / Ormco) (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('cd9fb4cb-d219-45c7-a0a1-9932c6d90f02', 62, 'ai_auto', 0.70),
  ('cd9fb4cb-d219-45c7-a0a1-9932c6d90f02', 412, 'ai_auto', 0.60),
  ('cd9fb4cb-d219-45c7-a0a1-9932c6d90f02', 63, 'ai_auto', 0.45),
  ('cd9fb4cb-d219-45c7-a0a1-9932c6d90f02', 60, 'ai_auto', 0.35),
  ('cd9fb4cb-d219-45c7-a0a1-9932c6d90f02', 413, 'ai_auto', 0.35),
  ('cd9fb4cb-d219-45c7-a0a1-9932c6d90f02', 415, 'ai_auto', 0.35),
  ('cd9fb4cb-d219-45c7-a0a1-9932c6d90f02', 61, 'ai_auto', 0.30),
  ('cd9fb4cb-d219-45c7-a0a1-9932c6d90f02', 414, 'ai_auto', 0.30),
  ('cd9fb4cb-d219-45c7-a0a1-9932c6d90f02', 416, 'ai_auto', 0.30),
  ('cd9fb4cb-d219-45c7-a0a1-9932c6d90f02', 125, 'ai_auto', 0.20);

-- BioHorizons (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('e373555c-e601-42e5-9298-1d7bdb202be4', 61, 'ai_auto', 0.70),
  ('e373555c-e601-42e5-9298-1d7bdb202be4', 60, 'ai_auto', 0.35),
  ('e373555c-e601-42e5-9298-1d7bdb202be4', 412, 'ai_auto', 0.35),
  ('e373555c-e601-42e5-9298-1d7bdb202be4', 413, 'ai_auto', 0.35),
  ('e373555c-e601-42e5-9298-1d7bdb202be4', 415, 'ai_auto', 0.35),
  ('e373555c-e601-42e5-9298-1d7bdb202be4', 62, 'ai_auto', 0.30),
  ('e373555c-e601-42e5-9298-1d7bdb202be4', 63, 'ai_auto', 0.30),
  ('e373555c-e601-42e5-9298-1d7bdb202be4', 414, 'ai_auto', 0.30),
  ('e373555c-e601-42e5-9298-1d7bdb202be4', 416, 'ai_auto', 0.30),
  ('e373555c-e601-42e5-9298-1d7bdb202be4', 25, 'ai_auto', 0.15);

-- Osstem Implant (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('c86628db-fe37-4a97-b5be-d0c6439eb850', 91, 'ai_auto', 0.40),
  ('c86628db-fe37-4a97-b5be-d0c6439eb850', 60, 'ai_auto', 0.35),
  ('c86628db-fe37-4a97-b5be-d0c6439eb850', 412, 'ai_auto', 0.35),
  ('c86628db-fe37-4a97-b5be-d0c6439eb850', 413, 'ai_auto', 0.35),
  ('c86628db-fe37-4a97-b5be-d0c6439eb850', 415, 'ai_auto', 0.35),
  ('c86628db-fe37-4a97-b5be-d0c6439eb850', 61, 'ai_auto', 0.30),
  ('c86628db-fe37-4a97-b5be-d0c6439eb850', 62, 'ai_auto', 0.30),
  ('c86628db-fe37-4a97-b5be-d0c6439eb850', 63, 'ai_auto', 0.30),
  ('c86628db-fe37-4a97-b5be-d0c6439eb850', 414, 'ai_auto', 0.30),
  ('c86628db-fe37-4a97-b5be-d0c6439eb850', 416, 'ai_auto', 0.30);

-- KLS Martin (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('bd4f2218-756a-4644-b784-b59f3edff9df', 61, 'ai_auto', 0.40),
  ('bd4f2218-756a-4644-b784-b59f3edff9df', 95, 'ai_auto', 0.40),
  ('bd4f2218-756a-4644-b784-b59f3edff9df', 413, 'ai_auto', 0.33),
  ('bd4f2218-756a-4644-b784-b59f3edff9df', 60, 'ai_auto', 0.30),
  ('bd4f2218-756a-4644-b784-b59f3edff9df', 62, 'ai_auto', 0.30),
  ('bd4f2218-756a-4644-b784-b59f3edff9df', 63, 'ai_auto', 0.30),
  ('bd4f2218-756a-4644-b784-b59f3edff9df', 412, 'ai_auto', 0.30),
  ('bd4f2218-756a-4644-b784-b59f3edff9df', 414, 'ai_auto', 0.30),
  ('bd4f2218-756a-4644-b784-b59f3edff9df', 415, 'ai_auto', 0.30),
  ('bd4f2218-756a-4644-b784-b59f3edff9df', 416, 'ai_auto', 0.30);

-- Planmeca (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('bc4dff5c-f3c5-4c0b-a84a-5103913ccaa0', 62, 'ai_auto', 0.70),
  ('bc4dff5c-f3c5-4c0b-a84a-5103913ccaa0', 83, 'ai_auto', 0.40),
  ('bc4dff5c-f3c5-4c0b-a84a-5103913ccaa0', 413, 'ai_auto', 0.40),
  ('bc4dff5c-f3c5-4c0b-a84a-5103913ccaa0', 60, 'ai_auto', 0.35),
  ('bc4dff5c-f3c5-4c0b-a84a-5103913ccaa0', 412, 'ai_auto', 0.35),
  ('bc4dff5c-f3c5-4c0b-a84a-5103913ccaa0', 414, 'ai_auto', 0.35),
  ('bc4dff5c-f3c5-4c0b-a84a-5103913ccaa0', 415, 'ai_auto', 0.35),
  ('bc4dff5c-f3c5-4c0b-a84a-5103913ccaa0', 61, 'ai_auto', 0.30),
  ('bc4dff5c-f3c5-4c0b-a84a-5103913ccaa0', 63, 'ai_auto', 0.30),
  ('bc4dff5c-f3c5-4c0b-a84a-5103913ccaa0', 416, 'ai_auto', 0.30);

-- Geistlich Pharma (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('efc1c3f6-5d67-45e4-ad5b-44ea283ce5d8', 61, 'ai_auto', 0.70),
  ('efc1c3f6-5d67-45e4-ad5b-44ea283ce5d8', 60, 'ai_auto', 0.35),
  ('efc1c3f6-5d67-45e4-ad5b-44ea283ce5d8', 412, 'ai_auto', 0.35),
  ('efc1c3f6-5d67-45e4-ad5b-44ea283ce5d8', 415, 'ai_auto', 0.35),
  ('efc1c3f6-5d67-45e4-ad5b-44ea283ce5d8', 413, 'ai_auto', 0.33),
  ('efc1c3f6-5d67-45e4-ad5b-44ea283ce5d8', 62, 'ai_auto', 0.30),
  ('efc1c3f6-5d67-45e4-ad5b-44ea283ce5d8', 63, 'ai_auto', 0.30),
  ('efc1c3f6-5d67-45e4-ad5b-44ea283ce5d8', 414, 'ai_auto', 0.30),
  ('efc1c3f6-5d67-45e4-ad5b-44ea283ce5d8', 416, 'ai_auto', 0.30),
  ('efc1c3f6-5d67-45e4-ad5b-44ea283ce5d8', 356, 'ai_auto', 0.12);

-- Intuitive Surgical (bariatric application) (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('e9684a5c-ddcc-4bc8-a25d-d21713fbc182', 18, 'ai_auto', 0.45),
  ('e9684a5c-ddcc-4bc8-a25d-d21713fbc182', 374, 'ai_auto', 0.45),
  ('e9684a5c-ddcc-4bc8-a25d-d21713fbc182', 371, 'ai_auto', 0.40),
  ('e9684a5c-ddcc-4bc8-a25d-d21713fbc182', 373, 'ai_auto', 0.40),
  ('e9684a5c-ddcc-4bc8-a25d-d21713fbc182', 17, 'ai_auto', 0.37),
  ('e9684a5c-ddcc-4bc8-a25d-d21713fbc182', 16, 'ai_auto', 0.30),
  ('e9684a5c-ddcc-4bc8-a25d-d21713fbc182', 19, 'ai_auto', 0.30),
  ('e9684a5c-ddcc-4bc8-a25d-d21713fbc182', 20, 'ai_auto', 0.30),
  ('e9684a5c-ddcc-4bc8-a25d-d21713fbc182', 21, 'ai_auto', 0.30),
  ('e9684a5c-ddcc-4bc8-a25d-d21713fbc182', 22, 'ai_auto', 0.30);

-- Ethicon (surgical stapling for bariatric) (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('da2c2f10-a84a-4dad-a6e6-356b8eebb3fc', 19, 'ai_auto', 0.65),
  ('da2c2f10-a84a-4dad-a6e6-356b8eebb3fc', 18, 'ai_auto', 0.45),
  ('da2c2f10-a84a-4dad-a6e6-356b8eebb3fc', 374, 'ai_auto', 0.45),
  ('da2c2f10-a84a-4dad-a6e6-356b8eebb3fc', 373, 'ai_auto', 0.43),
  ('da2c2f10-a84a-4dad-a6e6-356b8eebb3fc', 20, 'ai_auto', 0.40),
  ('da2c2f10-a84a-4dad-a6e6-356b8eebb3fc', 371, 'ai_auto', 0.40),
  ('da2c2f10-a84a-4dad-a6e6-356b8eebb3fc', 370, 'ai_auto', 0.33),
  ('da2c2f10-a84a-4dad-a6e6-356b8eebb3fc', 16, 'ai_auto', 0.30),
  ('da2c2f10-a84a-4dad-a6e6-356b8eebb3fc', 17, 'ai_auto', 0.30),
  ('da2c2f10-a84a-4dad-a6e6-356b8eebb3fc', 21, 'ai_auto', 0.30);

-- Apollo Endosurgery (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('32b017df-9ccb-4612-89a3-ac3ca486eedb', 373, 'ai_auto', 0.43),
  ('32b017df-9ccb-4612-89a3-ac3ca486eedb', 16, 'ai_auto', 0.40),
  ('32b017df-9ccb-4612-89a3-ac3ca486eedb', 17, 'ai_auto', 0.37),
  ('32b017df-9ccb-4612-89a3-ac3ca486eedb', 20, 'ai_auto', 0.35),
  ('32b017df-9ccb-4612-89a3-ac3ca486eedb', 370, 'ai_auto', 0.33),
  ('32b017df-9ccb-4612-89a3-ac3ca486eedb', 18, 'ai_auto', 0.30),
  ('32b017df-9ccb-4612-89a3-ac3ca486eedb', 19, 'ai_auto', 0.30),
  ('32b017df-9ccb-4612-89a3-ac3ca486eedb', 21, 'ai_auto', 0.30),
  ('32b017df-9ccb-4612-89a3-ac3ca486eedb', 22, 'ai_auto', 0.30),
  ('32b017df-9ccb-4612-89a3-ac3ca486eedb', 23, 'ai_auto', 0.30);

-- Reshape Lifesciences (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('663e26df-28ba-4d6c-b3e6-18f6ad4ff242', 16, 'ai_auto', 0.30),
  ('663e26df-28ba-4d6c-b3e6-18f6ad4ff242', 17, 'ai_auto', 0.30),
  ('663e26df-28ba-4d6c-b3e6-18f6ad4ff242', 18, 'ai_auto', 0.30),
  ('663e26df-28ba-4d6c-b3e6-18f6ad4ff242', 19, 'ai_auto', 0.30),
  ('663e26df-28ba-4d6c-b3e6-18f6ad4ff242', 20, 'ai_auto', 0.30),
  ('663e26df-28ba-4d6c-b3e6-18f6ad4ff242', 21, 'ai_auto', 0.30),
  ('663e26df-28ba-4d6c-b3e6-18f6ad4ff242', 22, 'ai_auto', 0.30),
  ('663e26df-28ba-4d6c-b3e6-18f6ad4ff242', 23, 'ai_auto', 0.30),
  ('663e26df-28ba-4d6c-b3e6-18f6ad4ff242', 370, 'ai_auto', 0.30),
  ('663e26df-28ba-4d6c-b3e6-18f6ad4ff242', 371, 'ai_auto', 0.30);

-- Allurion Technologies (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('6d49f744-2a26-4aa7-8835-d52439a85b92', 50, 'ai_auto', 0.45),
  ('6d49f744-2a26-4aa7-8835-d52439a85b92', 16, 'ai_auto', 0.35),
  ('6d49f744-2a26-4aa7-8835-d52439a85b92', 22, 'ai_auto', 0.35),
  ('6d49f744-2a26-4aa7-8835-d52439a85b92', 17, 'ai_auto', 0.33),
  ('6d49f744-2a26-4aa7-8835-d52439a85b92', 373, 'ai_auto', 0.33),
  ('6d49f744-2a26-4aa7-8835-d52439a85b92', 18, 'ai_auto', 0.30),
  ('6d49f744-2a26-4aa7-8835-d52439a85b92', 19, 'ai_auto', 0.30),
  ('6d49f744-2a26-4aa7-8835-d52439a85b92', 20, 'ai_auto', 0.30),
  ('6d49f744-2a26-4aa7-8835-d52439a85b92', 21, 'ai_auto', 0.30),
  ('6d49f744-2a26-4aa7-8835-d52439a85b92', 23, 'ai_auto', 0.30);

-- Spatz Medical (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('00ad784b-4f81-4bf7-9315-93e1095843f6', 16, 'ai_auto', 0.30),
  ('00ad784b-4f81-4bf7-9315-93e1095843f6', 17, 'ai_auto', 0.30),
  ('00ad784b-4f81-4bf7-9315-93e1095843f6', 18, 'ai_auto', 0.30),
  ('00ad784b-4f81-4bf7-9315-93e1095843f6', 19, 'ai_auto', 0.30),
  ('00ad784b-4f81-4bf7-9315-93e1095843f6', 20, 'ai_auto', 0.30),
  ('00ad784b-4f81-4bf7-9315-93e1095843f6', 21, 'ai_auto', 0.30),
  ('00ad784b-4f81-4bf7-9315-93e1095843f6', 22, 'ai_auto', 0.30),
  ('00ad784b-4f81-4bf7-9315-93e1095843f6', 23, 'ai_auto', 0.30),
  ('00ad784b-4f81-4bf7-9315-93e1095843f6', 370, 'ai_auto', 0.30),
  ('00ad784b-4f81-4bf7-9315-93e1095843f6', 371, 'ai_auto', 0.30);

-- Obalon Therapeutics (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('7d5a0607-e2b2-4b25-9f39-f95325090394', 18, 'ai_auto', 0.35),
  ('7d5a0607-e2b2-4b25-9f39-f95325090394', 374, 'ai_auto', 0.35),
  ('7d5a0607-e2b2-4b25-9f39-f95325090394', 371, 'ai_auto', 0.33),
  ('7d5a0607-e2b2-4b25-9f39-f95325090394', 16, 'ai_auto', 0.30),
  ('7d5a0607-e2b2-4b25-9f39-f95325090394', 17, 'ai_auto', 0.30),
  ('7d5a0607-e2b2-4b25-9f39-f95325090394', 19, 'ai_auto', 0.30),
  ('7d5a0607-e2b2-4b25-9f39-f95325090394', 20, 'ai_auto', 0.30),
  ('7d5a0607-e2b2-4b25-9f39-f95325090394', 21, 'ai_auto', 0.30),
  ('7d5a0607-e2b2-4b25-9f39-f95325090394', 22, 'ai_auto', 0.30),
  ('7d5a0607-e2b2-4b25-9f39-f95325090394', 23, 'ai_auto', 0.30);

-- CooperSurgical (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('9b0e3f95-031f-4c77-82fc-fc3f12d82198', 56, 'ai_auto', 0.70),
  ('9b0e3f95-031f-4c77-82fc-fc3f12d82198', 29, 'ai_auto', 0.45),
  ('9b0e3f95-031f-4c77-82fc-fc3f12d82198', 407, 'ai_auto', 0.37),
  ('9b0e3f95-031f-4c77-82fc-fc3f12d82198', 57, 'ai_auto', 0.35),
  ('9b0e3f95-031f-4c77-82fc-fc3f12d82198', 58, 'ai_auto', 0.35),
  ('9b0e3f95-031f-4c77-82fc-fc3f12d82198', 409, 'ai_auto', 0.35),
  ('9b0e3f95-031f-4c77-82fc-fc3f12d82198', 411, 'ai_auto', 0.33),
  ('9b0e3f95-031f-4c77-82fc-fc3f12d82198', 55, 'ai_auto', 0.30),
  ('9b0e3f95-031f-4c77-82fc-fc3f12d82198', 59, 'ai_auto', 0.30),
  ('9b0e3f95-031f-4c77-82fc-fc3f12d82198', 408, 'ai_auto', 0.30);

-- GE HealthCare (Maternal-Infant Care) (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('6f7d0386-7d24-488a-8b70-2b70006eb9cc', 407, 'ai_auto', 0.60),
  ('6f7d0386-7d24-488a-8b70-2b70006eb9cc', 58, 'ai_auto', 0.50),
  ('6f7d0386-7d24-488a-8b70-2b70006eb9cc', 55, 'ai_auto', 0.40),
  ('6f7d0386-7d24-488a-8b70-2b70006eb9cc', 100, 'ai_auto', 0.40),
  ('6f7d0386-7d24-488a-8b70-2b70006eb9cc', 411, 'ai_auto', 0.40),
  ('6f7d0386-7d24-488a-8b70-2b70006eb9cc', 410, 'ai_auto', 0.33),
  ('6f7d0386-7d24-488a-8b70-2b70006eb9cc', 56, 'ai_auto', 0.30),
  ('6f7d0386-7d24-488a-8b70-2b70006eb9cc', 57, 'ai_auto', 0.30),
  ('6f7d0386-7d24-488a-8b70-2b70006eb9cc', 59, 'ai_auto', 0.30),
  ('6f7d0386-7d24-488a-8b70-2b70006eb9cc', 408, 'ai_auto', 0.30);

-- Philips (OB/Fetal Monitoring) (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('b7dffb8f-e786-4842-a95b-a09b5515bfec', 407, 'ai_auto', 0.73),
  ('b7dffb8f-e786-4842-a95b-a09b5515bfec', 58, 'ai_auto', 0.50),
  ('b7dffb8f-e786-4842-a95b-a09b5515bfec', 100, 'ai_auto', 0.50),
  ('b7dffb8f-e786-4842-a95b-a09b5515bfec', 55, 'ai_auto', 0.40),
  ('b7dffb8f-e786-4842-a95b-a09b5515bfec', 84, 'ai_auto', 0.40),
  ('b7dffb8f-e786-4842-a95b-a09b5515bfec', 292, 'ai_auto', 0.40),
  ('b7dffb8f-e786-4842-a95b-a09b5515bfec', 410, 'ai_auto', 0.33),
  ('b7dffb8f-e786-4842-a95b-a09b5515bfec', 56, 'ai_auto', 0.30),
  ('b7dffb8f-e786-4842-a95b-a09b5515bfec', 57, 'ai_auto', 0.30),
  ('b7dffb8f-e786-4842-a95b-a09b5515bfec', 59, 'ai_auto', 0.30);

-- Mammotome (Leica Biosystems) (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('e135d684-87e0-487f-8662-f545b433be16', 410, 'ai_auto', 0.47),
  ('e135d684-87e0-487f-8662-f545b433be16', 407, 'ai_auto', 0.40),
  ('e135d684-87e0-487f-8662-f545b433be16', 411, 'ai_auto', 0.33),
  ('e135d684-87e0-487f-8662-f545b433be16', 55, 'ai_auto', 0.30),
  ('e135d684-87e0-487f-8662-f545b433be16', 56, 'ai_auto', 0.30),
  ('e135d684-87e0-487f-8662-f545b433be16', 57, 'ai_auto', 0.30),
  ('e135d684-87e0-487f-8662-f545b433be16', 58, 'ai_auto', 0.30),
  ('e135d684-87e0-487f-8662-f545b433be16', 59, 'ai_auto', 0.30),
  ('e135d684-87e0-487f-8662-f545b433be16', 408, 'ai_auto', 0.30),
  ('e135d684-87e0-487f-8662-f545b433be16', 409, 'ai_auto', 0.30);

-- Inovus Medical (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('181d97e4-e372-43a6-bd40-aa8f36fcc48f', 17, 'ai_auto', 0.45),
  ('181d97e4-e372-43a6-bd40-aa8f36fcc48f', 57, 'ai_auto', 0.40),
  ('181d97e4-e372-43a6-bd40-aa8f36fcc48f', 203, 'ai_auto', 0.40),
  ('181d97e4-e372-43a6-bd40-aa8f36fcc48f', 312, 'ai_auto', 0.40),
  ('181d97e4-e372-43a6-bd40-aa8f36fcc48f', 411, 'ai_auto', 0.33),
  ('181d97e4-e372-43a6-bd40-aa8f36fcc48f', 55, 'ai_auto', 0.30),
  ('181d97e4-e372-43a6-bd40-aa8f36fcc48f', 56, 'ai_auto', 0.30),
  ('181d97e4-e372-43a6-bd40-aa8f36fcc48f', 58, 'ai_auto', 0.30),
  ('181d97e4-e372-43a6-bd40-aa8f36fcc48f', 59, 'ai_auto', 0.30),
  ('181d97e4-e372-43a6-bd40-aa8f36fcc48f', 407, 'ai_auto', 0.30);

-- MedGyn Products (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('c91b4809-adbf-4e5c-b940-adc9315a5db5', 57, 'ai_auto', 0.35),
  ('c91b4809-adbf-4e5c-b940-adc9315a5db5', 409, 'ai_auto', 0.35),
  ('c91b4809-adbf-4e5c-b940-adc9315a5db5', 411, 'ai_auto', 0.33),
  ('c91b4809-adbf-4e5c-b940-adc9315a5db5', 55, 'ai_auto', 0.30),
  ('c91b4809-adbf-4e5c-b940-adc9315a5db5', 56, 'ai_auto', 0.30),
  ('c91b4809-adbf-4e5c-b940-adc9315a5db5', 58, 'ai_auto', 0.30),
  ('c91b4809-adbf-4e5c-b940-adc9315a5db5', 59, 'ai_auto', 0.30),
  ('c91b4809-adbf-4e5c-b940-adc9315a5db5', 407, 'ai_auto', 0.30),
  ('c91b4809-adbf-4e5c-b940-adc9315a5db5', 408, 'ai_auto', 0.30),
  ('c91b4809-adbf-4e5c-b940-adc9315a5db5', 410, 'ai_auto', 0.30);

-- Monica Healthcare (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('03773c87-231d-4266-b6fe-089a0b965cd2', 58, 'ai_auto', 0.70),
  ('03773c87-231d-4266-b6fe-089a0b965cd2', 11, 'ai_auto', 0.45),
  ('03773c87-231d-4266-b6fe-089a0b965cd2', 100, 'ai_auto', 0.40),
  ('03773c87-231d-4266-b6fe-089a0b965cd2', 407, 'ai_auto', 0.40),
  ('03773c87-231d-4266-b6fe-089a0b965cd2', 411, 'ai_auto', 0.37),
  ('03773c87-231d-4266-b6fe-089a0b965cd2', 55, 'ai_auto', 0.35),
  ('03773c87-231d-4266-b6fe-089a0b965cd2', 410, 'ai_auto', 0.33),
  ('03773c87-231d-4266-b6fe-089a0b965cd2', 56, 'ai_auto', 0.30),
  ('03773c87-231d-4266-b6fe-089a0b965cd2', 57, 'ai_auto', 0.30),
  ('03773c87-231d-4266-b6fe-089a0b965cd2', 59, 'ai_auto', 0.30);

-- Craneware (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('77847467-5c90-433a-83a5-9ed7ad92f8a6', 324, 'ai_auto', 0.30),
  ('77847467-5c90-433a-83a5-9ed7ad92f8a6', 325, 'ai_auto', 0.30),
  ('77847467-5c90-433a-83a5-9ed7ad92f8a6', 326, 'ai_auto', 0.30),
  ('77847467-5c90-433a-83a5-9ed7ad92f8a6', 327, 'ai_auto', 0.30),
  ('77847467-5c90-433a-83a5-9ed7ad92f8a6', 519, 'ai_auto', 0.30),
  ('77847467-5c90-433a-83a5-9ed7ad92f8a6', 675, 'ai_auto', 0.30),
  ('77847467-5c90-433a-83a5-9ed7ad92f8a6', 676, 'ai_auto', 0.30),
  ('77847467-5c90-433a-83a5-9ed7ad92f8a6', 677, 'ai_auto', 0.30),
  ('77847467-5c90-433a-83a5-9ed7ad92f8a6', 678, 'ai_auto', 0.30),
  ('77847467-5c90-433a-83a5-9ed7ad92f8a6', 679, 'ai_auto', 0.30);

-- Buffkin / Baker (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('1da0b37d-5291-4a4e-9382-b8b9b73ae893', 297, 'ai_auto', 0.30),
  ('1da0b37d-5291-4a4e-9382-b8b9b73ae893', 298, 'ai_auto', 0.30),
  ('1da0b37d-5291-4a4e-9382-b8b9b73ae893', 299, 'ai_auto', 0.30),
  ('1da0b37d-5291-4a4e-9382-b8b9b73ae893', 300, 'ai_auto', 0.30),
  ('1da0b37d-5291-4a4e-9382-b8b9b73ae893', 301, 'ai_auto', 0.30),
  ('1da0b37d-5291-4a4e-9382-b8b9b73ae893', 302, 'ai_auto', 0.30),
  ('1da0b37d-5291-4a4e-9382-b8b9b73ae893', 638, 'ai_auto', 0.30),
  ('1da0b37d-5291-4a4e-9382-b8b9b73ae893', 639, 'ai_auto', 0.30),
  ('1da0b37d-5291-4a4e-9382-b8b9b73ae893', 640, 'ai_auto', 0.30),
  ('1da0b37d-5291-4a4e-9382-b8b9b73ae893', 641, 'ai_auto', 0.30);

-- Surgical Affiliates Management Group (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('431f61ef-8210-49d5-9849-226c7ba6f3fe', 246, 'ai_auto', 0.30),
  ('431f61ef-8210-49d5-9849-226c7ba6f3fe', 247, 'ai_auto', 0.30),
  ('431f61ef-8210-49d5-9849-226c7ba6f3fe', 248, 'ai_auto', 0.30),
  ('431f61ef-8210-49d5-9849-226c7ba6f3fe', 249, 'ai_auto', 0.30),
  ('431f61ef-8210-49d5-9849-226c7ba6f3fe', 250, 'ai_auto', 0.30),
  ('431f61ef-8210-49d5-9849-226c7ba6f3fe', 251, 'ai_auto', 0.30),
  ('431f61ef-8210-49d5-9849-226c7ba6f3fe', 586, 'ai_auto', 0.30),
  ('431f61ef-8210-49d5-9849-226c7ba6f3fe', 587, 'ai_auto', 0.30),
  ('431f61ef-8210-49d5-9849-226c7ba6f3fe', 588, 'ai_auto', 0.30),
  ('431f61ef-8210-49d5-9849-226c7ba6f3fe', 589, 'ai_auto', 0.30);

-- Swisslog Healthcare (10 tags)
INSERT INTO company_tags (company_id, taxonomy_id, source_method, confidence_score) VALUES
  ('499eec3f-e950-4b32-a722-67e1e61f2a68', 140, 'ai_auto', 0.37),
  ('499eec3f-e950-4b32-a722-67e1e61f2a68', 142, 'ai_auto', 0.35),
  ('499eec3f-e950-4b32-a722-67e1e61f2a68', 144, 'ai_auto', 0.35),
  ('499eec3f-e950-4b32-a722-67e1e61f2a68', 488, 'ai_auto', 0.33),
  ('499eec3f-e950-4b32-a722-67e1e61f2a68', 139, 'ai_auto', 0.30),
  ('499eec3f-e950-4b32-a722-67e1e61f2a68', 141, 'ai_auto', 0.30),
  ('499eec3f-e950-4b32-a722-67e1e61f2a68', 143, 'ai_auto', 0.30),
  ('499eec3f-e950-4b32-a722-67e1e61f2a68', 483, 'ai_auto', 0.30),
  ('499eec3f-e950-4b32-a722-67e1e61f2a68', 486, 'ai_auto', 0.30),
  ('499eec3f-e950-4b32-a722-67e1e61f2a68', 487, 'ai_auto', 0.30);

COMMIT;

-- Verification queries:
-- SELECT COUNT(DISTINCT company_id) FROM company_tags; -- Expected: ~574
-- SELECT COUNT(*) FROM company_tags; -- Expected: ~5691
-- SELECT c.company_name, COUNT(ct.taxonomy_id) as tag_count FROM companies c JOIN company_tags ct ON c.id = ct.company_id GROUP BY c.company_name ORDER BY tag_count DESC LIMIT 20;

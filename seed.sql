INSERT INTO Publication (publication_id, title, abstract, publication_year, publication_date, digital_object_identifier, venue_name, publication_type, status)
VALUES (1, 'Quantum Data Pipelines', 'A concise study of reproducible data flows.', 2025, '2025-11-15', '10.1000/qdp.2025.001', 'Journal of Data Systems', 'Journal', 'Published');

INSERT INTO Publication (publication_id, title, abstract, publication_year, publication_date, digital_object_identifier, venue_name, publication_type, status)
VALUES (2, 'Edge AI for Health', 'Preliminary findings on edge inference for clinics.', 2026, '2025-11-15', '10.1000/eaih.2026.002', 'ICML Health Workshop', 'Conference', 'Under Review');

INSERT INTO Administrator (administrator_id, name, email_address, system_role, account_status)
VALUES (1, 'Jordan Lee', 'jordan.lee@acr.edu', 'System Admin', 'Active');

INSERT INTO Topic (topic_id, topic_name, topic_description, topic_category)
VALUES (1, 'Data Management', 'Techniques for reliable data handling.', 'Systems');

INSERT INTO Topic (topic_id, topic_name, topic_description, topic_category)
VALUES (2, 'Healthcare AI', 'AI methods applied to clinical settings.', 'AI');

INSERT INTO Researcher (researcher_id, name, email_address, ORCID_identifier, institution, department, academic_title, lab_name)
VALUES (1, 'Avery Chen', 'avery.chen@north.edu', '0000-0002-1234-5678', 'Northeastern University', 'Computer Science', 'Assistant Professor', 'Data Systems Lab');

INSERT INTO Researcher (researcher_id, name, email_address, ORCID_identifier, institution, department, academic_title, lab_name)
VALUES (2, 'Riley Patel', 'riley.patel@north.edu', '0000-0003-9876-5432', 'Northeastern University', 'Bioinformatics', 'Research Scientist', 'Health AI Lab');

INSERT INTO Role (role_id, role_name, role_description, role_category, status)
VALUES (1, 'Lead Author', 'Primary author responsible for manuscript.', 'Authorship', 'Active');

INSERT INTO Role (role_id, role_name, role_description, role_category, status)
VALUES (2, 'Data Curator', 'Manages and validates datasets.', 'Curation', 'Active');

INSERT INTO PublicationTopic (publicationtopic_id, publication_id, topic_id, date_associated)
VALUES (1, 1, 1, '2025-11-15');

INSERT INTO PublicationTopic (publicationtopic_id, publication_id, topic_id, date_associated)
VALUES (2, 2, 2, '2025-11-15');

INSERT INTO Contribution (contribution_id, researcher_id, publication_id, role_id, contribution_notes, date_recorded, verification_status)
VALUES (1, 1, 1, 1, 'Drafted core methodology section.', '2025-11-15', 'Verified');

INSERT INTO Contribution (contribution_id, researcher_id, publication_id, role_id, contribution_notes, date_recorded, verification_status)
VALUES (2, 2, 2, 2, 'Prepared clinical dataset documentation.', '2025-11-15', 'Pending');

INSERT INTO Audit (audit_id, administrator_id, publication_id, audit_timestamp, audit_notes)
VALUES (1, 1, 1, '2026-02-21 12:30:00', 'Initial compliance review completed.');

-- Add one more Role (new role_id)
INSERT INTO Role (role_id, role_name, role_description, role_category, status)
VALUES (3, 'Reviewer', 'Reviews and provides feedback on the manuscript.', 'Review', 'Active');

-- Add one more Researcher (new researcher_id)
INSERT INTO Researcher (researcher_id, name, email_address, ORCID_identifier, institution, department, academic_title, lab_name)
VALUES (3, 'Sam Morgan', 'sam.morgan@north.edu', '0000-0004-2468-1357', 'Northeastern University', 'Computer Science', 'PhD Student', 'Data Systems Lab');

-- Add one more Topic (new topic_id)
INSERT INTO Topic (topic_id, topic_name, topic_description, topic_category)
VALUES (3, 'Edge Computing', 'Computation performed near data sources for low latency.', 'Systems');

-- Add one more Publication to help Query 4 show more rows (new publication_id)
INSERT INTO Publication (publication_id, title, abstract, publication_year, publication_date, digital_object_identifier, venue_name, publication_type, status)
VALUES (3, 'Preprint: Lab Contribution Tracker', 'A draft proposal for structured contribution tracking.', 2025, '2025-12-01', '10.1000/lct.2025.003', 'arXiv', 'Preprint', 'Draft');

-- Add extra PublicationTopic links (avoid duplicate (publication_id, topic_id))
INSERT INTO PublicationTopic (publicationtopic_id, publication_id, topic_id, date_associated)
VALUES (3, 2, 3, '2025-11-20');

INSERT INTO PublicationTopic (publicationtopic_id, publication_id, topic_id, date_associated)
VALUES (4, 3, 1, '2025-12-02');

-- Add more Contributions so Publication 1 has 2+ contributions (for Query 3 HAVING)
-- (researcher_id, publication_id, role_id) must be unique
INSERT INTO Contribution (contribution_id, researcher_id, publication_id, role_id, contribution_notes, date_recorded, verification_status)
VALUES (3, 2, 1, 2, 'Validated dataset and cleaned missing values.', '2025-11-16', 'Verified');

INSERT INTO Contribution (contribution_id, researcher_id, publication_id, role_id, contribution_notes, date_recorded, verification_status)
VALUES (4, 3, 1, 3, 'Reviewed methods section and suggested improvements.', '2025-11-17', 'Pending');

-- Add contributions for Publication 3 as well (optional but helps queries look richer)
INSERT INTO Contribution (contribution_id, researcher_id, publication_id, role_id, contribution_notes, date_recorded, verification_status)
VALUES (5, 1, 3, 1, 'Wrote initial draft and structured contribution model.', '2025-12-02', 'Unverified');

-- Optional: add another Audit record (nice evidence for Audit queries later)
INSERT INTO Audit (audit_id, administrator_id, publication_id, audit_timestamp, audit_notes)
VALUES (2, 1, 2, '2026-02-21 13:15:00', 'Checked metadata completeness and DOI formatting.');
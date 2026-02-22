PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS Contribution;
DROP TABLE IF EXISTS PublicationTopic;
DROP TABLE IF EXISTS Audit;
DROP TABLE IF EXISTS Role;
DROP TABLE IF EXISTS Researcher;
DROP TABLE IF EXISTS Topic;
DROP TABLE IF EXISTS Administrator;
DROP TABLE IF EXISTS Publication;

CREATE TABLE Publication (
	publication_id INTEGER PRIMARY KEY,
	title TEXT NOT NULL,
	abstract TEXT,
	publication_year INTEGER,
	publication_date TEXT,
	digital_object_identifier TEXT UNIQUE,
	venue_name TEXT,
	publication_type TEXT NOT NULL CHECK (publication_type IN ('Journal', 'Conference', 'Preprint')),
	status TEXT NOT NULL CHECK (status IN ('Published', 'Under Review', 'Draft'))
);

CREATE TABLE Administrator (
	administrator_id INTEGER PRIMARY KEY,
	name TEXT NOT NULL,
	email_address TEXT NOT NULL UNIQUE,
	system_role TEXT NOT NULL,
	account_status TEXT NOT NULL
);

CREATE TABLE Audit (
	audit_id INTEGER PRIMARY KEY,
	administrator_id INTEGER NOT NULL,
	publication_id INTEGER NOT NULL,
	audit_timestamp TEXT NOT NULL,
	audit_notes TEXT,
	FOREIGN KEY (administrator_id) REFERENCES Administrator(administrator_id),
	FOREIGN KEY (publication_id) REFERENCES Publication(publication_id)
);

CREATE TABLE Topic (
	topic_id INTEGER PRIMARY KEY,
	topic_name TEXT NOT NULL UNIQUE,
	topic_description TEXT,
	topic_category TEXT
);

CREATE TABLE PublicationTopic (
	publicationtopic_id INTEGER PRIMARY KEY,
	publication_id INTEGER NOT NULL,
	topic_id INTEGER NOT NULL,
	date_associated TEXT,
	UNIQUE (publication_id, topic_id),
	FOREIGN KEY (publication_id) REFERENCES Publication(publication_id),
	FOREIGN KEY (topic_id) REFERENCES Topic(topic_id)
);

CREATE TABLE Researcher (
	researcher_id INTEGER PRIMARY KEY,
	name TEXT NOT NULL,
	email_address TEXT NOT NULL UNIQUE,
	ORCID_identifier TEXT UNIQUE,
	institution TEXT NOT NULL,
	department TEXT,
	academic_title TEXT,
	lab_name TEXT
);

CREATE TABLE Role (
	role_id INTEGER PRIMARY KEY,
	role_name TEXT NOT NULL UNIQUE,
	role_description TEXT,
	role_category TEXT NOT NULL,
	status TEXT NOT NULL CHECK (status IN ('Active', 'Inactive'))
);

CREATE TABLE Contribution (
	contribution_id INTEGER PRIMARY KEY,
	researcher_id INTEGER NOT NULL,
	publication_id INTEGER NOT NULL,
	role_id INTEGER NOT NULL,
	contribution_notes TEXT,
	date_recorded TEXT NOT NULL,
	verification_status TEXT NOT NULL CHECK (verification_status IN ('Unverified', 'Verified', 'Rejected', 'Pending')),
	UNIQUE (researcher_id, publication_id, role_id),
	FOREIGN KEY (researcher_id) REFERENCES Researcher(researcher_id),
	FOREIGN KEY (publication_id) REFERENCES Publication(publication_id),
	FOREIGN KEY (role_id) REFERENCES Role(role_id)
);

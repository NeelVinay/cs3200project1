-- Query for: Which researchers worked on which publications, what role they played, and whether their contribution was verified.

SELECT
    r.name AS researcher_name,              -- Researcher name
    p.title AS publication_title,           -- Publication title
    ro.role_name,                           -- Role played in the contribution
    c.verification_status                   -- Whether contribution was verified
FROM Researcher r
-- Join contributions to match researchers with their contributions
JOIN Contribution c ON r.researcher_id = c.researcher_id
-- Join publications to get publication details
JOIN Publication p ON c.publication_id = p.publication_id
-- Join roles to display the role name
JOIN Role ro ON c.role_id = ro.role_id;


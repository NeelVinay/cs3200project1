-- Query for: Which researchers worked on which publications, what role they played, and whether their contribution was verified.

SELECT
    r.name AS researcher_name,
    p.title AS publication_title,
    ro.role_name,
    c.verification_status
FROM Researcher r
JOIN Contribution c ON r.researcher_id = c.researcher_id
JOIN Publication p ON c.publication_id = p.publication_id
JOIN Role ro ON c.role_id = ro.role_id;


-- Query 4: Show publications that are either published journals OR under-review recent papers.

SELECT 
    publication_id,
    title,
    publication_year,
    publication_type,
    status
FROM Publication
WHERE 
    (publication_type = 'Journal' AND status = 'Published')
    OR
    (status = 'Under Review' AND publication_year >= 2025)
ORDER BY publication_year DESC;

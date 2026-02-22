-- Query 4: Show publications that are either published journals OR under-review recent papers.

SELECT 
    publication_id,
    title,
    publication_year,
    publication_type,
    status
FROM Publication
WHERE 
    -- Condition 1: Published journals
    (publication_type = 'Journal' AND status = 'Published')
    OR
    -- Condition 2: Papers under review from 2025 onwards
    (status = 'Under Review' AND publication_year >= 2025)
-- Sort by year in descending order (newest first)
ORDER BY publication_year DESC;

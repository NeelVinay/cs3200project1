-- Query 3: Which publications have multiple contributions?

SELECT 
    p.title,
    p.publication_year,
    COUNT(c.contribution_id) AS contribution_count
FROM Publication p
JOIN Contribution c ON p.publication_id = c.publication_id
GROUP BY p.publication_id, p.title, p.publication_year
HAVING COUNT(c.contribution_id) >= 2
ORDER BY contribution_count DESC;

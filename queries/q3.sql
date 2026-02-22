-- Query 3: Which publications have multiple contributions?

SELECT 
    p.title,                                              -- Publication title
    p.publication_year,                                  -- Year published
    COUNT(c.contribution_id) AS contribution_count       -- Count of contributors
FROM Publication p
JOIN Contribution c ON p.publication_id = c.publication_id  -- Link publications to contributions
-- Group by publication to count contributions per publication
GROUP BY p.publication_id, p.title, p.publication_year
-- Filter to only show publications with 2 or more contributions
HAVING COUNT(c.contribution_id) >= 2
-- Sort by number of contributions in descending order
ORDER BY contribution_count DESC;

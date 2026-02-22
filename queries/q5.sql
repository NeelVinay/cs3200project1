--Query 5: Label publications based on how many people worked on them.

SELECT 
    p.title,                                              -- Publication title
    COUNT(c.contribution_id) AS contribution_count,       -- Count contributors
    CASE 
        -- If 2 or more contributors, label as high collaboration
        WHEN COUNT(c.contribution_id) >= 2 THEN 'High Collaboration'
        -- Otherwise, label as low collaboration
        ELSE 'Low Collaboration'
    END AS collaboration_label
FROM Publication p
-- LEFT JOIN to include publications with no contributions
LEFT JOIN Contribution c ON p.publication_id = c.publication_id
-- Group by publication to count contributions per publication
GROUP BY p.publication_id, p.title
-- Sort by contribution count in descending order
ORDER BY contribution_count DESC;

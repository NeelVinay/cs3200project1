--Query 5: Label publications based on how many people worked on them.

SELECT 
    p.title,
    COUNT(c.contribution_id) AS contribution_count,
    CASE 
        WHEN COUNT(c.contribution_id) >= 2 THEN 'High Collaboration'
        ELSE 'Low Collaboration'
    END AS collaboration_label
FROM Publication p
LEFT JOIN Contribution c ON p.publication_id = c.publication_id
GROUP BY p.publication_id, p.title
ORDER BY contribution_count DESC;


-- Query for: Find researchers who worked on publications related to a specific topic.

SELECT DISTINCT r.name, r.email_address
FROM Researcher r
JOIN Contribution c ON r.researcher_id = c.researcher_id
WHERE c.publication_id IN (
    SELECT pt.publication_id
    FROM PublicationTopic pt
    JOIN Topic t ON pt.topic_id = t.topic_id
    WHERE t.topic_name = 'Healthcare AI'
);


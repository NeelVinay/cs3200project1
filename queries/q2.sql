-- Query for: Find researchers who worked on publications related to a specific topic.

SELECT DISTINCT r.name, r.email_address  -- Get unique researcher names and emails
FROM Researcher r
JOIN Contribution c ON r.researcher_id = c.researcher_id  -- Link researchers to their contributions
WHERE c.publication_id IN (
    -- Subquery: Find all publications with the specified topic
    SELECT pt.publication_id
    FROM PublicationTopic pt
    -- Join to get the topic name
    JOIN Topic t ON pt.topic_id = t.topic_id
    -- Filter for the desired topic
    WHERE t.topic_name = 'Healthcare AI'
);


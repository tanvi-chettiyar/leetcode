-- Write your PostgreSQL query statement below
WITH boarding AS (
    SELECT
        turn,
        person_name,
        weight,
        SUM(weight) OVER (ORDER BY turn ASC) AS total_weight
    FROM queue
)
SELECT person_name
FROM boarding
WHERE total_weight <= 1000
ORDER BY turn DESC
LIMIT 1;
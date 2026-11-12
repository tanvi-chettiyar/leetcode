-- Write your PostgreSQL query statement below
SELECT
    query_name,
    ROUND(AVG(rating::NUMERIC/position), 2 ) AS quality,
    ROUND((COUNT(*) FILTER (WHERE rating < 3))::NUMERIC / COUNT(rating) * 100, 2) AS poor_query_percentage
FROM queries
GROUP BY query_name
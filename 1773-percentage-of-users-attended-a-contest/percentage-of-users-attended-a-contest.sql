-- Write your PostgreSQL query statement below
SELECT
    t2.contest_id,
    ROUND(COUNT(t2.user_id)::numeric / (SELECT COUNT(*) FROM users) * 100, 2) AS percentage
FROM users t1
LEFT JOIN register t2
ON t1.user_id = t2.user_id
GROUP BY t2.contest_id
HAVING t2.contest_id IS NOT NULL
ORDER BY percentage DESC, t2.contest_id ASC;
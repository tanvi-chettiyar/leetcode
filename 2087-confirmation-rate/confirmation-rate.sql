-- Write your PostgreSQL query statement below
SELECT
    t1.user_id,
    CASE WHEN COUNT(action) > 0 THEN ROUND(COUNT(*) FILTER (WHERE action = 'confirmed')::numeric/COUNT(action), 2)
        ELSE 0
        END AS confirmation_rate
FROM signups t1
LEFT JOIN confirmations t2
ON t1.user_id = t2.user_id
GROUP BY t1.user_id
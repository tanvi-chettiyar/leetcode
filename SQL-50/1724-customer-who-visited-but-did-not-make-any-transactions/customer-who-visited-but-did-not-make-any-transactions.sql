-- Write your PostgreSQL query statement below
SELECT
    t1.customer_id,
    COUNT(t1.visit_id) - COUNT(t2.transaction_id) AS count_no_trans
FROM visits t1
LEFT JOIN transactions t2
ON t1.visit_id = t2.visit_id
GROUP BY t1.customer_id
HAVING COUNT(t1.visit_id) - COUNT(t2.transaction_id) > 0;
-- Write your PostgreSQL query statement below
WITH cat AS (
    SELECT
        'Low Salary' AS category
    UNION
    SELECT
        'Average Salary'
    UNION
    SELECT
        'High Salary'
)
SELECT
    t1.category,
    COUNT(t2.account_id) AS accounts_count
FROM cat t1
LEFT JOIN accounts t2
ON t1.category = 
    (CASE 
        WHEN t2.income < 20000 THEN 'Low Salary'
        WHEN t2.income > 50000 THEN 'High Salary'
        ELSE 'Average Salary'
    END)
GROUP BY t1.category
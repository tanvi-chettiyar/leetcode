-- Write your PostgreSQL query statement below
WITH managers AS (
    SELECT 
        reports_to AS manager_id,
        COUNT(employee_id) AS reports_count,
        ROUND(AVG(age), 0) AS average_age
    FROM employees
    GROUP BY reports_to
)
SELECT
    t2.employee_id,
    t2.name,
    t1.reports_count,
    t1.average_age
FROM managers t1
INNER JOIN employees t2
ON t1.manager_id = t2.employee_id
ORDER BY t2.employee_id;
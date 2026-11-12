-- Write your PostgreSQL query statement below
SELECT
    t1.name,
    t2.bonus
FROM employee t1
LEFT JOIN bonus t2
ON t1.empID = t2.empID
WHERE t2.bonus < 1000 or t2.bonus is NULL;
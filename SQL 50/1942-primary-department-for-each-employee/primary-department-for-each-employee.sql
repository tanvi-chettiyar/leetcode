-- Write your PostgreSQL query statement below
WITH checked_employees AS (
    SELECT 
        employee_id,
        department_id,
        primary_flag,
        COUNT(*) OVER(PARTITION BY employee_id) AS dept_count
    FROM employee
)
SELECT 
    employee_id,
    department_id
FROM checked_employees
WHERE primary_flag = 'Y' 
   OR dept_count = 1;

/* ALTERNATE APPROACH
SELECT 
    employee_id, 
    department_id
FROM employee
WHERE primary_flag = 'Y'
UNION
SELECT 
    employee_id, 
    department_id
FROM employee
WHERE employee_id IN (
    SELECT employee_id
    FROM employee
    GROUP BY employee_id
    HAVING COUNT(department_id) = 1
);
*/
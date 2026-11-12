-- Write your PostgreSQL query statement below
WITH manager AS (
    select
        managerId,
        count(managerId)
    from employee
    group by managerId
    having managerId is not null AND count(managerId) > 4
)
SELECT
    t1.name
FROM employee t1
INNER JOIN manager t2
ON t1.id = t2.managerId
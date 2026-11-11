-- Write your PostgreSQL query statement below
WITH distinct_num AS (
    SELECT 
        num AS dnum,
        COUNT(num) AS numc
    FROM mynumbers
    GROUP BY num
    HAVING COUNT(num) = 1
)
SELECT
    MAX(dnum) AS num
FROM distinct_num
WHERE numc = 1;
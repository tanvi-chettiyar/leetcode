-- Write your PostgreSQL query statement below
WITH distinct_num AS (
    SELECT 
        DISTINCT num AS dnum,
        COUNT(num) AS numc
    FROM mynumbers
    GROUP BY num
)
SELECT
    MAX(dnum) AS num
FROM distinct_num
WHERE numc = 1;
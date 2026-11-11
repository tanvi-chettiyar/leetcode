-- Write your PostgreSQL query statement below
WITH consec AS (
    SELECT
        num,
        CASE
            WHEN num = lead(num, 1) OVER (ORDER BY id) AND num = lead(num, 2) OVER (ORDER BY id)
            THEN 'T'
            ELSE 'F'
        END AS consec_flag
    FROM logs
)
SELECT
    DISTINCT num AS consecutivenums
FROM consec
WHERE consec_flag = 'T';
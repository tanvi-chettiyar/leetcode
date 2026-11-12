-- Write your PostgreSQL query statement below
WITH daily_total AS (
    SELECT
        visited_on,
        SUM(amount) AS amount
    FROM customer
    GROUP BY visited_on
),
moving_avg AS (
    SELECT
        visited_on,
        SUM(amount) OVER (ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS amount,
        ROUND(AVG(amount) OVER (ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW ), 2) AS average_amount,
        ROW_NUMBER() OVER (ORDER BY visited_on) AS day_num
    FROM daily_total
)
SELECT
    visited_on,
    amount,
    average_amount
FROM moving_avg
WHERE day_num > 6
ORDER BY visited_on ASC;
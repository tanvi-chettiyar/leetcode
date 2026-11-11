-- Write your PostgreSQL query statement below
WITH cte AS (
    SELECT
        product_id,
        MIN(year) AS first_sale
    FROM sales
    GROUP BY product_id
)
SELECT 
    t1.product_id,
    t2.first_sale AS first_year,
    t1.quantity,
    t1.price
FROM sales t1
RIGHT JOIN cte t2
ON t1.product_id = t2.product_id
WHERE t1.year = t2.first_sale;
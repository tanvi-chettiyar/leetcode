-- Write your PostgreSQL query statement below
WITH distinct_table AS (
    SELECT DISTINCT ON (customer_id)
        delivery_id,
        customer_id,
        order_date,
        customer_pref_delivery_date,
        CASE
            WHEN order_date = customer_pref_delivery_date THEN 1
            ELSE 0
        END AS order_type
    FROM delivery
    ORDER BY customer_id, order_date ASC
)
SELECT
    ROUND(AVG(order_type) * 100, 2)  AS immediate_percentage
FROM distinct_table
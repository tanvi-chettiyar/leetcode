-- Write your PostgreSQL query statement below
SELECT
    t1.product_id,
    ROUND(COALESCE(SUM(t1.price * t2.units)::numeric / NULLIF(SUM(t2.units), 0), 0), 2) AS average_price
FROM prices t1
LEFT JOIN unitsSold t2
ON t1.product_id = t2.product_id 
    AND t2.purchase_date >= t1.start_date 
    AND t2.purchase_date <= t1.end_date
GROUP BY t1.product_id
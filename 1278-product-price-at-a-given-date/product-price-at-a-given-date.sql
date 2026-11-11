-- Write your PostgreSQL query statement below
WITH ranked_prices AS (
    SELECT 
        product_id,
        new_price,
        ROW_NUMBER() OVER (
            PARTITION BY product_id 
            ORDER BY change_date DESC
        ) AS rn
    FROM products
    WHERE change_date <= '2019-08-16'
)
SELECT 
    t1.product_id,
    COALESCE(t2.new_price, 10) AS price
FROM (SELECT DISTINCT product_id FROM products) t1
LEFT JOIN ranked_prices t2 
    ON t1.product_id = t2.product_id AND t2.rn = 1;

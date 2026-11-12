-- Write your PostgreSQL query statement below
(SELECT
    t2.name AS results
FROM movierating t1
LEFT JOIN users t2
ON t1.user_id = t2.user_id
GROUP BY t2.name
ORDER BY COUNT(*) DESC, t2.name
LIMIT 1
)
UNION ALL
(SELECT
    t2.title AS results
FROM movierating t1
LEFT JOIN movies t2
ON t1.movie_id = t2.movie_id
WHERE t1.created_at BETWEEN '2020-02-01' AND '2020-02-29'
GROUP BY t2.title
ORDER BY AVG(t1.rating) DESC, t2.title
LIMIT 1
);


-- (SELECT
--     t2.name AS results
-- FROM (
--     SELECT
--         user_id,
--         COUNT(rating) AS count_rating
--     FROM movierating
--     GROUP BY user_id
-- ) t1
-- LEFT JOIN users t2
-- ON t1.user_id = t2.user_id
-- ORDER BY t1.count_rating DESC, t2.name
-- LIMIT 1
-- )
-- UNION ALL

-- (SELECT
--     t2.title
-- FROM (
--     SELECT
--         movie_id,
--         AVG(rating) AS average_rating
--     FROM movierating
--     WHERE created_at BETWEEN '2020-02-01' AND '2020-02-29'
--     GROUP BY movie_id
-- ) t1
-- LEFT JOIN movies t2
-- ON t1.movie_id = t2.movie_id
-- ORDER BY t1.average_rating DESC, t2.title
-- LIMIT 1
-- );
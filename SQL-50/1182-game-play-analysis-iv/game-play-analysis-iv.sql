-- Write your PostgreSQL query statement below
WITH next_login AS (
    SELECT
        player_id,
        event_date,
        LEAD(event_date, 1) OVER (PARTITION BY player_id ORDER BY event_date) AS next_event_date,
        MIN(event_date) OVER (PARTITION BY player_id) AS first_login
    FROM activity
)
SELECT 
    round(COUNT(DISTINCT player_id) FILTER 
        (WHERE event_date = first_login AND next_event_date = first_login + 1)
         / COUNT(DISTINCT player_id)::NUMERIC, 2) AS fraction
from next_login;
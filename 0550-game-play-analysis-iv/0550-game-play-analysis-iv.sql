# Write your MySQL query statement below
SELECT ROUND(COUNT(DISTINCT t.player_id)*1.0 /
       (SELECT COUNT(DISTINCT player_id) FROM Activity),2) AS fraction
FROM(
    SELECT player_id,MIN(event_date ) AS first_login
    FROM Activity 
    GROUP BY player_id 
)t
WHERE EXISTS(
    SELECT 1
    FROM Activity a1
    WHERE a1.player_id = t.player_id
    AND a1.event_date = DATE_ADD(t.first_login,INTERVAL 1 DAY)
)
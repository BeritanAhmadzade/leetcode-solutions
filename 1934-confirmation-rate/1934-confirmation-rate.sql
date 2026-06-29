# Write your MySQL query statement below
SELECT t.user_id , ROUND(t.confirmed_requests/t.total_requests,2) AS confirmation_rate
FROM (
        SELECT s.user_id ,SUM(CASE WHEN c.action = "confirmed" THEN 1 ELSE 0 END) AS confirmed_requests , COUNT(*) AS total_requests
        FROM Signups s
        LEFT JOIN Confirmations c
        ON s.user_id = c.user_id
        GROUP BY s.user_id
    )t
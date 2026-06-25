# Write your MySQL query statement below
SELECT t.machine_id , ROUND(AVG(duration),3)  AS processing_time
FROM(
    SELECT a1.machine_id, (a2.timestamp - a1.timestamp) AS duration 
    FROM Activity a1
    JOIN Activity a2
    ON a1.machine_id = a2.machine_id
    AND a1.process_id  = a2.process_id
    WHERE a1.activity_type = 'start' AND a2.activity_type = 'end'
    ) t
GROUP BY t.machine_id

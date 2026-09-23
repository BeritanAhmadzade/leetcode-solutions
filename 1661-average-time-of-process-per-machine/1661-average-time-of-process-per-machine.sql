# Write your MySQL query statement below
SELECT s.machine_id ,ROUND(SUM(e.timestamp  - s.timestamp )/count(s.process_id),3)as processing_time
from (
    SELECT machine_id ,activity_type,timestamp ,process_id 
    from Activity 
    where activity_type = 'start') s
    
JOIN (
    SELECT machine_id  ,activity_type,timestamp ,process_id 
    from Activity 
    where activity_type = 'end')  e

on s.machine_id   = e.machine_id  and s.process_id  = e.process_id 
group by s.machine_id
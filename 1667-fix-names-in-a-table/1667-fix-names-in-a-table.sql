# Write your MySQL query statement below
SELECT user_id, CONCAT(
    UPPER(LEFT(low_name,1)),
    LOWER(SUBSTRING(low_name,2)) 
    ) AS name  
FROM (
    SELECT user_id ,name,LOWER(name) AS low_name
    FROM Users
)t
ORDER BY user_id

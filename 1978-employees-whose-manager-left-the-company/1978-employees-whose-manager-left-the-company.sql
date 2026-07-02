# Write your MySQL query statement below
SELECT e.employee_id
FROM Employees e
LEFT JOIN Employees m
ON e.manager_id  = m.employee_id 
WHERE e.salary < 30000 AND  e.manager_id IS NOT NULL AND NOT EXISTS (
    SELECT *
    FROM Employees m
    WHERE m.employee_id = e.manager_id
 ) 
 ORDER BY e.employee_id
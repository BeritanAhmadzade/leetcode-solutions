# Write your MySQL query statement below
SELECT t.class 
FROM (
    SELECT class , COUNT(student) 
    FROM Courses 
    GROUP BY class
    HAVING  COUNT(student)>=5
)t

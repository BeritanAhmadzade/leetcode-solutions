# Write your MySQL query statement belowwith
with t as (
    SELECT id,
    recordDate,
    temperature,
    LAG(recordDate) OVER (ORDER BY recordDate) AS previous_date,
    LAG(temperature) OVER (ORDER BY recordDate) AS previous_temp
    FROM weather
)
SELECT id
FROM t
WHERE DATEDIFF(recordDate, previous_date)=1 AND
    temperature > previous_temp
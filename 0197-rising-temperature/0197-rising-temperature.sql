# Write your MySQL query statement below
SELECT w1.id
FROM Weather w1
JOIN Weather w2
ON DATEDIFF(w1.recordDate , w2.recordDate ) = 1
WHERE  w1.temperature  > w2.temperature;
-- SELECT id
-- FROM (
--     SELECT id,
--         recordDate,
--         temperature,
--         LAG(temperature) OVER (ORDER BY recordDate) AS prev_temp
--         FROM Weather
--     )t
-- WHERE  temperature >prev_temp
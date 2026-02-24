-- 197. Rising Temperature
-- https://leetcode.com/problems/rising-temperature/description/
-- Difficulty: Easy
-- Date: Feb 23, 2026
-- Time taken: 10 minutes

/*
PROBLEM:
Find the days where the temperature is higher than yesterday

MY APPROACH:
We need to combine the table with itself that way we can compare
both values: today's and yesterday's temperatures, in order to do so
we need to use a SELF JOIN on de DATES and then compare values

KEY LEARNING:
The use of SELF JOIN ON DATES instead od ID'S

-- MY SOLUTION:
SELECT t.id
FROM weather t
JOIN weather y
	ON t.recordDate = y.recordDate + INTERVAL 1 DAY
WHERE t.temperature > y.temperature;

-- RESULT: Accepted
-- Attempts: 2

-- MISTAKES I MADE (if any):
-- I joined it ON the id's instead of dates 
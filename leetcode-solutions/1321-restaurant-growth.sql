-- 1321.- Restaurant Growth
-- https://leetcode.com/problems/restaurant-growth/description/
-- Date: Feb 26, 2026
-- Time taken: 15 minutes

/*
PROBLEM:
Find the average amount of money spent in a week frame.

MY APPROACH:
- Created a CTE grouping by dates
- Subquery using SUM() over with Frames, beetwen and
- Query to filter out


KEY LEARNING:
SUM() + FRAMES + BEETWEN PRECEDING

-- MY SOLUTION:
WITH full_table AS
(SELECT visited_on, SUM(amount) AS daily_sum
FROM customer
GROUP BY visited_on 
ORDER BY visited_on ASC)
SELECT visited_on, amount, round(amount/7,2)  AS average_amount
FROM (
	SELECT *, SUM(daily_sum) OVER (ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS amount,
	count(*) OVER (ORDER BY visited_on) AS day_count
	FROM full_table) t
WHERE day_count >= 7;

-- RESULT: Accepted
-- Attempts: 1

-- MISTAKES I MADE (if any):
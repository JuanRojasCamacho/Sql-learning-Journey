-- 1934.- Confirmation Rate
-- https://leetcode.com/problems/confirmation-rate/description/
-- Date: March 4, 2026
-- Time taken:  10 minutes

/*
PROBLEM:
Find the confirmation rate out of total requests.

MY APPROACH:
- I created a CTE to LEFT JOIN two tables and catch NULL values
- I use the technique od SUM(CASE)/COUNT(colum)

KEY LEARNING:
CTE + SUM(CASE) + COUNT(action)

-- MY SOLUTION:
WITH total AS (SELECT s.user_id AS user_id, c.ACTION AS action
FROM signups s 
LEFT JOIN confirmations c ON c.user_id = s.user_id)
SELECT user_id,
	ROUND(SUM(CASE WHEN ACTION='confirmed' THEN 1 ELSE 0 END)*1.0 / COUNT(action),2)AS confirmation_rate
FROM total
GROUP BY user_id; 


-- RESULT: Accepted
-- Attempts: 1

-- MISTAKES I MADE (if any):
-- I forgot to round it up

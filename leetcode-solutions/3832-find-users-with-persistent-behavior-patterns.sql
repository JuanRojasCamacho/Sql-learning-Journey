-- 3832.- Find users with persistent behavior patterns
-- https://leetcode.com/problems/find-users-with-persistent-behavior-patterns/
-- Date: Mar 17, 2026
-- Time taken: 20 minutes

/*
PROBLEM:
Find users with patterns, based on dates and activity

MY APPROACH:
- CTE to rest date and row number to find consecurive days
- CTE TO  count the consecutive days
- CTE get metrics and filter
- CTE to rank in case of a tie
- Final filter


KEY LEARNING:
- CTE + ROW_NUMBER - DATE + AGG_FUNCT + WINDOW +++++


-- MY SOLUTION:
WITH main AS 
	(SELECT *,
		DATE_SUB(action_date, INTERVAL ROW_NUMBER() OVER (PARTITION BY user_id, action ORDER BY action_date) DAY) AS pattern
	FROM activity),
consecutive AS
	(SELECT *,
		COUNT(*) OVER (PARTITION BY user_id, pattern) AS consecutive_days
	FROM main),
metrics AS 
	(SELECT user_id, MAX(action) AS ACTION,
		COUNT(*) AS streak_length, MIN(action_date) AS start_date,
		MAX(action_date) AS end_date
	FROM consecutive
	WHERE consecutive_days >= 5
	GROUP BY user_id, consecutive_days),
ranking AS
	(SELECT *,
		DENSE_RANK() OVER (PARTITION BY user_id ORDER BY streak_length) AS rnk
	FROM metrics)
SELECT user_id, action, streak_length, start_date, end_date
FROM ranking
WHERE rnk = 1
ORDER BY streak_length DESC, user_id ASC;
    
-- RESULT: Accepted
-- Attempts: 1

-- MISTAKES I MADE (if any):
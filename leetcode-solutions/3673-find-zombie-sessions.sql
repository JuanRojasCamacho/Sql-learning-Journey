-- 3673.- Find Zombie Sessions
-- https://leetcode.com/problems/find-zombie-sessions/description/
-- Date: Mar 10, 2026
-- Time taken: 15 minutes

/*
PROBLEM:
Find what is called a zombie session according to some citeria.

MY APPROACH:
- CTE to find and separate some data
- CTE to find metrics
- Filter


KEY LEARNING:
- CTE + CASE + WINDOW + GROUP BY + AGG FUNCT + DATE MANAGE


-- MY SOLUTION:
WITH main AS 
	(SELECT *,
		CASE WHEN event_type = 'scroll' THEN 1 ELSE 0 END AS scrolls,
		CASE WHEN event_type = 'click' THEN 1 ELSE 0 END AS clicks,
		CASE WHEN event_type = 'purchase' THEN 1 ELSE 0 END AS purchases
	FROM app_events),
metrics AS
	(SELECT 	session_id, user_id,
			TIMESTAMPDIFF(MINUTE, MIN(event_timestamp), MAX(event_timestamp))
			AS session_duration_minutes,
			SUM(scrolls) AS scroll_count,
			SUM(clicks) AS clicks,
			SUM(purchases) AS  purchases
	FROM main
	GROUP BY session_id, user_id)
SELECT session_id, user_id, session_duration_minutes, scroll_count
FROM metrics
WHERE session_duration_minutes >30
	AND scroll_count >= 5
	AND clicks*1.0 / scroll_count < 0.20
	AND purchases = 0
ORDER BY scroll_count DESC, session_id ASC;

-- RESULT: Accepted
-- Attempts: 1

-- MISTAKES I MADE (if any):
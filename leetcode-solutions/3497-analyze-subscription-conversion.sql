-- 3497.- Analyze Subscription Conversion
-- https://leetcode.com/problems/analyze-subscription-conversion/description/
-- Date: Mar 10, 2026
-- Time taken: 15 minutes

/*
PROBLEM:
Find the average usage of a memership of customer who changed from
free trial to paid subscription

MY APPROACH:
- CTE flag changes and separate freetrial and subscription
- Group by and filter


KEY LEARNING:
- CTE + LAG + FLAGS + WINDOW + GROUP


-- MY SOLUTION:
 WITH CONVERSION AS
	(SELECT *,
		CASE
			WHEN activity_type = 'paid' AND 
			LAG(activity_type) OVER (PARTITION BY user_id ORDER BY activity_date) = 'free_trial'
			THEN 1 ELSE 0
		END AS flag,
		CASE WHEN activity_type = 'free_trial' THEN activity_duration  END AS free_duration,
		CASE WHEN activity_type = 'paid' THEN activity_duration END AS paid_duration
	FROM useractivity)
 SELECT user_id, 
        ROUND(AVG(free_duration),2) AS trial_avg_duration,
        ROUND(AVG(paid_duration),2) AS paid_avg_duration
 FROM CONVERSION
 GROUP BY USER_ID
 HAVING SUM(flag) >=1;

-- RESULT: Accepted
-- Attempts: 1

-- MISTAKES I MADE (if any):
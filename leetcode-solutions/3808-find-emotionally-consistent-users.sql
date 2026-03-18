-- 3808.- Find emotionally consistent users
-- https://leetcode.com/problems/find-emotionally-consistent-users/description/
-- Date: Mar 17, 2026
-- Time taken: 15 minutes

/*
PROBLEM:
Find users with consistent emotions

MY APPROACH:
-Create a CTE to count up their reaction
- CTE to get metrics
- Final Filter


KEY LEARNING:
- CTE + DENSE_RANK + GROUP BY(2args)


-- MY SOLUTION:
WITH main AS 
	(SELECT user_id,reaction, COUNT(*) AS cnt 
	FROM reactions
	GROUP BY user_id, reaction),
main_rnk AS 
	(SELECT * , DENSE_RANK() OVER (PARTITION BY user_id ORDER BY cnt DESC) AS rnk,
		SUM(cnt) OVER (PARTITION BY user_id) AS total_reaction
	FROM main
	ORDER BY user_id)
SELECT user_id, reaction AS dominant_reaction,
	ROUND(cnt*1.00/total_reaction, 2) AS reaction_ratio
FROM main_rnk in_rnk
WHERE rnk=1 
	AND cnt*1.00/total_reaction >= 0.6
	AND total_reaction >=5
ORDER BY reaction_ratio DESC, user_id ASC;
    
-- RESULT: Accepted
-- Attempts: 1

-- MISTAKES I MADE (if any):
-- 511.- Game Play Analysis
-- https://leetcode.com/problems/game-play-analysis-i/description/
-- Date: Mar 6, 2026
-- Time taken: 2 minutes

/*
PROBLEM:
Find the earliest logind date for each user


MY APPROACH:
- Use MIN and GROUP BY


KEY LEARNING:
- MIN() + GROUP BY


-- MY SOLUTION:
SELECT player_id, 
	MIN(event_date) AS first_login
FROM activity
GROUP BY player_id;

-- RESULT: Accepted
-- Attempts: 1

-- MISTAKES I MADE (if any):
-- 178.- Rank Scores
-- https://leetcode.com/problems/rank-scores/description/
-- Difficulty: Easy
-- Date: Feb 23, 2026
-- Time taken: 10 minutes

/*
PROBLEM:
Rank a list of values, allowing ties and no skipping ranks.

MY APPROACH:
For this scenario we need to use a DENSE_RANK

KEY LEARNING:
DENSE_RANK

-- MY SOLUTION:
SELECT 
	score,
	DENSE_RANK() OVER (ORDER BY score DESC) AS 'rank'
FROM scores;

-- RESULT: Accepted
-- Attempts: 2

-- MISTAKES I MADE (if any):
I didn't put quotes on AS 'rank'
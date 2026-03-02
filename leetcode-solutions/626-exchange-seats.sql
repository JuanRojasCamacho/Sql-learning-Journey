-- 626.- Exchange Seat
-- https://leetcode.com/problems/exchange-seats/description/
-- Date: March 1, 2026
-- Time taken:  5 minutes

/*
PROBLEM:
Swap even position with odd position except the last one.


MY APPROACH:
- Use case to find the even and odd numbers

KEY LEARNING:
CASE + Subquery + MAX


-- MY SOLUTION:
SELECT
	CASE
		WHEN id%2 = 0 THEN id-1
		WHEN id = (SELECT MAX(id) FROM seat) THEN id 
		ELSE id+1
	END AS id,
	student
FROM seat
ORDER BY id;

-- RESULT: Accepted
-- Attempts: 1

-- MISTAKES I MADE (if any):

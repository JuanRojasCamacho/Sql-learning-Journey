-- 180 Consecutive Numbers
-- https://leetcode.com/problems/consecutive-numbers/description/
-- Date: Feb 23, 2026
-- Time taken: 15 minutes

/*
PROBLEM:
Find the number that appears 2 times consecutively

MY APPROACH:
I used a nested select query that contains a table with
2 LAG window functions the filter the ones that matches
3 og the columns

KEY LEARNING:
NESTED SELECT + LAG + LAG(C,2)

-- MY SOLUTION:
SELECT DISTINCT num AS ConsecutiveNums
FROM (
	SELECT *,
		LAG(num) OVER (ORDER BY id) AS prev,
		LAG(num,2) OVER (ORDER BY id) AS prev2
	FROM logs
	) AS x
WHERE num = prev AND num = prev2;

-- RESULT: Accepted
-- Attempts: 3

-- MISTAKES I MADE (if any):
-- Did't add the second LAG() comparison
-- Forgot to use DISTINCT
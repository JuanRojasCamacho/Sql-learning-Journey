-- 619.- Biggest Single Number
-- https://leetcode.com/problems/biggest-single-number/description/
-- Date: Feb 25, 2026
-- Time taken: 5 minutes

/*
PROBLEM:
Find the biggest single number.

MY APPROACH:
1.- I Counted the times each number is repeated 
2.- Filter using having to get only the ones repeated once
3.- I got the MAX number of them all

KEY LEARNING:
MAX() + COUNT() + GROUP BY +HAVING

-- MY SOLUTION:
SELECT MAX(num) AS num
FROM (
	SELECT num, COUNT(*)
	FROM MyNumbers
	GROUP BY num
	HAVING count(*) = 1) t
;

-- RESULT: Accepted
-- Attempts:1

-- MISTAKES I MADE (if any):

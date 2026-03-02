-- 1667 Fix Names in A Table
-- https://leetcode.com/problems/fix-names-in-a-table/description/
-- Date: March 1, 2026
-- Time taken:  5 minutes

/*
PROBLEM:
Capitalize every name 


MY APPROACH:
- UPPPER (LEFT) to the first letter
- LOWER (SUBSTRING) to the rest of the word
- concatenate both

KEY LEARNING:
LEFT + UPPER + SUBSTR + LOWER + CONCAT


-- MY SOLUTION:
SELECT user_id,
	CONCAT(UPPER(LEFT(name,1)),LOWER(SUBSTR(name,2))) AS name
FROM users
ORDER BY user_id ASC;


-- RESULT: Accepted
-- Attempts: 1

-- MISTAKES I MADE (if any):

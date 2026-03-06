-- 1633 Percentage of Ussers attended a contest
-- https://leetcode.com/problems/percentage-of-users-attended-a-contest/description/
-- Date: March 4, 2026
-- Time taken:  10 minutes

/*
PROBLEM:
Find the percentage of users per contest

MY APPROACH:
- Use COUNT(*) and a subquery to find the total participants

KEY LEARNING:
COUNT(*) + Subquery + 2 ORDERS BY

-- MY SOLUTION:
SELECT 
    contest_id,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Users), 2) AS percentage
FROM Register
GROUP BY contest_id
ORDER by percentage DESC, contest_id ASC;


-- RESULT: Accepted
-- Attempts: 1

-- MISTAKES I MADE (if any):

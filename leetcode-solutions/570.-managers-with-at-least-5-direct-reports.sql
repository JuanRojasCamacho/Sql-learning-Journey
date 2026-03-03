-- 570.- Managers with at least 5 direct reports
-- https://leetcode.com/problems/managers-with-at-least-5-direct-reports/description/
-- Date: March 3, 2026
-- Time taken: 10 minutes

/*
PROBLEM:
Find the managers with at least 5 subordinates


MY APPROACH:
- Self join to find managers
- Count (*) them 
- Filter them using HAVING

KEY LEARNING:
COUNT(*) + HAVING + 2 ARGS ON GROUP BY


-- MY SOLUTION:
SELECT m.name
FROM employee e
JOIN employee m
	ON e.managerid = m.id
GROUP BY m.id, m.name
HAVING COUNT(*) >= 5;

-- RESULT: Accepted
-- Attempts: 2

-- MISTAKES I MADE (if any):
-- I forgot to use 2 arguments on HAVING

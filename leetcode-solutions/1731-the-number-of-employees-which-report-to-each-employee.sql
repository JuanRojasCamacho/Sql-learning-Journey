-- 1731.- The number of employees which report to each employee
-- https://leetcode.com/problems/the-number-of-employees-which-report-to-each-employee/description/
-- Date: March 3, 2026
-- Time taken: 10 minutes

/*
PROBLEM:
Count how many subordinates each manager has, 
as well as their average age


MY APPROACH:
- Self join to find managers
- Count (*) them 
- Find the average age

KEY LEARNING:
COUN(*) + AVG() + 2 ARGS ON GROUP BY


-- MY SOLUTION:
SELECT m.employee_id, m.name,
	COUNT(*) AS reports_count, ROUND(AVG(e.age)) AS average_age
FROM employees e
JOIN employees m
	ON e.reports_to = m.employee_id
GROUP BY m.employee_id, m.name
ORDER BY employee_id ASC;

-- RESULT: Accepted
-- Attempts: 2

-- MISTAKES I MADE (if any):
-- I forgot to ORDER BY id

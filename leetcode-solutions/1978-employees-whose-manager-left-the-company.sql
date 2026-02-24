-- 1978. Employees Whose Manager Left the Company
-- https://leetcode.com/problems/employees-whose-manager-left-the-company/description/
-- Difficulty: Easy
-- Date: Feb 23, 2026
-- Time taken: 15 minutes

/*
PROBLEM:
Find the employees whose manage left and had a salary less than 30k

MY APPROACH:
I used conditions using NULL and NOT NULL,

KEY LEARNING:
NOT NULL + NULL

-- MY SOLUTION:
SELECT e.employee_id
FROM employees e
LEFT JOIN employees m
	ON e.manager_id = m.employee_id
WHERE e.manager_id IS NOT NULL
	AND m.employee_id IS NULL 
	AND e.salary < 30000
ORDER BY e.employee_id;

-- RESULT: Accepted
-- Attempts: 3

-- MISTAKES I MADE (if any):
-- Forgot to strictly use less than <
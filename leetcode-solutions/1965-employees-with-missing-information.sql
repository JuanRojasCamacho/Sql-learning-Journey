-- 1965. Employees With Missing Information
-- https://leetcode.com/problems/employees-with-missing-information/description/
-- Date: Mar 8, 2026
-- Time taken: 10 minutes

/*
PROBLEM:
Find id of employees with either name or salaries missing


MY APPROACH:
Create a left join to fins employes with name missing
Create a left join to find employees with salaries mising
Union them

KEY LEARNING:
- LEFT JOIN + UNION + LEFT JOIN


-- MY SOLUTION:
SELECT e.employee_id
FROM Employees e
LEFT JOIN Salaries s
ON e.employee_id = s.employee_id
WHERE s.employee_id IS NULL

UNION

SELECT s.employee_id
FROM Salaries s
LEFT JOIN Employees e
ON s.employee_id = e.employee_id
WHERE e.employee_id IS NULL

ORDER BY employee_id;

-- RESULT: Accepted
-- Attempts: 1

-- MISTAKES I MADE (if any):
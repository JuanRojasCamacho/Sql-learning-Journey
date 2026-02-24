-- 185.- Department Top Three Salaries
-- https://leetcode.com/problems/department-top-three-salaries/description/
-- Date: Feb 23, 2026
-- Time taken: 15 minutes

/*
PROBLEM:
Find the 3 highest salaries per department

MY APPROACH:
1.- I created a CTE to keep all the data in one temporal table
2.- in the CTE y ranked them using DENSE_RANK()
2.- Filter through the 2 top ranks.

KEY LEARNING:
CTE + DENSE_RANK() + FILTER

-- MY SOLUTION:
WITH full_table AS 
	(SELECT employee.name AS Employee,
		department.name AS Department,
		salary,
		DENSE_RANK() OVER (PARTITION BY department.name ORDER BY salary DESC) AS rnk
	FROM employee 
	JOIN department
		ON employee.departmentId = department.id)
SELECT employee, department, salary
FROM full_table
WHERE rnk <= 3
;

-- RESULT: Accepted
-- Attempts: 1

-- MISTAKES I MADE (if any):

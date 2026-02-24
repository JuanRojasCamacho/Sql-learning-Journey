-- 184.- Department Highest Salary
-- https://leetcode.com/problems/department-highest-salary/description/
-- Difficulty: Medium
-- Date: Feb 23, 2026
-- Time taken: 15 minutes

/*
PROBLEM:
Find the higghest salarys per department.

MY APPROACH:
I made a window function using DENSE_RANK with a partition
to rank the salaries per department, the I made a subquery
to limit the just show the highest paid.

KEY LEARNING:
DENSE_RANK + PARTITION + SUBQUERY

-- MY SOLUTION:
SELECT Department, Employee, Salary
FROM(
	SELECT 
		department.name AS Department,
		employee.name AS Employee,
		employee.salary AS Salary,
		DENSE_RANK() OVER (PARTITION BY department.name ORDER BY salary DESC) AS rnk
	FROM employee
	JOIN department
		ON employee.departmentId = department.id
	) as X
WHERE rnk=1;

-- RESULT: Accepted
-- Attempts: 3

-- MISTAKES I MADE (if any):
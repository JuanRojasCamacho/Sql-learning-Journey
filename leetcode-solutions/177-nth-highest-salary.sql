-- 180 Consecutive Numbers
-- https://leetcode.com/problems/nth-highest-salary/description/
-- Date: Feb 23, 2026
-- Time taken: 15 minutes

/*
PROBLEM:
Find the nth highest salary

MY APPROACH:
I used a nested query so that way we can have NULL returns,
I used a DENSE_RANK to rank the salaries and the compare them to N.

KEY LEARNING:
NESTED SELECT + DENSE_RANK + FUCTION

-- MY SOLUTION:
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      # Write your MySQL query statement below.
    SELECT DISTINCT salary
    FROM (
        SELECT *,
            DENSE_RANK() OVER (ORDER BY salary DESC) AS rnk
        FROM employee
        ) AS X
    WHERE rnk = N
  );
END

-- RESULT: Accepted
-- Attempts: 3

-- MISTAKES I MADE (if any):
-- Did't add DISTINCT to show just one value
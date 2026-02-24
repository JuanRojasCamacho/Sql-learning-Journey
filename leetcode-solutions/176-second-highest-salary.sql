-- 182.- Second Highest Salary
-- https://leetcode.com/problems/second-highest-salary/description/
-- Difficulty: Easy
-- Date: Feb 23, 2026
-- Time taken: 10 minutes

/*
PROBLEM:
Find the second highest salary in a list, in case this list
has only one value return a NULL.

MY APPROACH:
To find the second highest I used ORDER BY AND DESC,
if the valueas are repeated i used DISTINCT and to return
NULL if just 1 value y use a nested SELECT QUERY.

KEY LEARNING:
NESTED SELECT + DISTINC

-- MY SOLUTION:
SELECT(
    SELECT DISTINCT salary 
    FROM employee
    ORDER BY salary DESC
    LIMIT 1 OFFSET 1
) AS SecondHighestSalary;

-- RESULT: Accepted
-- Attempts: 2

-- MISTAKES I MADE (if any):
I didn't use a nested SELECT QUEY.
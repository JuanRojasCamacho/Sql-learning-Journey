-- 181. Employees Earning More Than Their Managers
-- https://leetcode.com/problems/employees-earning-more-than-their-managers/
-- Difficulty: Easy
-- Date: Feb 21, 2026
-- Time taken: 20 minutes

/*
PROBLEM:
Find employees who earn more than their managers.
Both employee and manager are in the same Employee table.

MY APPROACH:
The main problem was to connect both persons that are within the same table
after a few tries I ended up using a SELF-JOIN, which I was
aware it existed so far.

KEY LEARNING:
SELF-JOIN allows you to compare values that are within the same table,
you need to create "copies" using aliases "e,m"

-- MY SOLUTION:
# Write your MySQL query statement below
SELECT e.name AS Employee
FROM Employee e
JOIN Employee m
    ON e.managerId = m.ID
WHERE e.salary > m.salary;

-- EXAMPLE:
-- SELECT e.name AS Employee
-- FROM Employee e
-- JOIN Employee m ON e.managerId = m.id
-- WHERE e.salary > m.salary;

-- RESULT: ✅ Accepted
-- Attempts: 3

-- MISTAKES I MADE (if any):
I tried without the aliases
I forgot to rename de result as Employee

-- TIME/SPACE COMPLEXITY:
-- Time: O(n²) - nested loop join
-- Space: O(1) - no extra structures
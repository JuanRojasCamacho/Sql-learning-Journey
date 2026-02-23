-- 577. Employee Bonus
-- Difficulty: Easy
-- Date: Feb 22, 2026
-- Time taken: 5 minutes

/*
PROBLEM:
Find the employees with a bonus less than 1k or nothing

MY APPROACH:
I used a LEFT JOIN to include the NULL values of employees
with no bonus, and use an OR condition to check for 
less than 1k bonuses

KEY LEARNING:
LEFT JOIN + OR

-- MY SOLUTION:
# Write your MySQL query statement below
select name, bonus
from employee
left join bonus
	on employee.empid = bonus.empid
where bonus < 1000 or
bonus is NULL;

-- RESULT: Accepted
-- Attempts: 2

-- MISTAKES I MADE (if any):
I forgot to put the = sign
-- 595. Big Countries
-- https://leetcode.com/problems/big-countries/description/
-- Difficulty: Easy
-- Date: Feb 22, 2026
-- Time taken: 5 minutes

/*
PROBLEM:
Find the classes countries that are big based on pouplation and area

MY APPROACH:
This one is easy, I just needed to use a "OR" to compare
either one or the other value

KEY LEARNING:
The use of OR with WHERE clauses

-- MY SOLUTION:
SELECT name, population, area
FROM world
where area >= 3000000 or 
population >= 25000000;

-- RESULT: Accepted
-- Attempts: 1

-- MISTAKES I MADE (if any):
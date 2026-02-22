-- 175. Combine Two Tables
-- https://leetcode.com/problems/combine-two-tables/
-- Difficulty: Easy
-- Date: Feb 26, 2026
-- Time taken: 5 minutes

/*
PROBLEM:
Report firstName, lastName, city, state for each person.
If no address exists, show NULL for city/state.

MY APPROACH:
I needed to use a LEFT JOIN instead of an INNER JOIN,
this because the NULLS needed to be seen.

KEY LEARNING:
Use LEFT JOIN when NULLS need to be shown.

-- MY SOLUTION:
# Write your MySQL query statement below
SELECT firstName, lastName, city, state
FROM Person
LEFT JOIN Address
    ON Person.personId = Address.personId;

-- RESULT: ✅ Accepted on first try
-- Time Complexity: O(n + m)
-- Space Complexity: O(1)
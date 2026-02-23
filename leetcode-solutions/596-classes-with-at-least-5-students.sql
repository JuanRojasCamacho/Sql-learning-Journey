-- 596. Classes With at Least 5 Students
-- https://leetcode.com/problems/classes-with-at-least-5-students/description/
-- Difficulty: Easy
-- Date: Feb 22, 2026
-- Time taken: 10 minutes

/*
PROBLEM:
Find the classes with at least 5 students

MY APPROACH:
We need to group by class and then filter using Having

KEY LEARNING:
Having filters out after the group by
in this case using where does not work

-- MY SOLUTION:
# Write your MySQL query statement below
SELECT class
FROM courses
group by class
having COUNT(class) >= 5;

-- RESULT: Accepted
-- Attempts: 3

-- MISTAKES I MADE (if any):
I forgot to put the = sign
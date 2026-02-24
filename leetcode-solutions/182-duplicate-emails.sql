-- 182.- Duplicate Emails
-- https://leetcode.com/problems/duplicate-emails/description/
-- Difficulty: Easy
-- Date: Feb 23, 2026
-- Time taken: 5 minutes

/*
PROBLEM:
Find the repeated emails.

MY APPROACH:
Because the goal is to find the emails that are repeated more
than once the easiest way is to GROUP BY email, then,
count them and filter the ones that are bigger than 1.

KEY LEARNING:
The use of GROUP BY and COUNT

-- MY SOLUTION:
SELECT email
FROM person
GROUP BY email
HAVING COUNT(*) > 1;

-- RESULT: Accepted
-- Attempts: 1

-- MISTAKES I MADE (if any):
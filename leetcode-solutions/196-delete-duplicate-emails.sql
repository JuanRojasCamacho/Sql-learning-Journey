-- 196.- Delete duplicate emails
-- https://leetcode.com/problems/delete-duplicate-emails/description/
-- Date: Mar 18, 2026
-- Time taken: 5 minutes

/*
PROBLEM:
Delete duplicate emails keeping the first one orderes by id

MY APPROACH:
- CTE ranked duplicates
- DELETE with filters


KEY LEARNING:
- CTE + DELETE


-- MY SOLUTION:
WITH ranked AS
(SELECT *,
DENSE_RANK() OVER (PARTITION BY email ORDER BY id) AS rnk
FROM person)
DELETE FROM person
WHERE id IN (SELECT id FROM ranked WHERE rnk>1);
    
-- RESULT: Accepted
-- Attempts: 1

-- MISTAKES I MADE (if any):
-- 1527.- Patients with a condition
-- https://leetcode.com/problems/patients-with-a-condition/description/
-- Date: March 1, 2026
-- Time taken:  5 minutes

/*
PROBLEM:
Look for words that starts with "DIAB1"


MY APPROACH:
- Use 2 conditions to assure the word starts with "DIAB1"

KEY LEARNING:
LIKE + OR


-- MY SOLUTION:
SELECT *
FROM patients
WHERE conditions LIKE 'DIAB1%' or  conditions LIKE'% DIAB1%';


-- RESULT: Accepted
-- Attempts: 1

-- MISTAKES I MADE (if any):

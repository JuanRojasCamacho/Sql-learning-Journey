-- 1517. Find Users With Valid E-Mails
-- https://leetcode.com/problems/find-users-with-valid-e-mails/description/?source=submission-noac
-- Date: Mar 17, 2026
-- Time taken: 5 minutes

/*
PROBLEM:
Find the mail that meet certain criteria

MY APPROACH:
-Create a REGEX_LIKE that works for it 


KEY LEARNING:
- REGEX


-- MY SOLUTION:
SELECT *
FROM users
WHERE REGEXP_LIKE(mail, '^[a-zA-Z][a-zA-Z0-9._-]*@leetcode\\.com$', 'c');
    
-- RESULT: Accepted
-- Attempts: 1

-- MISTAKES I MADE (if any):
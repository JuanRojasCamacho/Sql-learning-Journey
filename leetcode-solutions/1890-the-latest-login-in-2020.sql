-- 1890.- The lastest login in 2020
-- https://leetcode.com/problems/the-latest-login-in-2020/description/
-- Date: March 5, 2026
-- Time taken:  5 minutes

/*
PROBLEM:
Find the lastest login of each user dutin 2020.

MY APPROACH:
- Use MAX and filter

KEY LEARNING:
Careful when delimitating TIMESTAMPS

-- MY SOLUTION:
SELECT user_id, MAX(time_stamp) AS last_stamp
FROM logins
WHERE time_stamp >= '2020-01-01'
  AND time_stamp < '2021-01-01'
GROUP BY user_id;

-- RESULT: Accepted
-- Attempts: 1

-- MISTAKES I MADE (if any):
-- Didn't consider between as inclusive with timestamps
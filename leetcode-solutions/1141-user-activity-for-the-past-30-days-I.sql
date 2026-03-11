-- 1141.- User Activity for the past 30 days
-- https://leetcode.com/problems/user-activity-for-the-past-30-days-i/description/
-- Date: MAR 11, 2026
-- Time taken: 5 minutes

/*
PROBLEM:
show the number of active users per day on a interval o time


MY APPROACH:
Use s group by and a WHERE to filter dates.


KEY LEARNING:
-- GROUP BY + INTERVAL

-- MY SOLUTION:
SELECT activity_date AS DAY, COUNT(DISTINCT user_id) AS active_users
FROM activity
WHERE activity_date > DATE_SUB('2019-07-27', INTERVAL 30 DAY) AND activity_date <='2019-07-27' 
GROUP BY activity_date;


-- RESULT: Accepted
-- Attempts: 1

-- MISTAKES I MADE (if any):
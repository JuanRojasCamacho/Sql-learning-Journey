-- 602.- Friend Request II - Who Has the Most Friends
-- https://leetcode.com/problems/friend-requests-ii-who-has-the-most-friends/description/
-- Date: Feb 26, 2026
-- Time taken: 15 minutes

/*
PROBLEM:
Find the person who has the most friends from a 
request - accept table

MY APPROACH:
- Use UNION ALL to show the frecuency of a person
- Count up the times each person is shown
- Find the person who has the most friends

KEY LEARNING:
UNION ALL - COUNT(*) - SUBQUERY + MAX()


-- MY SOLUTION:
WITH user_id AS
(SELECT requester_id AS person_id FROM RequestAccepted
UNION ALL
SELECT accepter_id FROM RequestAccepted),
friend_user AS
(SELECT person_id, COUNT(*) AS friends
FROM user_id
GROUP BY person_id)
SELECT person_id AS id, friends AS num
FROM friend_user 
WHERE friends =  (SELECT MAX(friends) FROM friend_user);

-- RESULT: Accepted
-- Attempts: 1

-- MISTAKES I MADE (if any):

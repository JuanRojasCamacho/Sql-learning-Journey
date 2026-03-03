-- 262.- Trips and Users
-- https://leetcode.com/problems/trips-and-users/description/
-- Date: March 3, 2026
-- Time taken: 30 minutes

/*
PROBLEM:
We need to fins the cancelation ratio per day for trips which
neither user or driver are banned.


MY APPROACH:
VERSION: 1
- On this version i created a CTE with subqueries to find the full_table
then i created two more cte's to find the total trips per day 
and then the cancelled trips per dar, finally y made the math

VERSION 2:
After a research I realized we can do more than one aggregate function
per GROUP, this way I thighten up my code.

KEY LEARNING:
2 AGG FUNCTIONS IN ONE GROUP + MATH BETWEENT THEM + SUM(CASE) + COUNT(*)


-- MY SOLUTION:
SOLUTION 1:
WITH full_table AS
(SELECT status, request_at,
	(SELECT banned FROM users WHERE trips.client_id = users.users_id) AS Client_Banned,
	(SELECT banned FROM users WHERE trips.driver_id = users.users_id) AS Driver_Banned
FROM Trips
WHERE request_at >= '2013-10-01' AND request_at <= '2013-10-03'),
total_day AS(
	SELECT request_at, COUNT(*) AS total_per_day
	FROM full_table
	WHERE client_banned = 'No' AND Driver_banned = 'No'
	GROUP BY request_at),
cancelled_day AS(
	SELECT request_at, COUNT(*) AS cancelled_per_day
	FROM full_table
	WHERE status LIKE '%cancelled%' AND client_banned = 'No' AND Driver_banned = 'No'
	GROUP BY request_at)
SELECT total_day.request_at AS Day,
	COALESCE(ROUND(cancelled_per_day * 1.00 / total_per_day,2),0) AS 'Cancellation Rate'
FROM total_day
LEFT JOIN cancelled_day
	ON total_day.request_at = cancelled_day.request_at;



SOLUTION 2:
SELECT trips.request_at AS Day,
	ROUND(SUM(CASE WHEN trips.status LIKE 'cancelled%' THEN 1 ELSE 0 END)*1.0 / COUNT(*),2) AS "Cancelatio Rate"
FROM trips
JOIN users c ON trips.client_id = c.users_id
JOIN users d ON trips.driver_id = d.users_id
WHERE request_at BETWEEN '2013-10-01' AND '2013-10-03'
	AND c.banned = 'No' AND d.banned = 'No'
GROUP BY trips.request_at;

-- RESULT: Accepted
-- Attempts: 1

-- MISTAKES I MADE (if any):
-- 

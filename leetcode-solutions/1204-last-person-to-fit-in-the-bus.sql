-- 1204.- Las person to fit in the bus
-- https://leetcode.com/problems/last-person-to-fit-in-the-bus/description/
-- Date: Feb 25, 2026
-- Time taken: 10 minutes

/*
PROBLEM:
Find the name of the last person who fits in a bus with a weight limit.

MY APPROACH:
1.- I made a select statement usind SUM() OVER
2.- I use max to the las statements to find the last turn
3.- Connected the last turn to find the name

KEY LEARNING:
SUBQUERIES + SUM() OVER

-- MY SOLUTION:
SELECT person_name
FROM queue
WHERE turn = (
	SELECT MAX(turn)
	FROM (
		SELECT *,	
			SUM(weight) OVER (ORDER BY turn) AS kilos
		FROM queue) t
	WHERE kilos <= 1000);

-- RESULT: Accepted
-- Attempts: 1

-- MISTAKES I MADE (if any):
-- Forgot to use <= and not just <

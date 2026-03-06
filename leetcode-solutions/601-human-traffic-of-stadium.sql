-- 601.- Human Traffic of stadium
-- https://leetcode.com/problems/human-traffic-of-stadium/description/
-- Date: March 4, 2026
-- Time taken:  15 minutes

/*
PROBLEM:
Find blocks of consecutive id's where more than 100 people visited a stadium

MY APPROACH:
- First query using id - ROW_NUMBER to find consecurive blocks
- Second query using COUNT OVER to count how many consecutive days are per block
- Last query to filter blocks with more than 3 consecutive days

KEY LEARNING:
ID - ROW_NUMBER + COUNT OVER + GAP&ISLANDS FORMAT

-- MY SOLUTION:
SELECT id, visit_date,people
FROM 
	(SELECT *, COUNT(*) OVER (PARTITION BY consecutive) AS consecutive_count
	FROM (
		SELECT *,
			id - ROW_NUMBER() OVER (ORDER BY id) AS consecutive
		FROM stadium
		WHERE people >= 100)t)t2
WHERE consecutive_count >=3
ORDER BY id ASC;

-- RESULT: Accepted
-- Attempts: 1

-- MISTAKES I MADE (if any):

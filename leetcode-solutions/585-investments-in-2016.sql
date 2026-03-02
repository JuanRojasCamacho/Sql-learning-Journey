-- 585.-Investments in 2016
-- https://leetcode.com/problems/investments-in-2016/description/
-- Date: Feb 26, 2026
-- Time taken: 15 minutes

/*
PROBLEM:
Find the total investments that follow 2 conditions


MY APPROACH:
- CTE with Window Function to find the same investments in 2015
- CTE with window Function to find different locations
- Join them


KEY LEARNING:
- 2 CTE + WINDOW FUNCTION + JOIN

-- MY SOLUTION:
WITH same_tiv AS( 
SELECT pid, tiv_2016
FROM (
	SELECT  *, COUNT(*) OVER (PARTITION BY tiv_2015) AS count 
	FROM insurance)t
WHERE count >= 2),
diff_loc AS(
SELECT pid, tiv_2016
FROM (
	SELECT *, COUNT(*) OVER (PARTITION BY lat,lon) AS diff_count
	FROM insurance)t
WHERE diff_count = 1)
SELECT ROUND(SUM(diff_loc.tiv_2016),2) AS tiv_2016 
FROM diff_loc
JOIN same_tiv 
	ON diff_loc.pid = same_tiv.pid;

-- RESULT: Accepted
-- Attempts: 1

-- MISTAKES I MADE (if any):
- Forgot to round up the result

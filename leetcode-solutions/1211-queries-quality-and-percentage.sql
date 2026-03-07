-- 1211.- Queries Quality and Percentage
-- https://leetcode.com/problems/queries-quality-and-percentage/description/
-- Date: Mar 7, 2026
-- Time taken: 10 minutes

/*
PROBLEM:
A quality and poor qualiti average

MY APPROACH:
Use a group by and a CASE WHEN


KEY LEARNING:
- GROUP_BY + SUM(CASE)


-- MY SOLUTION:
SELECT query_name,
	ROUND(AVG(rating*1.0/POSITION),2) AS quality,
	ROUND(SUM(CASE WHEN rating <3 THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS poor_query_percentage
FROM queries
GROUP BY query_name;

-- RESULT: Accepted
-- Attempts: 1

-- MISTAKES I MADE (if any):

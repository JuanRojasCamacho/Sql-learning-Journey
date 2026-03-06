-- 3421.- Find students who improved
-- https://leetcode.com/problems/find-students-who-improved/description/
-- Date: March 5, 2026
-- Time taken:  15 minutes

/*
PROBLEM:
Find the students who improved from their first to their latest exam.

MY APPROACH:
- Use FIRST_VALUE in ASC order to find the first score
- Use FIRST_VALUE in DESC order to find the latest score
- Use count to count the number of examns they have made
- Filter them

KEY LEARNING:
- FIRST_VALUE + PARTITION 2 ARGS

-- MY SOLUTION:
WITH full_table AS 
(SELECT *, 
	FIRST_VALUE(score) OVER (PARTITION BY student_id, subject ORDER BY exam_date ASC) AS first_score,
	FIRST_VALUE(score) OVER (PARTITION BY student_id, subject ORDER BY exam_date DESC) AS latest_score,
	COUNT(*) OVER (PARTITION BY student_id, subject) AS count
FROM scores)
SELECT DISTINCT student_id, subject, first_score, latest_score
FROM full_table
WHERE count >=2 AND latest_score > first_score ;

-- RESULT: Accepted
-- Attempts: 1

-- MISTAKES I MADE (if any):
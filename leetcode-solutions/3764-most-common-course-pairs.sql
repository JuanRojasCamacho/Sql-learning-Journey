-- 3764.- Most Common course pairs
-- https://leetcode.com/problems/most-common-course-pairs/description/
-- Date: Mar 7, 2026
-- Time taken: 15 minutes

/*
PROBLEM:
Find the pairs of courses that repeat the most
within top students

MY APPROACH:
-Create a subquery to find top students
- Created a CTE to filter the studnten usind LEAD
- Filter


KEY LEARNING:
- SUBQUERY - LEAD - GROUP BY 


-- MY SOLUTION:
WITH full_table AS 
	(SELECT user_id, course_id, course_name AS first_course,
		LEAD(course_name) OVER (PARTITION BY user_id ORDER BY completion_Date) AS second_course
	FROM course_completions
	WHERE user_id IN
		(SELECT user_id
		FROM course_completions
		GROUP BY user_id
		HAVING COUNT(*) >= 5 AND AVG(course_rating) >=4))
SELECT first_course, second_course, COUNT(DISTINCT user_id) AS transition_count
FROM full_table
WHERE second_course IS NOT NULL
GROUP BY first_course, second_course
ORDER BY transition_count DESC, first_course ASC, second_course ASC ;
    
-- RESULT: Accepted
-- Attempts: 1

-- MISTAKES I MADE (if any):
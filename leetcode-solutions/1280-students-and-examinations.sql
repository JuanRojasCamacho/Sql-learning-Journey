-- 1280.- Students and examinations
-- https://leetcode.com/problems/students-and-examinations/description/
-- Date: Mar 8, 2026
-- Time taken: 10 minutes

/*
PROBLEM:
Find the amount of examsn wach student attended to 


MY APPROACH:
- Cross join to made a full table
- Left Join to match the examns
- Count them up

KEY LEARNING:
- CROSS-JOIN + LEFT-JOIN + GROUP BY

-- MY SOLUTION:
SELECT  a.student_id, a.student_name , b.subject_name, 
	COUNT(e.subject_name) AS attended_exams
FROM students a
CROSS JOIN subjects b
LEFT JOIN examinations e
	ON a.student_id  = e.student_id  
	AND b.subject_name = e.subject_name
GROUP BY a.student_id, a.student_name, b.subject_name
ORDER BY a.student_id, b.subject_name;



-- RESULT: Accepted
-- Attempts: 1

-- MISTAKES I MADE (if any):

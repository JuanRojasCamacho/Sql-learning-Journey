-- 3611.- Find Overbooked employees
-- https://leetcode.com/problems/find-overbooked-employees/description/
-- Date: Mar 8, 2026
-- Time taken: 15 minutes

/*
PROBLEM:
Find employees who are overbooked by meetings more than 2 weeks


MY APPROACH:
- CTE to group by weeks
- CTE to SUM hours per weeks
- CTE to group weeks
- Filter

KEY LEARNING:
- CTE + DATE_SUB + CTE + GROUP BY


-- MY SOLUTION:
WITH weeks AS
	(SELECT *, DATE_SUB(meeting_date, INTERVAL WEEKDAY(meeting_date) DAY) AS week_number
	FROM meetings),
sum_weeks AS
	(SELECT employee_id, week_number, SUM(duration_hours) AS hours_week
	FROM weeks
	GROUP BY employee_id, week_number
	HAVING SUM(duration_hours) > 20),
employees_weeks AS
	(SELECT employee_id, COUNT(*) AS meeting_heavy_weeks
	FROM sum_weeks
	GROUP BY employee_id
	HAVING COUNT(*) >=2)
SELECT a.employee_id, b.employee_name, b.department, a.meeting_heavy_weeks
FROM employees_weeks a
JOIN employees b ON a.employee_id = b.employee_id 
ORDER BY a.meeting_heavy_weeks DESC, b.employee_name ASC;

-- RESULT: Accepted
-- Attempts: 1

-- MISTAKES I MADE (if any):
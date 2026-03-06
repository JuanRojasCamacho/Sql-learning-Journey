-- 1661.- Average time of process per machine
-- https://leetcode.com/problems/average-time-of-process-per-machine/description/
-- Date: MAR 6, 2026
-- Time taken: 10 minutes

/*
PROBLEM:
Find the avareg time each machine do proceses


MY APPROACH:
Subquery with cases to separate end and tart timestamps, substract them
then average them using group by

KEY LEARNING:
- SUBQUERY + SUM(CASE) + GROUP BY


-- MY SOLUTION:
SELECT machine_id, ROUND(AVG(process_time),3) AS processing_time
FROM (
SELECT machine_id, process_id, 
		SUM(cASE WHEN activity_type = 'end' THEN TIMESTAMP ELSE 0 END)
		- 
		SUM(CASE WHEN activity_type = 'start' THEN TIMESTAMP ELSE 0 END) AS process_time
	FROM activity
	GROUP BY machine_id, process_id
	ORDER BY machine_id, process_id)t
GROUP BY machine_id;

-- RESULT: Accepted
-- Attempts: 1

-- MISTAKES I MADE (if any):

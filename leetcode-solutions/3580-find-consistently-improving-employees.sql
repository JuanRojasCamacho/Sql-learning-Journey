-- 3580.- Find Consistently Improving Employees
-- https://leetcode.com/problems/find-consistently-improving-employees/description/
-- Date: March 5, 2026
-- Time taken:  15 minutes

/*
PROBLEM:
Find the employees who improved consecuntively on their last 3 reviews,
then subtract the latest review from the first review.

MY APPROACH:
- I created a CTE to show only the last 3 reviews using DENSE_RANK
- I created another CTE to filter the 3 reviews and using LEAD compare the last 3 reviews
- Joing and filter with employees table

KEY LEARNING:
- CTE + DENSE_RANK + LEAD + COUNT + JOIN

-- MY SOLUTION:
WITH last_three AS
	(SELECT *,
	DENSE_RANK() OVER (PARTITION BY employee_id ORDER BY review_date DESC) AS rnk,
	COUNT(*) OVER (PARTITION BY employee_id) AS count
	FROM performance_reviews),
full_table AS
	(SELECT *,
		Lead(rating) OVER (PARTITION BY employee_id ORDER BY review_date DESC) AS second_last,
		Lead(rating,2) OVER (PARTITION BY employee_id  ORDER BY review_date DESC) AS third_last
	FROM last_three
	WHERE count >= 3 
		AND rnk BETWEEN 1 AND 3)
SELECT f.employee_id, e.name, f.rating - f.third_last AS improvement_score
FROM full_table f
JOIN employees e ON f.employee_id = e.employee_id
WHERE rating > second_last AND second_last > third_last
ORDER BY improvement_score DESC, name ASC;

-- RESULT: Accepted
-- Attempts: 1

-- MISTAKES I MADE (if any):
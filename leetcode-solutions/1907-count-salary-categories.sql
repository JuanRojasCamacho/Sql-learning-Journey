-- 1731.- Count Salary Categories
-- https://leetcode.com/problems/count-salary-categories/description/
-- Date: March 3, 2026
-- Time taken: 15 minutes

/*
PROBLEM:
Sort salaries into categories, HIGH, AVERAGE and LOW salaries.


MY APPROACH:
- I created a CTE with 3 rows, using SELECT and UNION, this created
the base table for each category
- I created a second CTE where I used case to sort the salaries
- LEFT JOIN them to create the final table

KEY LEARNING:
CTE - UNION - CASE - GROUP BY - LEFT JOIN


-- MY SOLUTION:
WITH categories AS (
    SELECT 'Low Salary' AS category
    UNION ALL
    SELECT 'Average Salary'
    UNION ALL
    SELECT 'High Salary'
),
income AS
(SELECT 
	CASE 
		WHEN income < 20000 THEN 'Low Salary'
		WHEN income > 50000 THEN 'High Salary'
		ELSE 'Average Salary'
	END AS category,
	Count(*) AS accounts_count
FROM accounts
GROUP BY category)
SELECT categories.category, COALESCE(income.accounts_count,0) AS accounts_count
FROM categories
LEFT JOIN income
	ON categories.category = income.category;

-- RESULT: Accepted
-- Attempts: 1

-- MISTAKES I MADE (if any):
-- 

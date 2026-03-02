-- 1070.- Product sales analysis III
-- https://leetcode.com/problems/product-sales-analysis-iii/description/
-- Date: March 1, 2026
-- Time taken:  10 minutes

/*
PROBLEM:
Find the sales for each product during their first year.

MY APPROACH:
- Use a dense_rank in a subquery and the filter

KEY LEARNING:
Subquery + Dense_Rank()


-- MY SOLUTION:
SELECT product_id, YEAR AS first_year, quantity, price
FROM (
	SELECT *,
		DENSE_RANK() OVER (PARTITION BY product_id ORDER BY year) AS rnk
	FROM sales)t
WHERE rnk = 1;

-- RESULT: Accepted
-- Attempts: 1

-- MISTAKES I MADE (if any):

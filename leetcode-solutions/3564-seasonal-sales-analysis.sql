-- 3564.- Seasonal Sales Analysis
-- https://leetcode.com/problems/seasonal-sales-analysis/description/
-- Date: Mar 10, 2026
-- Time taken: 20 minutes

/*
PROBLEM:
Find the most populat category per season

MY APPROACH:
- CTE to create 'seasons'
- CTE to fin metrics
- Filter


KEY LEARNING:
- EXTRACT + DENSE_RANK(3 ORDERS) + GROUP BY + CTE


-- MY SOLUTION:
WITH main AS 
	(SELECT category, quantity,
		quantity*price AS revenue,
		 CASE
		 	WHEN EXTRACT(MONTH FROM sale_date) IN (12,1,2) THEN 'Winter'
		 	WHEN EXTRACT(MONTH FROM sale_date) IN (3,4,5) THEN 'Spring'
		 	WHEN EXTRACT(MONTH FROM sale_date) IN (6,7,8) THEN 'Summer'
		 	ELSE 'Fall'
		 END AS season
	FROM products p
	LEFT JOIN sales s ON  p.product_id = s.product_id),
metrics AS
	 (SELECT season, category,
        SUM(quantity) AS total_quantity, 
        SUM(revenue) AS total_revenue,
		DENSE_RANK() OVER (PARTITION BY season
		ORDER BY SUM(quantity) DESC, SUM(revenue) desc, category ASC) AS rnk
	FROM main
	GROUP BY season, category)
SELECT season, category, total_quantity, total_revenue
FROM metrics
WHERE rnk = 1;

-- RESULT: Accepted
-- Attempts: 1

-- MISTAKES I MADE (if any):
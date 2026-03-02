-- 1484.- Group sold products by the date
-- https://leetcode.com/problems/group-sold-products-by-the-date/description/
-- Date: March 1, 2026
-- Time taken:  10 minutes

/*
PROBLEM:
Group and cocatenate products that were sold the same day

MY APPROACH:
- Use the new aggregation function GROUP_CONCAT = STRING_AGG
- COUNT distinct products

KEY LEARNING:
GROUP CONCAT + STRING AGG


-- MY SOLUTION:
SELECT sell_date,
	COUNT(DISTINCT product) AS num_sold,	
	GROUP_CONCAT(DISTINCT product ORDER BY product SEPARATOR ',') AS products
FROM activities
GROUP BY sell_date;


-- RESULT: Accepted
-- Attempts: 1

-- MISTAKES I MADE (if any):

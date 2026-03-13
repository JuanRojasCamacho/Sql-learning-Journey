-- 3626.- Find Stores with inventory Imbalance
-- https://leetcode.com/problems/find-stores-with-inventory-imbalance/description/
-- Date: Mar 12, 2026
-- Time taken: 20 minutes

/*
PROBLEM:
Find cheapest and mos expensive products per store


MY APPROACH:
- CTE to rank and count products
- CTE to filter and PIVOT
- JOIN and final filter


KEY LEARNING:
- CTE + DENSE_RANK + MAX(CASE)

-- MY SOLUTION:
WITH main AS 
	(SELECT *,
		DENSE_RANK() OVER (PARTITION BY store_id ORDER BY price ASC) AS cheapest,
		DENSE_RANK() OVER (PARTITION BY store_id ORDER BY price DESC) AS expensive,
		COUNT(*) OVER (PARTITION BY store_id) AS count
	FROM inventory),
metrics AS 
	(SELECT store_id,
		MAX(CASE WHEN cheapest = 1 THEN product_name END) AS cheapest_product,
		MAX(CASE WHEN cheapest = 1 THEN quantity END) AS cheapest_quantity,
		MAX(CASE WHEN expensive = 1 THEN product_name END) AS most_exp_product,
		MAX(CASE WHEN expensive = 1 THEN quantity END) AS expensive_quantity
	FROM main
	WHERE (cheapest = 1
		OR expensive = 1)
		AND count >= 3
	GROUP BY store_id)
SELECT m.store_id, s.store_name, s.LOCATION, m.most_exp_product, m.cheapest_product,
	ROUND(cheapest_quantity *1.0 / expensive_quantity,2) AS imbalance_ratio
FROM metrics m
JOIN stores s ON m.store_id = s.store_id
WHERE expensive_quantity  < cheapest_quantity
ORDER BY imbalance_ratio DESC, store_name ASC;

-- RESULT: Accepted
-- Attempts: 1

-- MISTAKES I MADE (if any):

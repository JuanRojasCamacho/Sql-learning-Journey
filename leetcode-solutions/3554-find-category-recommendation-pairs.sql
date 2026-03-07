-- 3554.- Find category recommendation pairs
-- https://leetcode.com/problems/find-category-recommendation-pairs/description/
-- Date: Mar 7, 2026
-- Time taken: 15 minutes

/*
PROBLEM:
Find the pairs of purchases that repeat more tha 3 times

MY APPROACH:
- CTE to find unique purchases from customers
- CTE to fins unique pairs of items
- Filter


KEY LEARNING:
- CTE + SELFJOIN + GROUP BY + COUNT 

-- MY SOLUTION:
WITH users_products AS 
	(SELECT DISTINCT  p.user_id, i.category
	FROM productpurchases p
	JOIN productinfo i ON p.product_id = i.product_id),
categories AS
	(SELECT a.user_id, a.category  AS category1, b.category AS category2
	FROM users_products a
	JOIN users_products b ON a.user_id = b.user_id
	WHERE a.category < b.category)
SELECT category1, category2, COUNT(*) AS customer_count
FROM categories
GROUP BY category1, category2
HAVING COUNT(*) >=3
ORDER BY customer_count DESC, category1 ASC, category2 ASC;
    
-- RESULT: Accepted
-- Attempts: 1

-- MISTAKES I MADE (if any):
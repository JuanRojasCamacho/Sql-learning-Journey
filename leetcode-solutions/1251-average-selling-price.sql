-- 1251.- Average Selling Price
-- https://leetcode.com/problems/average-selling-price/description/
-- Date: Mar 10, 2026
-- Time taken: 10 minutes

/*
PROBLEM:
Find the average selling price of a product and manage nulls

MY APPROACH:
- Group by user ID then multiply and divide
- Manage null with coalesce and nulliff


KEY LEARNING:
- JOIN + CONDITION BETWEEN + COALESCE + NULLIFF


-- MY SOLUTION:
SELECT  p.product_id, 
    ROUND( COALESCE(SUM(units*price)*1.0 / NULLIF(SUM(units),0),0) ,2) AS average_price
FROM unitssold u 
RIGHT JOIN prices p ON u.product_id = p.product_id 
	AND u.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY p.product_id;

-- RESULT: Accepted
-- Attempts: 1

-- MISTAKES I MADE (if any):

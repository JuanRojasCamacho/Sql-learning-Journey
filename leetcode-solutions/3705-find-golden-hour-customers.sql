-- 3705.- Find Golden Hour Customers
-- https://leetcode.com/problems/find-golden-hour-customers/description/
-- Date: MAR 6, 2026
-- Time taken: 20 minutes

/*
PROBLEM:
Find the golder customer, who are the one that follow certain criteria


MY APPROACH:
- Use a CTE combining SUM(CASE), count and group by
- Then filter according to the criteria


KEY LEARNING:
- CTE + SUM(CASE) + EXTRACT(HOUR FROM) + GROUP BY + ...


-- MY SOLUTION:
WITH full_table AS
(SELECT customer_id, COUNT(*) AS total_orders,
	ROUND(SUM(CASE WHEN EXTRACT(HOUR FROM order_timestamp) >= 11 AND EXTRACT(HOUR FROM order_timestamp) < 14
		OR EXTRACT(HOUR FROM order_timestamp) >= 18 AND EXTRACT(HOUR FROM order_timestamp) < 21 THEN 1 ELSE 0 END) *100.0
		/ count(*)) AS peak_hour_percentage, 
	ROUND(AVG(order_rating),2) AS average_rating,
	count(order_rating) AS orders_rated
FROM restaurant_orders
GROUP BY customer_id)
SELECT customer_id, total_orders, peak_hour_percentage, average_rating
FROM full_table
WHERE total_orders >= 3
	AND peak_hour_percentage >= 60
	AND average_rating >=4
	AND orders_rated*100.0/total_orders >=50
ORDER BY average_rating DESC, customer_id DESC;

-- RESULT: Accepted
-- Attempts: 1

-- MISTAKES I MADE (if any):
-- 1174.- Immediate Food Delirvery II
-- https://leetcode.com/problems/immediate-food-delivery-ii/description/
-- Date: Feb 25, 2026
-- Time taken: 20 minutes

/*
PROBLEM:
Find the price percentage of immediate firsts deliveries

MY APPROACH:
1.- I created a CTE to find the first deliveries of each customer
2.- I created a CTE to find the immediate order by joining
with deliveries table
3.- I created a CTE or total orders

KEY LEARNING:
CTE + JOIN + AND + ROUND

-- MY SOLUTION:
WITH first AS
(
	SELECT customer_id, MIN(order_date) AS first_order
	FROM delivery
	GROUP BY customer_id
),
immediate AS
(
	SELECT COUNT(*) AS num_immediate
	FROM delivery
	JOIN first 
		ON delivery.customer_id = first.customer_id
		AND delivery.order_date = first.first_order
	WHERE delivery.order_date = delivery.customer_pref_delivery_date
),
total AS 
(
	SELECT COUNT(*) AS total_first
	FROM delivery
	JOIN first 
		ON delivery.customer_id = first.customer_id
		AND delivery.order_date = first.first_order
)
SELECT ROUND(
       immediate.num_immediate * 100.0 / total.total_first,
       2
       ) AS immediate_percentage
FROM immediate, total;

-- RESULT: Accepted
-- Attempts: 1

-- MISTAKES I MADE (if any):

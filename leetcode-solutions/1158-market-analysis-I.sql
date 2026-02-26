-- 1158.- Market Analysis 1
-- https://leetcode.com/problems/market-analysis-i/description/
-- Date: Feb 25, 2026
-- Time taken: 15 minutes

/*
PROBLEM:
Find the price join date and the orders they made in 2019.

MY APPROACH:
1.- I created a CTE to find the orders each user made in 2019
2.- Left join it with users table to find their join date
3.- use Coalesce to manage Nulls

KEY LEARNING:
CTE + LEFT JOIN + COALESCE

-- MY SOLUTION:
WITH orders_2019 AS
	(
	SELECT buyer_id, COUNT(*) AS orders_in_2019
	FROM orders
	WHERE order_date BETWEEN '2019-01-01' AND '2019-12-31'
	GROUP  BY buyer_id
	)
SELECT user_id AS buyer_id, 
        join_date,
        coalesce(orders_in_2019,0) AS orders_in_2019
FROM users
LEFT JOIN orders_2019
	ON users.user_id = orders_2019.buyer_id;

-- RESULT: Accepted
-- Attempts:2

-- MISTAKES I MADE (if any):
- I didn't check the expected colum names

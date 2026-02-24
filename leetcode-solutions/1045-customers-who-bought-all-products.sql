-- 1045 Customers Who Bought All Products
-- https://leetcode.com/problems/customers-who-bought-all-products/description/-- Difficulty: Easy
-- Date: Feb 23, 2026
-- Time taken: 15 minutes

/*
PROBLEM:
Find the customers who bought every single product

MY APPROACH:
I used a nested select query plus a DISTINCT COUNT.

KEY LEARNING:
COUNT(DISTINCT) + NESTED SELECT

-- MY SOLUTION:
SELECT customer_id
FROM customer
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key) = (
	SELECT COUNT(*)
	FROM product);

-- RESULT: Accepted
-- Attempts: 1

-- MISTAKES I MADE (if any):
-- Put the DISTINCT outside the COUNT() 
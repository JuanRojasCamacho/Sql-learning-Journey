-- 183. Customers Who Never Order
-- https://leetcode.com/problems/customers-who-never-order
-- Difficulty: Easy
-- Date: Feb 21, 2026
-- Time taken: 5 minutes

/*
PROBLEM:
Find the customers that have no orders registered

MY APPROACH:
This one was easy, use a LEFT JOIN that also shows NULLS,
then just filter the customer that have NULLS.

KEY LEARNING:
LEFT JOIN to show NULLS

-- MY SOLUTION:
# Write your MySQL query statement below
SELECT name AS Customers
FROM Customers
LEFT JOIN Orders
    ON Customers.id = Orders.customerId
WHERE Orders.id IS NULL;

-- RESULT:  Accepted
-- Attempts: 1

-- MISTAKES I MADE (if any):

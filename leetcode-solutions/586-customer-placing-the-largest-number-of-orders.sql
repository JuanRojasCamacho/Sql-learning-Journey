-- 586.Customer Placing the Largest Number of Orders
-- Difficulty: Easy
-- Date: Feb 22, 2026
-- Time taken: 5 minutes

/*
PROBLEM:
Find the customer number (id) that has made
the most orders

MY APPROACH:
First I GROUP BY customer number, then I use the COUNT
Expression to find how many times the customer has ordered
then I order by DESC and finally LIMIT to 1

KEY LEARNING:
COUNT + ORDER + LIMIT

-- MY SOLUTION:
SELECT customer_number
FROM orders
GROUP BY customer_number
ORDER BY COUNT(customer_number) DESC
LIMIT 1;

-- RESULT: Accepted
-- Attempts: 2

-- MISTAKES I MADE (if any):
Mistakenly used SUM instead of COUNT
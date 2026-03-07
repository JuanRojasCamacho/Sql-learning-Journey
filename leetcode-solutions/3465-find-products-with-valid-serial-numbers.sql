-- 3465.- Find Products with valid serial number
-- https://leetcode.com/problems/find-products-with-valid-serial-numbers/description/
-- Date: Mar 7, 2026
-- Time taken: 10 minutes

/*
PROBLEM:
Find a valid serial number inside a string

MY APPROACH:
Use regex to find the perfect match


KEY LEARNING:
- REGEXP_LIKE()


-- MY SOLUTION:
SELECT *
FROM products
WHERE regexp_like(description, '\\bSN[0-9]{4}-[0-9]{4}\\b','c')
ORDER BY product_id ASC;

-- RESULT: Accepted
-- Attempts: 1

-- MISTAKES I MADE (if any):
-- Forgot to order it 
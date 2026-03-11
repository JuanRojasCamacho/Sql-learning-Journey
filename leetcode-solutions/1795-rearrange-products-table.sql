-- 1795.- Rearrange products table
-- https://leetcode.com/problems/rearrange-products-table/description/
-- Date: MAR 11, 2026
-- Time taken: 5 minutes

/*
PROBLEM:
UNPIVOT a table, columns to rows


MY APPROACH:
Use several SELECTS and then UNION them all.


KEY LEARNING:
-- UNPIVOT + SELECT + 'name' + UNION ALL


-- MY SOLUTION:
SELECT product_id, 'store1' AS store, store1 AS price
FROM products
WHERE store1 IS NOT NULL 

UNION

SELECT product_id,'store2', store2
FROM products
WHERE store2 IS NOT NULL 

UNION

SELECT product_id,'store3', store3
FROM products
WHERE store3 IS NOT NULL;


-- RESULT: Accepted
-- Attempts: 1

-- MISTAKES I MADE (if any):
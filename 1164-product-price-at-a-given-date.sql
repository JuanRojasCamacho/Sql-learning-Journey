-- 1164.- Product Price at a Given Date
-- https://leetcode.com/problems/product-price-at-a-given-date/description/
-- Date: Feb 25, 2026
-- Time taken: 25 minutes

/*
PROBLEM:
Find the price of a product that was updated the closest to a specific date
if no data the product should cost 10

MY APPROACH:
1.- I created a CTE to find the MAX date and the filter to the closest to it
2.- I created anothe CTE with the unique products ID
3.- I joined them and put 10 to NULLS.

KEY LEARNING:
CTE(Subquery) + CTE + LEFT JOIN + COALESCE

-- MY SOLUTION:
WITH new_price AS 
(
    SELECT product_id, new_price
    FROM 
    (
        SELECT *,
               MAX(change_date) OVER (PARTITION BY product_id) AS max_date
        FROM products
        WHERE change_date <= '2019-08-16'
    ) t
    WHERE change_date = max_date
),
all_products AS
(
	SELECT DISTINCT product_id
	FROM products
)
SELECT all_products.product_id,
		coalesce(new_price.new_price,10) AS new_price
FROM all_products
LEFT JOIN new_price
	ON all_products.product_id = new_price.product_id;

-- RESULT: Accepted
-- Attempts: 1

-- MISTAKES I MADE (if any):

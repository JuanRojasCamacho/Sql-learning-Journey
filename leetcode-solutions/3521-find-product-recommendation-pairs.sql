-- 3521.- Find Products recommendation
-- https://leetcode.com/problems/find-product-recommendation-pairs/description/
-- Date: Mar 7, 2026
-- Time taken: 10 minutes

/*
PROBLEM:
Find customers recommendations basen on pairs of purchases
made by more than 3 customers

MY APPROACH:
Use self join and the filter by 2 columns, then  group by
and join to find categories


KEY LEARNING:
- SELF JOIN + GROUP BY 2 COLUMNS + JOIN + JOIN


-- MY SOLUTION:
SELECT 
    a.product_id AS product1_id,
    b.product_id AS product2_id,
    p1.category AS product1_category,
    p2.category AS product2_category,
    COUNT(DISTINCT a.user_id) AS customer_count
FROM ProductPurchases a
JOIN ProductPurchases b 
    ON a.user_id = b.user_id
JOIN ProductInfo p1 
    ON a.product_id = p1.product_id
JOIN ProductInfo p2 
    ON b.product_id = p2.product_id
WHERE a.product_id < b.product_id
GROUP BY 
    a.product_id,
    b.product_id,
    p1.category,
    p2.category
HAVING COUNT(DISTINCT a.user_id) >= 3
ORDER BY 
    customer_count DESC,
    product1_id ASC,
    product2_id ASC;
    
-- RESULT: Accepted
-- Attempts: 1

-- MISTAKES I MADE (if any):
-- Forgot to order it 
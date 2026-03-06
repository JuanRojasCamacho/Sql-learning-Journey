-- 3657.- Find Loyal Customers
-- https://leetcode.com/problems/find-loyal-customers/description/
-- Date: Mar 6, 2026
-- Time taken: 10 minutes

/*
PROBLEM:
Find the customers who meet the following criteria:
- Be active for at least 30 days
-  Have at least 3 transactions
- Hava a refund ratio less than 20%


MY APPROACH:
- Group by customer is and the use AGG FUNCTIONS and Havind to filter


KEY LEARNING:
- Multiple AGG FUNCT + FUNCTION

-- MY SOLUTION:
SELECT customer_id
FROM customer_transactions
GROUP BY customer_id
HAVING COUNT(*) >= 3
	AND SUM(CASE WHEN transaction_type = 'refund' THEN 1 ELSE 0 END) *100 / COUNT(*) < 20
	AND DATEDIFF(MAX(transaction_date),MIN(transaction_date)) >= 30;

-- RESULT: Accepted
-- Attempts: 1

-- MISTAKES I MADE (if any):

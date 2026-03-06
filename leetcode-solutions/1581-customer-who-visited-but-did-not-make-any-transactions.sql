-- 1581.- Customer who visited but did not make any transactions
-- https://leetcode.com/problems/customer-who-visited-but-did-not-make-any-transactions/description/
-- Date: Mar 6, 2026
-- Time taken: 5 minutes

/*
PROBLEM:
Find the customers who visited the mall but did not puchase anything

MY APPROACH:
- Use a left join and thn filter using IS NULL


KEY LEARNING:
- LEFT JOIN + IS NULL


-- MY SOLUTION:
SELECT v.customer_id, COUNT(*) AS count_no_trans
FROM visits v
LEFT JOIN transactions t ON v.visit_id = t.visit_id 
WHERE t.transaction_id IS NULL
GROUP BY v.customer_id;


-- RESULT: Accepted
-- Attempts: 1

-- MISTAKES I MADE (if any):

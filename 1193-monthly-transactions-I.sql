-- 1193.- Montly Transactions 1
-- https://leetcode.com/problems/monthly-transactions-i/description/
-- Date: March 4, 2026
-- Time taken:  8 minutes

/*
PROBLEM:
Find several metrics from a montly transactions table

MY APPROACH:
- USE date format to shorten the date to YYYY-MM
- Use COUNT(*) to find the total 
- USE SUM(CASE) to find especific metrics

KEY LEARNING:
DATEFORMAT() + SUM(CASE) + COUNT(*) + GROUP BY 2 ARGS

-- MY SOLUTION:
SELECT DATE_FORMAT(trans_date, '%Y-%m') AS month,
	country,
	COUNT(*) AS trans_count,
	SUM(CASE WHEN state = 'approved' THEN 1 ELSE 0 END) AS approved_count,
	SUM(amount) AS trans_total_amount,
	SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END) AS approved_total_amount
FROM transactions
GROUP BY month, country;


-- RESULT: Accepted
-- Attempts: 1

-- MISTAKES I MADE (if any):

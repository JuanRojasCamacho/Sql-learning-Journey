-- 3220.- Odd and even transactions
-- https://leetcode.com/problems/odd-and-even-transactions/description/
-- Date: MAR 11, 2026
-- Time taken: 5 minutes

/*
PROBLEM:
PIVOT a table, columns to rows, depending on wheter the number is odd or even


MY APPROACH:
Use a SUM(CASE) and a group by


KEY LEARNING:
-- PIVOT + SUM(CASE) + NUM%=0


-- MY SOLUTION:
SELECT transaction_date,
	SUM(CASE WHEN amount%2!=0 THEN amount ELSE 0 END) AS odd_sum,	
	SUM(CASE WHEN amount%2=0 THEN amount ELSE 0 END) AS even_sum
FROM transactions
GROUP BY transaction_date
ORDER BY transaction_date ASC


-- RESULT: Accepted
-- Attempts: 1

-- MISTAKES I MADE (if any):
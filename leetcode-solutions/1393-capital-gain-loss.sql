-- 1393.- Capital Gain Loss
-- https://leetcode.com/problems/capital-gainloss/description/
-- Date: March 3, 2026
-- Time taken: 10 minutes

/*
PROBLEM:
Fing the total gain-loss of stocks


MY APPROACH:
- Created a case so to separate sells and them sum them up
- Created a case to separate buys and the sum them up
- I substracted both cases

KEY LEARNING:
SUM(CASE) - SUM(CASE) (POWERFUL TOOL)


-- MY SOLUTION:
SELECT stock_name,
	SUM(CASE WHEN operation = 'Sell' THEN price ELSE 0 END)
	-
	SUM(CASE WHEN operation = 'Buy' THEN price ELSE 0 END) 
	AS capital_gain_loss
FROM stocks
GROUP BY stock_name;

-- RESULT: Accepted
-- Attempts: 1

-- MISTAKES I MADE (if any):

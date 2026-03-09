-- 3611.- Find Churn Risk Customers
-- https://leetcode.com/problems/find-churn-risk-customers/description/
-- Date: Mar 8, 2026
-- Time taken: 30 minutes

/*
PROBLEM:
Find churn risk customers accordind to specific criteria


MY APPROACH:
- CTE with several window functions to find metric pero customer
- Filter them 

KEY LEARNING:
- CTE + WINDOW_FUNCTIONS + ROW_NUMBER + DATEDIFF


-- MY SOLUTION:
WITH main AS (
    SELECT *,
           SUM(CASE WHEN event_type = 'downgrade' THEN 1 ELSE 0 END)
               OVER (PARTITION BY user_id) AS downgrades,

           MAX(monthly_amount)
               OVER (PARTITION BY user_id) AS max_historical_amount,

           DATEDIFF(
               MAX(event_date) OVER (PARTITION BY user_id),
               MIN(event_date) OVER (PARTITION BY user_id)
           ) AS days_as_subscriber,

           ROW_NUMBER() OVER (
               PARTITION BY user_id
               ORDER BY event_date DESC, event_id DESC
           ) AS rn
    FROM subscription_events
)
SELECT user_id,
       plan_name AS current_plan,
       monthly_amount AS current_monthly_amount,
       max_historical_amount,
       days_as_subscriber
FROM main
WHERE rn = 1
  AND event_type != 'cancel'
  AND downgrades >= 1
  AND days_as_subscriber >= 60
  AND monthly_amount < (max_historical_amount / 2)
ORDER BY days_as_subscriber DESC, user_id ASC;

-- RESULT: Accepted
-- Attempts: 1

-- MISTAKES I MADE (if any):
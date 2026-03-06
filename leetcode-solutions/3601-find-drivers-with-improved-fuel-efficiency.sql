-- 3601.- Find Drivers with improved fuel efficiency
-- https://leetcode.com/problems/find-drivers-with-improved-fuel-efficiency/description/
-- Date: March 5, 2026
-- Time taken:  30 minutes

/*
PROBLEM:
Find the efficiency on drivers for each half of the year

MY APPROACH:
- I created a CTE to fin efficiency
- I creater a cte to find efficiency per half of the year
- filter out

KEY LEARNING:
- CTE + WINDOW FUNCTIONS

-- MY SOLUTION:
WITH efficiency AS (
    SELECT
        driver_id,
        CASE
            WHEN trip_date >= '2023-01-01' AND trip_date < '2023-07-01' THEN 1
            ELSE 2
        END AS half,
        distance_km / fuel_consumed AS eff
    FROM trips
),
avg_half AS (
    SELECT
        driver_id,
        half,
        AVG(eff) AS avg_eff
    FROM efficiency
    GROUP BY driver_id, half
),
pivot AS (
    SELECT
        driver_id,
        MAX(CASE WHEN half = 1 THEN avg_eff END) AS first_half_avg,
        MAX(CASE WHEN half = 2 THEN avg_eff END) AS second_half_avg
    FROM avg_half
    GROUP BY driver_id
)
SELECT
    p.driver_id,
    d.driver_name,
    ROUND(p.first_half_avg,2) AS first_half_avg,
    ROUND(p.second_half_avg,2) AS second_half_avg,
    ROUND(p.second_half_avg - p.first_half_avg,2) AS efficiency_improvement
FROM pivot p
JOIN drivers d
    ON p.driver_id = d.driver_id
WHERE p.first_half_avg IS NOT NULL
  AND p.second_half_avg IS NOT NULL
  AND p.second_half_avg > p.first_half_avg
ORDER BY efficiency_improvement DESC, driver_name ASC;
-- RESULT: Accepted
-- Attempts: 1

-- MISTAKES I MADE (if any):
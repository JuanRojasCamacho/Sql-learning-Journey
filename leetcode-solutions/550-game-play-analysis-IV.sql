-- 550.- Game play analysis IV
-- https://leetcode.com/problems/game-play-analysis-iv/description/
-- Date: Feb 26, 2026
-- Time taken: 15 minutes

/*
PROBLEM:
The problem ask to find the percentage of players who logged in the
day after their first login

MY APPROACH:
1.- I created a CTE to find the total distinct players
2.- I creates a CTE to find the players that logged in the day after
3.- I created a CTE to count the player
4-. I made the division

KEY LEARNING:
CTE + MIN() OVER + DATE + INTERVAL + COUNT(DISTINCT)

-- MY SOLUTION:
WITH total_players AS
(SELECT COUNT(DISTINCT player_id) AS total FROM activity),
first_login AS
(SELECT *, MIN(event_date) OVER (PARTITION BY player_id) AS first_login_date FROM activity),
consecutive AS
(SELECT count(*) AS consecutive_loging FROM first_login WHERE event_date = first_login_date + INTERVAL '1' DAY)
SELECT ROUND(consecutive_loging*1.00 / total , 2) AS fraction
FROM consecutive, total_players;

-- RESULT: Accepted
-- Attempts: 1

-- MISTAKES I MADE (if any):

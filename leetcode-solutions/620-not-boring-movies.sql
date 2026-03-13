-- 620.- Not boring movies
-- https://leetcode.com/problems/not-boring-movies/description/
-- Date: Mar 12, 2026
-- Time taken: 2 minutes

/*
PROBLEM:
Find odd id movies and nor boring


MY APPROACH:
- Filter using number % 2 = 1 and using NOT LIKE 'boring'


KEY LEARNING:
- ODD + NOT LIKE

-- MY SOLUTION:
SELECT *
FROM cinema
WHERE id % 2 = 1
	AND description NOT LIKE 'boring'
ORDER BY rating DESC;

-- RESULT: Accepted
-- Attempts: 1

-- MISTAKES I MADE (if any):

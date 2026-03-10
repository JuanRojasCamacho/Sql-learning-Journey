-- 3642.- Find Books with polarized opinions
-- https://leetcode.com/problems/find-books-with-polarized-opinions/description/
-- Date: Mar 10, 2026
-- Time taken: 15 minutes

/*
PROBLEM:
Find metrics for each book according to session readings.

MY APPROACH:
- CTE to crete some flags and separate some date
- CTE with window functions to find metrics
- Query with JOIN and filters


KEY LEARNING:
- CTE + CASE + WINDOW + GROUP BY + AGG FUNCT


-- MY SOLUTION:
WITH main AS 
	(SELECT *,
		CASE WHEN session_rating >= 4 THEN 1 END AS top_ratings,
		CASE WHEN session_rating <= 2 THEN 1 END AS bottom_ratings
	FROM reading_sessions),
metrics AS
	(SELECT 	book_id, 
			COUNT(session_rating) AS number_sessions,
			COUNT(top_ratings) AS number_top,
			COUNT(bottom_ratings) AS number_bottom,
			MAX(session_rating) - MIN(session_rating) AS rating_spread,
			ROUND((COUNT(top_ratings) + COUNT(bottom_ratings))*1.00 / COUNT(session_rating),2) AS polarization_score
	FROM main
	GROUP BY book_id)
SELECT 	b.book_id, b.title, b.author, b.genre, b.pages,
		m.rating_spread , m.polarization_score
FROM metrics m
JOIN books b ON m.book_id = b.book_id
WHERE m.number_top >=1
	AND m.number_bottom >=1
	AND m.number_sessions >=5
	AND m.polarization_score >= 0.6
ORDER BY m.polarization_score DESC, b.title DESC;

-- RESULT: Accepted
-- Attempts: 1

-- MISTAKES I MADE (if any):
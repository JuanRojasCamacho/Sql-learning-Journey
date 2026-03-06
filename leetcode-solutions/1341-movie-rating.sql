-- 1341.- Movie Rating
-- https://leetcode.com/problems/movie-rating/description/
-- Date: March 4, 2026
-- Time taken:  15 minutes

/*
PROBLEM:
Find teo things: person who rated the most movies
and the highest rated movie in february 2020

MY APPROACH:
- Created a query to find the person, using JOIN, COUNT, ORDER BY
- Created a query to find the movie, using JOIN, AVG, ORDER BY
- UNIO ALL to them

KEY LEARNING:
QUERY(JOIN+COUNT) + UNION ALL + QUERY(JOIN,AVG)

-- MY SOLUTION:
(SELECT u.name AS results
FROM movierating m
JOIN users u ON m.user_id = u.user_id
GROUP BY m.user_id, u.name
ORDER BY COUNT(*) DESC, u.name ASC
LIMIT 1)

UNION ALL

(SELECT m.title AS results
FROM movierating r
JOIN movies m ON r.movie_id = m.movie_id
WHERE created_at BETWEEN '2020-02-01' AND '2020-02-29'
GROUP BY m.title
ORDER BY AVG(r.rating) DESC, m.title ASC
LIMIT 1);


-- RESULT: Accepted
-- Attempts: 1

-- MISTAKES I MADE (if any):
-- Didn't consider february can have 29 days
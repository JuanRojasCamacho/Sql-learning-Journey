-- 584.- Find customer referee
-- Difficulty: Easy
-- Date: Feb 22, 2026
-- Time taken: 5 minutes

/*
PROBLEM:
Find customers referred by a different person than ID=2 or no one

MY APPROACH:
Just use a nor equal simbol != and IS NULL

KEY LEARNING:
!= and IS NULL

-- MY SOLUTION:
SELECT name
FROM customer 
WHERE referee_id != 2 OR referee_id IS NULL;

-- RESULT: Accepted
-- Attempts: 1

-- MISTAKES I MADE (if any):

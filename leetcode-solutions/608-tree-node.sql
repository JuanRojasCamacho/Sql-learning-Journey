-- 608.- Tree Node
-- https://leetcode.com/problems/tree-node/description/
-- Date: Feb 26, 2026
-- Time taken:  15 minutes

/*
PROBLEM:
Evaluate if a node is a root, leaf or inner


MY APPROACH:
- Use cases to evaluate each row
- Use exists to evaluate inner


KEY LEARNING:
CASES - EXISTS


-- MY SOLUTION:
SELECT id, 
	CASE
		WHEN p_id is NULL THEN 'Root'
		WHEN EXISTS (
			SELECT 1
			FROM tree t
			WHERE t.p_id = tree.id
		) THEN 'Inner'
		ELSE 'Leaf'
	END as type
FROM tree;


-- RESULT: Accepted
-- Attempts: 1

-- MISTAKES I MADE (if any):

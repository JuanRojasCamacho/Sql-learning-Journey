-- 3475.- Dna pattern recognition
-- https://leetcode.com/problems/dna-pattern-recognition/description/
-- Date: Mar 12, 2026
-- Time taken: 5 minutes

/*
PROBLEM:
Find pattens in strings and raise a flag


MY APPROACH:
- Use CASE and LIKE to find patterns


KEY LEARNING:
- CASE + LIKE

-- MY SOLUTION:
SELECT *,
	CASE WHEN dna_sequence LIKE 'ATG%' THEN 1 ELSE 0 END AS has_start,
	CASE WHEN dna_sequence LIKE '%TAA' 
		OR dna_sequence LIKE '%TAG' 
		OR dna_sequence LIKE '%TGA'
		THEN 1 ELSE 0 END AS has_stop,
	CASE WHEN dna_sequence LIKE '%ATAT%' THEN 1 ELSE 0 END AS has_atat,
	CASE WHEN dna_sequence LIKE '%GGG%' THEN 1 ELSE 0 END AS has_ggg
FROM samples
ORDER BY sample_id ASC;

-- RESULT: Accepted
-- Attempts: 1

-- MISTAKES I MADE (if any):

-- 3586.- Find COVID recovery patients
-- https://leetcode.com/problems/find-covid-recovery-patients/description/
-- Date: Mar 13, 2026
-- Time taken: 15 minutes

/*
PROBLEM:
Find patients who recovered from covid, according
to their tests


MY APPROACH:
- CTE to find their first positive test
- CTE with JOIN to find their first negative test after their
first positive test
- Final filter


KEY LEARNING:
- CTE + CTE + JOIN 

-- MY SOLUTION:
WITH positive AS
	(SELECT patient_id, MIN(test_date) AS first_positive
	FROM covid_tests
	WHERE RESULT = 'Positive'
	GROUP BY patient_id),
negative AS 
	(SELECT c.patient_id, MIN(c.test_date) AS first_negative
	FROM covid_tests c
	JOIN positive p ON C.patient_id  = p.patient_id
	WHERE RESULT ='Negative' AND test_date > first_positive
	GROUP BY c.patient_id)
SELECT n.patient_id, pa.patient_name, pa.age , 
		DATEDIFF(n.first_negative,p.first_positive) AS recovery_time
FROM negative n
JOIN positive p ON N.patient_id  = p.patient_id 
JOIN patients pa ON pa.patient_id  = n.patient_id 
ORDER BY recovery_time ASC, pa.patient_name ASC;

-- RESULT: Accepted
-- Attempts: 1

-- MISTAKES I MADE (if any):

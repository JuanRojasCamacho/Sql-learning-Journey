-- 3451.- Find Invalid Ip Addresses
-- https://leetcode.com/problems/find-invalid-ip-addresses/description/
-- Date: Mar 13, 2026
-- Time taken: 10 minutes

/*
PROBLEM:
Find invalid ip 


MY APPROACH:
- Filter using REGEX


KEY LEARNING:
- REGEX

-- MY SOLUTION:
SELECT ip, COUNT(*) AS invalid_count
FROM logs
WHERE ip NOT REGEXP '^(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[1-9][0-9]?|0)\\.(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[1-9][0-9]?|0)\\.(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[1-9][0-9]?|0)\\.(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[1-9][0-9]?|0)$'
GROUP BY ip
ORDER BY invalid_count DESC, ip DESC;

-- RESULT: Accepted
-- Attempts: 1

-- MISTAKES I MADE (if any):

-- 3482.- Analyze organization hierarchy
-- https://leetcode.com/problems/analyze-organization-hierarchy/description/
-- Date: Mar 8, 2026
-- Time taken: 40 minutes

/*
PROBLEM:
Find the hierarchy of an organization and some metrics


MY APPROACH:
- Recursive CTE
- Recursive CTE
- CTE for metrics
- Filter

KEY LEARNING:
- RECURSIVE CTE


-- MY SOLUTION:
WITH RECURSIVE levels AS (
    SELECT
        employee_id,
        employee_name,
        manager_id,
        salary,
        department,
        1 AS level
    FROM employees
    WHERE manager_id IS NULL

    UNION ALL

    SELECT
        e.employee_id,
        e.employee_name,
        e.manager_id,
        e.salary,
        e.department,
        l.level + 1
    FROM employees e
    JOIN levels l
        ON e.manager_id = l.employee_id
),

hierarchy AS (
    SELECT
        employee_id AS manager_id,
        employee_id AS subordinate_id
    FROM employees

    UNION ALL

    SELECT
        h.manager_id,
        e.employee_id
    FROM hierarchy h
    JOIN employees e
        ON e.manager_id = h.subordinate_id
),

team_metrics AS (
    SELECT
        h.manager_id AS employee_id,
        COUNT(*) - 1 AS team_size,
        SUM(e.salary) AS budget
    FROM hierarchy h
    JOIN employees e
        ON h.subordinate_id = e.employee_id
    GROUP BY h.manager_id
)

SELECT
    l.employee_id,
    l.employee_name,
    l.level,
    COALESCE(t.team_size,0) AS team_size,
    COALESCE(t.budget,l.salary) AS budget
FROM levels l
LEFT JOIN team_metrics t
    ON l.employee_id = t.employee_id
ORDER BY
    l.level ASC,
    budget DESC,
    l.employee_name ASC;
    
-- RESULT: Accepted
-- Attempts: 1

-- MISTAKES I MADE (if any):
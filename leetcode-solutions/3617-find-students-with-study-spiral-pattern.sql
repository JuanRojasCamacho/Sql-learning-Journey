-- 3617.- Find students with study spiral patterns
-- https://leetcode.com/problems/find-students-with-study-spiral-pattern/description/
-- Date: MAR 11, 2026
-- Time taken: 20 minutes

/*
PROBLEM:
Detect study partterns and fin metrics from them


MY APPROACH:
- Several CTE to gt to the problem


KEY LEARNING:
-- CTE + LAG + WINDOW + EVERYTHING...

-- MY SOLUTION:
WITH ordered AS (
    SELECT
        ss.*,
        LAG(session_date) OVER (
            PARTITION BY student_id
            ORDER BY session_date
        ) AS prev_date
    FROM study_sessions ss
),
gaps AS (
    SELECT
        *,
        CASE
            WHEN prev_date IS NULL
            OR session_date - prev_date > 2
            THEN 1 ELSE 0
        END AS gap_flag
    FROM ordered
),
blocks AS (
    SELECT
        *,
        SUM(gap_flag) OVER (
            PARTITION BY student_id
            ORDER BY session_date
        ) AS block_id
    FROM gaps
),
numbered AS (
    SELECT
        *,
        ROW_NUMBER() OVER(
            PARTITION BY student_id, block_id
            ORDER BY session_date
        ) AS rn
    FROM blocks
),
cycles AS (
    SELECT
        a.student_id,
        a.block_id,
        MIN(b.rn - a.rn) AS cycle_length
    FROM numbered a
    JOIN numbered b
        ON a.student_id = b.student_id
        AND a.block_id = b.block_id
        AND a.subject = b.subject
        AND b.rn > a.rn
    GROUP BY a.student_id, a.block_id
),
valid_cycles AS (
    SELECT
        c.student_id,
        c.block_id,
        c.cycle_length
    FROM cycles c
    JOIN numbered n
        ON c.student_id = n.student_id
        AND c.block_id = n.block_id
    GROUP BY c.student_id, c.block_id, c.cycle_length
    HAVING
        c.cycle_length >= 3
        AND COUNT(*) >= c.cycle_length * 2
),
final_stats AS (
    SELECT
        v.student_id,
        v.cycle_length,
        SUM(n.hours_studied) AS total_study_hours
    FROM valid_cycles v
    JOIN numbered n
        ON v.student_id = n.student_id
        AND v.block_id = n.block_id
    GROUP BY v.student_id, v.cycle_length
)
SELECT
    s.student_id,
    s.student_name,
    s.major,
    f.cycle_length,
    f.total_study_hours
FROM final_stats f
JOIN students s
    ON s.student_id = f.student_id
ORDER BY
    cycle_length DESC,
    total_study_hours DESC;


-- RESULT: Accepted
-- Attempts: 1

-- MISTAKES I MADE (if any):
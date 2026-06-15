-- ============================================================
-- Interview Query — [Self JOINs and CROSS JOINs]
-- Section: [Medidum]
-- Date: 2026-06-15
-- ============================================================


/* ============================================================
   ✅ WHAT IT IS
   ============================================================ */
-- ⭐️ SELF JOIN : JOIN from a table to itself
-- ⭐️ CROSS JOIN : clause that returns all row combinations within two tables


/* ============================================================
   ✅ SYNTAX
   ============================================================ */
SELECT e.name as employee, m.name as manager
    FROM employees as e LEFT JOIN employees as m
    ON e.manager_id = m.id

-- use aliases to make sure which table we are referring to

SELECT cars.model, colors.color
FROM cars
CROSS JOIN colors;
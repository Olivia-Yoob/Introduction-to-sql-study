-- ============================================================
-- Interview Query — [ORDER BY and LIMIT]
-- Section: [Easy]
-- Date: 2026-06-11
-- ============================================================


/* ============================================================
   ✅ WHAT IT IS
   ============================================================ */
-- ⭐️ ORDER BY : order the rows in our table according to a specific column
-- ⭐️ LIMIT : limits the number of rows

/* ============================================================
   ✅ SYNTAX
   ============================================================ */
SELECT * FROM employees
ORDER BY salary DESC
LIMIT 3

-- Execution Order
SELECT first_name, SUM(salary)
FROM employees
    JOIN sales
    ON employees.id = sales_employeeID
WHERE salary > 7500 AND last_name != 'Williams'
GROUP BY employee.id
HAVING COUNT(*) > 1

ORDER BY salary DESC
LIMIT 5

1. FROM -> gets input tables
2. JOIN ~ ON -> Merges input tables
3. WHERE -> filters rows according to condition
4. GROUP BY -> Separated into smaller tables
5. HAVING -> filters smaller tables according to condition
6. SELECT -> selects the columns we need (and integrates smaller tables)
7. SUM() and aggregate functions or numerical operations performed on output
8. ORDER BY -> order rows 
9. LIMIT -> limits the number of rows returned

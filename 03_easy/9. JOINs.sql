-- ============================================================
-- Interview Query — [JOINs]
-- Section: [Easy]
-- Date: 2026-06-07
-- ============================================================


/* ============================================================
   ✅ WHAT IT IS
   ============================================================ */
-- data should not be duplicated across table
-- reduces unnecessary use of memory and limits the risk of data inconsistencies
-- we have to update the same information in two different places to reduce data inconsistencies
-- ⭐️ PRIMARY KEY : a unique identifier for each row
-- ⭐️ FOREIGN KEY : the column that references to the primary key of another table

/* ============================================================
   ✅ SYNTAX
   ============================================================ */

-- ⭐️ JOIN 
-- JOIN : matches rows of two different tables and appends them.
-- ON : specify the primary and foreign keyw with ON statement

SELECT * FROM employees
JOIN sales
    ON employees.id = sales.employee_id

SELECT s.id, e.name
FROM employees AS e
JOIN sales AS s
    ON s.employee_id = e.id

-- ⭐️ INNER JOIN
-- returns all rows that have a matching value in both tables

SELECT * FROM prices
INNER JOIN names
    ON prices.itemID = names.itemID

-- ⭐️ LEFT JOIN
-- keeps all rows that appear in the first table, if there is no matching value in the second table, the join will append empty cells

SELECT * FROM prices
LEFT JOIN names
    ON prices.itemID = names.itemID

-- ⭐️ RIGHT JOIN
-- keeps all the values in the second table, if there is no matching value in the fisrst table, the join will append empty cells instead.

SELECT * FROM prices
RIGHT JOIN names
    ON prices.itemID = names.itemID

-- ⭐️ OUTER JOIN
-- keeps all the rows that appeared on the first and second table
-- If any of them have no matching values in the other table, it completes the join with empty cells.

SELECT * FROM prices
OUTER JOIN names
    ON prices.itemID = names.itemID

/* ============================================================
   ✅ KEY POINTS
   ============================================================ */
-- FROM -> JOIN ~~ ON -> WHERE -> SELECT -> Aggregate functions and numerical operations performed on output



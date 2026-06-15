-- ============================================================
-- Interview Query — [SELECT and WHERE]
-- Section: [Easy]
-- Date: 2026-06-02
-- ============================================================


/* ============================================================
   ✅ WHAT IT IS
   ============================================================ */
-- SQL is a scalable language then other languages.
-- SELECT : statement that can retrieve data from tables
-- WHERE : specify which subset of rows SQL should retrieve from a particular table by providing a condition
-- AS : rename columns from certain tables with the keyword

/* ============================================================
   ✅ SYNTAX
   ============================================================ */

-- ⭐️ SELECT 
-- SELECT specific columns FROM a specific table
SELECT [columns] FROM [table]

-- ⭐️ WHERE
-- WHERE clause lets us filter(specify) the rows returned by SELECT statement
SELECT * FROM employees
WHERE salary >= 80000

/* ============================================================
   ✅ KEY POINTS
   ============================================================ */
-- 1. wildcard(*) : select all the columns from a specific table
SELECT * FROM employees

-- 2. AS : rename columns
SELECT id, 
   first_name AS name,
   last_name AS surname
FROM employees

-- 3. Filtering condition after the WHERE clause -> usual relationship
!=
=
<
>
<=
>=

-- 4. Logical connectors
NOT
AND
OR

SELECT first_name, last_name FROM employees
WHERE salary >= 80000 AND date_hired >= 2019-01-01

-- 5. Execution order
FROM -> gets the input table
WHERE -> Filters rows according to a condition
SELECT -> Selects the columns we need
AS -> Renames columns
-- ============================================================
-- Interview Query — [Subqueries and CTEs]
-- Section: [Medium]
-- Date: 2026-06-15
-- ============================================================


/* ============================================================
   ✅ WHAT IT IS
   ============================================================ */
-- ⭐️ Subqueries : One query builds an intermediate table that is easier to manipulate & Another query gets the solution from the intermediate table
-- ⭐️ Common Table Expressions and the WITH clause : include WITH clause to pre-declare more complicated subqueries called CTEs
-- let us query and name the intermediate tables before writing the queries that use them



/* ============================================================
   ✅ SYNTAX
   ============================================================ */
-- replacing the table name in a SQL query with another query enclosed by parenthesis ()
SELECT * FROM (<query>) AS <intermediate_table_name>

-- <(query)> : return an intermediate table ! always requires alias
-- Outer query : applied to it

-- find single values and also use them in other queries
SELECT price - (SELECT AVG(price) FROM products) FROM products


WITH
    <CTE_name1> AS (<query1>),
    <CTE_name2> AS (<query2>)
SELECT * FROM CTE_name1 JOIN CTE_name2


## Common Use cases for subqueries

-- 1) Use with WHERE and IN
WITH
    selected_countries AS (SELECT Country FROM ...)
SELECT * FROM Customers
WHERE Country IN selected_countries


-- 2) Use with GROUP BY 
-- IF we want to know the sum of the salaries of the top-performing employees in each department

-->> Use a GROUP BY to find the max salaries for each dept.
-->> Add all the max salaries found with SUM as an aggregate function.

WITH max_salaries AS
    (SELECT MAX(salary) AS max_salary FROM employees
    GROUP BY department_id)

SELECT SUM(max_salary) FROM max_salaries


-- 3) Use to Get Single Metrics
-- IF we want to find all the songs that performed better than avg, we would need the avg amount of plays in order to filter the rest of the songs. 

SELECT title, album, artist, plays FROM songs
WHERE plays > (SELECT AVG(plays) FROM songs)

-- (SELECT AVG(plays) FROM songs) returns a single numeric value
-- ============================================================
-- Interview Query — [Aggregate Functions]
-- Section: [Easy]
-- Date: 2026-06-07
-- ============================================================


/* ============================================================
   ✅ WHAT IT IS
   ============================================================ */
-- SQL lets you process the data of the tables you retrieve.
-- AVG : returns the mean of the values in the column
-- SUM : returns the sum of the values in the column
-- COUNT : returns the number of values in the column 
-- MAX : returns the highest or alphabetically last value in a column
-- MIN : returns the lowerst or alphabetivally first values in a column

/* ============================================================
   ✅ SYNTAX
   ============================================================ */


SELECT MIN(price) AS lowest_price FROM products

SELECT MIN(name) FROM products -- also work for alphabetical orders

SELECT price + 5 AS price_plus_shipping FROM products

SELECT id, name, price * 0.8 AS price_with_discount FROM products


/* ============================================================
   ✅ KEY POINTS
   ============================================================ */

FROM -> WHERE -> AND -> SELECT -> SUM, COUNT, +, * 
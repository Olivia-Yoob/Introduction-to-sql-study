-- ============================================================
-- Interview Query — [GROUP BY and HAVING]
-- Section: [Easy]
-- Date: 2026-06-11
-- ============================================================


/* ============================================================
   ✅ WHAT IT IS
   ============================================================ */
-- ⭐️ GROUP BY 
-- 1. divide our table into smaller tables according to a single column
-- 2. perform an aggregate function over each of them
-- 3. Integrate the results into a single table again

-- ⭐️ HAVING
-- filter the groups made by GROUP BY (works similarly to the WHERE clause, but it's applied to groups instead of single rows)


/* ============================================================
   ✅ SYNTAX
   ============================================================ */
SELECT employeeID, SUM(amount) AS total_sold
FROM employees
WHERE employeeID = 1 -- filters the sales done by the first employee
-- GROUP BY employeeID

-- Total amount sold for employees who performed more than one sale

SELECT employeeID,
    SUM(amount) AS total_sold
FROM employees
GROUP BY employeeID
HAVING COUNT(*) > 1


SELECT first_name, SUM(salary)
FROM employees
JOIN sales
    ON employees.id = sales.employeeID
WHERE salary > 7500 AND last_name != 'Williams'
GROUP BY employees.id -- first_name 도 넣는게 정석이기는 함. 하지만 만약 id 가 기본키라면 각 그룹의 name 도 하나만 결정되므로 생략 가능
HAVING COUNT(*) > 1

-- Execution Order
1. FROM -> Gets input tables
2. JOIN ~ ON -> Merges input tables
3. WHERE -> Filters rows according to condition
4. GROUP BY -> Separates into smaller tables
5. HAVING -> Filters smaller tables according to condition
6. SELECT -> Selects the columns we need (and integrates smaller tables)
7. SUM() and aggregate functions or numerical operations performed on output


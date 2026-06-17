/* ============================================================
   📝 PROBLEM 1: [Employee Salaries - etl problem]
   Source: Interview Query — [Medium]
   Date: 2026-06-17
   ============================================================ */

-- Due to an ETL error, the employees table, instead of updating the salaries every year when doing compensation adjustments, did an insert instead. The head of HR still needs the current salary of each employee.
-- Write a query to get the current salary for each employee.
-- @ Note: Assume no duplicate combination of first and last names (I.E. No two John Smiths). Assume the INSERT operation works with ID autoincrement.

/* 🧪 MY ATTEMPT (정답 보기 전 시도) */

SELECT first_name, last_name, salary 
FROM employees
GROUP BY (first_name AND last_name) -- didn't work bc it's a logical operator "AND", so return a TRUE or FALSE value -> first_name, last_name
HAVING id = MAX(id) -- Cannot compare an aggregated value with a non-aggregated column in a grouped query

--> Don't know which salary of row to retrieve
--> GROUP BY 이후에는 집계된 값과 개별 row 비교 불가능

/* ✅ SOLUTION */

SELECT first_name, last_name, MAX(id) AS max_id
FROM employees
GROUP BY 1,2

-- we can re-join it to the original table in a subquery to then get the correct salary associated with the id in the sub query

SELECT e.first_name, e.last_name, e.salary
FROM employees AS e
INNER JOIN (
    SELECT first_name, last_name, MAX(id) AS max_id
    FROM employees
    GROUP BY 1,2
) AS m
ON e.id = m.max_id

-- 그 MAX(ID)를 참조하는 salary 가져옴

/* 💭 REFLECTION */
-- 🤜 Current salary, latest record, most recent row, newest entry 
--> GROUP BY person -> MAX(id) or MAX(created_at) -> JOIN back

/* 🎓 Practice Question */
-- For each employee, return their current (most recent) salary based on updated_at

SELECT s.employee_id, s.salary, s.updated_at
FROM employee_salaries AS s 
INNER JOIN (
    SELECT employee_id, MAX(updated_at) AS max_date
    FROM employee_salaries
    GROUP BY employee_id
) as i
ON s.employee_id = i.employee_id
AND s.updated_at = i.max_date
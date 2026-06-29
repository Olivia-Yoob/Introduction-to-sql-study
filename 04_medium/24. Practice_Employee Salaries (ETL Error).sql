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






/* 🧪 MY ATTEMPT #2 for review (0629) */

1) many rows

2) 
FROM employees

3) no conditions

4) 
GROUP BY first_name, last_name

5)
MAX(id)

6) 

7) 

8)

SELECT first_name, last_name, salary
FROM employees
GROUP BY first_name, last_name
-- 무슨 행을 가져올지 모르겠어요


SELECT e.first_name, e.last_name, e.salary
FROM employees e INNER JOIN (
    SELECT first_name, last_name, MAX(id) AS max_id
    FROM employees
    GROUP BY first_name, last_name
) m 
ON e.id = m.max_id

/* ⭐️ KEY TAKEAWAYS (latest-row-per-group pattern) — 0629 */

-- 1) PATTERN: "current / latest / most recent / newest / highest row per group"
--    -> Find WHICH row it is with MAX(id) or MAX(date), then JOIN back to the original table.
--    The value I want (salary) isn't computed — it already lives in a row,
--    so I must pin down the row first, then read the value off it.

-- 2) WHY a single GROUP BY + SELECT salary FAILS:
--    GROUP BY collapses all rows of a person into ONE blurred group.
--    The group holds many salaries (50k, 60k, 70k) -> SQL can't pick one.

-- 3) WHY HAVING DOESN'T WORK (e.g. HAVING id = MAX(id)):
--    HAVING runs AFTER GROUP BY, on the collapsed group level.
--    MAX(id) is fine (group-level), but a bare `id` no longer exists —
--    the individual rows were already blurred away.
--    -> Cannot compare an aggregated value with a non-aggregated column.

-- 4) WHERE vs HAVING:
--    WHERE  = filters individual ROWS  (before GROUP BY)
--    HAVING = filters GROUPS/aggregates (after GROUP BY)
--    Picking one specific row INSIDE a group = neither -> JOIN back.

-- 5) WHY INNER JOIN (not LEFT):
--    Goal is to KEEP only the matching (latest) row and DROP the rest.
--    INNER = keep matches only. LEFT would keep old rows too -> wrong answer.

-- ⚙️ Self-check when stuck:
--    "Can I select the value directly, or must I first decide WHICH row?"
--    If "which row" -> MAX(...) to pin the row -> INNER JOIN back.


Q1. 최신 행을 물어봐서 그 최신 행의 id 찾아서 셀프 조인 하는 방식
SELECT t.user_id, t.amount 
FROM transactions t JOIN (
    SELECT user_id, MAX(created_at) AS max_date
    FROM transactions
    GROUP BY user_id
) m
    ON t.userid = m.userid
    AND t.created_at = m.max_date
    
Q2. 집계의 집계 구조 

SELECT num_of_posts, COUNT(*) AS number_of_users
    FROM (SELECT user_id, COUNT(*) AS num_of_posts
    FROM num_of_posts
    GROUP BY user_id)
GROUP BY num_of_posts

/* 1. Get the average salary of each department.

2. Find how many departments have the same average salary.

3. Get the name of the employee with the highest salary.*/
SELECT name
FROM employees
WHERE salary = MAX(salary)

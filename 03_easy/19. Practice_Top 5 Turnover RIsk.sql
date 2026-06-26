/* ============================================================
   📝 PROBLEM 7: [Top 5 Turnover Risk]
   Source: Interview Query — [Easy]
   Date: 2026-06-11
   ============================================================ */

-- find the five lowest-paid employees who have completed at least three projects
-- completed pjts = have an end date (END_DT IS NOTNULL)

/* 🧪 MY ATTEMPT (정답 보기 전 시도) */

SELECT p.employee_id
FROM employees e 
    LEFT JOIN projects p
        ON e.id = p.employee_id
WHERE End_dt IS NOT NULL
GROUP BY p.employee_id
HAVING COUNT(*) >= 3
ORDER BY e.salary ASC
LIMIT 5

/* ✅ SOLUTION */

SELECT p.employee_id
FROM employees e
INNER JOIN projects p -- all employees who completed three projects completed at least one, 근데 end_dt 가 null 일수도 있지 않나?
GROUP BY e.id
HAVING COUNT(p.End_dt) >= 3
ORDER BY e.salary ASC
LIMIT 5

/* 💭 REFLECTION */
-- COUNT() do not count null
-- Primary Key로 grouping is more convenient
-- LEFT JOIN -> JOIN : WHERE End_dt IS NOT NULL 를 쓰는 순간 직원이 없는 사람은 어차피 제거 
-- Can't delete NULL with INNER JOIN, but can filter NULL rows with COUNT() operation

-- 👉 Default in practice = the HAVING approach is more standard and cleaner.
-- 👉 Using WHERE + HAVING is more explicit and shows the step-by-step reasoning process.



/* 🧪 MY ATTEMPT #2 for review (0626) */
1) 5 rows

2) 
FROM employees e JOIN projects p
ON e.id = p.employee_id

3) who have completed at least three projects
-- WHERE p.END_dt >= 3 
-- WHERE 가 아니라 HAVING (개수를 센 결과에 대한 조건이기 때문에)

4) 
-- GROUP BY e.employee_id
GROUP BY e.id

5) 
COUNT(p.project_id) AS project_num

6) 
-- Not needed
HAVING COUNT(p.End_dt) >= 3 -- COUNT는 NULL을 세지 않는다


7) 
/* WITH project_num AS(
    SELECT e.employee_id, COUNT(p.project_id) AS pjt_cnt
    FROM employees e JOIN projects p
    ON e.id = p.employee_id
    GROUP BY e.employee_id
) */

-- 이 문제에서는 CTE 필요 없었음. 

8)
SELECT e.employee_id

9) 
-- ORDER BY project_num DESC LIMIT 5
ORDER BY project_num ASC LIMIT 5


/* FROM employees e JOIN projects p
ON e.id = p.employee_id
WHERE p.END_dt >= 3
ORDER BY pm.pjt_cnt DESC LIMIT 5 */

SELECT e.id AS employee_id
FROM employees e 
JOIN projects p ON e.id = p.employee_id
GROUP BY e.id
HAVING COUNT(p.END_dt) >= 3
ORDER BY e.salary ASC
LIMIT 5

-- 😭 "~개 이상/이하" + 그게 집계(COUNT/SUM)면 → HAVING
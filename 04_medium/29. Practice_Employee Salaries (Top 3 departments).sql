/* ============================================================
   📝 PROBLEM 5: [Employee Salaries]
   Source: Interview Query — [Medium]
   Date: 2026-07-01
   ============================================================ */

-- select the top 3 departments with at least ten employees and rank them according to the percentage of their employees making over 100K in salary.

/* 🧪 MY ATTEMPT (정답 보기 전 시도) */
0) top 3 dept, 
at least ten employess, 
rank them, 
percentage of their employees, 
making over 100k in salary

1) 3 rows 


2) employees & departments table
salary in employees & name in departments

FROM employees e JOIN departments d
ON e.department_id = d.id

3) 
-- ❌ WHERE COUNT(e.id) > = 10
-- where는 행 하나 보고 판단하는거고 having은 모아서 센 값 (집계)
-- 집계함수가 들어가는 조건은 where에 못쓴다, group by 에 카운트가 생김

4) 
GROUP BY d.id

5) 
SUM(CASE WHEN salary > 100000 THEN 1 ELSE 0 END) / COUNT(*)

6) HAVING COUNT(*) >= 10

9) ORDER BY ... DESC LIMIT 3


SELECT SUM(CASE WHEN salary > 100000 THEN 1 ELSE 0 END) / COUNT(*) AS percentage_over_100k,
   d.name AS department_name, 
   COUNT(*) AS number_of_employees
FROM employees e 
JOIN departments d
ON e.department_id = d.id
GROUP BY d.id, d.name
HAVING COUNT(*) >= 10
ORDER BY percentage_over_100k DESC
LIMIT 3
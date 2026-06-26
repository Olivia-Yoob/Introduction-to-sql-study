/* ============================================================
   📝 PROBLEM 4: [Total Salary]
   Source: Interview Query — [Easy]
   Date: 2026-06-07
   ============================================================ */

-- get the total salary of all employees

/* 🧪 MY ATTEMPT (정답 보기 전 시도) */
SELECT SUM(salary) AS total_salary
FROM employees


/* ✅ SOLUTION */
SELECT SUM(salary) AS total_salary
FROM employees


/* 🧪 MY ATTEMPT #2 for review (0626) */
-- get the total salary of all employees
1) one row or many rows? : one row
2) How many tables? need a JOIN? : one table, no JOIN needed
3) Any conditions? : NO
4) Group by? : NO
5) Aggregate? : SUM
6) Filter or aggregate (HAVING) : NO
7) Compare against an aggregate? : NO
8) OUTPUT columns + Aliases? : total salary of all employees / total_salary
9) sort/limit count? : NO

SELECT SUM(salary) AS total_salary
FROM employees
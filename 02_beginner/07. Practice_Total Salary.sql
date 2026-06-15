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

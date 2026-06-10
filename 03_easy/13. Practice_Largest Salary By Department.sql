/* ============================================================
   📝 PROBLEM 3: [Largest Salary by dept]
   Source: Interview Query — [Easy]
   Date: 2026-06-11
   ============================================================ */

-- get the largest salary of any employee by department

/* 🧪 MY ATTEMPT (정답 보기 전 시도) */
SELECT department, MAX(salary) AS largest_salary
FROM employees
GROUP BY department

/* ✅ SOLUTION */
SELECT department, MAX(salary) AS largest_salary
FROM employees
GROUP BY department

/* 💭 REFLECTION */
-- the larget salary -> MAX()
-- by department -> GROUP BY
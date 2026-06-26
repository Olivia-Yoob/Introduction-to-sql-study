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


/* 🧪 MY ATTEMPT #2 for review (0626) */

1) one row by each department

2) one table
FROM employees

3)  Not needed

4) by department
GROUP BY department

5) largest salary
MAX(salary)

6) Not needed

7) Not needed

8) 
SELECT department, MAX(salary) AS largest_salary

9) Not needed

SELECT department, MAX(salary) AS largest_salary
FROM employees
GROUP BY department


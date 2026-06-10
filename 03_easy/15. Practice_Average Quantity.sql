/* ============================================================
   📝 PROBLEM 4: [Average Quantity]
   Source: Interview Query — [Easy]
   Date: 2026-06-11
   ============================================================ */

-- find the average quantity of each product purchased per transaction each year

/* 🧪 MY ATTEMPT (정답 보기 전 시도) */

SELECT year, AVG(quantity) AS avg_quantity
FROM transactions
GROUP BY YEAR(created_at)


/* ✅ SOLUTION */
SELECT department, MAX(salary) AS largest_salary
FROM employees
GROUP BY department

/* 💭 REFLECTION */
-- the larget salary -> MAX()
-- by department -> GROUP BY
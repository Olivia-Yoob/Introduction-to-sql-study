/* ============================================================
   📝 PROBLEM 4: [Average Quantity]
   Source: Interview Query — [Easy]
   Date: 2026-06-11
   ============================================================ */

-- find the average quantity of each product purchased per transaction each year
-- sorted by year and product_id in ascending order
-- avg_quantity should be rounded to two decimal places.

/* 🧪 MY ATTEMPT (정답 보기 전 시도) */

SELECT year, product_id, AVG(quantity) AS avg_quantity
FROM transactions
GROUP BY product_id, YEAR(created_at) AS year


/* ✅ SOLUTION */
SELECT YEAR(created_at) AS year, 
    product_id,
    ROUND(AVG(quantity), 2) AS avg_quantity
FROM transactions
GROUP BY YEAR(created_at), product_id
ORDER BY year, product_id

/* 💭 REFLECTION */
-- can't use AS in GROUP BY clause, only in SELECT clause
-- SELECT YEAR(created_at) AS year 추가 필요
-- miss ROUND() condition
-- 요구사항 꼼꼼하게 파악하기



/* 🧪 MY ATTEMPT #2 for review (0626) */

1) many rows
2) one table
FROM transactions

3) Not needed

4) of each product purchased per transaction each year
GROUP BY YEAR(created_at), product_id

5) the average quantity
AVG(quantity)

6) Not needed

7) Not needed

8) 
SELECT YEAR(created_at) AS year, product_id, ROUND(AVG(quantity),2) AS avg_quantity

9) sorted by year and product_id in ascending order
ORDER BY YEAR(created_at), product_id


SELECT YEAR(created_at) AS year, product_id, ROUND(AVG(quantity),2) AS avg_quantity
FROM transactions
GROUP BY YEAR(created_at), product_id
ORDER BY year, product_id -- last part of the SQL execution

/* ============================================================
   📝 PROBLEM 4: [Customer Orders]
   Source: Interview Query — [Medium]
   Date: 2026-06-19
   ============================================================ */

-- Write a query to identify customers who placed more than three transactions each in both 2019 and 2020.

/* 🧪 MY ATTEMPT (정답 보기 전 시도) */

SELECT u.name AS customer_name
FROM transactions t JOIN users u
    ON t.id = u.id

CASE
    WHEN t.created_at >= "2019.01.01 00:00:00" AND t.created_at < "2021.01.01 00:00:00" THEN COUNT(quantity) > 3


/* ✅ SOLUTION */




/* 📝 REFLECTION */

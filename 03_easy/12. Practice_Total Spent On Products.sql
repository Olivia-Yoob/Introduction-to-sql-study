/* ============================================================
   📝 PROBLEM 2: [Total Spent on Products]
   Source: Interview Query — [Easy]
   Date: 2026-06-11
   ============================================================ */

-- get the total amount spent on each item in the purchase table by users registered in 2022

/* 🧪 MY ATTEMPT (정답 보기 전 시도) */

SELECT purchases.item, SUM(price) AS total_amount_spent
FROM users JOIN purchases
    ON users.user_id = purchases.user_id
WHERE users.registration_date LIKE '2022%'
GROUP BY purchases.item


/* ✅ SOLUTION */
SELECT p.item, SUM(price) AS total_amount_spent
FROM purchases p
JOIN users u ON p.user_id = u.user_id
WHERE YEAR(u.registration_date) = '2022'
GROUP By p.item

/* 💭 REFLECTION */
-- both conditions are needed, so we need to use INNER JOIN
-- LIKE 방식은 날짜 타입을 문자열처럼 처리하는 방식이므로, 날짜 관련 조건은 YEAR() 나 날짜 범위 조건을 사용하는 것이 더 명확
-- select the function that fits with column type
WHERE registration_date >= '2022-01-01'
    AND registration_date < '2023-01-01'
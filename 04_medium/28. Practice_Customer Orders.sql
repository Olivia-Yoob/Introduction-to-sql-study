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
/* 
STEP 1. WHAT & HOW : Retrieve customer name
=> user.name must be the result,so need to JOIN with transactions table

STEP 2. JOIN KEY? 
=> transactions.user_id = users.id

STEP 3. more then three transactions 
=> aggregate function
=> GROUP BY customers + COUNT / SUM

STEP 4. "both 2019 and 2020"
=> 두 해를 합치는게 아니라, 각 해를 따로 세서 둘 다 3이 초과하는지
=> 조건부 집계를 통해 연도별 카운트를 분리해야 함
SUM (CASE WHEN YEAR = 2019 THEN 1 ELSE 0 END)
SUM (CASE WHEN YEAR = 2020 THEN 1 ELSE 0 END)

STEP 5. 집계 결과로 거르기 
=> WHERE X, HAVING O
HAVING 2019 COUNT > 3 AND 2020 COUNT > 3

*/

SELECT u.name AS customer_name
FROM transactions t JOIN users u 
    ON t.user_id = u.id
GROUP BY u.id, u.name
HAVING SUM(CASE WHEN YEAR(t.created_at) = 2019 THEN 1 ELSE 0 END) > 3
    AND SUM(CASE WHEN YEAR(t.created_at) = 2020 THEN 1 ELSE 0 END) > 3


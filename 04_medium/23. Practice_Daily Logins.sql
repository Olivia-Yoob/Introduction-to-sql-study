/* ============================================================
   📝 PROBLEM 1: [Daily Logins]
   Source: Interview Query — [Medium]
   Date: 2026-06-17
   ============================================================ */

-- Calculate how many users logged in an identical number of times on Jan 1st,2022
-- 주문 횟수가 같은 고객들이 몇 명씩 있는지 구해라

/* 🧪 MY ATTEMPT (정답 보기 전 시도) */

SELECT COUNT(login_date) AS number_of_logins, COUNT(DISTINCT user_id) AS number_of_users
FROM user_logins
WHERE DATE_FORMAT(login_date,"%d-%m-%y") = "01-01-2022"
GROUP BY user_id

--> Just calculate the number of logins by each users


/* ✅ SOLUTION */

* 로그인 횟수별 사용자 수 계산
-- 1) How many logins each user had on Jan 1st 2022 
-- 2) additional grouping based on the subquery

SELECT number_of_logins, COUNT(*) AS number_of_users 
FROM    
    (SELECT user_id, COUNT(*) AS number_of_logins
        FROM user_logins
    WHERE login_date >= '2022-01-01 00:00:00'
        AND login_date < '2022-01-02 00:00:00'
    GROUP BY user_id
    )   
GROUP BY number_of_logins

/* 💭 REFLECTION */
-- 🤜 use > and <= or <= and > to filter date rows
-- 🤜 understand the question precisely
-- 🤜 COUNT(*) = number of rows that include in a specific group
-- Same results with COUNT(user_id)

-- ⭐️ Pattern : How many users logged in an identical number of times?
--> user별 로그인 횟수 계산 -> 로그인 횟수별 user 수 계산
--> 집계한 결과를 다시 집계해야 하는 문제
--> QType : COUNT | FREQUENCY -> USE subqueries! (GROUP BY -> sub -> GROUP BY)

/* 🎓 Practice Question */

* Calculate how many customers places an identical number of orders on January 1st, 2022.

1) Count number of orders on Jan 1st,2022 by each customers
2) Find the number of customers who have identical number of orders

SELECT number_of_orders, COUNT(*) AS number_of_customers -- 3) and count number of customers by each group
FROM
    (SELECT customer_id, COUNT(*) AS number_of_orders -- 1) count number of orders on jan 1 2022, group by each customers
    FROM orders
    WHERE order_date >= "2022-01-01 00:00:00"
        AND order_date < "2022-01-02 00:00:00"
    GROUP BY customer_id
    )
GROUP BY number_of_orders -- 2) group by counts of orders 


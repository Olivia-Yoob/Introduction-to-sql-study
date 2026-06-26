/* ============================================================
   📝 PROBLEM 6: [Session Difference]
   Source: Interview Query — [Easy]
   Date: 2026-06-11
   ============================================================ */

-- get the number of days between each user's first session and last session for the year 2020.

/* 🧪 MY ATTEMPT (정답 보기 전 시도) */

SELECT user_id, DAY(MAX(created_at) - MIN(created_at)) AS no_of_days
FROM user_sessions
WHERE YEAR(created_at) = '2020'
GROUP BY user_id


/* ✅ SOLUTION */
SELECT user_id,
DATEDIFF(MAX(created_at), MIN(created_at)) AS no_of_days
FROM user_sessions
WHERE YEAR(created_at) = 2020
GROUP BY user_id 


/* 💭 REFLECTION */
-- DAY() extracts the day part of a date, while DATEDIFF() calculates the numnber of days between two dates.
-- 2020 을 써야 함


/* 🧪 MY ATTEMPT #2 for review (0626) */
1) many rows
2) 
FROM user_sessions

3) 
-- WHERE YEAR(created_at) = '2020'
WHERE YEAR(created_at) = 2020

4)
GROUP BY user_id

5) 
-- DAY(MAX(created_at) - MIN(created_at))
DATEDIFF(MAX(created_at),MIN(created_at))

6) N

7) N

8) 
-- SELECT user_id, DAY(MAX(created_at) - MIN(created_at)) AS no_of_days
SELECT user_id, DATEDIFF(MAX(created_at),MIN(created_at)) AS no_of_days

9) N

SELECT user_id, DATEDIFF(MAX(created_at),MIN(created_at)) AS no_of_days
FROM user_sessions
WHERE YEAR(created_at) = 2020
GROUP BY user_id

-- HAVING 을 쓰는 경우 -> 계산한 결과(집계값)을 보고, 어떤 그룹은 결과에서 빼야 하나? 일때, Y면 HAVING & N이면 HAVING 아님.
-- ex. 기간이 30일 넘는 유저만 보여줘 = 계산된 일수를 보고 30 이하인 유저 빼야 함
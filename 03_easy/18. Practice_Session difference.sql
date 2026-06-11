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
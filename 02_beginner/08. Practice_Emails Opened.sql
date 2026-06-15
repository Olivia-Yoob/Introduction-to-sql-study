/* ============================================================
   📝 PROBLEM 5: [Emails Opened]
   Source: Interview Query — [Easy]
   Date: 2026-06-07
   ============================================================ */

-- how many users have opened an email

/* 🧪 MY ATTEMPT (정답 보기 전 시도) */

SELECT COUNT(user_id) AS num_users_open_email
FROM events
WHERE action = 'email_opened'


/* ✅ SOLUTION */
SELECT COUNT(DISTINCT user_id) AS num_users_open_email
FROM events
WHERE action = 'email_opened'

/* 💭 REFLECTION */

    1) How many users
    2) Number of customers
    3) Unique visitors
    4) Distinct users
→ COUNT(DISTINCT column)

    1) How many events
    2) How many orders
    3) How many clicks
    4) How many opens
→ COUNT(*) 또는 COUNT(column)
-- 사람 수를 세면 DISTINCT , 이벤트 수를 새면 그냥 수 세기
/* ============================================================
   📝 PROBLEM 2: [Like Tracker]
   Source: Interview Query — [Easy]
   Date: 2026-06-04
   ============================================================ */

-- What query would you write to determine how many different users gave a like on June 6, 2020?
-- events table
-- diff users -> DISTINCT
-- like on June 6, 2020 -> WHERE

/* 🧪 MY ATTEMPT (정답 보기 전 시도) */
SELECT COUNT(DISTINCT user_id) AS num_users_gave_like
FROM events
WHERE action = 'like'
    AND created_at LIKE '2020-06-06%'

-- 실무에서는 LIKE 보다는 날짜 비교를 사용하는 편이 좋음

/* ✅ SOLUTION */
SELECT COUNT(DISTINCT user_id) AS num_users_gave_like
FROM events
WHERE action = 'like'
    AND created_at >= '2020-06-06'
    AND created_at < '2020-06-07';


/* 💭 REFLECTION */
-- 인덱스를 활용하기 쉽고, DBMS에 덜 의존적
-- 서로 다른 사용자 수 구하기 이니까 DISTINCT 사용
-- -- ✅ 날짜 비교: 인덱스 사용 가능
WHERE created_at >= '2020-06-06' AND created_at < '2020-06-07'
-- → DB가 정렬된 인덱스에서 "06-06 시작 지점" 바로 찾아서 그 구간만 스캔

-- ❌ LIKE: 인덱스 못 쓰는 경우 많음
WHERE created_at LIKE '2020-06-06%'
-- → DB가 datetime을 문자열로 변환 후 패턴 매칭
-- → 모든 행을 다 검사해야 할 수도 있음 (full table scan)

-- 1. DISTINCT: "서로 다른 X 개수" 키워드 → COUNT(DISTINCT col)
-- 2. 날짜 필터: LIKE 대신 범위 비교
--    이유 ① 인덱스 활용 가능 → 성능 ↑
--         ② 암묵적 형변환 없음 → 안정성 ↑
--         ③ 의도가 명확 → 가독성 ↑
-- 3. 반열린 구간 [start, end): >= 시작 AND < 다음날


/* 💡 TRIGGER */
-- "특정 날짜 하루치 데이터" 필터
--   → WHERE col >= '날짜' AND col < '다음날'
--   (NOT LIKE, NOT BETWEEN)
--
-- "서로 다른 X 개수" 
--   → COUNT(DISTINCT col)
--
-- WHY: 함수로 컬럼 감싸거나 LIKE 쓰면 인덱스 못 씀

-- Three reasons. 
-- First, range comparison can use indexes on datetime columns, while LIKE typically triggers a full table scan. 
-- Second, it avoids implicit type conversion between datetime and string. 
-- Third, the intent is more explicit — anyone reading the query immediately knows it's a date range.


/* 🧪 MY ATTEMPT #2 for review (0625) */
-- how many differernt users / gave a like / on June 6,2020
-- nums_users_gave_like

SELECT COUNT(DISTINCT user_id) AS num_users_gave_like
FROM events
WHERE action = 'like' 
    AND created_at < '2020-06-07'
    AND created_at >= '2020-06-06'

/* ============================================================
   📝 PROBLEM 1: [Select All Flights]
   Source: Interview Query — [Easy]
   Date: 2026-06-04
   ============================================================ */
 
-- Write a SQL query to list all flights scheduled between Mumbai ('BOM') and Delhi ('DEL') that use an aircraft whose capacity is greater than the average capacity of all aircrafts in the database.
-- BETWEEN 'BOM' AND 'DEL'
-- capacity > AVG(capacity) 

-- 테이블 스키마: flights , aircrafts
 
/* 🧪 MY ATTEMPT (정답 보기 전 시도) */
SELECT origin, destimnation, departure_time, model, 
    CASE capacity > AVG(capacity) THEN capacity
FROM flights
JOIN aircrafts
    ON flights.aircraft_id = aircrafts.aircraft_id
WHERE origin IN ('BOM', 'DEL') 
    AND destination IN ('BOM', 'DEL') 
 
-- 전체 평균을 어떻게 구하는지
AVG(capacity)
 
/* ✅ SOLUTION 오류 */
SELECT origin, destination, departure_time, model,
    CASE 
        WHEN capacity > (
            SELECT AVG(capacity)
            FROM aircrafts
        ) THEN capacity
        ELSE NULL
    END AS above_avg_capacity
FROM flights
JOIN aircrafts
    ON flights.aircraft_id = aircrafts.aircraft_id
WHERE (origin = 'BOM' AND destination = 'DEL')
    OR (origin = 'DEL' AND destination = 'BOM')
 
-- 내가 한 오류 1 : 조건을 CASE에 쓰려고 했는데,  
-- 내가 한 오류 2 : IN

 /* ✅ SOLUTION */
SELECT 
    f.origin,
    f.destination,
    DATE_FORMAT(departure_time, '%Y-%m-%d %H:%i') AS departure_time,
    a.model,
    a.capacity
FROM flights f
JOIN aircrafts a
    ON f.aircraft_id = a.aircraft_id
WHERE (
        (f.origin = 'BOM' AND f.destination = 'DEL')
    OR  (f.origin = 'DEL' AND f.destination = 'BOM')
    )
    AND a.capacity > (
        SELECT AVG(capacity)
        FROM aircrafts
    );


/* 💭 REFLECTION */
-- 1. CASE vs WHERE 차이를 헷갈림
--    - WHERE: 행을 걸러냄
--    - CASE:  값을 조건부 표시 (필터링 X)
--
-- 2. IN의 함정
--    - IN ('BOM','DEL') AND IN ('BOM','DEL')는 BOM→BOM도 포함
--    - 양방향 경로는 OR로 묶어야 정확
--
-- 3. 전체 평균은 subquery로
--    - WHERE col > (SELECT AVG(col) FROM table)
-- ❌ 이렇게 안 됨
-- WHERE capacity > AVG(capacity) : AVG는 "여러 행을 하나로 합치는" 함수, 근데 WHERE는 "한 행씩 검사하는" 단계



/* 💡 TRIGGER */
-- "전체 평균보다 ___" 문제 → WHERE col > (SELECT AVG(col) FROM ...)
-- "양방향 경로" (A↔B)     → WHERE (orig=A AND dest=B) OR (orig=B AND dest=A)
-- 조건이 "필터"인가 "표시"인가 먼저 구분 → 필터=WHERE / 표시=CASE


/* 🔖 함수 메모: DATE_FORMAT */
-- DATE_FORMAT(column, format)
-- %Y: 4자리 연도 (2026)
-- %m: 월 (06)
-- %d: 일 (04)
-- %H: 시 24시간 (15)
-- %i: 분 (30)
-- %s: 초 (45)

/* 상황쓰는 것한 행씩 거르기 (개별 값 비교) WHERE
한 행씩 거르는데 전체 집계값과 비교 WHERE + subquery 
⭐그룹별 집계 후 그룹 거르기 GROUP BY + HAVING */


/* 🧪 MY ATTEMPT #2 for review (0625) */ 
-- Write a SQL query to list all flights scheduled between Mumbai and Delhi that use an aircraft whose capacity is greater than the average capacity of all aircrafts in the database.

-- #1 Split chunk 
-- list all flights
SELECT 

-- scheduled between Mumbai and Delhi 
-- BOM -> DEL / DEL -> BOM

-- that use an aircraft
flights JOIN aircraft

-- whose capacity is greater than 
WHERE capacity > ** 

-- the average capacity of all aircrafts
AVG()
all aircrafts -> subquery?


-- #2 Summarize Question to one sentence
🤜 뭄바이-델리 항공편 중 전체 평균 수용인원보다 큰 비행기를 사용하는 항공편 조회하기

-- #3 SQL 
1) Result coulmn should be 'origin', 'destination', 'departure_tiume', 'model', 'capacity'
2) How many tables? -> flights JOIN aircrafts
3) conditions -> WHERE BOM & DEL 
4) aggregation -> average AVG()
5) compare with the results of aggregation -> capacity > average

-- #4 classify types
JOIN / WHERE / AVG / subquery


-- ⭐️ My attempts 
SELECT flights.origin, flights.destination, DATE_FORMAT(flights.departure_time, '%Y-%m-%d %H:%i') AS departure_time, aircrafts.model, aircrafts.capacity
FROM flights JOIN aircrafts
ON flights.aircraft_id = aircrafts.aircraft_id
WHERE (
    (flights.origin = 'BOM' and flights.destination = 'DEL') 
    OR (flights.origin = 'DEL' and flights.destination = 'BOM') 
)
-- 추가
AND aircrafts.capacity >
(
    SELECT AVG(capacity)
    FROM aircrafts
)

-- What I missed 
*) compare with the results of aggregation -> capacity > average

-> AVG is aggregation function !
-> calculate average first, and compare that average with each rows.

SELECT AVG(capacity)
FROM aircrafts

*) datetime results

DATE_FORMAT(flights.departure_time, '%Y-%m-%d %H:%i') AS departure_time

-- ⭐️ My attempts 2
-- capacity > AVG(capacity), so need to calculate AVG first. -> make average first by using CTE 
-- To compare average and each rows, use CROSS JOIN

WITH avg_capacity AS
(
    SELECT AVG(capacity) AS avg_cap
    FROM aircrafts
)
SELECT flights.origin, flights.destination, DATE_FORMAT(flights.departure_time, '%Y-%m-%d %H:%i') AS departure_time, aircrafts.model, aircrafts.capacity
FROM flights JOIN aircrafts
ON flights.aircraft_id = aircrafts.aircraft_id
CROSS JOIN avg_capacity
WHERE (
    (flights.origin = 'BOM' and flights.destination = 'DEL') 
    OR (flights.origin = 'DEL' and flights.destination = 'BOM') 
)
AND aircrafts.capacity > avg_capacity.avg_cap


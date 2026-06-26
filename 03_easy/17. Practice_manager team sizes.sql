/* ============================================================
   📝 PROBLEM 5: [Manager team sizes]
   Source: Interview Query — [Easy]
   Date: 2026-06-11
   ============================================================ */

-- identify the manager with the biggest team size
-- there is only one manager with the largest team size

/* 🧪 MY ATTEMPT (정답 보기 전 시도) */

SELECT m.name AS manager, COUNT(e.name) AS team_size
FROM employees e JOIN managers m
    ON e.manager_id = m.id
GROUP BY m.name
ORDER BY team_size DESC
LIMIT 1


/* ✅ SOLUTION */
SELECT m.name AS manager, COUNT(e.id) AS team_size
FROM managers m
LEFT JOIN employees e -- 직원이 없는 매니저도 포함 시키기
    ON e.manager_id = m.id
GROUP BY m.id -- same name 있을 수 있으므로 고유 번호로 & 기본키는 NULL이 될 수 없음
ORDER BY COUNT(e.id) DESC -- ORDER BY team_size DESC 도 가능!
LIMIT 1

/* 💭 REFLECTION */
-- grouping by a primary key (m.id) is safer than grouping by a name since names may not be unique
-- LEFT JOIN includes managers with no employees, making the query more robust
-- Think about edge cases, not just the expected output
-- A query can be correct for the sample data but stil be less reliable in real-world scenarios.



/* 🧪 MY ATTEMPT #2 for review (0626) */

1) one row
2) employees, managers
FROM employees e JOIN managers m
    ON e.manager_id = m.id

3) Not needed

4) 
GROUP BY m.id

5) MAX(COUNT(e.id)) 

6) Not needed

7) Not needed

8) 
SELECT m.name AS manager, MAX(COUNT(e.id)) AS team_size

SELECT m.name AS manager, MAX(COUNT(e.id)) AS team_size
FROM employees e JOIN managers m
    ON e.manager_id = m.id
GROUP BY m.id

-- 집계함수는 중첩 불가!!
-- 실제로 필요한건 cOUNT가 가장 큰 행 1개를 고르는 것임


1) one row
2) employees, managers
FROM employees e JOIN managers m
    ON e.manager_id = m.id

3) Not needed

4) 
GROUP BY m.id

5) COUNT(e.id)

6) Not needed

7) Not needed
-- bigger than the average or highest salary
-- 기준 값 설정 할 때 & 동점자 포함할때도

8) 
SELECT m.name AS manager, COUNT(e.id) AS team_size

9) 
ORDER BY COUNT(e.id) DESC
LIMIT 1

SELECT m.name AS manager, COUNT(e.id) AS team_size
FROM employees e JOIN managers m
    ON e.manager_id = m.id
GROUP BY m.id
ORDER BY COUNT(e.id) DESC
LIMIT 1


-- ⚠️ IF there are more managers who have largest size of the team 


FROM managers m
LEFT JOIN employees e
    ON e.manager_id = m.id
GROUP BY m.id
HAVING COUNT(e.id) = (
    SELECT MAX(t.cnt)
    FROM(
        SELECT COUNT(e2.id) AS cnt
        FROM managers m2
        LEFT JOIN employees e2 
            ON m2.id = e2.manager_id
        GROUP BY m2.id
    ) t
);



WITH team AS(
    SELECT m.id, m.name, COUNT(e.id) AS team_size
    FROM managers m 
    LEFT JOIN employees e ON e.manager_id = m.id
    GROUP BY m.id
)
SELECT name AS manager, team_size
FROM team
WHERE team_size = (SELECT MAX(team_size) FROM team);
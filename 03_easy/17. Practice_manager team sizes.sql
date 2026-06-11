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
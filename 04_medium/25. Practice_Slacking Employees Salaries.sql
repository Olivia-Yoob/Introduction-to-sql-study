/* ============================================================
   📝 PROBLEM 2: [Slacking Employees Salaries]
   Source: Interview Query — [Medium]
   Date: 2026-06-18
   ============================================================ */

-- Given two tables : employees and projects, find the sum of the salaries of all employees who didn't complete any of their projects.
-- We will consider a project unfinished if it has no end date (its End_dt is NULL)
-- employee didn't finish any of their projects: when they were assigned at least one project & none of their projects have an End_dt

/* 🧪 MY ATTEMPT (정답 보기 전 시도) */

SELECT SUM(e.salary) AS total_slack_salary
FROM employees AS e 
INNER JOIN (
    SELECT employee_id 
    FROM projects
    WHERE Start_dt IS NOT NULL 
        AND End_dt IS NULL
    ) AS p
ON p.employee_id = e.id

/* ✅ SOLUTION */

-- 1) searches for the table that holds all the salaries we must sum up
WITH slack_salaries AS (
    SELECT e.salary
    FROM employee e
    INNER JOIN projects p -- 2) excludes all employees that have no assigned projects
        ON e.id = p.employee_id
    GROUP BY e.id
    HAVING COUNT(p.End_dt) = 0 -- 3) 끝낸 프로젝트가 있는 직원
)

SELECT SUM(salary) AS total_slack_salary
FROM slack_salaries

/* 💭 REFLECTION */
-- End_dt가 NULL인 프로젝트가 "적어도 하나 있는" 직원을 골랐음. 문제는 그 직원의 모든 프로젝트가 미완료여야 함.
--> COUNT(p.End_dt) = 0

-- INNER JOIN을 미완료 프로젝트 목록과 하면, 미완료 프로젝트가 여러 개인 직원은 여러 행으로 늘어나서 salary가 그 개수만큼 더해짐.
--> 서브쿼리에서 중복 제거

-- 0) Problem : find the sum of the salaries of all the employees who didn’t complete any of their projects.
--> 프로젝트를 하나도! 끝내지 않은 직원들의 salary 합
--> 1. 직원이 프로젝트를 최소 1개 배정 --> ✅ INNER JOIN with projects table
v --> 2. 그 직원의 모든 프로젝트가 미완료 (End_dt IS NULL) --> ✅ GROUP BY + HAVING
--> 3. 위 직원의 급여 합산 --> ✅ SUM

-- 1) 어떤 테이블이 필요한지 정하기
--> salary -> employee table에 있음.
--> End_dt -> projects table에 있음.
--> 두 테이블을 합쳐야 하니 FROM에 둘 다 등장할 것이라는것을 먼저 잡음.
FROM employee e 
JOIN projects p

-- 2) 두 테이블을 어떻게 연결할지 (JOIN 조건 활용)
--> 공통 키인 id 로 연결하며, 프로젝트가 없는 직원은 애초에 후보가 아니므로 INNER JOIN을 씀.
FROM employee e 
INNER JOIN projects p
    ON e.id = p.employee_id

-- 3) 직원 단위로 묶기 (GROUP BY) : 누구 기준으로 판단
--> 이 직원이 프로젝트 전부 미완료 했는지 확인 : 직원 한 명의 프로젝트를 전체 모아서 봐야 판단해야 함!
GROUP BY e.id

-- 4) 그룹에 조건 걸기 (HAVING) : 미완료 조건 
--> 각 직원 그룹에서 완료한 프로젝트가 0개인지 확인
HAVING COUNT(p.END_dt) = 0

-- 5) 여기까지를 하나의 대상 직원 목록으로 묶기 (WITH)
--> 임시테이블 만들어서 이름 붙여두기 (WITH/CTE)
WITH slack_salaries AS (
    SELECT e.salary
    FROM employee e 
    JOIN projects p
        ON e.id = p.employee_id
    GROUP BY e.id
    HAVING COUNT(p.END_dt) = 0
)

-- 6) 합산
SELECT SUM(salary) AS total_slack_salary
FROM slack_salaries

/* 🎓 Practice Question */

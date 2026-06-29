/* ============================================================
   📝 PROBLEM 3: [Exam Scores]
   Source: Interview Query — [Medium]
   Date: 2026-06-19
   ============================================================ */

-- To finish a class, students must pass four exams (exam ids: 1,2,3 and 4).
-- Given a table exam_scores containing the data about all of the exams that students took, form a new table to track the scores for each student.

/* 🧪 MY ATTEMPT (정답 보기 전 시도) */

SELECT student_name, 
(CASE
    WHEN exam_id = 1 THEN score AS exam_1
    WHEN exam_id = 2 THEN score AS exam_2
    WHEN exam_id = 3 THEN score AS exam_3
    ELSE score AS exam_4
END)
FROM exam_scores

/* ✅ SOLUTION */

SELECT student_name,
    SUM(CASE WHEN exam_id = 1 THEN score ELSE NULL END) AS exam_1,
    SUM(CASE WHEN exam_id = 2 THEN score ELSE NULL END) AS exam_2,
    SUM(CASE WHEN exam_id = 3 THEN score ELSE NULL END) AS exam_3,
    SUM(CASE WHEN exam_id = 4 THEN score ELSE NULL END) AS exam_4
FROM exam_scores
GROUP BY student_name
-- GROUP BY 를 썼기 때문에 SUM 집계를 해주는 것
-- GROUP BY 를 해줘야 한 학생 별로 한 행의 값을 도출 가능
-- 각각의 case 존재해야 함




/* 📝 REFLECTION */

-- I first tried putting AS inside CASE, but aliases can't go inside an expression — they only work on the final column. That was my main mistake.

-- Key takeaway: To pivot rows into columns, two things work together:
--   1) CASE (or IF) places each score into the right column (exam_1 ~ exam_4)
--   2) GROUP BY + an aggregate (SUM/MAX) collapses each student's multiple rows into a single row, skipping the NULLs.

-- Since each exam was taken only once, SUM and MAX give the same result, but MAX better reflects the intent ("pick the one score"). I'd use MAX
-- if a student could retake an exam, since SUM would wrongly add them up.
-- Note: IF() is shorter but MySQL-only; CASE is standard SQL and portable.


/* 🧪 MY ATTEMPT #2 for review (0630) */

SELECT 
    student_name, 
    MAX(CASE WHEN exam_id = 1 THEN score END) AS exam_1,
    MAX(CASE WHEN exam_id = 2 THEN score END) AS exam_2,
    MAX(CASE WHEN exam_id = 3 THEN score END) AS exam_3,
    MAX(CASE WHEN exam_id = 4 THEN score END) AS exam_4
FROM exam_scores
GROUP BY student_name -- 행을 안 접으니까 원본 그대로 등장

⭐️ GROUP BY 하면, SELECT에는 (A) 묶은 컬럼 + (B) 집계값만 온다.


/* ============================================================
   🎓 EXTRA PRACTICE (0630) — CASE / pivot / conditional aggregation
   ============================================================ */

/* ---------- Q1. Pivot (방금 배운 패턴) ----------
   Table: sales (id, salesperson, quarter ['Q1'..'Q4'], amount)

   For each salesperson, show total sales in separate columns per quarter.

   Expected shape:
   | salesperson | Q1 | Q2 | Q3 | Q4 |

   👉 your answer:
*/

SELECT salesperson,
    SUM(CASE WHEN quarter = 'Q1' THEN amount END) AS Q1,
    SUM(CASE WHEN quarter = 'Q2' THEN amount END) AS Q2,
    SUM(CASE WHEN quarter = 'Q3' THEN amount END) AS Q3,
    SUM(CASE WHEN quarter = 'Q4' THEN amount END) AS Q4
FROM sales
GROUP BY salesperson



/* ---------- Q2. Conditional aggregation (살짝 변형) ----------
   Table: orders (id, customer_id, status ['shipped' / 'cancelled'])

   For each customer, count how many orders were shipped and how many
   were cancelled — in two separate columns.

   Expected shape:
   | customer_id | shipped_count | cancelled_count |

   👉 your answer:
*/

SELECT customer_id, 
    COUNT(CASE WHEN status = 'shipped' THEN 1 END) AS shipped_count,
    COUNT(CASE WHEN status = 'cancelled' THEN 1 END) AS cancelled_count
FROM orders
GROUP BY customer_id
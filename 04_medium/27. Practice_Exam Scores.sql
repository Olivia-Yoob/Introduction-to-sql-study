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

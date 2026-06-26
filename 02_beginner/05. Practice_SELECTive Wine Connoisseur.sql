/* ============================================================
   📝 PROBLEM 3: [SELECTive Wine Connoisseur]
   Source: Interview Query — [Easy]
   Date: 2026-06-07
   ============================================================ */

-- Write a query to find the ids of suitable wined for this customer.
-- Greater or equal to than 13% alcohol content
-- Ash content less than 2.4
-- A color intensity less than 3

/* 🧪 MY ATTEMPT (정답 보기 전 시도) */
SELECT id
FROM wines
    WHERE alcohol >= 13
    AND ash < 2.4
    AND color_intensity < 3

/* ✅ SOLUTION */
SELECT id
FROM wines
    WHERE alcohol >= 13
    AND ash < 2.4
    AND color_intensity < 3


/* 🧪 MY ATTEMPT #2 for review (0626) */
-- wine / that has a greater or equal to than 13% alcohol content / ash content less than 2.4 / a color intensity less than 3
-- write a query to find the ids of suitable wines for this customer
-- all percentages are reported with two numbers before the decimal point

SELECT id
FROM wines
WHERE alcohol >= 13
    AND ach < 2.4
    AND color_intensity < 3
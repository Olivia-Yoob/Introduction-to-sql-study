-- ============================================================
-- Interview Query — [CASE clause]
-- Section: [Medium]
-- Date: 2026-06-19
-- ============================================================


/* ============================================================
   ✅ WHAT IT IS
   ============================================================ */
-- ⭐️ CASE : lets us return values conditionally
-- ⭐️ IF : return different values depending on a certain condition
-- ONLY accepts one condition instead of many

/* ============================================================
   ✅ SYNTAX
   ============================================================ */
CASE  
    WHEN <condition 1> THEN <return value for condition1>
    WHEN <condition 2> THEN <return value for condition2>
    ...
    ELSE <return value for when all previous conditions are false>
END


CASE  
    WHEN price > 100 THEN "Expensive"
    WHEN price < 40 THEN "Cheap"
    ELSE "Average"
END


IF (<condition>, <value_if_true>, <value_if_false>)
IF (quantity > 10, "many", "few")

-- Percentage of users that linked an email to their account
SELECT AVG(CASE WHEN email ="" THEN 0 ELSE 1 END) AS pct_w_emails
FROM users


-- ============================================================
-- Interview Query — [Datetime]
-- Section: [Medium]
-- Date: 2026-06-15
-- ============================================================


/* ============================================================
   ✅ WHAT IT IS
   ============================================================ */
-- ⭐️ DATETIME : SQL data type that deals with calendar values
-- ⭐️ DATE : doesn't include time
-- all data values are stored as DATETIME rather than DATE
-- MAX & MIN for the latest and earlist date in the query
-- < & > for the before and after relationships
-- ORDER BY will order value from earliest to most recent

/* ============================================================
   ✅ SYNTAX
   ============================================================ */
-- To add or subtract any number of years, months, weeks, etc

-- 4 days before a column called created_at
DATE_SUB(created_at, INTERVAL 4 DAY)

DATE_<operation>(<Column>, INTERVAL <number> <unit>)

SELECT DATE_FORMAT(<date_column>,<format>)
SELECT DATE_FORMAT("2017-06-15", "%Y")
-- would only retrieve the year "2017"

https://dev.mysql.com/doc/refman/8.0/en/date-and-time-functions.html#function_date-format


# 🧭 SQL Problem-Solving Checklist

Read the question, then walk these steps **in order**.
The order follows SQL's logical execution order
(`FROM → WHERE → GROUP BY → HAVING → SELECT → ORDER BY → LIMIT`),
so you can fill it in like a blank template.

| # | Ask yourself | → SQL clause | Trigger keywords |
|---|--------------|--------------|------------------|
| 0 | **Any ambiguous English?** Lock the meaning first. | (interpretation) | "different", "each", "per", "top", "active" |
| 1 | One row or many rows in the result? | (big picture) | "total" vs. "for each" |
| 2 | How many tables? Do I need a JOIN? | `FROM` / `JOIN` | "A's B", multiple nouns |
| 3 | Any row-level conditions? | `WHERE` | date, status, type |
| 4 | Group by something? | `GROUP BY` | "for each", "per", "by" |
| 5 | Any aggregation? | `COUNT` / `SUM` / `AVG` / `MAX` | "how many", "total", "average" |
| 6 | Filter **on the aggregate**? | `HAVING` | "more than 2", "at least" |
| 7 | Compare **against** an aggregate? | subquery / CTE | "higher than average", "the max" |
| 8 | What columns to output? Aliases? | `SELECT ... AS` | result column names |
| 9 | Sort or limit count? | `ORDER BY` / `LIMIT` | "top N", "highest", "descending" |

## Key principles

1. **Interpret first (step 0).** If you read "different users" as just "users",
   you'll drop `DISTINCT` and everything downstream breaks. Meaning before syntax.

2. **WHERE vs. HAVING.**
   - `WHERE` filters rows **before** aggregation.
   - `HAVING` filters groups **after** aggregation.

3. **Single-day date filter** → half-open range, not `LIKE` / `BETWEEN` / `DATE(col)=...`:
   ```sql
   WHERE col >= '2020-06-06' AND col < '2020-06-07'
   ```
   Reasons: ① uses the index ② no implicit type conversion ③ intent is explicit.

4. **"Top N" problems** → don't forget `ORDER BY ... LIMIT N`
   (or a window function like `RANK()` / `DENSE_RANK()` when there are ties).

## One-line summary

> **Interpret (0) → Big picture (1) → FROM/JOIN (2) → WHERE (3) → GROUP BY (4) →
> aggregate (5) → HAVING/subquery (6,7) → SELECT (8) → ORDER/LIMIT (9)**
>
> Same as SQL's execution order — memorize this and any problem becomes fill-in-the-blanks.

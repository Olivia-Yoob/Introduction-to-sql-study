# Interview Query — SQL Study

Practice and notes from the [Interview Query SQL Interview Learning Path](https://www.interviewquery.com/learning-paths/sql-interview).

This repository documents my journey through SQL preparation for data analytics interviews, with a focus on the kind of business-context queries that come up in real Product Analyst and BI Analyst roles.

---

## 📌 About This Repo

SQL is the foundation of data analytics work. Rather than just solving problems and moving on, I'm building a study log so I can revisit concepts later and track how my reasoning evolves over time.

Each section folder includes:
- The original question and schema
- My solution(s), including failed attempts where useful
- A short note on the concept, common mistakes, and why this pattern matters in practice

---

## 🎯 Learning Goals

- Build fluency in writing SQL for business questions, not just syntax drills
- Master `JOIN`, `GROUP BY`, subqueries, CTEs, and window functions
- Develop the habit of explaining queries — interview SQL is as much about communication as correctness
- Prepare for upcoming graduate-level database coursework

---

## 📚 Learning Source

**[Interview Query — SQL Interview Learning Path](https://www.interviewquery.com/learning-paths/sql-interview)**

A structured curriculum used by data professionals preparing for analytics, data science, and data engineering interviews. The path moves from fundamentals through medium-level subqueries and window functions, up to advanced multi-join scenarios and senior-level case studies.

---

## 🧠 Core Concepts Covered

| Topic | Status | Key Patterns |
|---|---|---|
| `SELECT` / `WHERE` | ✅ | Filtering, comparison and logical operators |
| `JOIN` | ✅ | INNER, LEFT, RIGHT, FULL — table relationships |
| Aggregation | ✅ | `GROUP BY`, `HAVING`, `COUNT`, `SUM`, `AVG`, `MAX`, `MIN` |
| Sorting & Limiting | ✅ | `ORDER BY`, `LIMIT`, ranking logic |
| Subqueries | 🟡 In progress | Nested SELECTs in `WHERE`, `FROM`, `SELECT` |
| CTEs | 🟡 In progress | `WITH ... AS (...)` for readability and reuse |
| Window Functions | 🟡 In progress | `RANK()`, `PARTITION BY`, `OVER` clauses |
| Self Joins | ⏳ Next | Hierarchies, pairwise comparisons within one table |

---

## 🧭 Study Approach

I keep each lesson short and structured. For every problem:

1. **Read and re-state** the question in plain English
2. **Sketch the data model** — tables, keys, relationships
3. **Attempt the query** before looking at any solution
4. **Compare and reflect** — if the official answer is different, why?
5. **Note the underlying pattern** so I can recognize it next time

I also keep a separate `notes/` folder for English expressions and phrases that come up frequently in SQL learning material — useful both for technical writing and for interview communication.

---

## 🗂 Repository Structure

```
interviewquery-study-sql/
├── README.md
├── 01_introduction/
├── 02_beginner/
├── 03_easy/
├── 04_medium/
├── 05_advanced/
└── notes/
    ├── concepts.md
    └── english_expressions.md
```

---

*This is a personal study log. All practice questions belong to Interview Query.*
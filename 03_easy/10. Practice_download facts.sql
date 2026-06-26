/* ============================================================
   📝 PROBLEM 1: [Download facts]
   Source: Interview Query — [Easy]
   Date: 2026-06-07
   ============================================================ */

-- accounts, downloads, find the average number of downloads for free vs paying accounts, broken down by day
-- need to consider accounts that have had at least one download
-- round average_downloads to 2 decimal places

/* 🧪 MY ATTEMPT (정답 보기 전 시도) */

SELECT downloads.download_date, accounts.paying_customer, ROUND(AVG(downloads),2) AS average_downloads
FROM accounts
INNER JOIN downloads 
    ON accounts.account_id = downloads.account_id
GROUP BY accounts.paying_customer

/* ✅ SOLUTION */

SELECT downloads.download_date, accounts.paying_customer, ROUND(AVG(downloads.downloads),2) AS average_downloads
FROM accounts
INNER JOIN downloads 
    ON accounts.account_id = downloads.account_id
GROUP BY accounts.paying_customer, downloads.download_date 

-- downloads.download_date : broken by day
-- accounts.paying_customer : free vs paying accounts
-- INNER JOIN : consider accounts that have had at least one download

/* 💭 REFLECTION

1. 문제에서 "broken down by X"가 나오면
   X를 GROUP BY에 포함해야 한다.

2. SELECT에 있는 비집계 컬럼은 보통 GROUP BY에도 들어가야 한다.

3. 집계하기 전에 테이블 구조를 먼저 확인하자.
   이번 문제는 downloads 컬럼이 이미 존재했기 때문에
   COUNT()가 아니라 AVG(downloads)를 사용했다.

4. INNER JOIN을 사용하면 downloads 기록이 없는 계정은
   자동으로 제외되므로,
   "accounts that have had at least one download" 조건이
   자연스럽게 충족된다.

*/

/* 🧪 MY ATTEMPT #2 for review (0626) */
1) many rows
2) accounts, downloads 2tables & consider accounts that have had at least one Download 
accounts JOIN downloads
   ON accounts.account_id = downloads.account_id

3) round average_downloads to 2 decimal places
ROUND(average_downloads,2)

4) broken down by day & downloads for free vs paying account
GROUP BY downloads.download_date, accounts.paying_customer

5) average number of downloads
AVG(downloads.downloads) AS average_downloads

6) X filter needed

7) X compare needed

8) 
SELECT download_date, paying_customer, ROUND(AVG(downloads.downloads),2) AS average_downloads

9) No sort needed


SELECT download_date, paying_customer, ROUND(AVG(downloads.downloads),2) AS average_downloads
FROM accounts 
JOIN downloads
   ON accounts.account_id = downloads.account_id
GROUP BY downloads.download_date, accounts.paying_customer

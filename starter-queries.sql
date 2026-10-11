-- Starter queries for the collections prioritization project.
-- Run these against accounts.csv (import it into SQLite, Postgres, or any SQL tool first).
-- Table name used here: accounts.

-- 1. The big picture: how much is overdue, and how late is it on average?
SELECT
  COUNT(*) AS overdue_accounts,
  ROUND(SUM(balance_owed), 2) AS total_overdue,
  ROUND(AVG(days_overdue), 1) AS avg_days_overdue
FROM accounts;

-- 2. Aging buckets: group accounts by how late they are.
SELECT
  CASE
    WHEN days_overdue BETWEEN 1 AND 30 THEN '1-30 days'
    WHEN days_overdue BETWEEN 31 AND 60 THEN '31-60 days'
    WHEN days_overdue BETWEEN 61 AND 90 THEN '61-90 days'
    ELSE '90+ days'
  END AS aging_bucket,
  COUNT(*) AS num_accounts,
  ROUND(SUM(balance_owed), 2) AS bucket_balance
FROM accounts
GROUP BY aging_bucket
ORDER BY MIN(days_overdue);

-- 3. Quick wins: high balances, no promised payment, not contacted recently.
SELECT account_id, balance_owed, days_overdue, contact_attempts_30d
FROM accounts
WHERE promised_payment = 'N'
  AND contact_attempts_30d <= 2
ORDER BY balance_owed DESC
LIMIT 10;

-- 4. First version of the priority ranking.
-- Scores each account 0-100 from money at stake, lateness vs. habit,
-- and payment behavior. Tune the weights and explain your choices.
-- (Written with CASE so it runs in SQLite, Postgres, and MySQL.)
SELECT
  account_id,
  balance_owed,
  days_overdue,
  avg_days_to_pay,
  promised_payment,
  ROUND(
    -- money at stake: balance scaled, capped at 40 points
    CASE WHEN balance_owed / 5000.0 > 40 THEN 40
         ELSE balance_owed / 5000.0 END
    -- lateness beyond the account's own habit, capped at 30 points
    + CASE WHEN days_overdue - avg_days_to_pay <= 0 THEN 0
           WHEN (days_overdue - avg_days_to_pay) / 3.0 > 30 THEN 30
           ELSE (days_overdue - avg_days_to_pay) / 3.0 END
    -- no recent payment and no promise adds urgency (0-20 points)
    + CASE WHEN days_since_last_payment > 60 AND promised_payment = 'N' THEN 20
           WHEN promised_payment = 'N' THEN 10
           ELSE 0 END
    -- many failed attempts signals a stuck account, capped at 10 points
    + CASE WHEN contact_attempts_30d * 2.0 > 10 THEN 10
           ELSE contact_attempts_30d * 2.0 END
  , 1) AS priority_score
FROM accounts
ORDER BY priority_score DESC;

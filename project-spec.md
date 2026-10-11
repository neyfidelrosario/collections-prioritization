# Which Accounts to Chase First: A Collections Prioritization Project

## What this is

A portfolio project built from a real accounts receivable workflow: every morning, a collector looks at a list of overdue accounts and decides which ones to chase first. This project turns that judgment into a repeatable scoring method, then proves it works on data.

All names, companies, and figures here are fictional and representative. This is a portfolio exercise. It is not advice about any real employer's systems.

## The business question

"With limited hours in the day, which overdue accounts should I contact first to recover the most money?"

## The dataset

One file: `accounts.csv` — 50 anonymized overdue accounts. Each row is one account, with:

- **account_id** — anonymous label (ACCT-001, ACCT-002, ...)
- **balance_owed** — total dollars overdue on the account
- **days_overdue** — how many days past the due date the oldest invoice is
- **open_invoices** — how many unpaid invoices the account has
- **days_since_last_payment** — how long ago the account last paid anything
- **avg_days_to_pay** — the account's historical habit: how many days it usually takes to pay
- **promised_payment** — Y/N: did the client promise a payment date?
- **contact_attempts_30d** — how many times the account was contacted in the last 30 days
- **account_age_months** — how long the account has been a client
- **industry** — the client's line of business (kept generic)

## The method: a priority score

Not every overdue dollar is equal. A $100,000 balance that is 90 days late with no payment promise deserves attention before a $3,000 balance that is 10 days late from a client who always pays on day 45.

The project builds a simple, explainable score from four signals:

1. **Money at stake** — bigger balances rank higher. (Scale the balance so it doesn't drown out everything else.)
2. **How late it is** — more days overdue ranks higher, but compare against the account's own habit. An account 60 days overdue that usually pays in 30 is more worrying than one 60 days overdue that usually pays in 55.
3. **Payment behavior** — accounts with no recent payment and no promised date rank higher. A promise to pay lowers the urgency.
4. **Effort already spent** — accounts contacted many times with no result get flagged differently: they may need a new tactic (a call instead of an email, a supervisor involved), not just another attempt.

Each account gets a score from 0 to 100. Sort highest first. That ranked list is the deliverable.

## The deliverable

A one-page write-up plus the ranked list, answering:

- Which 10 accounts should be contacted first, and why (one line of reasoning each)
- How much of the total overdue balance those 10 accounts represent
- Which accounts look stuck (many contact attempts, no payment, no promise) and what a different next step could be
- One honest limitation of the scoring method

## Starter files

- `accounts.csv` — the dataset (50 accounts, described above)
- `starter-queries.sql` — four SQL queries to begin the analysis:
  1. Total overdue balance and average days overdue (the big picture)
  2. Accounts grouped by how late they are: 1–30, 31–60, 61–90, 90+ days (aging buckets)
  3. High-balance accounts with no promised payment and no recent contact (quick wins)
  4. A first version of the priority ranking

## Weekend plan

**Day 1 — Explore and clean (2–3 hours).** Load the CSV. Run the starter queries. Check for anything odd: negative balances, impossible dates, missing values. Decide how to handle each oddity and write down the decision.

**Day 2 — Score and write up (2–3 hours).** Build the priority score, rank the accounts, and write the one-page summary: top 10 to chase, why, what the numbers add up to, and one limitation.

## How to present it

- Put the project on GitHub: the spec, the CSV, the SQL, and the write-up.
- Link it from LinkedIn's Featured section.
- In interviews, walk through it using the talking points in `interview-talking-points.md`.
- Never present the figures as real. If asked, say: "The data is fictional and representative; the workflow is real."

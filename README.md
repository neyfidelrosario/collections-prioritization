# Which Accounts to Chase First: A Collections Prioritization Project

A portfolio project built from a real accounts receivable workflow: every morning, a collector looks at a list of overdue accounts and decides which ones to chase first. This project turns that judgment into a repeatable 0–100 scoring method, then proves it on data.

All names, companies, and figures are fictional and representative. This is a portfolio exercise, not advice about any real employer's systems.

## What's inside

- `project-spec.md` — the full spec: business question, dataset description, scoring method, weekend plan
- `accounts.csv` — 50 anonymized overdue accounts (balances, days overdue, payment history, promises, contact attempts)
- `starter-queries.sql` — four SQL queries: big picture, aging buckets, quick wins, and the full priority ranking
- `writeup.md` — findings: top 10 accounts to chase, quick wins, stuck accounts, and one honest limitation
- `interview-talking-points.md` — how to talk about this project in interviews, each point tied to a business-analysis skill

## Run it yourself

1. Import `accounts.csv` into SQLite (table name: `accounts`, column names in first row)
2. Run the queries in `starter-queries.sql` in order
3. Read `writeup.md` for the findings

## The method in one paragraph

Each account gets a priority score from four signals: money at stake (balance scaled and capped), lateness measured against the account's own paying habit, payment behavior (recent payment? promised date?), and effort already spent. Sort highest first. That ranked list is the Monday-morning call list.

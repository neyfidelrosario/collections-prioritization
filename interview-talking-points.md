# Interview Talking Points: Collections Prioritization Project

Plain-English points for talking about the project in interviews. Each point names the project step, then the business-analysis skill it proves. The dataset is fictional and representative; the workflow is real. Say so if asked.

## 1. "I started by defining the real question."
**Project step:** Before touching data, I wrote down the decision the analysis had to support: with limited hours, which overdue accounts should be contacted first to recover the most money.
**Skill this proves:** Framing the problem before solving it. Analysts who skip this step build impressive work that answers the wrong question.

## 2. "I picked one dataset and learned its limits."
**Project step:** I worked with a single table of 50 overdue accounts: balances, days overdue, payment history, promises, and contact attempts. On day one I checked it for problems — missing values, impossible dates — and wrote down how I handled each one.
**Skill this proves:** Data sourcing and data quality. Knowing what your data can and cannot tell you is what separates analysis from guessing.

## 3. "I turned collector judgment into a scoring rule."
**Project step:** I built a 0–100 priority score from four signals: money at stake, how late the account is compared to its own paying habit, whether there is a promised payment, and how much effort had already failed. Every weight is visible and explainable.
**Skill this proves:** Translating business knowledge into logic. The score is just my day-to-day judgment written down so anyone can repeat it.

## 4. "I did the analysis in SQL."
**Project step:** Four queries: the big picture, aging buckets, quick-win accounts, and the full priority ranking. The ranking query is the centerpiece — it computes the score for every account in one pass.
**Skill this proves:** Technical execution. SQL is the working language of business analysis, and this shows I can use it on a real workflow.

## 5. "I turned the ranking into a recommendation."
**Project step:** The deliverable was not the ranked list — it was a one-page write-up: the top 10 accounts to chase, one line of reasoning each, what share of the overdue balance they represent, and which accounts look stuck and need a different tactic.
**Skill this proves:** Stakeholder communication. Analysis only matters when it changes what someone does on Monday morning.

## 6. "I was honest about what the score can't do."
**Project step:** I wrote down one limitation: the score can't see relationships. A long-standing client going through a rough quarter might deserve patience the numbers don't show. The score informs the call list; it doesn't replace judgment.
**Skill this proves:** Intellectual honesty. Knowing the limits of your own analysis is what makes people trust it.

## If they ask "Is this real data?"
"The figures and names are fictional and representative. The workflow — deciding which overdue accounts to chase first, and what signals matter — is exactly what I do every day."

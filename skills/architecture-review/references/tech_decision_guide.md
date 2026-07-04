# Tech Decision Guide

Use this for small architecture decisions. Do not turn routine code placement into an ADR.

## Decision Frame

- What behavior or contract changes?
- Who owns the data?
- Who initiates side effects?
- Which callers must remain compatible?
- What verification proves the decision works?

## Option Scoring

Compare options on:

- local change cost
- future change cost
- coupling introduced
- migration risk
- consistency with existing repo patterns

## Recommendation Format

```markdown
Recommendation: <option>

Why:
- <reason grounded in current code>
- <trade-off accepted>

Rejected:
- <option>: <why not>
```

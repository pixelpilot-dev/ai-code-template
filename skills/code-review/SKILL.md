---
name: code-review
description: Use as the local review quality bar and findings format, while the review process itself follows superpowers review skills.
---

# Code Review

## When to use

- before finishing a substantial task
- when reviewing a diff or a set of changed files
- when a quality merge gate is needed instead of a simple summary
- when shaping the expected output of the local `agents/code-reviewer.md`

## How it fits

- Use `superpowers:requesting-code-review` for the review process.
- Use local `agents/code-reviewer.md` as the reviewer.
- Use `superpowers:receiving-code-review` when handling review feedback.
- Use this skill as the local standard for what a good review should look like.
- For React, Next.js, and UI code review, consult `vercel-react-best-practices` and `vercel-composition-patterns`.
- Add `vercel-react-view-transitions` when reviewing transitions or motion behavior.
- Use `web-design-guidelines` for UI/accessibility/design audits when that angle is part of the review.

## How to work

1. Define the review scope first: diff, specific files, or an entire module.
2. Prioritize checks in this order: correctness, regressions, security, tests, maintainability.
3. Make findings concrete: what breaks, where the risk is, and how to fix it.
4. Keep the summary short and place it after the findings.
5. If there are no clear issues, say so explicitly and mention residual risks.

## Findings format

- priority
- file and location
- risk
- proposed fix

## Expected output

- review findings ordered by severity
- open questions or assumptions
- a brief merge recommendation

## References

- `skills/code-review/references/code_review_checklist.md`
- `skills/code-review/references/common_antipatterns.md`
- `skills/code-review/references/coding_standards.md`

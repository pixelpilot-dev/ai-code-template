---
name: clean-code-review
description: Use to review readability, cohesion, naming, and local simplicity before or after code changes.
---

# Clean Code Review

## When to use

- the code is growing and losing readability
- it is unclear where responsibility boundaries are
- there is duplication, long functions, or unclear names
- you need to decide quickly whether simplification is worth doing before or after a fix

## When not to use

- a security review as the primary goal
- a deep architectural assessment across multiple subsystems

## How to work

1. Look at module responsibility first, style second.
2. Aim for local clarity and predictability, not “perfect beauty”.
3. Remove duplication and excess abstraction only where it materially reduces complexity.
4. Check names, function size, nesting, and cohesion in nearby code.
5. Do not refactor outside the current task unless there is a clear benefit.
6. For JavaScript and TypeScript, use `js-ts-quality` to check function purity, side-effect boundaries, type clarity, and overengineering risk.
7. Use `code-health-tools` when the review is driven by `knip`, `jscpd`, dead code, unused exports/dependencies, or duplication reports.

## Red flags

- a helper for a single call site
- a generic utility with no clear owner
- cleanup based only on tool output without checking ownership and runtime entrypoints
- long functions with multiple abstraction levels
- comments that hide bad naming
- growing props, conditionals, and branching without decomposition

## Expected output

- a list of simplification opportunities
- notes on naming, structure, and duplication
- recommendations only where the value justifies the cost of change

## References

- `skills/code-review/references/common_antipatterns.md`
- `skills/js-ts-quality/references/refactoring.md`

---
name: architecture-review
description: Use to review module boundaries, decomposition, and architectural trade-offs before or during changes.
---

# Architecture Review

## When to use

- the task touches multiple modules or layers
- there is a risk of muddling dependencies and ownership
- you need to choose the structure of a feature, shared code, or an integration
- you need to assess architectural debt before implementation

## When not to use

- a small change in one component with no structural impact
- a pure security review
- a pure code review of a ready diff with no architectural decision involved

## How to work

1. Define the change boundary: which modules are changing and why.
2. Find areas with high coupling, implicit dependencies, and blurry ownership.
3. Propose 2-3 structural options, but recommend one.
4. Check whether the interface of a module can be understood without reading its internals.
5. Make sure the change does not create a new shared dumping ground of speculative utilities and abstractions.

## What to inspect

- boundaries between feature, shared, and infra code
- who owns the data and who initiates side effects
- coupling between UI, state, API, and utilities
- the cost of future changes after the current decision
- migration risks and backward compatibility

## Expected output

- a concise assessment of the current structure
- a list of architectural risks and trade-offs
- a recommended decomposition or simplification approach

## References

- `skills/architecture-review/references/architecture_patterns.md`
- `skills/architecture-review/references/system_design_workflows.md`
- `skills/architecture-review/references/tech_decision_guide.md`

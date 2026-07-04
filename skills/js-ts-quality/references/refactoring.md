# Refactoring JS/TS Code

## Decision Rule

Refactor only when it reduces current complexity, clarifies ownership, removes meaningful duplication, or makes the requested change safer.

## Good Refactors

- Extract a named pure function for a repeated or non-trivial transformation.
- Split a component that mixes data loading, state transitions, and presentation.
- Move side effects to an existing boundary.
- Replace boolean clusters with a small state object or discriminated union.
- Rename unclear variables when naming is the main source of confusion.
- Delete dead branches, unused helpers, or unused parameters.

## Bad Refactors

- Extracting a helper for a single obvious expression.
- Creating `utils`, `helpers`, or `common` modules without a domain owner.
- Generalizing for imagined future use.
- Replacing simple control flow with patterns the repo does not use.
- Moving code across layers just because it looks reusable.
- Combining cleanup with behavior changes so the diff becomes hard to review.

## Refactoring Sequence

1. Name the pain: duplication, mixed responsibilities, unclear naming, hidden side effect, or awkward type.
2. Identify the owner of the behavior.
3. Make the smallest structural change that removes the pain.
4. Preserve public behavior unless the user asked for behavior change.
5. Run the narrowest useful verification.

## AI Guardrail

When unsure, prefer a boring local improvement over an architectural abstraction.

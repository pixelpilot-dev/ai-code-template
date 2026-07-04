# Code Review Checklist

Use this as a risk checklist, not as a template for long review notes.

## Order

1. Correctness: does the changed behavior work for normal, empty, loading, and error states?
2. Regressions: did public contracts, routing, data ownership, or generated outputs change?
3. Security: did the change touch auth, permissions, user input, files, secrets, logs, or external integrations?
4. Verification: is there a command or existing test that actually covers the changed behavior?
5. Maintainability: is the code easier to change locally without creating a shared dumping ground?

## Frontend Checks

- Data fetching should keep server state in TanStack Query or the repo's existing data layer.
- Mutations should invalidate or update the specific affected cache entries.
- Route files and screens should stay thin when the repo has feature/widget layers.
- Shared UI should remain domain-agnostic.
- Generated files should not be edited by hand unless generation is unavailable and the reason is stated.

## Review Output

Lead with findings. Each finding needs:

- priority
- file and line
- concrete risk
- concrete fix or direction

If there are no actionable issues, say that and list residual risks or missing verification.

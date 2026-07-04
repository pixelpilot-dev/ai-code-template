# Fix Discipline

## Smallest Useful Fix

- Fix the module that owns the broken behavior.
- Preserve callers unless the caller contract is wrong.
- Keep behavior changes separate from cleanup when possible.
- Prefer one clear fix over multiple unrelated improvements.

## Safe Refactoring During A Fix

Allowed when it directly supports the fix:

- rename unclear local variables
- extract a small pure transformation that was duplicated or hard to test mentally
- move a side effect back to the existing boundary
- narrow a type at the untrusted boundary

Avoid during a fix:

- moving features into `shared`
- introducing new architecture
- replacing a local pattern with a personal preference
- changing styling, formatting, or naming across unrelated files

## Verification

Use a command or smoke path that exercises the original failure. If only a partial check is possible, report exactly what it covers and what remains unverified.

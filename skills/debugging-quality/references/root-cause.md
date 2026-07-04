# Root Cause Debugging

## Evidence First

Before editing, collect at least one of:

- failing command output
- stack trace or runtime error
- user-visible broken behavior
- failing route/screen/path
- incorrect data shape
- inconsistent state transition

## Trace Pattern

1. Entry: where does the input, event, route, query, mutation, or render start?
2. Transformation: where is data mapped, filtered, normalized, or typed?
3. Ownership: which layer owns the behavior?
4. Failure: where does the value, branch, effect, or render become wrong?
5. Contract: did caller or callee violate an expected shape?

## Hypothesis Quality

Good:

- “The query key omits `patientId`, so cached data can be reused across patients.”
- “The route param is optional but the component treats it as present.”
- “The effect depends on derived state and reruns after every render.”

Weak:

- “This file is messy.”
- “Maybe state is stale.”
- “This needs refactoring.”

## When Evidence Is Missing

Say what is unknown, inspect the closest owner, and make the narrowest fix that follows from code evidence. Avoid speculative rewrites.

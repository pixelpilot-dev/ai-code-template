# Writing JS/TS Code

## Function Shape

- Start with the smallest function that has one reason to change.
- Give every function a clear input/output contract.
- Prefer returning values over mutating arguments.
- Keep data mapping separate from I/O, navigation, storage, logging, and rendering side effects.
- If a function has multiple abstraction levels, split by responsibility, not by arbitrary line count.

## TypeScript

- Prefer precise object, union, and literal types over loose records.
- Use `unknown` at untrusted boundaries, then narrow.
- Avoid `any`; if unavoidable, isolate it near the boundary and explain why only when the reason is not obvious.
- Avoid `as` and non-null assertions unless the invariant is established immediately nearby.
- Prefer discriminated unions for multi-state flows instead of boolean combinations.
- Keep exported types stable and local types close to their implementation.

## Readability

- Use names that explain domain intent, not implementation mechanics.
- Keep conditions positive when possible.
- Replace nested branching with early returns when it improves scanning.
- Prefer simple arrays/maps/reducers only when the transformation remains obvious.
- Avoid chaining so much logic that intermediate intent disappears.
- Keep comments for non-obvious constraints, business rules, or external quirks.

## React And React Native

- Keep render functions mostly declarative.
- Move data fetching, mutations, and view-model shaping into hooks or feature `lib/model` when the repo pattern supports that.
- Do not duplicate server state in local component state.
- Do not create inline objects/functions only to satisfy style; optimize only when there is a real stability need or local pattern.
- Keep screen/route files thin: params, guards, layout, and composition.

## Side Effects

Allowed side-effect boundaries:

- API clients and mutation functions
- storage adapters
- logging/monitoring adapters
- navigation handlers
- app/bootstrap/provider runtime effects

Inside domain and mapping code, prefer pure functions.

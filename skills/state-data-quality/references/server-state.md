# Server State

## Ownership

Server state is data fetched from, synchronized with, or invalidated against a remote or persistent source. Prefer the repo's existing query/data layer.

## Query Keys

- Include every variable that changes returned data.
- Keep keys stable and serializable.
- Put query key helpers near the owning API/domain layer when the repo has that pattern.
- Avoid broad invalidation when a precise key is available.

## Queries

- Keep fetch logic in API/query modules, not inside render-heavy components.
- Normalize or adapt API responses near the API boundary.
- Preserve loading, empty, error, and success states.
- Avoid copying query data into local state unless the user is editing a draft.

## Mutations

- Define what data changes before writing invalidation.
- Invalidate or update the smallest affected cache surface.
- Keep optimistic updates explicit and reversible.
- Handle failure states; do not silently swallow mutation errors.

## Review Questions

- Does the query key contain all inputs?
- Does the mutation update or invalidate affected readers?
- Is API shape converted before UI consumes it?
- Can stale data appear after navigation, account switch, or role change?

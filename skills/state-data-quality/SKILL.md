---
name: state-data-quality
description: Guide AI behavior for frontend data ownership, state management, forms, cache, server state, client state, derived state, query keys, mutations, invalidation, optimistic updates, adapters, and data mapping in JavaScript, TypeScript, React, and React Native projects.
---

# State Data Quality

## Goal

Keep data ownership explicit so UI state, server state, form state, and derived data do not blur into one hard-to-debug component.

## Workflow

1. Classify the data before choosing a tool: server, client, form, derived, URL/navigation, local persistent, or runtime-only.
2. Read the matching reference:
   - `references/server-state.md` for queries, mutations, cache, invalidation, and API data.
   - `references/client-state.md` for local UI state, Zustand-like stores, persistent state, and derived data.
   - `references/forms-and-errors.md` for forms, validation, loading, empty, error, and success states.
3. Place mapping and adapters near the data owner.
4. Keep route/screen/components mostly composition and rendering.
5. Use `verification-profile` to select a check that exercises the affected data flow.

## Defaults

- Server-owned data belongs in the server-state layer, not duplicated into local component state.
- Client state should represent UI-only decisions or local workflow state.
- Derived data should usually be computed, not stored.
- Forms can temporarily own unsaved user input.
- Query keys, invalidation, and optimistic updates must match the data contract.
- Data mapping should make API shape changes visible in one place.

## Red Flags

- `useState` mirrors query data or props without a clear editing workflow.
- A mutation succeeds but related queries are not invalidated or updated.
- A query key omits a variable that changes the returned data.
- A global store holds server data because passing props felt inconvenient.
- Form validation, API mapping, and rendering are all in one component.
- Error handling only covers the happy path.

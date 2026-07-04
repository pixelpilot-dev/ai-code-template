# Coding Standards

## General

- Prefer TypeScript types over `any`; tolerate existing `any` only when replacing it is outside scope.
- Use repo aliases and import ordering rules already configured in ESLint.
- Keep comments for non-obvious decisions, not line-by-line narration.
- Keep formatting delegated to Prettier or the repo formatter.
- For JS/TS-specific behavior, use `skills/js-ts-quality/references/writing-code.md`.

## Boundaries

- Put reusable primitives in `shared/ui`, not domain components.
- Put domain-specific UI in the owning feature, widget, page, or screen.
- Put API clients and generated API adapters in the existing API layer.
- Keep route constants and typed params in the existing navigation layer.

## Hooks And Data

- Custom hooks should own one coherent concern.
- Query hooks should expose stable query keys or use existing query key conventions.
- Mutations should make cache updates explicit.
- Avoid effects that synchronize data that can be derived during render.

## Verification

- Use the repo's scripts rather than inventing shell commands.
- Do not add new tests by default; run or update existing tests only when they already cover the changed behavior or the user requested tests.

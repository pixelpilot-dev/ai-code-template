---
name: js-ts-quality
description: Guide AI behavior for writing, refactoring, and reviewing JavaScript and TypeScript code. Use when Codex writes JS/TS, React, or React Native code; reviews AI-generated code; performs refactoring; evaluates readability, purity, types, function boundaries, naming, side effects, overengineering, or maintainability.
---

# JS/TS Quality

## Goal

Make AI-written JavaScript and TypeScript look like careful human code: small, clear, typed, locally coherent, and boring in the right places.

## Workflow

1. Understand the local repo shape first. Use `repo-context` when the project is React, Vite, Expo, or React Native.
2. Load the relevant reference:
   - `references/writing-code.md` when writing or changing JS/TS code.
   - `references/refactoring.md` when simplifying or restructuring code.
   - `references/reviewing-ai-code.md` when reviewing a diff or AI-generated code.
3. Use `code-health-tools` when the work is driven by `knip`, `jscpd`, dead code, unused exports, unused dependencies, or duplication cleanup.
4. Prefer existing local patterns, naming, helpers, and data boundaries over a new personal style.
5. Keep the change smaller than the surrounding problem unless the user explicitly asks for broader cleanup.
6. Use `verification-profile` before claiming the work is complete.

## Default Behavior

- Optimize for readability and correctness before cleverness.
- Keep functions pure by default; put side effects at explicit boundaries.
- Prefer direct code over speculative abstractions.
- Write types that express the domain, not types that hide uncertainty.
- Make invalid states hard to represent when that is local and cheap.
- Avoid broad refactors while fixing narrow bugs.
- Leave the codebase more predictable, not just more abstract.
- Treat code-health tool output as a signal that requires reading the owning code path.

## Refusal Points

Do not introduce:

- a helper with one call site unless it names a real concept or removes meaningful complexity
- a generic utility with no clear owner
- a new state layer for derived or server-owned data
- `any`, type assertions, or non-null assertions as shortcuts
- comments that explain confusing code instead of making the code clearer
- large rewrites that are not needed for the current task
- deletions based only on `knip` output without checking entrypoints and dynamic usage
- abstractions based only on `jscpd` output without proving shared domain meaning

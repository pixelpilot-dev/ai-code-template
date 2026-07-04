---
name: debugging-quality
description: Guide AI behavior during bug fixing and unexpected behavior investigation. Use when debugging JavaScript, TypeScript, React, React Native, API, state, routing, rendering, build, or integration issues; when a failure is reported; when tests, lint, typecheck, or runtime behavior are failing; or when Codex is tempted to patch without reproducing or isolating root cause.
---

# Debugging Quality

## Goal

Fix the smallest proven cause, not the most convenient-looking symptom.

## Workflow

1. State the observed failure in concrete terms.
2. Identify the expected behavior and the current behavior.
3. Reproduce or inspect the failing path before changing code.
4. Trace data and control flow from entry point to failure.
5. Form one primary hypothesis and one fallback hypothesis.
6. Change the smallest owner module that can fix the cause.
7. Verify the original symptom with `verification-profile`.

## References

- Read `references/root-cause.md` before changing code for a bug.
- Read `references/fix-discipline.md` when the fix might touch multiple files or layers.

## Guardrails

- Do not rewrite broad code to avoid understanding the failure.
- Do not add defensive branches until the impossible state is proven possible.
- Do not change public contracts while fixing an internal bug unless the contract is the bug.
- Do not mark a bug fixed because code “looks better”.
- If the bug cannot be reproduced, state the evidence and make the fix conditional on the traced cause.

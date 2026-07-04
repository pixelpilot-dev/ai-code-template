---
name: code-health-tools
description: Use when working on JavaScript or TypeScript code health tasks involving Knip, jscpd, dry refactoring, dead code, unused files, unused exports, unused dependencies, copy-paste detection, duplication cleanup, broad cleanup reviews, or refactors driven by tool output.
---

# Code Health Tools

## Goal

Use `knip` and `jscpd` as evidence tools for cleanup, not as autonomous deletion or abstraction engines.

## Workflow

1. Use this skill only for explicit cleanup, dead-code, unused dependency, duplication, or tool-output review tasks.
2. Inspect `package.json`, lockfiles, and existing `knip` or `jscpd` config before choosing commands.
3. Prefer the quality scripts below when the project defines them.
4. If no local command exists, state that `npx` may need network access and follow the environment approval rules before running it.
5. Read the reported files and surrounding ownership before editing.
6. Make the smallest safe cleanup or refactor; keep behavior unchanged unless the user asked otherwise.
7. Re-run the same tool on the touched scope, then use `verification-profile` for the repo-appropriate final check.

## Preferred Scripts

Use the package manager implied by the repo. If the project defines these scripts, prefer them over raw tool commands:

| Task | Preferred command | Use for |
| --- | --- | --- |
| Baseline JS/TS quality | `yarn quality:base` | format check, ESLint, and TypeScript verification after code-health edits |
| Knip exploration | `yarn quality:deps` | non-blocking unused file/export/dependency report |
| Knip gate | `yarn quality:deps:strict` | strict cleanup verification when the user asks for a gate or after targeted cleanup |
| Duplication report | `yarn quality:duplicates` | jscpd copy-paste detection |
| Full quality gate | `yarn quality` | final broad quality check when the change intentionally touched cleanup, dependencies, and duplication |

Do not run write-mode scripts such as `format`, `lint:js:fix`, or `lint:fix` unless the user asked for formatting or automated fixes.

## Knip

Use `knip` for unused files, unused exports, unused dependencies, and package cleanup.

Command preference:

- Existing repo script, especially `quality:deps` for exploration and `quality:deps:strict` for strict verification.
- Existing local binary, such as `npx knip`, only when the project already uses it or the user asked to run it.
- `npx knip --help` before relying on unfamiliar flags.

Before deleting or changing anything, check for false positives around:

- route conventions, file-based routing, screens, layouts, and app entrypoints
- dynamic imports, registry maps, string-based imports, and lazy module loading
- generated files, API clients, codegen outputs, and framework metadata
- test, Storybook, E2E, build, CI, Expo, Metro, native, or platform-specific entrypoints
- package scripts, config files, peer dependencies, and plugin-discovered dependencies
- exported symbols that are public API for consumers outside the scanned package

Do not run automatic fix modes or remove dependencies unless the user asked for cleanup and the diff is reviewed. Dependency removal must update the correct manifest and lockfile through the repo's package manager.

## jscpd And Dry Refactoring

Use `jscpd` for copy-paste detection and duplication cleanup. Prefer compact output for agent work:

```bash
npx jscpd --reporters ai <path>
```

If the repo defines `quality:duplicates`, prefer that script first so local jscpd configuration is respected.

If the repo uses the Rust `cpd` binary instead, use the equivalent local command:

```bash
cpd --reporters ai <path>
```

For noisy scans, narrow scope or raise the minimum line/token threshold before refactoring. Treat each clone as a candidate, then read both fragments before deciding.

Good dry-refactoring targets:

- duplicated transformations with the same domain meaning
- repeated validation or mapping logic owned by one feature or shared layer
- repeated constants or config values that should change together
- repeated test setup that hides intent and belongs in a test helper

Avoid refactoring:

- generated code, snapshots, migrations, translations, fixtures, or copied vendor code
- duplicated UI markup with different product meaning or likely future divergence
- similar tests that assert different behavior
- duplication across unrelated feature owners where a shared abstraction would create coupling
- one-off extraction into generic `utils`, `helpers`, or `common` modules

When refactoring, choose the least abstract option that removes real duplication: extract a pure function, local module, constant/config, test helper, or feature-owned shared component. Re-run `jscpd` on the touched scope to confirm the targeted clone is gone.

## Output Standard

Report:

- command used, or why it was not run
- high-signal findings grouped by `knip` and `jscpd`
- false-positive risks checked before editing
- files changed and why the cleanup is safe
- verification command and result

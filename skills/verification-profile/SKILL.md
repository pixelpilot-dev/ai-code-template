---
name: verification-profile
description: Choose the lightest defensible verification before claiming a change is complete, fixed, or safe. Use after code, config, documentation, skill, dependency, React, Vite, Expo, React Native, API, or routing changes to select lint, typecheck, build, smoke, generator, validator, or existing test commands without over-testing by default.
---

# Verification Profile

## Goal

Verify the actual risk introduced by the change, not every possible risk in the repo.

## Workflow

1. Inspect `package.json` scripts and any repo-specific docs before choosing commands.
2. Match the touched files to the smallest useful verification profile below.
3. Run the command from the repo root.
4. If the ideal command is unavailable or too expensive, choose the closest available command and state the residual risk.
5. Do not create new tests by default. Run existing tests only when they already cover the touched behavior or the user asked for tests.

## Profiles

| Change type | Minimal verification |
| --- | --- |
| Skill or agent instructions | `quick_validate.py <skill-dir>` for new/changed skills, plus a placeholder scan across changed files |
| Docs only | Link/path sanity check with `rg` or render-specific tooling if the format needs rendering |
| Local TypeScript utility | Typecheck when available; otherwise lint or the narrowest build script |
| React component or hook | `lint` plus `typecheck` when available |
| React route or app provider | `typecheck`; add route generation/build if the router requires generated output |
| TanStack Query mutation/query/cache | `typecheck`; add existing targeted tests only if already present |
| API/OpenAPI schema/client | Repo API lint/generate script, then typecheck |
| Styling-only web change | `lint`; add build only if class extraction, Tailwind config, or bundling can break |
| React Native JS-only screen/component | `typecheck` and `lint` |
| Expo app config, native deps, permissions, plugins | `expo:doctor`, `expo:install-check`, and `typecheck` |
| React Native native folders | Platform build or smoke command if available; otherwise state that native build was not run |
| Dependency or lockfile change | Install/check command already used by repo, then lint/typecheck or build depending on affected surface |
| Build, Vite, Metro, Electron, or TS config | Build or typecheck command that exercises the changed config |

## Command Selection

- Prefer exact project scripts such as `npm run typecheck`, `npm run lint`, `npm run build`, `npm run expo:doctor`, or `npm run lint:types`.
- Respect the package manager implied by lockfiles and existing scripts.
- Avoid full builds for tiny docs or instruction-only changes unless the change affects build configuration.
- For long-running or flaky checks, run the narrow command first and report why broader verification was skipped.

## Reporting

State the command and result plainly:

- `npm run typecheck` passed.
- `npm run lint` failed on pre-existing files outside the touched scope.
- Not run: native iOS build, because the change was JS-only and no native files changed.

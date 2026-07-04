---
name: repo-context
description: Establish lightweight repository context before implementing, reviewing, debugging, or planning work in React, Vite, Expo, and React Native projects that use the personal feature-first architecture. Use for identifying package scripts, routing style, aliases, feature/shared boundaries, generated files, API/data layers, and the right follow-up skills or verification path.
---

# Repo Context

## Goal

Build just enough local context to work safely without turning every task into an audit.

## Workflow

1. Inspect `package.json`, lockfiles, config files, and the top two or three source directories.
2. Identify the project profile: React/Vite, Electron-flavored React, Expo with React Navigation, or Expo Router.
3. Read `references/common.md` for shared architecture rules.
4. Read exactly one variant reference:
   - `references/react.md` for React/Vite web apps.
   - `references/react-native.md` for Expo or React Native apps.
5. Prefer repo-local scripts and established aliases over assumptions from another project.
6. If the task touches TanStack Query, Router, Start, React, Next, Expo, or React Native behavior, load the matching installed domain skill after this context pass.
7. Before claiming completion, use `verification-profile` to choose the lightest defensible check.

## Guardrails

- Do not force a project into a folder layout it does not already use.
- Treat generated files as outputs unless the repo has no generator path.
- Keep edits within the smallest layer that owns the behavior.
- Avoid adding shared utilities until there are real cross-slice consumers.
- Preserve native `ios/` and `android/` changes unless the task explicitly targets native configuration.

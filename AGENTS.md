# Personal Codex Workflow

This repository uses a personal Codex Desktop workflow.
`AGENTS.md` is intentionally lightweight: it defines global rules and routing hints.
Detailed execution belongs in skills and explicit user requests.

## Language

- Write `AGENTS.md`, skills, and agent instructions in English.
- Respond to the user in Russian unless the user explicitly asks for another language.
- Keep user-facing summaries, plans, review notes, and status updates in Russian.
- Code, file names, commit message suggestions, and API-level identifiers may stay in English.

## Core Principle

- First identify the task type.
- Then choose the lightest workflow that fits the task.
- Use skills and agents as execution tools, not as extra bureaucracy.
- Do not force implementation-oriented workflow onto review, documentation, or leadership tasks.

## Typical Work Modes

These are routing hints, not full workflows:

- Code review
- Architecture analysis and design
- Brainstorming before implementation
- Implementation after design alignment
- Documentation writing
- Leadership and project guidance

## Work Mode Routing

- `Code review`
  Prefer process: `superpowers:requesting-code-review`
  Prefer reviewer: `agents/code-reviewer.md`
  Prefer feedback handling: `superpowers:receiving-code-review`
  Use `skills/code-review/SKILL.md` as the local review quality bar and findings format.

- `Architecture analysis and design`
  Prefer: `architecture-review`
  Delegate if useful: `agents/architect-review.md`

- `Brainstorming before implementation`
  Prefer: `superpowers:brainstorming`

- `Implementation after design alignment`
  For React/Next/UI work, prefer sequence: `superpowers:brainstorming` -> `superpowers:writing-plans` when needed -> relevant Vercel skills.
  Add `vercel-react-view-transitions` when the task involves transitions or motion.
  Add TanStack skills when the implementation touches TanStack Query, Router, Start, or AI.

- `Documentation writing`
  Prefer: `agents/documentation-expert.md`
  For API-focused docs: `agents/api-documenter.md`

- `Leadership and project guidance`
  Prefer: `skills/cto-advisor/SKILL.md`

Use a skill or agent only after the work mode is clear.

When using superpowers review-process skills, keep the process from superpowers but use the local `agents/code-reviewer.md` as the reviewer.

## Todoist

- Use Todoist only when the user explicitly asks for it.
- Do not create or manage Todoist tasks by default.

## Engineering Guardrails

- Read the codebase and existing patterns before making assumptions.
- For React, Vite, Expo, or React Native repositories that use the personal feature-first architecture, use `repo-context` before implementation, review, or debugging work.
- For JavaScript and TypeScript writing, refactoring, or review, use `js-ts-quality` to calibrate AI behavior around readability, pure functions, side-effect boundaries, type clarity, and avoiding overengineering.
- For bugs and unexpected behavior, use `debugging-quality` so fixes trace the root cause before editing.
- For queries, mutations, forms, cache, route params, local state, global state, or persistence, use `state-data-quality` to clarify ownership before editing.
- For code health cleanup involving dead code, unused files, unused exports, unused dependencies, copy-paste detection, duplication, `knip`, `jscpd`, or dry refactoring, use `code-health-tools`. Treat tool output as evidence to investigate, not as permission to delete or abstract code blindly.
- For non-trivial implementation work, use `superpowers:brainstorming` first.
- Use `superpowers:writing-plans` for multi-step implementation when planning will materially reduce risk or rework.
- Do not write tests by default. Add new tests only when the user explicitly asks for them.
- Modify existing tests only when they already cover behavior that was intentionally changed.
- Do not default to `superpowers:test-driven-development`; use it only when the user explicitly asks for TDD.
- For React, Next.js, and UI work, use the Vercel skills from `~/.agents/skills` as the frontend source of truth instead of local React-specific skills.
- For TanStack work, load the matching installed TanStack skill before implementation:
  - `tanstack-query-best-practices` for server state, caching, mutations, invalidation, or query keys.
  - `tanstack-router-best-practices` for routing, loaders, navigation, search params, or route organization.
  - `tanstack-start-best-practices` for TanStack Start server functions, middleware, SSR, auth, API routes, or deployment adapters.
  - `tanstack-integration-best-practices` when TanStack Query is combined with Router or Start.
  - TanStack AI package skills from `node_modules` for chat, tool calling, adapters, structured outputs, streaming, Code Mode, sandbox drivers, or server tool registration.
- For Vercel-related work, load the matching installed Vercel skill before implementation:
  - `vercel-react-best-practices` for React/Next.js performance, rendering, async data, bundles, or server/client boundaries.
  - `vercel-composition-patterns` for reusable component APIs, compound components, context interfaces, or boolean prop refactors.
  - `vercel-react-view-transitions` for route transitions, shared element transitions, or motion with React View Transitions.
  - `vercel-react-native-skills` for React Native or Expo work.
  - `deploy-to-vercel` or `vercel-cli-with-tokens` only when the user asks for deployment or Vercel project management.
- Write code only after the approach is clear enough.
- Before claiming a fix or completion, use `verification-profile` to choose an appropriate verification command and base the claim on its output. Verification can be lint, typecheck, build, targeted smoke check, or an existing test command when tests already cover the touched behavior.
- For external libraries, frameworks, and SDKs, use installed package skills first when present. Use the Context7 MCP server for up-to-date documentation when skills are insufficient; if Context7 is insufficient, fall back to primary official documentation.

## Change Safety

- Stay on the current git branch unless the user explicitly asks for a new branch.
- Do not create commits unless the user explicitly asks.
- Do not revert, overwrite, or discard user changes unless the user explicitly asks.
- Do not assume that every task should end in code changes.

## Subagents

- Use subagents only for bounded, autonomous work that can be delegated safely.
- Typical examples: independent code review, security review, architecture review, or documentation drafting on a clearly scoped target.
- Do not spawn subagents for the main critical path when the next local step depends on the result immediately.
- Prefer inline work when the task is small, tightly coupled, or mostly conversational.

## Defaults

- Be concise, direct, and pragmatic.
- Prefer clarity over ceremony.
- Surface blockers early and state concrete next steps.

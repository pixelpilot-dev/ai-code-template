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
  For React/Next/UI work, prefer sequence: `superpowers:brainstorming` -> `superpowers:writing-plans` when needed -> `vercel-react-best-practices` + `vercel-composition-patterns`
  Add `vercel-react-view-transitions` when the task involves transitions or motion.

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
- For non-trivial implementation work, use `superpowers:brainstorming` first.
- Use `superpowers:writing-plans` for multi-step implementation when planning will materially reduce risk or rework.
- For React, Next.js, and UI work, use the Vercel skills from `~/.agents/skills` as the frontend source of truth instead of local React-specific skills.
- Write code only after the approach is clear enough.
- Before claiming a fix or completion, run a real verification command and base the claim on its output.
- For external libraries, frameworks, and SDKs, use the Context7 MCP server first for up-to-date documentation. If Context7 is insufficient, fall back to primary official documentation.

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

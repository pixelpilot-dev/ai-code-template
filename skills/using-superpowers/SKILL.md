---
name: using-superpowers
description: Use at the start of work to determine the right skills and avoid missing process guardrails.
---

# Using Superpowers

## When to use

- at the start of any new task
- before the first clarifying question
- before moving into implementation, debugging, review, or planning

## Goal

Quickly determine which skills are actually needed for the current task and avoid dragging in unnecessary workflow.

## Rules

1. First check whether a process skill is needed.
2. If the task is about new functionality, behavior changes, or a noticeable rework, start with `superpowers:brainstorming`.
3. If the work becomes multi-step after the design is aligned, use `superpowers:writing-plans`.
4. If the task is about a bug or unexpected behavior, start with `systematic-debugging` if it is available.
5. If a substantial implementation step is complete and needs review, use the process from `superpowers:requesting-code-review`, but keep the reviewer local: `agents/code-reviewer.md`.
6. If you are receiving review feedback, use `superpowers:receiving-code-review`.
7. If the task is complete and you are about to claim it is done, use `superpowers:verification-before-completion`.
8. For React, Next.js, and UI implementation or review, prefer external Vercel skills from `~/.agents/skills`: `vercel-react-best-practices`, `vercel-composition-patterns`, and `vercel-react-view-transitions` when relevant.
9. Use domain skills only after process skills and only when they materially help in the current context.

## Priority

1. Direct user instructions and local repository rules.
2. Process skills.
3. Domain skills.
4. Reference materials.

## Red flags

- reading code first and only then deciding whether a skill is needed
- activating multiple overlapping skills without a clear reason
- using reference material as if it were a workflow
- ignoring local repository rules in favor of an imported template

## Expected output

- the minimal skill set for the task has been selected
- it is clear why those skills are being used
- the rest of the work follows the appropriate workflow instead of inertia

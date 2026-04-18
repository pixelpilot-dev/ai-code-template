# Personal Codex Workflow

This repository is the source of truth for a personal Codex Desktop setup.

It contains:

- a lightweight global [`AGENTS.md`](./AGENTS.md)
- a small set of custom local skills in [`skills/`](./skills)
- a small set of custom local agents in [`agents/`](./agents)
- supporting docs in [`docs/`](./docs)
- a sync script in [`scripts/sync-codex-links.sh`](./scripts/sync-codex-links.sh)

The goal is to keep the workflow opinionated but small: global routing in `AGENTS.md`, focused custom skills where needed, custom agents for bounded subagent work, and external packages for broader ecosystems.

## What This Repo Manages

### 1. Global Routing

[`AGENTS.md`](./AGENTS.md) is intentionally lightweight.

It defines:

- language rules
- task routing by work mode
- engineering guardrails
- subagent usage rules
- how local assets and external skill packages should be combined

### 2. Custom Local Skills

Current local skills:

- [`using-superpowers`](./skills/using-superpowers/SKILL.md)
- [`architecture-review`](./skills/architecture-review/SKILL.md)
- [`security-review`](./skills/security-review/SKILL.md)
- [`clean-code-review`](./skills/clean-code-review/SKILL.md)
- [`code-review`](./skills/code-review/SKILL.md)
- [`cto-advisor`](./skills/cto-advisor/SKILL.md)

These cover the parts of the workflow that are specific to this setup:

- local routing discipline
- architecture analysis
- security review
- code cleanliness
- local code review quality bar
- CTO / leadership guidance

### 3. Custom Local Agents

Current local agents:

- [`code-reviewer`](./agents/code-reviewer.md)
- [`architect-review`](./agents/architect-review.md)
- [`security-auditor`](./agents/security-auditor.md)
- [`documentation-expert`](./agents/documentation-expert.md)
- [`api-documenter`](./agents/api-documenter.md)

These are intended for bounded autonomous work through subagents, not for general-purpose orchestration.

### 4. Supporting Docs

- [`docs/codex-skill-cheatsheet.md`](./docs/codex-skill-cheatsheet.md) — quick prompting cheatsheet for common workflows

## External Dependencies

This setup is intentionally not self-contained. It relies on external skill ecosystems and MCP servers.

## Installing External Skill Packages

This repo assumes two external layers are available in the local Codex setup:

- `superpowers` for process workflows
- Vercel skill packages for React / Next.js / UI work

### Install Superpowers

Superpowers should be installed into `~/.codex/superpowers` and exposed through native skill discovery in `~/.agents/skills/`.

```bash
git clone https://github.com/obra/superpowers.git ~/.codex/superpowers
mkdir -p ~/.agents/skills
ln -s ~/.codex/superpowers/skills ~/.agents/skills/superpowers
```

Then restart Codex and verify:

```bash
ls -la ~/.agents/skills/superpowers
```

### Install Vercel Skills

The frontend layer in this workflow relies on the Vercel agent skill package.

```bash
npx skills add vercel-labs/agent-skills
```

This installs skill folders into `~/.agents/skills/`, including packages such as:

- `vercel-react-best-practices`
- `vercel-composition-patterns`
- `vercel-react-view-transitions`
- `web-design-guidelines`
- `deploy-to-vercel`
- `vercel-cli-with-tokens`

After installation, restart Codex and verify:

```bash
ls -la ~/.agents/skills
```

### Superpowers

Superpowers is used as the primary process layer for:

- brainstorming
- planning
- review process
- review feedback handling
- verification

This repo does **not** replace those process skills when Superpowers already provides a stronger workflow.

### Vercel Skills

Vercel skill packages installed in `~/.agents/skills/` are treated as the frontend source of truth for React / Next.js / UI implementation and review.

In practice, React-related work should prefer:

- `vercel-react-best-practices`
- `vercel-composition-patterns`
- `vercel-react-view-transitions`
- `web-design-guidelines` when the task includes UI/accessibility/design review

Vercel is used here as an additional toolset, especially for React and UI best practices.

### MCP Servers

This workflow expects MCP servers to be available in Codex, especially:

- `context7` for up-to-date library and framework docs
- `todoist` when explicitly requested
- any additional local/project-specific MCP servers you have configured

## Review Model

Code review is intentionally split into two layers:

- **process** comes from Superpowers:
  - `superpowers:requesting-code-review`
  - `superpowers:receiving-code-review`
- **reviewer** stays local:
  - [`agents/code-reviewer.md`](./agents/code-reviewer.md)

This means:

- the review workflow is inherited from Superpowers
- the actual review voice and findings style come from the local reviewer
- [`skills/code-review/SKILL.md`](./skills/code-review/SKILL.md) acts as the local review quality bar

## Repository Layout

```text
.
├── AGENTS.md
├── README.md
├── agents/
│   ├── api-documenter.md
│   ├── architect-review.md
│   ├── code-reviewer.md
│   ├── documentation-expert.md
│   └── security-auditor.md
├── docs/
│   └── codex-skill-cheatsheet.md
├── scripts/
│   └── sync-codex-links.sh
└── skills/
    ├── architecture-review/
    ├── clean-code-review/
    ├── code-review/
    ├── cto-advisor/
    ├── security-review/
    └── using-superpowers/
```

## Syncing Into Codex

This repo is intended to stay under git while Codex consumes it through symlinks.

Use:

```bash
bash ./scripts/sync-codex-links.sh --dry-run
bash ./scripts/sync-codex-links.sh
```

The script:

- links [`AGENTS.md`](./AGENTS.md) into `~/.codex/AGENTS.md`
- links local skills from [`skills/`](./skills) into `~/.codex/skills/`
- links local agents from [`agents/`](./agents) into `~/.codex/agents/`
- backs up conflicting existing paths under `~/.codex/backups/...`
- removes stale repo-managed symlinks

After syncing, open a new Codex chat or restart Codex so changes are picked up reliably.

## Workflow Philosophy

This setup is intentionally hybrid:

- keep global instructions short
- keep custom local skills small and specific
- use subagents only for bounded autonomous tasks
- lean on external skill packages when they are clearly better maintained
- avoid duplicating process skills that Superpowers already handles well

## Notes

- React-specific implementation guidance is no longer maintained locally in this repo.
- Architecture, security, code cleanliness, review style, and CTO-level guidance remain local on purpose.
- Todoist is optional and should only be used when explicitly requested.

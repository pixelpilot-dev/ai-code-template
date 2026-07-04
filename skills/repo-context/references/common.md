# Common Frontend Repo Context

This reference describes the general personal frontend architecture used across React, Vite, Expo, and React Native repositories.

## Shared Shape

Use a feature-first architecture with small variations:

- `app` owns bootstrap, providers, runtime effects, routing, and app shell.
- `pages`, `screens`, or route files are entry points. Keep them thin when possible.
- `widgets` compose multiple features or shared UI into larger screen sections.
- `features` own user workflows and feature-specific `ui`, `lib`, `model`, `api`, or `constants`.
- `entities` appear in stricter FSD web projects for domain objects shared by multiple features.
- `shared` owns reusable UI, API clients, config, constants, routes, low-level libs, schemas, and cross-cutting infrastructure.
- `services` may appear in React Native projects as the data/auth/query layer. Treat it like shared infrastructure, not as feature UI.

## Boundary Rules

- Follow the current repo's layer direction. Higher layers may use lower layers; lower layers should not import higher layers.
- Prefer public slice entry points such as `index.ts` when they exist.
- Use relative imports inside the same slice or segment.
- Do not deep-import another feature's `ui`, `lib`, `model`, or `api` unless the repo already exposes that contract.
- Keep generated files, route trees, and OpenAPI schemas out of manual edits unless the task is specifically about the generator.

## Data And State

- TanStack Query is the preferred server-state tool when the repo already uses it.
- Query clients live in `app/providers`, `bootstrap`, or `services/query`.
- Domain API clients live in `shared/api`, `services/api`, or a feature `model/api` when the feature owns the flow.
- Zustand may appear for client state. Do not use it for server cache.
- Query keys and invalidation should stay near the data owner or a shared query constants module already used by the repo.

## Change Placement

- UI-only changes usually belong in the closest `ui` file.
- Screen composition belongs in `pages`, `screens`, route files, or `widgets`.
- Business logic and view-model hooks belong in `lib` or `model` inside the owning feature.
- API request shape, adapters, and generated client overrides belong in `shared/api`, `services/api`, or feature `model/api`.
- Cross-cutting visual primitives belong in `shared/ui`; domain-specific components should stay in the feature.

## First Commands To Inspect

Use these before deciding the verification path:

```bash
node -e "const p=require('./package.json'); console.log(p.scripts)"
find . -maxdepth 3 -type d -not -path './node_modules*' -not -path './.git*' | sort | sed -n '1,180p'
```

Prefer `rg` for code search.

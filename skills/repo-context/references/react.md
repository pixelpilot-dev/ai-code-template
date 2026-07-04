# React And Vite Repo Context

## Common Profiles

React/Vite app-shell profile:

- Vite + React with an Electron build path.
- Source layout: `src/app`, `src/features`, `src/pages`, `src/shared`, `src/widgets`.
- Routing lives under `src/app/router`; screens live under `src/pages`.
- API/OpenAPI lives under `src/shared/api`, with generated schema output.
- Aliases include `@`, `@config`, `@app-env`, `@components`, `@lib`, and `@api`.

React/Vite FSD profile:

- Vite + React with TanStack Router, Storybook, Tailwind, and React Compiler.
- Source layout: `src/app`, `src/entities`, `src/features`, `src/pages`, `src/shared`, `src/widgets`.
- Routes live under `src/app/router/routes`; `routeTree.gen.ts` is generated.
- Aliases mirror FSD layers: `@app`, `@entities`, `@features`, `@pages`, `@shared`, `@widgets`.
- ESLint enforces public APIs and FSD import direction.

## Web Rules

- Keep app bootstrap in `src/app`: providers, router setup, app shell, runtime init.
- Put route/screen entry points in `src/pages` or `src/app/router/routes`, matching the repo.
- Keep route files thin: load guards, params, layout selection, then compose page/widgets/features.
- Put domain API code in `src/shared/api` unless the repo already keeps it in a feature.
- Do not manually edit generated files such as TanStack route trees or OpenAPI generated clients.
- When an ESLint file defines FSD restrictions, treat them as the source of truth.

## Common Scripts

Inspect `package.json` first, then prefer these patterns:

- General web checks: `lint`, `typecheck`, `build`, `format:check`.
- Type-only repos may use `lint:types` instead of `typecheck`.
- API/OpenAPI repos may use `openapi:lint`, `openapi:bundle`, `openapi:generate`, or `api:generate`.
- TanStack Router repos may use `routes:generate` before typecheck/build.
- Storybook repos may use `storybook` or `build-storybook` for component-library changes.
- Electron-specific changes should include `build:electron-main` or the repo's Electron script if touched code is in Electron config/runtime.

## Skill Routing

- Use `vercel-react-best-practices` for React rendering, performance, server/client boundaries, or component changes.
- Use `vercel-composition-patterns` for reusable component APIs or prop/API design.
- Use `tanstack-router-best-practices` for TanStack Router routes, loaders, params, and navigation.
- Use `tanstack-query-best-practices` for queries, mutations, invalidation, query keys, and cache behavior.

# Client State

## Good Client State

Use local or global client state for:

- UI visibility and selection
- wizard or modal progress
- unsaved drafts
- local feature preferences
- temporary interaction state
- offline or persisted local-only data

## Bad Client State

Avoid storing:

- server data already owned by a query cache
- values derived cheaply from props/query data
- duplicated route params
- data used only by one child when props are clearer
- global state created to avoid passing two props

## Derived Data

Prefer deriving during render or in a small pure helper. Store derived data only when computation is expensive, async, or represents a user-edited draft.

## Global Stores

Use global stores when state crosses distant parts of the app and has clear ownership. Keep store actions narrow and domain-named. Do not turn stores into miscellaneous bags.

## Persistence

Persistent local state needs an explicit reason: offline behavior, auth/session, preferences, onboarding, or native capability. Treat persistence as a side effect boundary.

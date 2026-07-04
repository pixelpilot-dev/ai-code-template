# Common Antipatterns

## Architecture

- Adding a generic helper for one call site.
- Moving feature-specific logic into `shared` before there are real shared consumers.
- Deep-importing another feature's internals instead of using its public API.
- Putting API details, navigation, formatting, and UI state into one large component.
- Editing generated files while leaving the generator stale.
- Introducing abstractions for imagined future use instead of current complexity.
- Turning jscpd clone output into shared utilities without proving shared domain ownership.

## React And State

- Duplicating server state in local state or Zustand.
- Invalidating broad query groups when a specific query key is enough.
- Creating provider-level effects that hide feature ownership.
- Passing many boolean props where composition or separate components would be clearer.

## React Native

- Treating native config changes as JS-only changes.
- Hiding permissions, storage, or background behavior inside UI components.
- Adding platform-specific code without checking iOS and Android behavior.
- Reusing web assumptions for navigation, safe areas, keyboard behavior, or gestures.

## Review Smells

- A finding that cannot describe what breaks.
- A style preference framed as a correctness bug.
- A proposed fix that rewrites unrelated code.
- A cleanup suggestion presented as mandatory without showing the maintenance risk.
- A dead-code finding based only on Knip output without checking framework entrypoints or dynamic usage.

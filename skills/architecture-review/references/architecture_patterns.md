# Architecture Patterns

## Feature-First Layers

- `app`: composition root, providers, routing, runtime setup.
- `pages` or `screens`: route-level entry points.
- `widgets`: larger UI compositions built from features and shared UI.
- `features`: user workflows and domain-specific behavior.
- `entities`: stable domain objects shared by multiple features, when the repo uses this layer.
- `shared`: low-level primitives, API clients, config, constants, and reusable UI.

## Good Boundaries

- A feature can be understood from its public exports and nearby `ui`, `lib`, and `model` folders.
- Shared modules do not import app, page, widget, feature, or entity code.
- Cross-feature communication happens through explicit public APIs, route params, query cache, or a shared domain layer.
- Generated clients and route trees have a clear source generator.

## Trade-Offs

- Keeping logic in a feature is cheaper until another real consumer appears.
- Moving logic to `shared` reduces duplication only when ownership remains clear.
- Adding a domain layer is useful for stable concepts, but harmful for one-off screen state.

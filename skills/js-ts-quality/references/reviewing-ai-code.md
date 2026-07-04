# Reviewing AI-Generated JS/TS

## Review Priorities

1. Correctness: does the code implement the requested behavior without changing unrelated behavior?
2. Boundary fit: is code placed in the layer that owns the behavior?
3. Side effects: are I/O, storage, logging, navigation, and mutations explicit?
4. Types: do types narrow uncertainty or only silence the compiler?
5. Simplicity: could the code be simpler without losing clarity?
6. Verification: does the chosen command actually exercise the changed surface?

## AI-Specific Smells

- New abstractions with no current consumer.
- Overly generic names: `handleData`, `processItems`, `commonUtils`, `manager`, `service` without a domain noun.
- Defensive code for states that cannot happen locally.
- Type assertions that paper over incompatible data.
- Comments that narrate every line.
- Silent behavior changes hidden inside formatting or cleanup.
- Large files touched to make a small behavior change.
- Data copied into local state only to mirror props, query data, or derived values.

## Finding Standard

Only report a finding when you can state:

- what can break
- where the risk enters
- why the existing code path allows it
- what focused change would fix it

Do not report vague “could be cleaner” feedback as a finding. Put low-confidence cleanup ideas in a short note after findings.

## Good Review Language

- “This mutation updates X but only invalidates Y, so screen Z can show stale data.”
- “This helper has one call site and hides a two-line transformation; keeping it inline is clearer.”
- “The route file now owns data shaping. Move that to the feature hook so the route remains composition-only.”
- “The `as` assertion hides an untrusted API shape. Narrow the response before using it.”

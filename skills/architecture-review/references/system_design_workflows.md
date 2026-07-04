# System Design Workflows

## Lightweight Review

1. Name the changed behavior and the owning layer.
2. List the modules that read or write the affected data.
3. Check whether side effects start from the right place: app/bootstrap for global effects, feature/model for feature effects, shared API for transport.
4. Identify generated, native, or external contracts.
5. Recommend the smallest structure that keeps future changes local.

## When To Propose Options

Offer 2-3 options only when placement or ownership is genuinely ambiguous. Otherwise recommend the established repo pattern.

Useful option categories:

- keep in current feature
- extract to shared/domain API
- introduce a widget or entity layer
- move side effects to app/bootstrap

## Output

Keep the output practical:

- current boundary
- risk if unchanged
- recommended placement
- migration steps, if any

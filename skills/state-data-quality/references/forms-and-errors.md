# Forms And UI States

## Forms

- Let forms own unsaved user input.
- Convert API data into form defaults at the boundary.
- Convert form values into API payloads in a submit adapter or mutation layer.
- Keep validation close to the form schema or domain rule.
- Do not write form drafts back into server cache until submit succeeds unless the UX explicitly requires optimistic behavior.

## UI States

Every data-driven screen or component should intentionally handle:

- loading
- empty
- error
- success
- disabled/submitting

Do not add decorative state branches. Add states that users can actually encounter.

## Error Handling

- Show user-facing errors where the user can act.
- Log or monitor unexpected technical errors at the boundary.
- Keep retry behavior explicit.
- Avoid swallowing errors in mutations, effects, and async handlers.

## Review Questions

- Can users recover from failure?
- Is disabled/submitting state preventing duplicate actions?
- Does empty state differ from loading?
- Are validation errors local and API errors handled after submit?

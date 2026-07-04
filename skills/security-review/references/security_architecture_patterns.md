# Security Architecture Patterns

## Frontend And Mobile Hotspots

- Authn: login, token refresh, session restore, logout, Firebase auth, OAuth callbacks.
- Authz: role-based routes, patient/doctor access checks, tenant or organization boundaries.
- Data exposure: logs, error messages, client state, query cache, generated API clients.
- Inputs: forms, file uploads, route params, search params, deep links, webhooks, and external links.
- Local persistence: secure storage, MMKV/AsyncStorage, cached health data, uploaded file metadata.
- Native config: app schemes, permissions, entitlements, Android permissions, iOS usage descriptions.

## Review Pattern

1. Identify untrusted inputs and sensitive outputs.
2. Trace where the data is validated, authorized, stored, logged, and rendered.
3. Check whether UI-only checks are backed by API/server enforcement.
4. Verify logout and account switching clear sensitive cache and local state.
5. Prefer concrete exploit paths over generic best-practice warnings.

# Cryptography Implementation

## Defaults

- Do not design custom crypto.
- Prefer platform libraries and established app primitives already used by the repo.
- Keep secrets out of source, generated clients, logs, crash reports, and public config.
- Treat client-side encryption as exposure reduction, not as authorization.

## Frontend And Mobile

- Web tokens should use the repo's existing session storage and refresh strategy.
- Mobile sensitive values should use secure platform storage when available.
- Do not store long-lived access tokens in plain AsyncStorage/MMKV unless the existing risk is explicitly accepted.
- Do not log tokens, authorization headers, signed URLs, one-time codes, or health data payloads.

## Red Flags

- Home-grown hashing, signing, key derivation, or encryption helpers.
- Reversible encoding presented as encryption.
- Hard-coded keys or API secrets in app config, generated files, or source.
- Crypto changes without a server/API contract review.

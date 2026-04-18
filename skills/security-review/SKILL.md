---
name: security-review
description: Use for application security review of code and decisions, especially around auth, validation, secrets, and data exposure.
---

# Security Review

## When to use

- auth, session, permissions, and tokens
- user input, file uploads, integrations, and webhooks
- secrets, cookies, headers, and logs
- code where a mistake could lead to data leakage or access-control bypass

## When not to use

- a purely visual UI change with no data or integrations
- general architectural decomposition without security risk

## How to work

1. Identify the attack surface of the current change.
2. Check where untrusted input enters and how it is validated.
3. Verify that sensitive information does not leak into responses, logs, or client state.
4. Treat authz separately from authn: who is logged in and what they are allowed to do.
5. If the risk is high, formulate findings before implementation or before merge, not after.

## What to inspect

- input validation and data normalization
- authorization checks and bypass paths through clients or internal endpoints
- secrets, tokens, cookie flags, configs, and logs
- injection, traversal, and SSRF-like scenarios where applicable
- safe error handling without unnecessary information leakage

## Expected output

- a prioritized list of security findings
- a concise risk description
- a concrete remediation or follow-up direction

## References

- `skills/security-review/references/security_architecture_patterns.md`
- `skills/security-review/references/cryptography_implementation.md`
- `skills/security-review/references/penetration_testing_guide.md`

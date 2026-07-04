# Penetration Testing Guide

Use this only when the user asks for security validation beyond static review.

## Static First

Before dynamic probing, identify:

- the target flow
- allowed environment
- test account boundaries
- data that must not be modified
- commands or tools that need approval

## Manual Checks

- Try unauthenticated access to protected routes and API calls.
- Try cross-user or cross-tenant identifiers in route params and API payloads.
- Try malformed file uploads, oversized payloads, and unsupported extensions.
- Check whether logout clears sensitive cache and local storage.
- Check whether deep links or external links can redirect to unsafe targets.

## Safety

- Do not attack production or third-party systems without explicit approval.
- Do not brute force, fuzz aggressively, or run scanners unless explicitly authorized.
- Report exact request/response evidence when available, but redact secrets and personal data.

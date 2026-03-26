---
paths:
  - "ios/**/Services/**/*.swift"
  - "ios/**/UseCases/**/*.swift"
---

# Service / use-case rules

- Define **protocol-first** boundaries for network, persistence, and clock/time.
- Every async API should be **cancellable** where reasonable (`AsyncThrowingStream`, `URLSession` tasks).
- Use **typed errors** (domain-specific enums/structs); avoid silent `try?` on recoverable failures without metrics or logging.
- Apply **timeouts and retry policy** explicitly for network; document when retries are unsafe (non-idempotent writes).
- **Secrets** never appear in literals; load from Keychain, secure enclave flows, or server-issued tokens.

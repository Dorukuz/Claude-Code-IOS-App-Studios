---
paths:
  - "ios/**/Tests/**/*.swift"
  - "ios/**/*Tests.swift"
---

# Test rules

- Tests must be **deterministic**; avoid real network (inject protocols / URLProtocol stubs).
- Name tests **`test_<condition>_<expected>()`** or follow existing XCTest style in repo.
- Prefer **black-box module tests** for services; UI tests only for critical flows (launch, paywall, auth).
- Snapshot tests (if used) must pin **device traits** and dark/light where UI depends on them.
- No credentials or production endpoints in test bundles.

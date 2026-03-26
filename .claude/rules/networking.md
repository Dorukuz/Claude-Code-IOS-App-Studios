---
paths:
  - "ios/**/Networking/**/*.swift"
  - "ios/**/API/**/*.swift"
---

# Networking rules

- Enforce **HTTPS**; document any ATS exceptions in Info.plist with justification.
- Centralize **base URL**, environment switches, and header injection (no duplicated `URLSession` configuration).
- Validate **response codes and decoding** explicitly; do not assume happy-path JSON.
- **Certificate pinning** is opt-in—if enabled, document rotation and failure UX.
- Never send **privacy-sensitive fields** in query strings or analytics payloads without review.

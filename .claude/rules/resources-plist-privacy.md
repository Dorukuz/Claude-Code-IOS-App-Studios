---
paths:
  - "ios/**/*.xcassets/**"
  - "ios/**/*.plist"
  - "ios/**/PrivacyInfo.xcprivacy"
  - "ios/**/*.entitlements"
---

# Resources, Info.plist, privacy manifest

- **Asset catalogs**: consistent naming (no spaces; prefer `snake_case` or `camelCase` per team convention); provide @2x/@3x where applicable.
- **Info.plist keys**: every **usage description** (`NS*UsageDescription`) must match real behavior; update localization where strings are user-visible in system prompts.
- **Privacy manifest** (`PrivacyInfo.xcprivacy`): required APIs and data collection must be **accurate**; update when adding SDKs.
- **Entitlements**: add only what you need; document push, iCloud, associations, etc., in `docs/` or ADR.

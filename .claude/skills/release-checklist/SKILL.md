---
name: release-checklist
description: "Pre-submission checklist for iOS: build settings, signing sanity, privacy artifacts, tests, and App Store readiness."
argument-hint: "[version/build]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit
---

# Release checklist

Use before **TestFlight** wide distribution or **App Store** submission.

---

## 1. Context

Ask if unknown:

- Target release: **marketing version** + **build number**
- Minimum iOS / devices supported
- **IAP** or **subscriptions** in this build?

---

## 2. Engineering gates

- [ ] `swift test` / `xcodebuild test` green on CI (or documented exception).
- [ ] No debug-only endpoints hardcoded.
- [ ] Feature flags / remote config documented if release-critical.
- [ ] Crash reporting symbolication ready (dSYM upload path known).

---

## 3. Privacy & compliance

- [ ] `PrivacyInfo.xcprivacy` up to date for SDK/reason API changes.
- [ ] App Store **Privacy Nutrition Labels** match actual behavior.
- [ ] **ATT** if tracking; prompt timing reviewed with product.

---

## 4. App Store Connect metadata

- [ ] Screenshots for required sizes / locales planned.
- [ ] “What’s New” accurate.
- [ ] Review notes include demo credentials if login required.

---

## 5. QA sign-off alignment

Cross-link `qa-lead` criteria: critical flows verified on **device** + smallest supported OS version.

---

## Output

Produce a Markdown checklist the team can paste into `production/milestones/` or ticket comment. Mark **blockers** explicitly.

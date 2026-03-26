---
name: code-review
description: "Structured Swift/iOS code review: architecture fit, concurrency, SwiftUI boundaries, privacy, accessibility, and test seams."
argument-hint: "[path or PR scope]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit
---

# Code review (iOS)

Perform a **constructive** review of the requested scope (feature, directory, or PR description).

---

## 1. Clarify scope

If missing, ask:

- Target: `ios/...` paths, feature name, or “whole diff”?
- Risk level: user data? payments? networking?
- **Definition of done** for this change?

---

## 2. Checklist (adapt to scope)

### Architecture & Swift

- [ ] Clear module boundaries; avoid cyclical deps.
- [ ] State ownership: views thin; services injected.
- [ ] Swift concurrency: `async` cancellation, `@MainActor` appropriateness, no unbounded `Task {}` in `body`.
- [ ] Error handling: typed errors; user-visible recovery.

### UI (SwiftUI / UIKit)

- [ ] Loading / empty / error states for async work.
- [ ] Dynamic Type and VoiceOver basics for new controls.
- [ ] No blocking work on main thread.

### Security & privacy

- [ ] No secrets in source; tokens not logged.
- [ ] Network calls use TLS; exceptions documented.

### Tests

- [ ] Logic covered or issue tracked with owner tag `TODO(name):`.
- [ ] Tests deterministic (no prod network).

### Performance

- [ ] Large lists use lazy stacks / pagination where needed.
- [ ] Images scaled appropriately; caching policy sane.

---

## 3. Output format

Use headings:

1. **Summary** — 2–4 bullets.
2. **Blockers** — must-fix before merge.
3. **Suggestions** — should-fix / nice-to-have.
4. **Questions** — ambiguities for author/product.

Link to **rules**: `.claude/rules/*.md` when relevant.

---

## 4. Collaboration

Offer **fixes** as optional follow-up; do not rewrite broad areas without explicit ask.

---
name: accessibility-audit
description: "Accessibility pass for iOS: VoiceOver labels/traits, Dynamic Type, contrast, motion, and focus order for a flow or screen set."
argument-hint: "[feature or screen list]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit
---

# Accessibility audit

---

## 1. Scope

Ask:

- Which **flows** (e.g., onboarding → paywall → home)?
- **Custom controls** vs. standard SwiftUI controls?
- Supported **iOS versions**?

---

## 2. Review areas

### VoiceOver

- [ ] Every interactive element has meaningful label (not relying on guessed icon names).
- [ ] Group-related content with `accessibilityElement(children:)` where it reduces verbosity.
- [ ] Dynamic content updates use `accessibilityValue` / announcements appropriately.

### Dynamic Type

- [ ] Layouts reflow without clipping critical actions.
- [ ] Multiline text allowed where copy can grow.

### Visual

- [ ] SF Symbols / custom icons meet contrast for text backgrounds.
- [ ] Color is not the only state indicator.

### Motion

- [ ] Respect `accessibilityReduceMotion`; provide simpler transitions when set.

### Input

- [ ] Hit targets ≥ recommended where custom; not obscured.

---

## 3. Output

Table of issues:

| Area | Location | Severity | Fix suggestion |
|------|----------|----------|----------------|

Prioritize **ship blockers** (unreachable actions under VoiceOver).

---

## 4. Collaboration

Pair with `product-designer` if flows must change; with `swiftui-engineer` for implementation.

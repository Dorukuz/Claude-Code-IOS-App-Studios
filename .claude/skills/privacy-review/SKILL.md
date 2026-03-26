---
name: privacy-review
description: "Privacy review for iOS apps: data inventory, PrivacyInfo.xcprivacy, ATT, SDKs, logging, and App Store label consistency (non-legal)."
argument-hint: "[feature or SDK change]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit
---

# Privacy review

**Not legal advice.** Flag gaps; recommend involving counsel for policies and regulated domains.

---

## 1. Triggering context

Ask:

- New **third-party SDK**? Which vendor & version?
- New **data type** collected (location, contacts, IDFA, health, financial)?
- **Analytics / ads / fraud** changes?

---

## 2. Inventory

Use or create `docs/templates/privacy-worksheet-template.md` instance.

For each data type: **collected?** **linked to user?** **tracking?** **purpose?** **retention?**

---

## 3. Technical checks

- [ ] `PrivacyInfo.xcprivacy` lists **required reason APIs** used.
- [ ] Sensitive APIs have **usage descriptions** in Info.plist where required.
- [ ] Logs / crash reports scrub **PII** and tokens.
- [ ] Deep links / notifications do not leak secrets.

---

## 4. ATT & tracking

If IDFA or cross-app tracking: verify **ATT** timing and copy with `product-designer`.

---

## 5. Output

- **Risks** (High/Med/Low) with remediation owners (`privacy-compliance-lead`, `analytics-engineer`, `networking-engineer`).
- **Checklist** for ASC privacy questions update.

---

## Collaboration

Escalate architectural shifts (on-device only, E2EE) to `technical-director`.

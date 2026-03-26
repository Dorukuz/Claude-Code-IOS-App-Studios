---
name: testflight-notes
description: "Draft TestFlight / beta release notes and a structured verification list for testers."
argument-hint: "[build]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit
---

# TestFlight notes

---

## 1. Inputs

Gather:

- Build / branch / version
- **User-visible changes** since last beta
- **Known issues** safe to expose to testers
- Features needing **specific hardware** (e.g., NFC, Watch)

---

## 2. Draft — What to test

Short bullets:

- Focus areas (max 5)
- Regressions to watch
- Anything **NOT** ready (explicitly)

Tone: concise, friendly, honest.

---

## 3. Internal QA checklist

Clone sections from `docs/templates/testflight-checklist-template.md` and tailor.

---

## 4. Output files (suggest paths)

- `production/milestones/testflight-build-XXX.md` — full checklist + sign-off
- ASC **What to Test** field — copy-ready paragraph under 4k chars

---

## Collaboration

Loop in `qa-lead` for severity of known issues; `release-manager` for group assignments.

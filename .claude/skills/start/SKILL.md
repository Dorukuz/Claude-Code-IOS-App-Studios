---
name: start
description: "First-time onboarding for iOS App Studio — asks where you are, then routes to the right workflow. No assumptions."
argument-hint: "[no arguments]"
user-invocable: true
allowed-tools: Read, Glob, Grep, AskUserQuestion
---

# Guided onboarding (iOS)

Entry point for new users. **Do not assume** Xcode scheme names, SwiftPM layout, or product maturity.

---

## 1. Silent context scan

Before the first user-facing message, gather:

- **Tooling configured?** Read `.claude/docs/technical-preferences.md`. If any key line still says `[TO BE CONFIGURED]`, tooling is incomplete.
- **Product doc started?** Check `design/prd/product-overview.md` for substantive content (not only placeholders).
- **Code present?** Glob `ios/**/*.swift` — note approximate file count.
- **Architecture docs?** Any `docs/architecture/adr-*.md` or non-empty `docs/architecture/`.
- **Production planning?** `production/sprints/`, `production/milestones/`.

Use findings to **validate** the user’s self-serve path later.

---

## 2. Ask where the user is

Present four options clearly:

> **Welcome to Claude iOS App Studio.**
>
> Where are you starting from?
>
> **A) No idea yet** — exploring what app to build.
>
> **B) Vague idea** — theme or audience, not a spec.
>
> **C) Clear concept** — know core value prop; docs incomplete.
>
> **D) Existing work** — code or significant docs already in repo.

Wait for a response.

---

## 3. Route

### A — No idea

- Recommend `/brainstorm` for structured ideation (problem, audience, moat, MVP slice).
- Then: fill `design/prd/product-overview.md`, choose SPM vs Xcode layout under `ios/`, `/map-systems`, `/sprint-plan`.

### B — Vague idea

- Ask for a **one-sentence** hint; recommend `/brainstorm [hint]`.
- Then same as A.

### C — Clear concept

- Ask: **minimum iOS version**, **SwiftUI vs UIKit legacy**, **offline need**, **accounts?**
- Offer: **Formalize PRD** (`design/prd` + template) **or** **`/map-systems`** if product is stable.
- Suggest `/privacy-review` early if ads, social, location, or third-party SDKs.

### D — Existing work

- Summarize findings from step 1 (files, ADRs, gaps).
- Recommend `/project-stage-detect` for full gap analysis.
- If tooling file still has `[TO BE CONFIGURED]`, nudge to update it after choosing Xcode/Swift versions.

---

## 4. Confirm next step

> “Want to start with **[X]**, or something else first?”

Never auto-run another skill without consent.

---

## Edge cases

- **D chosen but empty repo** — suggest A/B/C.
- **Returning user with filled prefs + many Swift files** — offer `/sprint-plan`, `/code-review`, or “what do you want to ship next?”.

---

## Collaborative protocol

Ask first → present options → **user decides** → recommend skills → **no auto-exec**.

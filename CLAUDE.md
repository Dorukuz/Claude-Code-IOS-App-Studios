# Claude iOS App Studio

This repository is a **studio template** for building iOS apps with **Claude Code** (and compatible tooling). It mirrors the coordination model of multi-agent game studio templates, but every agent, rule, and skill is scoped to **Swift, SwiftUI-first iOS delivery**, **App Store readiness**, **privacy**, **accessibility**, and **release hygiene**.

You remain in control: agents **ask**, present **options**, and wait for your decisions before treating drafts as final.

## Studio hierarchy

| Tier | Role | Agents |
|------|------|--------|
| 1 | Directors | `creative-director`, `technical-director`, `producer` |
| 2 | Leads | `product-designer`, `lead-ios-engineer`, `qa-lead`, `release-manager`, `localization-lead`, `privacy-compliance-lead` |
| 3 | Specialists | SwiftUI, UIKit, networking, persistence, media, extensions/widgets, accessibility, performance, security, testing, DevTools/CI, analytics, StoreKit, App Store review, and more |

Full tables: [docs/agent-roster.md](docs/agent-roster.md) · Escalation: [docs/agent-coordination-map.md](docs/agent-coordination-map.md)

## Collaboration protocol (all agents)

1. **Ask** — clarify goal, constraints, and definition of done.
2. **Present options** — 2–4 approaches with trade-offs (scope, risk, maintenance).
3. **You decide** — no binding product or architecture choices without your explicit call.
4. **Draft** — show plans, diffs, or doc outlines before “final”.
5. **Approve** — treat implementation and committed docs as final only after your sign-off.

## Default technical stance

- **Swift 6** language mode and structured concurrency where applicable.
- **SwiftUI-first** UI; UIKit used deliberately for integration or legacy surfaces.
- **No secrets in source** — Keychain, xcconfig (gitignored), or secrets manager.
- **Privacy manifest** and **App Tracking Transparency** when you collect data or use tracking SDKs.
- **Localized** user-facing strings; VoiceOver and Dynamic Type considered in UI work.

Project defaults and toolchain notes: [.claude/docs/technical-preferences.md](.claude/docs/technical-preferences.md)

## Where code and docs live

| Path | Purpose |
|------|---------|
| `ios/` | Xcode project or SwiftPM package(s) — your app target(s) |
| `design/` | PRD drafts, UX notes, copy decks |
| `docs/` | ADRs, technical writeups (beyond templates) |
| `docs/templates/` | Fill-in templates for PRD, release, privacy, etc. |
| `production/` | Sprint notes, milestones, session state, logs |

## Entry points

- **`/start`** — onboarding; detects stage and suggests next skills.
- **`/project-stage-detect`** — gap analysis for existing trees.
- **`/code-review`**, **`/release-checklist`**, **`/accessibility-audit`**, **`/privacy-review`**, **`/testflight-notes`** — high-value quality gates.

See [README.md](README.md) for prerequisites and slash-command index.

## Cursor users

Path-scoped standards are mirrored under [.cursor/rules/](.cursor/rules/). For agent roles in Cursor Agent, see [AGENTS.md](AGENTS.md).

# Claude-Code-IOS-App-Studios

Turn a Claude Code session into a structured **iOS app development studio**: specialized agents, slash-command workflows, git hooks, and path-scoped rules for Swift/SwiftUI projects—plus a lightweight **[Cursor](https://cursor.com/)** rules mirror. Focused on shipping iOS apps (TestFlight, App Store, privacy, accessibility).

---

## What’s included

| Category | Description |
|----------|-------------|
| **Agents** | Tiered roles from directors to specialists (see [docs/agent-roster.md](docs/agent-roster.md)) |
| **Skills** | Slash commands under `.claude/skills/` (`/start`, `/code-review`, release & compliance workflows, stubs for full production kit) |
| **Hooks** | Session context, commit/push checks, asset naming, compaction helpers (`.claude/hooks/`) |
| **Rules** | Path-scoped standards for `ios/` trees (`.claude/rules/` + `.cursor/rules/`) |
| **Templates** | PRD, ADR, sprint, App Store metadata, privacy worksheet ([docs/templates/](docs/templates/)) |

---

## Prerequisites

- **Git**
- [Claude Code](https://www.anthropic.com/claude-code): `npm install -g @anthropic-ai/claude-code`
- **Recommended**: `jq` (hook JSON parsing), **Python 3** (JSON validation), **Xcode** matching [.claude/docs/technical-preferences.md](.claude/docs/technical-preferences.md)

Hooks fail soft if optional tools are missing.

---

## Quick start

1. Clone or copy this template into your project root.
2. Add or open your app under [`ios/`](ios/) (Xcode project or SwiftPM).
3. Start Claude Code: `claude`
4. Run **`/start`** — it asks where you are (idea only, prototype, production, existing codebase) and suggests next steps.

**Cursor:** open the folder in Cursor; rules in `.cursor/rules/` apply automatically to matching paths.

---

## Slash commands (skills)

Type `/` in Claude Code to invoke skills. Highlights:

| Skill | Purpose |
|-------|---------|
| `/start` | Onboarding and routing |
| `/code-review` | Structured Swift/iOS review |
| `/release-checklist` | Pre-submission sanity pass |
| `/accessibility-audit` | VoiceOver, Dynamic Type, contrast |
| `/privacy-review` | Privacy manifest, data collection, ATT |
| `/testflight-notes` | What testers should verify |

Additional stubs include `/sprint-plan`, `/design-review`, `/app-store-metadata`, `/localization-pass`, `/team-ui`, and more—extend `SKILL.md` files as needed.

---

## Project layout

```text
CLAUDE.md                 # Studio charter (read first)
AGENTS.md                 # Cursor-oriented agent map
.claude/                  # Claude Code: agents, skills, hooks, rules, settings
.cursor/rules/            # Cursor path rules (mirror)
docs/                     # Guides + templates
design/                   # Product / UX working docs
ios/                      # Your Xcode or SwiftPM app
production/               # Sprints, milestones, session logs/state
```

---

## Customization

- Edit or remove **agents** you do not need.
- Tune **rules** to match your real folder names under `ios/`.
- Tighten or relax **hooks** (e.g. secret patterns, JSON validation).

---

## License

MIT — see [LICENSE](LICENSE).

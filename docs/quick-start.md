# Quick start — Claude iOS App Studio

## 1. Install tooling

- **Claude Code** (`npm install -g @anthropic-ai/claude-code`)
- **Xcode** from the Mac App Store (version in [.claude/docs/technical-preferences.md](../.claude/docs/technical-preferences.md))
- Optional: **jq**, **SwiftLint**, **SwiftFormat** for local checks

## 2. Place your app

- Put your Xcode project or SwiftPM package under **`ios/`** (see [ios/README.md](../ios/README.md)).
- Fill in **Minimum iOS**, **Swift**, and **Xcode** in `.claude/docs/technical-preferences.md` when decided.

## 3. Start a session

```bash
cd /path/to/repo
claude
```

Run **`/start`**. It will:

- Detect whether you have idea-only, prototype, production, or existing-code state
- Suggest the next slash command (`/code-review`, `/sprint-plan`, `/privacy-review`, etc.)

## 4. Cursor

Open the repo folder in Cursor. Rules under `.cursor/rules/` apply to `ios/**` and related globs.

## 5. Session recovery

- Maintain **`production/session-state/active.md`** for work-in-progress context (hooks surface it on session start and before compaction).
- **`production/session-logs/`** accumulates agent audit and session summaries.

## 6. First-week checklist

- [ ] PRD or product overview in `design/`
- [ ] Architecture outline or ADR in `docs/architecture/`
- [ ] CI smoke (`xcodebuild test` or SwiftPM `swift test`) documented in README
- [ ] Privacy manifest plan if you use tracking SDKs or required-reason APIs

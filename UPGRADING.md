# Upgrading Claude-Code-IOS-App-Studios

This document helps you merge new template versions into an existing project that was started from this repo.

## Version history (template)

| Version | Notes |
|--------|--------|
| 0.1.0 | Initial template: agents, skills, hooks, rules, docs |

## General strategy

1. **Fetch upstream** (if you added this repo as a remote) or copy changed paths from a fresh clone.
2. **Never blindly overwrite** project-specific content: `ios/`, `design/`, `production/session-state/`, and customized agent prompts.
3. **Safe to replace** when you have no local edits: hook scripts under `.claude/hooks/`, shared `docs/templates/`, and new stub skills.

## Files usually safe to overwrite

- `.claude/hooks/*.sh`
- `.claude/settings.json` (re-apply your local permission tweaks afterward)
- `docs/templates/*` (unless you store proprietary templates there)
- New `.claude/skills/*` that you have not customized

## Files that usually need manual merge

- `CLAUDE.md` — studio charter; merge new sections with your team conventions
- `README.md` — project branding and links
- `.claude/agents/*` — if you edited agent behavior
- `.claude/rules/*` and `.cursor/rules/*` — if you tuned paths for your layout

## After upgrading

- Run `/start` or `/project-stage-detect` to confirm skills still route correctly
- Spot-check `bash .claude/hooks/validate-commit.sh` with a dry-run commit if you changed hook logic

#!/usr/bin/env bash
# PreToolUse: warn on push to protected branches

INPUT=$(cat)

if command -v jq >/dev/null 2>&1; then
  COMMAND=$(echo "$INPUT" | jq -r '.tool_input.command // empty')
else
  COMMAND=$(echo "$INPUT" | grep -oE '"command"[[:space:]]*:[[:space:]]*"[^"]*"' | sed 's/"command"[[:space:]]*:[[:space:]]*"//;s/"$//')
fi

if ! echo "$COMMAND" | grep -qE '^git[[:space:]]+push'; then
  exit 0
fi

CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
MATCHED_BRANCH=""

for branch in develop main master release; do
  if [ "$CURRENT_BRANCH" = "$branch" ]; then
    MATCHED_BRANCH="$branch"
    break
  fi
  if echo "$COMMAND" | grep -qE "[[:space:]]${branch}([[:space:]]|$)"; then
    MATCHED_BRANCH="$branch"
    break
  fi
done

if [ -n "$MATCHED_BRANCH" ]; then
  echo "Push to protected branch '$MATCHED_BRANCH' detected." >&2
  echo "Reminder: Run tests, verify Archive, check privacy manifest & App Store metadata." >&2
fi

exit 0

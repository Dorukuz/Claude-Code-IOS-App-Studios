#!/usr/bin/env bash
# Stop: archive session state + log uncommitted files

TIMESTAMP=$(date +%Y%m%d_%H%M%S)
SESSION_LOG_DIR="production/session-logs"
mkdir -p "$SESSION_LOG_DIR" 2>/dev/null

RECENT_COMMITS=$(git log --oneline --since="8 hours ago" 2>/dev/null)
MODIFIED_FILES=$(git diff --name-only 2>/dev/null)

STATE_FILE="production/session-state/active.md"
if [ -f "$STATE_FILE" ]; then
  {
    echo "## Archived Session State: $TIMESTAMP"
    cat "$STATE_FILE"
    echo "---"
    echo ""
  } >> "$SESSION_LOG_DIR/session-log.md" 2>/dev/null
  rm "$STATE_FILE" 2>/dev/null
fi

if [ -n "$RECENT_COMMITS" ] || [ -n "$MODIFIED_FILES" ]; then
  {
    echo "## Session End: $TIMESTAMP"
    [ -n "$RECENT_COMMITS" ] && echo "### Recent commits" && echo "$RECENT_COMMITS"
    [ -n "$MODIFIED_FILES" ] && echo "### Uncommitted" && echo "$MODIFIED_FILES"
    echo "---"
    echo ""
  } >> "$SESSION_LOG_DIR/session-log.md" 2>/dev/null
fi

exit 0

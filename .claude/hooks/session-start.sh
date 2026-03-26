#!/usr/bin/env bash
# SessionStart: context for Claude

echo "=== Claude iOS App Studio — Session Context ==="

BRANCH=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
if [ -n "$BRANCH" ]; then
  echo "Branch: $BRANCH"
  echo ""
  echo "Recent commits:"
  git log --oneline -5 2>/dev/null | while read -r line; do
    echo "  $line"
  done
fi

LATEST_SPRINT=$(ls -t production/sprints/sprint-*.md 2>/dev/null | head -1)
if [ -n "$LATEST_SPRINT" ]; then
  echo ""
  echo "Latest sprint doc: $(basename "$LATEST_SPRINT")"
fi

LATEST_MILESTONE=$(ls -t production/milestones/*.md 2>/dev/null | head -1)
if [ -n "$LATEST_MILESTONE" ]; then
  echo "Latest milestone: $(basename "$LATEST_MILESTONE")"
fi

if [ -d "ios" ]; then
  SWIFT_COUNT=$(find ios -name "*.swift" 2>/dev/null | wc -l | tr -d ' ')
  echo ""
  echo "Swift files under ios/: $SWIFT_COUNT"
fi

STATE_FILE="production/session-state/active.md"
if [ -f "$STATE_FILE" ]; then
  echo ""
  echo "=== ACTIVE SESSION STATE ==="
  head -25 "$STATE_FILE" 2>/dev/null
  TOTAL_LINES=$(wc -l < "$STATE_FILE" 2>/dev/null | tr -d ' ')
  if [ "${TOTAL_LINES:-0}" -gt 25 ] 2>/dev/null; then
    echo "... ($TOTAL_LINES lines — read full file to continue)"
  fi
  echo "=== END PREVIEW ==="
fi

echo ""
echo "==================================="

exit 0

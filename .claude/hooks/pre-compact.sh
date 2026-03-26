#!/usr/bin/env bash
# PreCompact: preserve working context

echo "=== SESSION STATE BEFORE COMPACTION ==="
echo "Timestamp: $(date)"

STATE_FILE="production/session-state/active.md"
if [ -f "$STATE_FILE" ]; then
  echo ""
  echo "## Active session state ($STATE_FILE)"
  STATE_LINES=$(wc -l < "$STATE_FILE" 2>/dev/null | tr -d ' ')
  if [ "${STATE_LINES:-0}" -gt 80 ] 2>/dev/null; then
    head -n 80 "$STATE_FILE"
    echo "... (truncated — $STATE_LINES lines)"
  else
    cat "$STATE_FILE"
  fi
else
  echo ""
  echo "## No production/session-state/active.md — create it to recover context after compaction"
fi

echo ""
echo "## Git working tree"
git status -sb 2>/dev/null || true

echo ""
echo "## design/ WIP markers"
if [ -d "design" ]; then
  while IFS= read -r f; do
    [ -f "$f" ] || continue
    INCOMPLETE=$(grep -nE 'TODO|WIP|PLACEHOLDER|\[TBD\]' "$f" 2>/dev/null)
    if [ -n "$INCOMPLETE" ]; then
      echo " $f:"
      echo "$INCOMPLETE" | while read -r line; do echo "   $line"; done
    fi
  done < <(find design -name "*.md" 2>/dev/null)
else
  echo " (no design/ folder)"
fi

SESSION_LOG_DIR="production/session-logs"
mkdir -p "$SESSION_LOG_DIR" 2>/dev/null
echo "Compaction at $(date)" >> "$SESSION_LOG_DIR/compaction-log.txt" 2>/dev/null

echo ""
echo "=== END SESSION STATE ==="

exit 0

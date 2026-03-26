#!/usr/bin/env bash
# PostToolUse: after Write|Edit — validate asset paths (xcassets, plist JSON where applicable)

INPUT=$(cat)

if command -v jq >/dev/null 2>&1; then
  FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty')
else
  FILE_PATH=$(echo "$INPUT" | grep -oE '"file_path"[[:space:]]*:[[:space:]]*"[^"]*"' | sed 's/"file_path"[[:space:]]*:[[:space:]]*"//;s/"$//')
fi

FILE_PATH=$(echo "$FILE_PATH" | sed 's|\\|/|g')
[ -n "$FILE_PATH" ] || exit 0

WARNINGS=""

if echo "$FILE_PATH" | grep -qE '\.xcassets/'; then
  FILENAME=$(basename "$FILE_PATH")
  if echo "$FILENAME" | grep -qE '[[:space:]]'; then
    WARNINGS="$WARNINGS\nASSET: $FILE_PATH — avoid spaces in asset paths"
  fi
fi

if echo "$FILE_PATH" | grep -qE '\.json$' && echo "$FILE_PATH" | grep -qE '(^|/)ios/'; then
  if [ -f "$FILE_PATH" ]; then
    PYTHON_CMD=""
    for cmd in python3 python py; do
      if command -v "$cmd" >/dev/null 2>&1; then
        PYTHON_CMD="$cmd"
        break
      fi
    done
    if [ -n "$PYTHON_CMD" ]; then
      if ! "$PYTHON_CMD" -m json.tool "$FILE_PATH" >/dev/null 2>&1; then
        WARNINGS="$WARNINGS\nFORMAT: $FILE_PATH is not valid JSON"
      fi
    fi
  fi
fi

if [ -n "$WARNINGS" ]; then
  echo -e "=== Asset Validation ===$WARNINGS\n========================" >&2
fi

exit 0

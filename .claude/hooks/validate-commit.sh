#!/usr/bin/env bash
# PreToolUse: validate git commit (non-blocking warnings; blocks invalid JSON in ios data)
# stdin: JSON with .tool_input.command for Bash tool

INPUT=$(cat)

if command -v jq >/dev/null 2>&1; then
  COMMAND=$(echo "$INPUT" | jq -r '.tool_input.command // empty')
else
  COMMAND=$(echo "$INPUT" | grep -oE '"command"[[:space:]]*:[[:space:]]*"[^"]*"' | sed 's/"command"[[:space:]]*:[[:space:]]*"//;s/"$//')
fi

if ! echo "$COMMAND" | grep -qE '^git[[:space:]]+commit'; then
  exit 0
fi

STAGED=$(git diff --cached --name-only 2>/dev/null)
if [ -z "$STAGED" ]; then
  exit 0
fi

WARNINGS=""

# Design docs under design/ — basic sections for PRD-style docs
DESIGN_FILES=$(echo "$STAGED" | grep -E '^design/.*\.md$')
if [ -n "$DESIGN_FILES" ]; then
  while IFS= read -r file; do
    [ -f "$file" ] || continue
    if echo "$file" | grep -qiE 'prd|product'; then
      for section in "Problem" "Goals" "Non-goals" "Risks" "Success metrics"; do
        if ! grep -qi "$section" "$file"; then
          WARNINGS="$WARNINGS\nDESIGN: $file may be missing PRD-style section: $section"
        fi
      done
    fi
  done <<< "$DESIGN_FILES"
fi

PYTHON_CMD=""
for cmd in python3 python py; do
  if command -v "$cmd" >/dev/null 2>&1; then
    PYTHON_CMD="$cmd"
    break
  fi
done

# JSON under ios/ or design/data
DATA_FILES=$(echo "$STAGED" | grep -E '\.(json)$' | grep -E '^(ios|design)/')
if [ -n "$DATA_FILES" ] && [ -n "$PYTHON_CMD" ]; then
  while IFS= read -r file; do
    [ -f "$file" ] || continue
    if ! "$PYTHON_CMD" -m json.tool "$file" >/dev/null 2>&1; then
      echo "BLOCKED: $file is not valid JSON" >&2
      exit 2
    fi
  done <<< "$DATA_FILES"
elif [ -n "$DATA_FILES" ] && [ -z "$PYTHON_CMD" ]; then
  WARNINGS="$WARNINGS\nTOOL: python not found; skipped JSON validation for staged files"
fi

# Swift: TODO without owner tag in ios/
SWIFT_FILES=$(echo "$STAGED" | grep -E '^ios/.*\.swift$')
if [ -n "$SWIFT_FILES" ]; then
  while IFS= read -r file; do
    [ -f "$file" ] || continue
    if grep -nE '(TODO|FIXME|HACK)[^(]' "$file" 2>/dev/null; then
      WARNINGS="$WARNINGS\nSTYLE: $file has TODO/FIXME without owner tag. Prefer TODO(name):"
    fi
  done <<< "$SWIFT_FILES"
fi

# Secret-ish patterns (warn only)
SECRET_FILES=$(echo "$STAGED" | grep -E '^ios/.*\.swift$')
if [ -n "$SECRET_FILES" ]; then
  while IFS= read -r file; do
    [ -f "$file" ] || continue
    if grep -nE '(apiKey|api_key|API_KEY|Authorization: Bearer|sk_live_AAAA|AKIA[0-9A-Z]{16})' "$file" 2>/dev/null; then
      WARNINGS="$WARNINGS\nSECRET: $file may contain credential patterns — verify before commit"
    fi
  done <<< "$SECRET_FILES"
fi

# fatalError in non-test Swift (warn)
if [ -n "$SWIFT_FILES" ]; then
  while IFS= read -r file; do
    case "$file" in
      *Tests.swift|*/Tests/*) continue ;;
    esac
    [ -f "$file" ] || continue
    if grep -nE '\bfatalError\(' "$file" 2>/dev/null; then
      WARNINGS="$WARNINGS\nRUNTIME: $file uses fatalError — ensure unreachable or debug-only"
    fi
  done <<< "$SWIFT_FILES"
fi

if [ -n "$WARNINGS" ]; then
  echo -e "=== Commit Validation Warnings ===$WARNINGS\n================================" >&2
fi

exit 0

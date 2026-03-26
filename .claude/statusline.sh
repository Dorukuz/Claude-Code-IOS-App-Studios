#!/usr/bin/env bash
# Status line for Claude Code — iOS App Studio
set +e
branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null || echo "?")
swift_v=""
if command -v swift >/dev/null 2>&1; then
  swift_v=$(swift --version 2>/dev/null | head -1 | cut -c1-40)
fi
echo "iOS Studio | ${branch:-?} | ${swift_v:-no swift}"

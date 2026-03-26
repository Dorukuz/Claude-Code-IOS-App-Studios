#!/usr/bin/env bash
# Status line for Claude Code — Claude-Code-IOS-App-Studios
set +e
branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null || echo "?")
swift_v=""
if command -v swift >/dev/null 2>&1; then
  swift_v=$(swift --version 2>/dev/null | head -1 | cut -c1-40)
fi
echo "Claude-Code-IOS-App-Studios | ${branch:-?} | ${swift_v:-no swift}"

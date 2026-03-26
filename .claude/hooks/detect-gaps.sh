#!/usr/bin/env bash
# SessionStart: documentation / tooling gaps for iOS template

set +e

echo "=== Documentation & setup gaps ==="

FRESH=true

if [ -f ".claude/docs/technical-preferences.md" ]; then
  if ! grep -q '\[TO BE CONFIGURED\]' .claude/docs/technical-preferences.md 2>/dev/null; then
    FRESH=false
  fi
fi

if [ -f "design/prd/product-overview.md" ]; then
  if ! grep -q '\[TO BE CONFIGURED\]' design/prd/product-overview.md 2>/dev/null; then
    FRESH=false
  fi
fi

SWIFT_COUNT=0
if [ -d "ios" ]; then
  SWIFT_COUNT=$(find ios -name "*.swift" 2>/dev/null | wc -l | tr -d ' ')
  if [ "${SWIFT_COUNT:-0}" -gt 0 ]; then
    FRESH=false
  fi
fi

if [ "$FRESH" = true ]; then
  echo ""
  echo "New project: tooling and/or code not filled in yet. Run: /start"
  echo "For a full gap scan: /project-stage-detect"
  echo "==================================="
  exit 0
fi

if [ -d "design" ]; then
  DM=$(find design -name "*.md" 2>/dev/null | wc -l | tr -d ' ')
else
  DM=0
fi

if [ "${SWIFT_COUNT:-0}" -gt 30 ] && [ "${DM:-0}" -lt 2 ]; then
  echo ""
  echo "GAP: Many Swift files ($SWIFT_COUNT) but few design docs ($DM markdown). Consider /reverse-document or PRD in design/"
fi

if [ "${SWIFT_COUNT:-0}" -gt 0 ] && [ ! -d "docs/architecture" ]; then
  echo ""
  echo "GAP: Code exists but no docs/architecture/ — add ADRs for major decisions (/gate-check)"
fi

if [ "${SWIFT_COUNT:-0}" -gt 80 ]; then
  if [ ! -d "production/sprints" ] && [ ! -d "production/milestones" ]; then
    echo ""
    echo "GAP: Large codebase — consider production/sprints/ or milestones/"
  fi
fi

if [ -d "ios" ]; then
  if ! find ios -name "PrivacyInfo.xcprivacy" 2>/dev/null | grep -q .; then
    echo ""
    echo "HINT: No PrivacyInfo.xcprivacy found under ios/ — add when using required-reason APIs or third-party SDKs"
  fi
fi

echo ""
echo "Full analysis: /project-stage-detect"
echo "==================================="

exit 0

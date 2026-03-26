# Agent map (Cursor / multi-agent)

Use this as a **quick routing table**. Full prompts live in [`.claude/agents/`](.claude/agents/). In Claude Code, subagents load those files automatically; in Cursor Agent, @-mention or paste the relevant agent file when you want role-specific behavior.

## When to use which agent

| Situation | Start with | Escalate to |
|-----------|------------|-------------|
| Product vision, scope cuts, conflicting goals | `creative-director` | — |
| Architecture, stack trade-offs, Swift concurrency | `technical-director` | — |
| Cross-team sequencing, release vs. tech debt | `producer` | directors |
| UX flows, IA, onboarding | `product-designer` | `creative-director` |
| Module boundaries, SwiftUI structure, performance | `lead-ios-engineer` | `technical-director` |
| Test strategy, coverage gaps, sign-off | `qa-lead` | `producer` |
| Signing, ASC, TestFlight, phased release | `release-manager` | `producer` |
| Strings, locales, pseudo-locales | `localization-lead` | `product-designer` |
| Privacy manifest, ATT, data collection | `privacy-compliance-lead` | `technical-director` + legal if needed |
| SwiftUI screens | `swiftui-engineer` | `lead-ios-engineer` |
| UIKit bridges, legacy screens | `uikit-integration-engineer` | `lead-ios-engineer` |
| URLSession, APIs, errors | `networking-engineer` | `lead-ios-engineer` |
| SwiftData / Core Data | `persistence-engineer` | `lead-ios-engineer` |
| AVFoundation, media playback | `media-av-engineer` | `lead-ios-engineer` |
| Widgets, notifications, BG tasks | `notifications-widgets-engineer` | `lead-ios-engineer` |
| VoiceOver, Dynamic Type, contrast | `accessibility-engineer` | `product-designer` |
| Instruments, hang risk, memory | `performance-engineer` | `lead-ios-engineer` |
| Keychain, ATS, hardening | `security-engineer` | `technical-director` |
| XCTest, UI tests | `test-engineer` | `qa-lead` |
| CI, Fastlane, Xcode Cloud | `devtools-engineer` | `release-manager` |
| Analytics events (privacy-aware) | `analytics-engineer` | `privacy-compliance-lead` |
| StoreKit / IAP | `iap-storekit-engineer` | `release-manager` |
| App Review narrative & guideline fit | `app-store-review-specialist` | `release-manager` |
| Watch-only targets | `watchos-engineer` | `lead-ios-engineer` |
| App Intents / Siri | `app-intents-engineer` | `product-designer` |
| Universal links / routing | `deep-linking-engineer` | `networking-engineer` |
</think>


<｜tool▁calls▁begin｜><｜tool▁call▁begin｜>
StrReplace
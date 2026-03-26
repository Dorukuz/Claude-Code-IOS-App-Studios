# Agent roster

Agents are defined in [`.claude/agents/`](../.claude/agents/). Each file uses YAML frontmatter (`name`, `description`, `model`, `tools`, etc.) plus a detailed system prompt.

| Tier | Agent | Focus |
|------|-------|--------|
| 1 | `creative-director` | Product vision, scope, conflicting goals |
| 1 | `technical-director` | Architecture, Swift concurrency, platform strategy |
| 1 | `producer` | Sequencing, trade-offs, delivery risk |
| 2 | `product-designer` | UX, IA, flows, onboarding |
| 2 | `lead-ios-engineer` | Modules, SwiftUI structure, code health |
| 2 | `qa-lead` | Quality strategy, release criteria |
| 2 | `release-manager` | ASC, TestFlight, versioning, phased release |
| 2 | `localization-lead` | Locales, exports, pseudo-localization |
| 2 | `privacy-compliance-lead` | Privacy manifest, ATT, data inventory |
| 3 | `swiftui-engineer` | SwiftUI views & composition |
| 3 | `uikit-integration-engineer` | UIKit bridges, legacy UI |
| 3 | `networking-engineer` | URLSession, APIs, errors |
| 3 | `persistence-engineer` | SwiftData, Core Data, files |
| 3 | `media-av-engineer` | AVFoundation, images, video |
| 3 | `notifications-widgets-engineer` | Push, widgets, extensions, BG tasks |
| 3 | `accessibility-engineer` | VoiceOver, Dynamic Type |
| 3 | `performance-engineer` | Instruments, hangs, memory |
| 3 | `security-engineer` | Keychain, ATS, hardening |
| 3 | `test-engineer` | XCTest, UI tests |
| 3 | `devtools-engineer` | CI, Fastlane, Xcode Cloud |
| 3 | `analytics-engineer` | Events, privacy-aware telemetry |
| 3 | `iap-storekit-engineer` | In-app purchase, StoreKit 2 |
| 3 | `app-store-review-specialist` | Guideline alignment, review notes |
| 3 | `watchos-engineer` | watchOS targets |
| 3 | `app-intents-engineer` | App Intents, Siri |
| 3 | `deep-linking-engineer` | Universal links, routing |
| 3 | `background-tasks-engineer` | BGTaskScheduler, refresh |
| 3 | `documentation-engineer` | ADRs, internal docs |

See also [AGENTS.md](../AGENTS.md) for a Cursor-oriented routing table.

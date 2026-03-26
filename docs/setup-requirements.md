# Setup requirements

## Operating system

- **macOS** with Xcode installed (iOS Simulator and device builds require Apple toolchain).

## Apple Developer

- **Apple ID** enrolled in the Apple Developer Program for device testing and App Store distribution.
- **Signing**: use Xcode automatic signing for development; document manual signing if your org requires it (do not commit `.p12`, private keys, or App Store Connect API keys to git).

## Repository

- **Git** for version control.
- **Claude Code** for slash commands and hook integration.

## Recommended

| Tool | Purpose |
|------|---------|
| `jq` | Hook JSON parsing |
| Python 3 | JSON validation in hooks |
| SwiftLint / SwiftFormat | Consistent style (optional) |
| Fastlane or Xcode Cloud | Release automation (optional) |

## Network

- Sandboxed network access for SPM resolution and CI if applicable.

## What this template does *not* provide

- A hosted backend or secrets store — bring your own.
- Legal review — involve counsel for privacy policy and ATT copy.

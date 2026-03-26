# iOS application directory

Place your **Xcode project** or **SwiftPM** package here so hooks and path-scoped rules under `.claude/rules/` match consistently.

## Recommended layouts

### A) Xcode app project

```text
ios/
  MyApp/
    MyApp.xcodeproj
    MyApp/
      Sources/
      Resources/
      Views/
      ViewModels/
      Services/
      Networking/
      Tests/
```

Adjust folder names to taste; update `.claude/rules/*.md` globs if you deviate.

### B) Swift Package (library modules + thin app wrapper)

```text
ios/
  Package.swift
  Sources/
    MyAppFeature/
    MyAppUI/
  Tests/
```

For a **production app**, you still typically need an **Xcode app target** for signing, assets, and App Store packaging—SwiftPM alone may be insufficient.

## Toolchain

Record **Minimum iOS**, **Xcode**, and **Swift** versions in `.claude/docs/technical-preferences.md`.

## Assets & privacy

- Asset catalogs: `*.xcassets` under `ios/`
- Privacy manifest: `PrivacyInfo.xcprivacy` near your main target when required
- Localized strings: prefer **String Catalog** (`.xcstrings`) for new projects

## This template

The repo ships **without** a committed `.xcodeproj` to avoid churn and machine-specific settings. Create a project in Xcode or add your existing tree under `ios/`.

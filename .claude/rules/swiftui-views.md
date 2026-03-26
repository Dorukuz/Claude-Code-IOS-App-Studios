---
paths:
  - "ios/**/Views/**/*.swift"
  - "ios/**/*View.swift"
---

# SwiftUI view rules

- Views **do not own** business logic or persistence; delegate to ViewModels/services via bindings and callbacks.
- User-visible strings must be **localization-ready** (`LocalizedStringKey`, `String(localized:)`, or generated `Strings`—pick one project convention and stay consistent).
- Provide **accessibility** labels, hints, and traits where meaning is not obvious from UIKit/SF Symbol defaults alone.
- Avoid blocking the main actor with **heavy synchronous work**; offload to async services.
- **Previews** should compile without network secrets; use mock data types.
- Do not embed **API keys or bearer tokens** in views.

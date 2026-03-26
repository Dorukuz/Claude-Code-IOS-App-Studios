---
paths:
  - "ios/**/*ViewModel.swift"
  - "ios/**/ViewModels/**/*.swift"
---

# ViewModel rules

- ViewModels own **UI state** and orchestrate use cases; they do not construct low-level URLs or parse raw JSON when a dedicated service exists.
- Prefer **`@Observable` / `ObservableObject`** consistently (choose one style per module).
- Mark types with **`@MainActor`** when they drive UI; avoid `nonisolated(unsafe)` unless justified in an ADR.
- Expose **testable inputs/outputs**; avoid hidden singletons for app state.
- Use **structured concurrency** (`async`/`await`); cancel work when the UI tears down (`task(id:)`, `Task.cancel` patterns).
- Log errors with **correlation** suitable for debugging (no PII in logs).

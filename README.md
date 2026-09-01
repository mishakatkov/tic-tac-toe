# Tic-tac-toe — Flutter architecture template

Flutter monorepo reproducing the architecture and conventions of the production repo
`flutter-front` (Betclic), at the scale of a tic-tac-toe game. Serves as a starting
point for a new project, or as exercise material.

## Getting started

```bash
mise install          # Flutter 3.44.4
mise run bs           # dart pub get + melos bootstrap
mise run generate     # codegen (riverpod, freezed, auto_route, theme_tailor)
cd apps/tic_tac_toe && flutter run
```

## The green bar

```bash
mise run generate && mise run format && mise run analyze && mise run test
```

## What the template contains

| Layer | Package | What it demonstrates |
|-------|---------|----------------------|
| App | `apps/tic_tac_toe` | entry point, `ProviderScope` fed by composition |
| Composition | `composition/app_providers` | the only list that knows every feature |
| Composition | `composition/app_router` | root router, the features' route declarations |
| Feature domain | `features/game/board/domain` | freezed entities, tested behaviors, the opponent contract |
| Feature data | `features/game/board/data` | data source behind the domain contract, `Result`, injected timing |
| Feature presentation | `features/game/board/presentation` | freezed notifier state, theme_tailor theme, l10n |
| DSM | `dsm/tactics_*` | brand tokens + the palette's DI contract |
| Utilities | `utilities/*` | `Result`, `HttpClient`, `WidgetFactory`, `givn` — vendored from prod |

The architecture rules, the naming conventions and the checklist for wiring a new
feature are in [`AGENTS.md`](AGENTS.md).

# AGENTS.md

Instructions for AI agents working on this repo. It is a **Flutter architecture
template** reproducing the architecture and conventions of the production repo
`flutter-front` (Betclic), at the scale of a tic-tac-toe game.

---

## Project Overview

Flutter monorepo organised as a **Dart workspace + Melos**, with a
**feature-first / Clean Architecture** layout.

### Tech Stack

- **Flutter 3.44+** / **Dart SDK >=3.11.0 <4.0.0**
- **Riverpod V3** with code generation for state management
- **auto_route** (routing), **freezed** (entities/DTOs), **theme_tailor** (themes)
- **Melos** for the workspace, **Mason** to scaffold the layers
- **givn** + **shouldly** for the tests

### Repository Structure

```
apps/
  tic_tac_toe/                    # entry point: main.dart + application/
packages/
  composition/
    app_providers/                # aggregates every bindProviders() into one list of overrides
    app_router/                   # AppRouter (AutoRoute root) + impls of the features' routing ports
  dsm/
    tactics_components/           # tokens (palette, radius, spacing, icons) + DSM widgets — no Riverpod
    tactics_providers/            # the DSM's DI contracts: tacticsPaletteProvider (throws) + bindProviders
  features/
    game/board/     domain|data|presentation   # the grid, the rules and the computer opponent
  utilities/
    exceptions/                   # UnregisteredProviderException
    givn/                         # test DSL given(...).when(...).then(...)
    network/shared/domain/        # network contracts: HttpClient, NetworkResponse, NetworkError (pkg network_domain)
    network/dio/data/             # Dio implementation of the contracts (pkg network_dio_data) — the only package that knows Dio
    types/result/domain/          # Result<T, E> (result_dart): a call either succeeds or fails, it never throws
    widget_factory/presentation/  # WidgetFactory<T>: expose a widget to a host without coupling
bricks/                           # Mason templates (domain, data, presentation)
```

**These four packages are vendored from `flutter-front` — report a problem rather
than modifying them**: `utilities/exceptions`, `utilities/givn`,
`utilities/types/result`, `utilities/widget_factory`.

`utilities/network/*` keeps the prod shape (same package, type and provider names)
but **reduced**: `get<T>` only, no interceptors, no auth, no gRPC/WebSocket/SSE.
No feature consumes it yet, and composition does **not** bind it: `httpClientProvider`
stays unfulfilled, so reading it throws `UnregisteredProviderException` rather than
silently handing out a client nobody configured. The day a data source needs it, add
`...network_dio_data.bindProviders()` to `appProviders` — and bring the DTOs and mappers
in then, not before.

There is no `shared_domain/` today: the app has one feature, so its domain lives inside
it. Promote a type to `shared_domain/` the day a **second** feature consumes it — and
promote only that type, never a whole domain package because part of it is shared.

---

## Build and Development Commands

Everything goes through **mise** (or melos directly):

| Command | Description |
|---------|-------------|
| `mise run bs` | `dart pub get` + `melos bootstrap` (after any pubspec change) |
| `mise run generate` | Codegen across the whole workspace (after touching a `.br.dart`) |
| `mise run analyze` | Static analysis |
| `mise run test` | All the tests |
| `mise run format` | Formatting (120 columns) |
| `flutter run` (from `apps/tic_tac_toe`) | Runs the app |

**The green bar before any commit**: `mise run generate && mise run format && mise run analyze && mise run test`.

A single package: `(cd packages/features/game/<feature>/<layer> && flutter test)`.

### Creating a package

Scaffold through Mason, never by hand, to keep the structure identical:

```bash
mason make domain       -o packages/features/<universe>/<feature>/domain       --name <feature>_domain       --classname <feature> --on-conflict overwrite
mason make data         -o packages/features/<universe>/<feature>/data         --name <feature>_data         --classname <feature> --domainPackage <feature>_domain --on-conflict overwrite
mason make presentation -o packages/features/<universe>/<feature>/presentation --name <feature>_presentation --classname <feature> --domainPackage <feature>_domain --on-conflict overwrite
```

Then the wiring checklist (§ *Wiring a new feature*).

---

## Code Style Guidelines

### Linting

- **very_good_analysis** as the base + strict mode: `strict-casts`, `strict-inference`, `strict-raw-types`
- **Line width: 120 characters**

### Naming Conventions

- Every file that needs `build_runner` ends in **`.br.dart`**, with the matching
  `part`: `part '<name>.br.g.dart'` (Riverpod),
  `part '<name>.br.freezed.dart'` (freezed), `part '<name>.br.tailor.dart'`
  (theme_tailor), `part '<name>.br.gr.dart'` (auto_route).
- Each package's `build.yaml` restricts the generators to `**/*.br.dart`.
- Every package exposes a `lib/src/package_name.dart` → `const packageName = '<pkg>';`
  (used as a log tag).
- Class members: **fields first, then constructor(s), then methods** — widgets included.
- Alphabetical order everywhere: constructor parameters, fields, enum constants,
  imports, pubspec dependencies.
- Route path enums: `{FeatureName}RoutePath`, colocated in the route file.
- Strict null safety — **never force-unwrap** (`!`).

### Widget Guidelines

- Never use Material widgets directly in a feature: go through the
  `tactics_components` primitives.
- Keep widgets small, focused, atomic; `const` constructors whenever possible.
- Use `RepaintBoundary` where it helps performance.

### Date/Time Handling

- **Never use `DateTime.now()` / `DateTime.timestamp()` directly** in testable
  logic — inject a time source through a provider (in prod: the `Kronos` NTP
  utility) — a `DateTime Function()` that the tests freeze.

### Import Policy

| Scenario | Rule |
|----------|------|
| Cross-package | Always `package:` imports |
| Internal (same package) | `package:<self>/src/...` imports (as in prod) |
| Feature isolation | NEVER import `packages/features/X` into `packages/features/Y` |
| Clean Architecture | The Presentation layer must not import Data layer files |
| HTTP library | `dio` may only appear in `utilities/network/dio/data` — elsewhere, `HttpClient` |

---

## Architecture Rules

### Feature-First Architecture

```
feature/
├── data/lib/src/
│   ├── data_sources/     # single source → implements the domain contract directly
│   ├── dtos/             # *.br.dart (freezed + json_serializable)
│   ├── mappers/          # extension <Dto>Mapper on <Dto> { Entity toEntity() }
│   ├── providers_di.br.dart / providers_internal.br.dart / providers.br.dart / providers.dart
├── domain/lib/src/
│   ├── behaviors/        # business logic, classes named after a verb (PlayMove, ChooseMove)
│   ├── entities/         # *.br.dart (freezed)
│   ├── entities/errors/  # sealed unions of business failures (*.br.dart) — the `E` of the Results
│   ├── repositories/     # abstract contracts
│   ├── providers_di.br.dart / providers_internal.br.dart / providers.br.dart
└── presentation/lib/src/
    ├── {feature}_screen.dart         # the screen; the Page (@RoutePage) lives in routing/
    ├── l10n/{feature}_strings.dart   # user-facing copy, one const per label
    ├── notifiers/        # *_notifier.br.dart
    ├── routing/          # {feature}_routing.dart (port) + {feature}_router.br.dart (pages + RoutePath)
    ├── theme/            # {feature}_theme.br.dart (@TailorMixinComponent)
    ├── widgets/
    ├── providers_di.br.dart / providers_internal.br.dart / providers.dart
```

A feature only gets its own `domain` package if it owns entities or contracts. `board`
owns all of them — the grid, the outcomes, the rules, and the contract for where the
opponent's move comes from — so it carries all three layers.

### Layer Dependencies

- **Domain**: independent (no Data or Presentation import)
- **Data**: depends only on its domain
- **Presentation**: depends only on its domain, never on Data
- **Composition** (`app_providers`, `app_router`): the only layer allowed to know
  every feature at once, and the only one to call `bindProviders(...)`

### The provider triplet + `bindProviders`

Every package that exposes providers follows the same shape:

- **`providers_di.br.dart`** — *incoming contracts*. Each provider `throw
  UnregisteredProviderException(...)` until composition provides it.
  **This file is never exported by the package barrel.**
- **`providers_internal.br.dart`** — internal wiring / defaults (data sources,
  default theme derived from the DSM palette). Not the public API.
- **`providers.br.dart` / `providers.dart`** — the public API: the providers other
  packages consume, plus a `bindProviders({...})` returning `List<Override>`.

Composition only ever calls `bindProviders(...)`; it never overrides a
`providers_di` symbol directly.

**Presentation never reads a repository contract.** It reads state providers and
calls **behaviors** exposed as providers (`playMoveProvider`,
`evaluateBoardProvider`). For any new cross-cutting action: add a small class in the
domain's `src/behaviors/` and expose it from `providers.br.dart`, rather than
exporting the raw repository.

### Errors: `Result`, not exceptions

A call that can fail returns a **`Result<T, E>`** (`types_result_domain`, built on
`result_dart`): the failure is a return value visible in the signature, not an
exception to catch in the right place. Exceptions stay reserved for **programming
errors** (`UnregisteredProviderException`).

Three successive translations, so that no feature depends on the HTTP library:

| Layer | Type | Who produces it |
|-------|------|-----------------|
| HTTP library | `DioException` | Dio |
| network contract | `NetworkError` (sealed union) | `mapDioException`, in `network_dio_data` |
| business domain | `{Feature}Error` (freezed sealed union) | the data source, which returns a `Failure` |

- A **data source** takes its dependencies injected (`HttpClient`, a clock — never a
  `Dio`, never a homegrown "API client" class), declares its paths as
  `static const String _xxxPath`, and models the response envelope as a **DTO**
  rather than reaching for a JSON key by hand — an API that changes shape must fail
  at parsing, not return an empty list.
- It catches everything, logs only the **unexpected**
  (`if (exception is! NetworkError)`, network failures being already traced by the
  network layer) and returns a `Failure`.
- On the state side, a Riverpod provider converts with `getOrThrow()`: the failure
  lands in the `AsyncValue`, and presentation translates the `error:` into
  **user-facing copy** from its `l10n` — never `Text('$error')`.
- The `baseUrl` arrives by injection (`bindProviders(baseUrlProvider: …)`), never
  from a static config class inside the feature.

### The opponent seam

The computer's move arrives through a domain contract, `OpponentRepository`, so *where*
it is computed is not the feature's business:

| Concern | Where |
|---------|-------|
| "give me the opponent's move", async, can fail | `domain` — `OpponentRepository` + the `RequestOpponentMove` behavior |
| the rule-based strategy | `domain` — `ChooseMove`, a pure behavior |
| playing that strategy, and taking a moment over it | `data` — `LocalOpponentDataSource` |
| which source is wired | `composition` — `board_data.bindProviders()` |
| in-flight state, stale answers, error copy | `presentation` — `GameNotifier` + `l10n` |

The contract is **async and failable even though today's source is neither**, and that is
the whole point: the day the move comes from a backend, add an
`opponent_http_data_source.dart` beside the local one — with the DTO, mapper and
`HttpClient` it needs then — and change which one composition binds. The domain does not
move and `GameNotifier` does not change, because it only ever awaits a behavior and folds
a `Result`.

Do not build the HTTP layer before there is an endpoint: a fake transport, speculative
DTOs and mappers cost real code and teach a shape nobody has validated yet.

### Routing Architecture

Every feature **with navigation** exposes a **routing interface** (a *port*): the
feature emits **intents**, **outcomes** or **dismissals**, and the composition-side
implementation (`app_router`) translates them into concrete navigation. Methods are
named by event, never by imperative.

| Type | When | Pattern | Examples |
|------|------|---------|----------|
| Intent | The user starts/continues a flow | `on…Requested` | `onGameSettingsRequested`, `onSignInRequested` |
| Outcome | A step succeeds | `on…Successful`, `on…Sent` | `onAuthenticationSuccessful` |
| Dismiss | The user closes/cancels | `onDismiss…`, `onCancel` | `onDismissErrorModal` |

To avoid: `navigateTo…` / `goTo…` / `push…` (the destination belongs to the router),
`onTap…` / `on…Clicked` / `on…Pressed` (describe the intent, not the gesture).

No feature has a routing port for now — the game fits on a single screen. As soon as
a feature gets a second destination: `{feature}_routing.dart` declares the event, and
`app_{feature}_routing.dart` on the composition side decides where it leads.

Path segments are defined through **colocated enums** `{FeatureName}RoutePath`
(values sorted alphabetically) — never a hardcoded string. The `RoutePath` of
`app_router` only holds the first-level paths.

A feature **without** its own navigation (here Board) has no routing port: just a
`{feature}_router.br.dart` declaring its page.

### Riverpod Guidelines

1. Riverpod V3 with code generation (the `@riverpod` annotation)
2. `ref.select` to watch a single property and avoid rebuilds
3. `AsyncValue` for async states (data, error, loading)
4. `bindProviders` / `overrideWith` for dependency injection and tests
5. Small, single-responsibility providers
6. `Notifier` and `AsyncNotifier` patterns for state — the generator **strips the
   `Notifier` suffix**: `class GameNotifier` → `gameProvider`
7. Reach dimensions/config through dedicated providers — never hardcode

### Sharing widgets between features

To expose a widget to another feature without a feature → feature import:
`WidgetFactory<T>` (the `widget_factory` utility), declared as a contract in the
**consumer's** `providers_di.br.dart` and provided by composition through its
`bindProviders(...)`. The arguments are `shared_domain` types or structural
records — never a type owned by another feature.

The same mechanism, made **nullable**, is how a feature is exposed only on certain
markets or variants: a `WidgetFactory<T>?` that throws until someone answers, each
composition answering explicitly yes (a factory) or no (`null`). A variant nobody
wires up crashes on the first build with `UnregisteredProviderException` — never a
silently empty screen.

---

## Wiring a new feature

1. **Routes & pages** — in `presentation`, `lib/src/routing/{feature}_router.br.dart`
   declares the `{Feature}RoutePath` enum and the `@RoutePage` widgets.
2. **Routing port** — `lib/src/routing/{feature}_routing.dart` declares the
   navigation events, fed through `providers_di.br.dart`
   (`{feature}RoutingProvider`, which throws).
3. **`app_router`** — add the presentation package to its `pubspec.yaml`, add the
   `AutoRoute(page: {Feature}Route.page, path: {Feature}RoutePath.x.path)` entries to
   `AppRouter.routes`, and create `lib/src/routing/app_{feature}_routing.dart`.
4. **`app_providers`** — add the domain/data/presentation packages to its
   `pubspec.yaml`, then `...{feature}_data.bindProviders()` and
   `...{feature}_presentation.bindProviders(routing: (ref) => App{Feature}Routing(...))`.
5. **Theme** — nothing to do: every feature carries its own default theme in its
   `providers_internal.br.dart`. Pass `theme:` to `bindProviders` only to override it
   (brand, dark mode, A/B).

---

## Testing Instructions

Tests specify **behavior**, not implementation. A unit test should only fail when the
**behavior** changes, not during a refactor.

Tests live in `test/unit/src/`, mirroring `lib/src/`, use the **shouldly** assertions
(`.should.be(...)`, `.should.beTrue()`) and the **givn** DSL
`given(...).when(...).then(...)`.

### Mocks

Mocks are generated by **mockito**, declared in a single
`test/unit/src/<package_name>_mocks.dart`:

```dart
@GenerateMocks([HttpClient])
void main() {}
```

`build_runner` produces `<package_name>_mocks.mocks.dart`, which the tests import. In
a `given`, the instances go through `mocks: [MockHttpClient()]` and are read back via
`context.mockOf<MockHttpClient>()` (usable in the `then` too, for a `verify`).
**No unit test touches the network**: it is the `HttpClient` that gets mocked, never Dio.

### Given / When / Then structure

| Phase | Meaning |
|-------|---------|
| **Given** | Context — user scenario / business setup (stubs/mocks/fakes) |
| **When** | Action — what happens |
| **Then** | Observable result — what must be true afterwards |

The `given` / `when` / `then` strings are **behavior descriptions** for a human: they
read like a spec, not like code.

### Behavior-oriented descriptions (BDD)

| Avoid (implementation-oriented) | Prefer (behavior / user) |
|---------------------------------|--------------------------|
| `playMove is called with index 4` | `the user plays the centre cell` |
| `it should return GameOutcome.win` | `crosses should have won` |
| `state is updated` | `the turn should pass to circles` |

- Prefer "the user …" over "the app / the system / the notifier"
- No method or type names in the sentences
- Group by **behavior / scenario**, not by method name

### What to test

- **Test**: behaviors, repositories / data sources, mappers, state holders
  (providers/notifiers), functions with real logic
- For a data source, cover at least: the nominal case, the empty response, the
  unexpectedly shaped response, and the failure — each must produce the right
  `Success` / `Failure`
- **Often skip**: trivial constructors, logic-free DTOs, isolated private helpers,
  framework behavior, generated serialisation
- **Assert on behavior**: business rules, branching, side effects, error handling,
  state changes. Prefer asserting **outputs and State**; keep `verify` for
  **side effects** (e.g. analytics)
- **One test, one behavior**

The `apps/tic_tac_toe` test mounts the real composition, fake transport included: a
forgotten DI contract blows up there immediately.

Presentation tests reach a feature's dependencies through the same `bindProviders(...)`
seam composition uses — never by importing a `providers_di` symbol. `GameNotifier`'s
spec supplies its own `OpponentRepository`, which is how the in-flight, failure and
stale-answer paths are reachable at all.

### Riverpod in tests

- Override only the **direct** dependencies; do not replace the whole graph
- Riverpod discourages mocking Notifiers: test through the behaviors / data sources,
  or shape the API so the behavior becomes observable

---

## Commit and Branch Conventions

### Branch Naming

Format: `<type>/TICKET_<brief_description>` — types: `feat/`, `fix/`, `hotfix/`,
`chore/`, `docs/`, `refactor/`, `perf/`, `test/`.

Example: `feat/ITFRARC-123_user_authentication`

### Commit Messages

Format: `<type>[optional scope]: <description>`

```
feat(board): add restart action
fix(board): resolve grid alignment on iPhone SE
```

- Imperative mood: "add", not "added"
- No leading capital, no trailing period, keep it short

---

## Security Considerations

### Logging

- **Never use `print()` or `debugPrint()`**
- Go through a logger, tagged with the package's `packageName` (in prod: the `Timber` utility)

### Error Reporting

- Report caught exceptions through the APM/Crashlytics providers
- Never implement raw tracking inside the features
- Exceptions are reserved for **programming errors**
  (`UnregisteredProviderException` = a DI contract never provided). An expected
  failure (network, backend, missing resource) comes back as the `Failure` of a
  `Result` — see *Errors*.
- Log a failure **only once**, in the layer that produces it: the network layer
  traces its own errors, a data source does not re-log a `NetworkError`

---

## Design System (DSM) Guidelines

### Token Usage

- **Never a raw color** (`0xFF...`, `Colors.red`) nor a hardcoded value inside a feature
- The tokens live in `tactics_components`: `TacticsPalette`, `TacticsRadius`,
  `TacticsSpacing`, `TacticsIcons`

### Theming

Every feature exposes a `ThemeExtension` generated by **theme_tailor**
(`@TailorMixinComponent`) in `presentation/lib/src/theme/{feature}_theme.br.dart`,
with **concrete semantic tokens** (colors, `TextStyle`, doubles) — never the raw
palette. `BoardTheme` names `crossColor` and `circleColor`, not `red` and `positive`.
The default is built from the DSM palette in `providers_internal.br.dart`;
`providers_di.br.dart` exposes the `{feature}ThemeProvider` contract pointing at it,
which allows overriding it in composition without touching the feature.

- **`tactics_components`**: usable directly inside a feature (widgets, tokens)
- **`tactics_providers`**: **NEVER** import it inside a feature — go through the
  feature's theme. Only composition reads `tacticsPaletteProvider`.
- Theme access: `ref.watch({feature}ThemeProvider.select((theme) => theme.xxx))`

---

## AI Automation

- `CLAUDE.md` is the entry point: it imports this file and the `.claude/rules/`
  rules (`comments`, `dart-line-breaks`) on every session.
- `.mcp.json` registers the **`dart`** server (`dart mcp-server`) — prefer its tools
  (analysis, hot reload, devices, tests, runtime errors) over shell `flutter`/`dart` calls.
- `mason.yaml` + `bricks/`: the scaffolding templates that guarantee every generated
  layer has the same structure as the prod repo. **Do not change them lightly** —
  they affect every future scaffold.
- Generated code (`*.g.dart`, `*.gr.dart`, `*.freezed.dart`, `*.tailor.dart`) is
  **committed**: run `mise run generate` and commit the result in the same change as
  the source.

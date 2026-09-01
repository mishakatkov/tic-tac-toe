// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers_internal.br.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// The feature's default theme, derived from the DSM palette. Composition can
/// override it (brand, dark mode, A/B) without touching the feature.

@ProviderFor(defaultBoardTheme)
final defaultBoardThemeProvider = DefaultBoardThemeProvider._();

/// The feature's default theme, derived from the DSM palette. Composition can
/// override it (brand, dark mode, A/B) without touching the feature.

final class DefaultBoardThemeProvider
    extends $FunctionalProvider<BoardTheme, BoardTheme, BoardTheme>
    with $Provider<BoardTheme> {
  /// The feature's default theme, derived from the DSM palette. Composition can
  /// override it (brand, dark mode, A/B) without touching the feature.
  DefaultBoardThemeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'defaultBoardThemeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$defaultBoardThemeHash();

  @$internal
  @override
  $ProviderElement<BoardTheme> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  BoardTheme create(Ref ref) {
    return defaultBoardTheme(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BoardTheme value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BoardTheme>(value),
    );
  }
}

String _$defaultBoardThemeHash() => r'aaef4f795caafee0ade2b152c25760d517bbe3b7';

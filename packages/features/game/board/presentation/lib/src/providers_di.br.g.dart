// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers_di.br.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(boardTheme)
final boardThemeProvider = BoardThemeProvider._();

final class BoardThemeProvider
    extends $FunctionalProvider<BoardTheme, BoardTheme, BoardTheme>
    with $Provider<BoardTheme> {
  BoardThemeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'boardThemeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$boardThemeHash();

  @$internal
  @override
  $ProviderElement<BoardTheme> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  BoardTheme create(Ref ref) {
    return boardTheme(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BoardTheme value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BoardTheme>(value),
    );
  }
}

String _$boardThemeHash() => r'2d738f0e85b4683195ce36d625e15c4821801ddb';

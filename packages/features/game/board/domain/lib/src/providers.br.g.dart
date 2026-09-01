// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.br.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(chooseMove)
final chooseMoveProvider = ChooseMoveProvider._();

final class ChooseMoveProvider
    extends $FunctionalProvider<ChooseMove, ChooseMove, ChooseMove>
    with $Provider<ChooseMove> {
  ChooseMoveProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'chooseMoveProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$chooseMoveHash();

  @$internal
  @override
  $ProviderElement<ChooseMove> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ChooseMove create(Ref ref) {
    return chooseMove(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ChooseMove value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ChooseMove>(value),
    );
  }
}

String _$chooseMoveHash() => r'eaa65c20f1663a04c7359ef8e46b935ff5e7ead5';

@ProviderFor(evaluateBoard)
final evaluateBoardProvider = EvaluateBoardProvider._();

final class EvaluateBoardProvider
    extends $FunctionalProvider<EvaluateBoard, EvaluateBoard, EvaluateBoard>
    with $Provider<EvaluateBoard> {
  EvaluateBoardProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'evaluateBoardProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$evaluateBoardHash();

  @$internal
  @override
  $ProviderElement<EvaluateBoard> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  EvaluateBoard create(Ref ref) {
    return evaluateBoard(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(EvaluateBoard value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<EvaluateBoard>(value),
    );
  }
}

String _$evaluateBoardHash() => r'674ea3b7eb36128e8f56beaecc33d61ed23cc932';

@ProviderFor(playMove)
final playMoveProvider = PlayMoveProvider._();

final class PlayMoveProvider
    extends $FunctionalProvider<PlayMove, PlayMove, PlayMove>
    with $Provider<PlayMove> {
  PlayMoveProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'playMoveProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$playMoveHash();

  @$internal
  @override
  $ProviderElement<PlayMove> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  PlayMove create(Ref ref) {
    return playMove(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PlayMove value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PlayMove>(value),
    );
  }
}

String _$playMoveHash() => r'f9355620d4201b3c7c2ff64c9f4a667200a8e9dd';

@ProviderFor(requestOpponentMove)
final requestOpponentMoveProvider = RequestOpponentMoveProvider._();

final class RequestOpponentMoveProvider
    extends
        $FunctionalProvider<
          RequestOpponentMove,
          RequestOpponentMove,
          RequestOpponentMove
        >
    with $Provider<RequestOpponentMove> {
  RequestOpponentMoveProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'requestOpponentMoveProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$requestOpponentMoveHash();

  @$internal
  @override
  $ProviderElement<RequestOpponentMove> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  RequestOpponentMove create(Ref ref) {
    return requestOpponentMove(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RequestOpponentMove value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RequestOpponentMove>(value),
    );
  }
}

String _$requestOpponentMoveHash() =>
    r'a6a49fea4d2b0f3715de5bf78f8ae13855e6bf0a';

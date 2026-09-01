// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_state.br.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GameState {

 Board get board; bool get isComputerThinking; Mark get playerMark; OpponentError? get opponentError;
/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GameStateCopyWith<GameState> get copyWith => _$GameStateCopyWithImpl<GameState>(this as GameState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameState&&(identical(other.board, board) || other.board == board)&&(identical(other.isComputerThinking, isComputerThinking) || other.isComputerThinking == isComputerThinking)&&(identical(other.playerMark, playerMark) || other.playerMark == playerMark)&&(identical(other.opponentError, opponentError) || other.opponentError == opponentError));
}


@override
int get hashCode => Object.hash(runtimeType,board,isComputerThinking,playerMark,opponentError);

@override
String toString() {
  return 'GameState(board: $board, isComputerThinking: $isComputerThinking, playerMark: $playerMark, opponentError: $opponentError)';
}


}

/// @nodoc
abstract mixin class $GameStateCopyWith<$Res>  {
  factory $GameStateCopyWith(GameState value, $Res Function(GameState) _then) = _$GameStateCopyWithImpl;
@useResult
$Res call({
 Board board, bool isComputerThinking, Mark playerMark, OpponentError? opponentError
});


$BoardCopyWith<$Res> get board;$OpponentErrorCopyWith<$Res>? get opponentError;

}
/// @nodoc
class _$GameStateCopyWithImpl<$Res>
    implements $GameStateCopyWith<$Res> {
  _$GameStateCopyWithImpl(this._self, this._then);

  final GameState _self;
  final $Res Function(GameState) _then;

/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? board = null,Object? isComputerThinking = null,Object? playerMark = null,Object? opponentError = freezed,}) {
  return _then(_self.copyWith(
board: null == board ? _self.board : board // ignore: cast_nullable_to_non_nullable
as Board,isComputerThinking: null == isComputerThinking ? _self.isComputerThinking : isComputerThinking // ignore: cast_nullable_to_non_nullable
as bool,playerMark: null == playerMark ? _self.playerMark : playerMark // ignore: cast_nullable_to_non_nullable
as Mark,opponentError: freezed == opponentError ? _self.opponentError : opponentError // ignore: cast_nullable_to_non_nullable
as OpponentError?,
  ));
}
/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BoardCopyWith<$Res> get board {
  
  return $BoardCopyWith<$Res>(_self.board, (value) {
    return _then(_self.copyWith(board: value));
  });
}/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OpponentErrorCopyWith<$Res>? get opponentError {
    if (_self.opponentError == null) {
    return null;
  }

  return $OpponentErrorCopyWith<$Res>(_self.opponentError!, (value) {
    return _then(_self.copyWith(opponentError: value));
  });
}
}


/// Adds pattern-matching-related methods to [GameState].
extension GameStatePatterns on GameState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GameState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GameState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GameState value)  $default,){
final _that = this;
switch (_that) {
case _GameState():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GameState value)?  $default,){
final _that = this;
switch (_that) {
case _GameState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Board board,  bool isComputerThinking,  Mark playerMark,  OpponentError? opponentError)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GameState() when $default != null:
return $default(_that.board,_that.isComputerThinking,_that.playerMark,_that.opponentError);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Board board,  bool isComputerThinking,  Mark playerMark,  OpponentError? opponentError)  $default,) {final _that = this;
switch (_that) {
case _GameState():
return $default(_that.board,_that.isComputerThinking,_that.playerMark,_that.opponentError);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Board board,  bool isComputerThinking,  Mark playerMark,  OpponentError? opponentError)?  $default,) {final _that = this;
switch (_that) {
case _GameState() when $default != null:
return $default(_that.board,_that.isComputerThinking,_that.playerMark,_that.opponentError);case _:
  return null;

}
}

}

/// @nodoc


class _GameState extends GameState {
  const _GameState({required this.board, required this.isComputerThinking, required this.playerMark, this.opponentError}): super._();
  

@override final  Board board;
@override final  bool isComputerThinking;
@override final  Mark playerMark;
@override final  OpponentError? opponentError;

/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GameStateCopyWith<_GameState> get copyWith => __$GameStateCopyWithImpl<_GameState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GameState&&(identical(other.board, board) || other.board == board)&&(identical(other.isComputerThinking, isComputerThinking) || other.isComputerThinking == isComputerThinking)&&(identical(other.playerMark, playerMark) || other.playerMark == playerMark)&&(identical(other.opponentError, opponentError) || other.opponentError == opponentError));
}


@override
int get hashCode => Object.hash(runtimeType,board,isComputerThinking,playerMark,opponentError);

@override
String toString() {
  return 'GameState(board: $board, isComputerThinking: $isComputerThinking, playerMark: $playerMark, opponentError: $opponentError)';
}


}

/// @nodoc
abstract mixin class _$GameStateCopyWith<$Res> implements $GameStateCopyWith<$Res> {
  factory _$GameStateCopyWith(_GameState value, $Res Function(_GameState) _then) = __$GameStateCopyWithImpl;
@override @useResult
$Res call({
 Board board, bool isComputerThinking, Mark playerMark, OpponentError? opponentError
});


@override $BoardCopyWith<$Res> get board;@override $OpponentErrorCopyWith<$Res>? get opponentError;

}
/// @nodoc
class __$GameStateCopyWithImpl<$Res>
    implements _$GameStateCopyWith<$Res> {
  __$GameStateCopyWithImpl(this._self, this._then);

  final _GameState _self;
  final $Res Function(_GameState) _then;

/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? board = null,Object? isComputerThinking = null,Object? playerMark = null,Object? opponentError = freezed,}) {
  return _then(_GameState(
board: null == board ? _self.board : board // ignore: cast_nullable_to_non_nullable
as Board,isComputerThinking: null == isComputerThinking ? _self.isComputerThinking : isComputerThinking // ignore: cast_nullable_to_non_nullable
as bool,playerMark: null == playerMark ? _self.playerMark : playerMark // ignore: cast_nullable_to_non_nullable
as Mark,opponentError: freezed == opponentError ? _self.opponentError : opponentError // ignore: cast_nullable_to_non_nullable
as OpponentError?,
  ));
}

/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BoardCopyWith<$Res> get board {
  
  return $BoardCopyWith<$Res>(_self.board, (value) {
    return _then(_self.copyWith(board: value));
  });
}/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OpponentErrorCopyWith<$Res>? get opponentError {
    if (_self.opponentError == null) {
    return null;
  }

  return $OpponentErrorCopyWith<$Res>(_self.opponentError!, (value) {
    return _then(_self.copyWith(opponentError: value));
  });
}
}

// dart format on

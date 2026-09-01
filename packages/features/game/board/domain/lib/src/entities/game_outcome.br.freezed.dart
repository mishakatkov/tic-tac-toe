// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_outcome.br.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GameOutcome {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameOutcome);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GameOutcome()';
}


}

/// @nodoc
class $GameOutcomeCopyWith<$Res>  {
$GameOutcomeCopyWith(GameOutcome _, $Res Function(GameOutcome) __);
}


/// Adds pattern-matching-related methods to [GameOutcome].
extension GameOutcomePatterns on GameOutcome {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( DrawGameOutcome value)?  draw,TResult Function( InProgressGameOutcome value)?  inProgress,TResult Function( WinGameOutcome value)?  win,required TResult orElse(),}){
final _that = this;
switch (_that) {
case DrawGameOutcome() when draw != null:
return draw(_that);case InProgressGameOutcome() when inProgress != null:
return inProgress(_that);case WinGameOutcome() when win != null:
return win(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( DrawGameOutcome value)  draw,required TResult Function( InProgressGameOutcome value)  inProgress,required TResult Function( WinGameOutcome value)  win,}){
final _that = this;
switch (_that) {
case DrawGameOutcome():
return draw(_that);case InProgressGameOutcome():
return inProgress(_that);case WinGameOutcome():
return win(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( DrawGameOutcome value)?  draw,TResult? Function( InProgressGameOutcome value)?  inProgress,TResult? Function( WinGameOutcome value)?  win,}){
final _that = this;
switch (_that) {
case DrawGameOutcome() when draw != null:
return draw(_that);case InProgressGameOutcome() when inProgress != null:
return inProgress(_that);case WinGameOutcome() when win != null:
return win(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  draw,TResult Function()?  inProgress,TResult Function( Mark mark,  List<int> line)?  win,required TResult orElse(),}) {final _that = this;
switch (_that) {
case DrawGameOutcome() when draw != null:
return draw();case InProgressGameOutcome() when inProgress != null:
return inProgress();case WinGameOutcome() when win != null:
return win(_that.mark,_that.line);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  draw,required TResult Function()  inProgress,required TResult Function( Mark mark,  List<int> line)  win,}) {final _that = this;
switch (_that) {
case DrawGameOutcome():
return draw();case InProgressGameOutcome():
return inProgress();case WinGameOutcome():
return win(_that.mark,_that.line);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  draw,TResult? Function()?  inProgress,TResult? Function( Mark mark,  List<int> line)?  win,}) {final _that = this;
switch (_that) {
case DrawGameOutcome() when draw != null:
return draw();case InProgressGameOutcome() when inProgress != null:
return inProgress();case WinGameOutcome() when win != null:
return win(_that.mark,_that.line);case _:
  return null;

}
}

}

/// @nodoc


class DrawGameOutcome implements GameOutcome {
  const DrawGameOutcome();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DrawGameOutcome);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GameOutcome.draw()';
}


}




/// @nodoc


class InProgressGameOutcome implements GameOutcome {
  const InProgressGameOutcome();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InProgressGameOutcome);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GameOutcome.inProgress()';
}


}




/// @nodoc


class WinGameOutcome implements GameOutcome {
  const WinGameOutcome(this.mark, final  List<int> line): _line = line;
  

 final  Mark mark;
 final  List<int> _line;
 List<int> get line {
  if (_line is EqualUnmodifiableListView) return _line;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_line);
}


/// Create a copy of GameOutcome
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WinGameOutcomeCopyWith<WinGameOutcome> get copyWith => _$WinGameOutcomeCopyWithImpl<WinGameOutcome>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WinGameOutcome&&(identical(other.mark, mark) || other.mark == mark)&&const DeepCollectionEquality().equals(other._line, _line));
}


@override
int get hashCode => Object.hash(runtimeType,mark,const DeepCollectionEquality().hash(_line));

@override
String toString() {
  return 'GameOutcome.win(mark: $mark, line: $line)';
}


}

/// @nodoc
abstract mixin class $WinGameOutcomeCopyWith<$Res> implements $GameOutcomeCopyWith<$Res> {
  factory $WinGameOutcomeCopyWith(WinGameOutcome value, $Res Function(WinGameOutcome) _then) = _$WinGameOutcomeCopyWithImpl;
@useResult
$Res call({
 Mark mark, List<int> line
});




}
/// @nodoc
class _$WinGameOutcomeCopyWithImpl<$Res>
    implements $WinGameOutcomeCopyWith<$Res> {
  _$WinGameOutcomeCopyWithImpl(this._self, this._then);

  final WinGameOutcome _self;
  final $Res Function(WinGameOutcome) _then;

/// Create a copy of GameOutcome
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? mark = null,Object? line = null,}) {
  return _then(WinGameOutcome(
null == mark ? _self.mark : mark // ignore: cast_nullable_to_non_nullable
as Mark,null == line ? _self._line : line // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}


}

// dart format on

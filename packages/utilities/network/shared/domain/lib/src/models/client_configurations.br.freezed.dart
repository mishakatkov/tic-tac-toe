// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'client_configurations.br.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HttpClientConfiguration {

 String get baseUrl; Duration get connectTimeout; Duration get receiveTimeout;
/// Create a copy of HttpClientConfiguration
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HttpClientConfigurationCopyWith<HttpClientConfiguration> get copyWith => _$HttpClientConfigurationCopyWithImpl<HttpClientConfiguration>(this as HttpClientConfiguration, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HttpClientConfiguration&&(identical(other.baseUrl, baseUrl) || other.baseUrl == baseUrl)&&(identical(other.connectTimeout, connectTimeout) || other.connectTimeout == connectTimeout)&&(identical(other.receiveTimeout, receiveTimeout) || other.receiveTimeout == receiveTimeout));
}


@override
int get hashCode => Object.hash(runtimeType,baseUrl,connectTimeout,receiveTimeout);

@override
String toString() {
  return 'HttpClientConfiguration(baseUrl: $baseUrl, connectTimeout: $connectTimeout, receiveTimeout: $receiveTimeout)';
}


}

/// @nodoc
abstract mixin class $HttpClientConfigurationCopyWith<$Res>  {
  factory $HttpClientConfigurationCopyWith(HttpClientConfiguration value, $Res Function(HttpClientConfiguration) _then) = _$HttpClientConfigurationCopyWithImpl;
@useResult
$Res call({
 String baseUrl, Duration connectTimeout, Duration receiveTimeout
});




}
/// @nodoc
class _$HttpClientConfigurationCopyWithImpl<$Res>
    implements $HttpClientConfigurationCopyWith<$Res> {
  _$HttpClientConfigurationCopyWithImpl(this._self, this._then);

  final HttpClientConfiguration _self;
  final $Res Function(HttpClientConfiguration) _then;

/// Create a copy of HttpClientConfiguration
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? baseUrl = null,Object? connectTimeout = null,Object? receiveTimeout = null,}) {
  return _then(_self.copyWith(
baseUrl: null == baseUrl ? _self.baseUrl : baseUrl // ignore: cast_nullable_to_non_nullable
as String,connectTimeout: null == connectTimeout ? _self.connectTimeout : connectTimeout // ignore: cast_nullable_to_non_nullable
as Duration,receiveTimeout: null == receiveTimeout ? _self.receiveTimeout : receiveTimeout // ignore: cast_nullable_to_non_nullable
as Duration,
  ));
}

}


/// Adds pattern-matching-related methods to [HttpClientConfiguration].
extension HttpClientConfigurationPatterns on HttpClientConfiguration {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HttpClientConfiguration value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HttpClientConfiguration() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HttpClientConfiguration value)  $default,){
final _that = this;
switch (_that) {
case _HttpClientConfiguration():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HttpClientConfiguration value)?  $default,){
final _that = this;
switch (_that) {
case _HttpClientConfiguration() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String baseUrl,  Duration connectTimeout,  Duration receiveTimeout)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HttpClientConfiguration() when $default != null:
return $default(_that.baseUrl,_that.connectTimeout,_that.receiveTimeout);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String baseUrl,  Duration connectTimeout,  Duration receiveTimeout)  $default,) {final _that = this;
switch (_that) {
case _HttpClientConfiguration():
return $default(_that.baseUrl,_that.connectTimeout,_that.receiveTimeout);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String baseUrl,  Duration connectTimeout,  Duration receiveTimeout)?  $default,) {final _that = this;
switch (_that) {
case _HttpClientConfiguration() when $default != null:
return $default(_that.baseUrl,_that.connectTimeout,_that.receiveTimeout);case _:
  return null;

}
}

}

/// @nodoc


class _HttpClientConfiguration implements HttpClientConfiguration {
  const _HttpClientConfiguration({required this.baseUrl, this.connectTimeout = const Duration(seconds: 15), this.receiveTimeout = const Duration(seconds: 15)});
  

@override final  String baseUrl;
@override@JsonKey() final  Duration connectTimeout;
@override@JsonKey() final  Duration receiveTimeout;

/// Create a copy of HttpClientConfiguration
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HttpClientConfigurationCopyWith<_HttpClientConfiguration> get copyWith => __$HttpClientConfigurationCopyWithImpl<_HttpClientConfiguration>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HttpClientConfiguration&&(identical(other.baseUrl, baseUrl) || other.baseUrl == baseUrl)&&(identical(other.connectTimeout, connectTimeout) || other.connectTimeout == connectTimeout)&&(identical(other.receiveTimeout, receiveTimeout) || other.receiveTimeout == receiveTimeout));
}


@override
int get hashCode => Object.hash(runtimeType,baseUrl,connectTimeout,receiveTimeout);

@override
String toString() {
  return 'HttpClientConfiguration(baseUrl: $baseUrl, connectTimeout: $connectTimeout, receiveTimeout: $receiveTimeout)';
}


}

/// @nodoc
abstract mixin class _$HttpClientConfigurationCopyWith<$Res> implements $HttpClientConfigurationCopyWith<$Res> {
  factory _$HttpClientConfigurationCopyWith(_HttpClientConfiguration value, $Res Function(_HttpClientConfiguration) _then) = __$HttpClientConfigurationCopyWithImpl;
@override @useResult
$Res call({
 String baseUrl, Duration connectTimeout, Duration receiveTimeout
});




}
/// @nodoc
class __$HttpClientConfigurationCopyWithImpl<$Res>
    implements _$HttpClientConfigurationCopyWith<$Res> {
  __$HttpClientConfigurationCopyWithImpl(this._self, this._then);

  final _HttpClientConfiguration _self;
  final $Res Function(_HttpClientConfiguration) _then;

/// Create a copy of HttpClientConfiguration
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? baseUrl = null,Object? connectTimeout = null,Object? receiveTimeout = null,}) {
  return _then(_HttpClientConfiguration(
baseUrl: null == baseUrl ? _self.baseUrl : baseUrl // ignore: cast_nullable_to_non_nullable
as String,connectTimeout: null == connectTimeout ? _self.connectTimeout : connectTimeout // ignore: cast_nullable_to_non_nullable
as Duration,receiveTimeout: null == receiveTimeout ? _self.receiveTimeout : receiveTimeout // ignore: cast_nullable_to_non_nullable
as Duration,
  ));
}


}

// dart format on

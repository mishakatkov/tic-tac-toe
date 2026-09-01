// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'board_theme.br.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$BoardThemeTailorMixin on ThemeExtension<BoardTheme> {
  Color get backgroundColor;
  Color get cellColor;
  Color get circleColor;
  Color get crossColor;
  TextStyle get errorStyle;
  Color get gridColor;
  double get sideOptionSize;
  TextStyle get statusStyle;
  Color get winningLineColor;

  @override
  BoardTheme copyWith({
    Color? backgroundColor,
    Color? cellColor,
    Color? circleColor,
    Color? crossColor,
    TextStyle? errorStyle,
    Color? gridColor,
    double? sideOptionSize,
    TextStyle? statusStyle,
    Color? winningLineColor,
  }) {
    return BoardTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      cellColor: cellColor ?? this.cellColor,
      circleColor: circleColor ?? this.circleColor,
      crossColor: crossColor ?? this.crossColor,
      errorStyle: errorStyle ?? this.errorStyle,
      gridColor: gridColor ?? this.gridColor,
      sideOptionSize: sideOptionSize ?? this.sideOptionSize,
      statusStyle: statusStyle ?? this.statusStyle,
      winningLineColor: winningLineColor ?? this.winningLineColor,
    );
  }

  @override
  BoardTheme lerp(covariant ThemeExtension<BoardTheme>? other, double t) {
    if (other is! BoardTheme) return this as BoardTheme;
    return BoardTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      cellColor: Color.lerp(cellColor, other.cellColor, t)!,
      circleColor: Color.lerp(circleColor, other.circleColor, t)!,
      crossColor: Color.lerp(crossColor, other.crossColor, t)!,
      errorStyle: TextStyle.lerp(errorStyle, other.errorStyle, t)!,
      gridColor: Color.lerp(gridColor, other.gridColor, t)!,
      sideOptionSize: t < 0.5 ? sideOptionSize : other.sideOptionSize,
      statusStyle: TextStyle.lerp(statusStyle, other.statusStyle, t)!,
      winningLineColor: Color.lerp(
        winningLineColor,
        other.winningLineColor,
        t,
      )!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BoardTheme &&
            const DeepCollectionEquality().equals(
              backgroundColor,
              other.backgroundColor,
            ) &&
            const DeepCollectionEquality().equals(cellColor, other.cellColor) &&
            const DeepCollectionEquality().equals(
              circleColor,
              other.circleColor,
            ) &&
            const DeepCollectionEquality().equals(
              crossColor,
              other.crossColor,
            ) &&
            const DeepCollectionEquality().equals(
              errorStyle,
              other.errorStyle,
            ) &&
            const DeepCollectionEquality().equals(gridColor, other.gridColor) &&
            const DeepCollectionEquality().equals(
              sideOptionSize,
              other.sideOptionSize,
            ) &&
            const DeepCollectionEquality().equals(
              statusStyle,
              other.statusStyle,
            ) &&
            const DeepCollectionEquality().equals(
              winningLineColor,
              other.winningLineColor,
            ));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(backgroundColor),
      const DeepCollectionEquality().hash(cellColor),
      const DeepCollectionEquality().hash(circleColor),
      const DeepCollectionEquality().hash(crossColor),
      const DeepCollectionEquality().hash(errorStyle),
      const DeepCollectionEquality().hash(gridColor),
      const DeepCollectionEquality().hash(sideOptionSize),
      const DeepCollectionEquality().hash(statusStyle),
      const DeepCollectionEquality().hash(winningLineColor),
    );
  }
}

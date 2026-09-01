import 'package:flutter/widgets.dart';

/// Injectable widget factory: a feature exposes a widget through this interface,
/// and a host renders it via `create()` without depending on the feature.
abstract interface class WidgetFactory<T> {
  const WidgetFactory();

  const factory WidgetFactory.from(Widget Function(T data, {Key? key}) create) = _FunctionWidgetFactory;

  /// Shorthand for a widget with no argument.
  static WidgetFactory<void> fromNoArg(Widget Function({Key? key}) create) =>
      WidgetFactory<void>.from((_, {Key? key}) => create(key: key));

  Widget create(T data, {Key? key});
}

class _FunctionWidgetFactory<T> implements WidgetFactory<T> {
  const _FunctionWidgetFactory(this._create);

  final Widget Function(T data, {Key? key}) _create;

  @override
  Widget create(T data, {Key? key}) => _create(data, key: key);
}

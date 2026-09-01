import 'package:exceptions/exceptions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tactics_components/tactics_components.dart';

part 'providers_di.br.g.dart';

@riverpod
TacticsPalette tacticsPalette(Ref ref) {
  throw UnregisteredProviderException(tacticsPaletteProvider);
}

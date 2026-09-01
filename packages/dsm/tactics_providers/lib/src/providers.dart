import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tactics_components/tactics_components.dart';
import 'package:tactics_providers/src/providers_di.br.dart';

List<Override> bindProviders({
  required ProviderListenable<TacticsPalette> palette,
}) => [tacticsPaletteProvider.overrideWith((ref) => ref.watch(palette))];

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';
import 'providers.dart';
import 'services/character_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final characters = await CharacterService().getCharacterData();

  // Must set these cause Android does not have all of them by default
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight
  ]);

  runApp(
    ProviderScope(
      overrides: [
        charactersProvider.overrideWith((ref) => characters),
      ],
      child: const MyApp(),
    ),
  );
}

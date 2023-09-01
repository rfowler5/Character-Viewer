import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';
import 'state/characters_provider.dart';

// TODO: Don't like having multiple main files. Look into method channels to see if can
// consolidate to just one main file.

void mainCommon() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Must set these cause Android (and maybe ios also?) does not have all of them by default
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight
  ]);

  final container = ProviderContainer();
  await container.read(charactersProvider.future);

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const MyApp(),
    ),
  );
}

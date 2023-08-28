import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'models/character.dart';

final charactersProvider =
    FutureProvider<List<Character>>((ref) async => throw UnimplementedError());

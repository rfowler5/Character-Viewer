import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/character.dart';
import '../repo/character_service.dart';

final charactersProvider = FutureProvider<List<Character>>(
    (ref) async => await CharacterService().getCharacterData());

import 'dart:convert';

import 'package:dio/dio.dart';

import '../models/character.dart';
import 'dio_base.dart';

class CharacterService {
  Future<List<Character>> getCharacterData() async {
    return await dio.get('').then((Response response) =>
        (jsonDecode(response.data)['RelatedTopics'] as List)
            .map((e) => Character.fromMap(e))
            .toList());
  }
}

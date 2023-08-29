import 'dart:convert';

import 'package:dio/dio.dart';

import '../constants.dart';
import '../models/character.dart';

class CharacterService {
  final dio = Dio(BaseOptions(baseUrl: baseApiURL));

  Future<List<Character>> getCharacterData() async {
    return await dio.get('').then((Response response) =>
        (jsonDecode(response.data)['RelatedTopics'] as List)
            .map((e) => Character.fromMap(e))
            .toList());
  }
}

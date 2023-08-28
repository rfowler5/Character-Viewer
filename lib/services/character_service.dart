import 'dart:convert';

import 'package:dio/dio.dart';

import '../models/character.dart';

class CharacterService {
  final dio = Dio(BaseOptions(
      baseUrl: 'http://api.duckduckgo.com/?q=simpsons+characters&format=json'));

  Future<List<Character>> getCharacterData() async {
    return await dio.get('').then((Response response) =>
        (jsonDecode(response.data)['RelatedTopics'] as List)
            .map((e) => Character.map(e))
            .toList());
  }
}

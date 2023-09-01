import '../configs/api_configs.dart' show baseImageURL, defaultImageURL;

class Character {
  Character(
      {required this.name, required this.image, required this.description});

  late final String name;
  late final String image;
  late final String description;

  Character.fromMap(Map<String, dynamic> map) {
    final iconURL = map['Icon']['URL'];

    final resultString = map['Result'] as String;

    name = _extractMatchGroup(r'<a[^>]*>(.*)</a>', resultString);

    description = _extractMatchGroup(r'<br[^>]*>(.*)$', resultString);

    image = '$baseImageURL${iconURL != '' ? iconURL : defaultImageURL}';
  }

  /// Helper to extract text in a single regExp match group.
  String _extractMatchGroup(String regExpStr, String searchStr) =>
      RegExp(regExpStr, dotAll: true).firstMatch(searchStr)?.group(1) ?? '';
}

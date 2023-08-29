import '../constants.dart';

class Character {
  Character(
      {required this.name, required this.image, required this.description});

  late final String name;
  late final String image;
  late final String description;

  Character.fromMap(Map<String, dynamic> map) {
    final textArray = (map['Text'] as String).split(' - ');
    final iconUri = map['Icon']['URL'];

    name = textArray[0];
    description = textArray[1];
    image = '$baseURL${iconUri != '' ? iconUri : defaultImageURL}';
  }
}

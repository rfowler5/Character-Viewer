import '../configs/api_configs.dart' show baseImageURL, defaultImageURL;

class Character {
  Character(
      {required this.name, required this.image, required this.description});

  late final String name;
  late final String image;
  late final String description;

  Character.fromMap(Map<String, dynamic> map) {
    final textArray = (map['Text'] as String).split(' - ');
    final iconURL = map['Icon']['URL'];

    name = textArray.isNotEmpty ? textArray[0] : '';

    description = textArray.length == 2 ? textArray[1] : '';
    image = '$baseImageURL${iconURL != '' ? iconURL : defaultImageURL}';
  }
}

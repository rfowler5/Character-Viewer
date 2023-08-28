const DEFAULT_IMAGE =
    '/iu/?u=https%3A%2F%2Fi.pinimg.com%2Foriginals%2F87%2Fae%2F83%2F87ae8360cfe56fda3b49e609eb3b7c25.jpg&f=1&nofb=1&ipt=d8bdf64d237740171a5144a3b0bd02e58bad632901048c5832c2dacc7716107d&ipo=images';

class Character {
  Character(this.name, this.image, this.description);

  final String name;
  final String image;
  final String description;

  Character.map(Map<String, dynamic> map)
      : name = (map['Text'] as String).split(' - ')[0],
        image =
            'https://duckduckgo.com${map['Icon']['URL'] != '' ? map['Icon']['URL'] : DEFAULT_IMAGE}',
        description = (map['Text'] as String).split(' - ')[1];
}

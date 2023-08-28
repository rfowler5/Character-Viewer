import 'package:flutter/material.dart';

import '../models/character.dart';

class CharacterDescriptions extends StatelessWidget {
  const CharacterDescriptions(
      {required this.characters, this.onTap, super.key});

  final List<Character> characters;
  final void Function(int)? onTap;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (_, __) =>
          Container(height: 2, color: Colors.grey[400]), //Colors.grey),
      itemCount: characters.length,
      itemBuilder: (context, index) => ListTile(
        // Tap to navigate or to change character being viewed at the moment.
        onTap: () => onTap!(index),
        title: Text(
          characters[index].name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        tileColor: Colors.white, //Colors.grey[400],
      ),
    );
  }
}

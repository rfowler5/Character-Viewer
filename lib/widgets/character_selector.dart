import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../models/character.dart';

class CharacterSelector extends StatelessWidget {
  const CharacterSelector({required this.characters, this.onTap, super.key});

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
        title: AutoSizeText(
          characters[index].name,
          maxLines: 1,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        tileColor: Colors.white, //Colors.grey[400],
      ),
    );
  }
}

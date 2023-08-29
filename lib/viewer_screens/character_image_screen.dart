import 'package:flutter/material.dart';

import '../models/character.dart';
import '../widgets/character_card.dart';

class CharacterImageScreen extends StatelessWidget {
  const CharacterImageScreen({required this.character, super.key});
  final Character character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: CharacterCard(character: character),
      ),
    );
  }
}

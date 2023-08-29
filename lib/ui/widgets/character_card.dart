import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../models/character.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({required this.character, super.key});
  final Character character;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              flex: 2,
              child: AutoSizeText(
                character.name,
                maxLines: 3,
                wrapWords: false,
                style:
                    const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(flex: 1),
            Expanded(
                flex: 5,
                child: Image.network(
                  character.image,
                  fit: BoxFit.cover,
                )),
            const Spacer(flex: 1),
            Expanded(
              flex: 3,
              child: AutoSizeText(
                character.description,
                style: const TextStyle(fontSize: 18),
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

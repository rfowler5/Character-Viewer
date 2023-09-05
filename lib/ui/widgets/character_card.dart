import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../models/character.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({required this.character, super.key});
  final Character character;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isTablet = min(size.height, size.width) > 600;
    final isPhoneLandscape = !isTablet &&
        MediaQuery.of(context).orientation == Orientation.landscape;

    int flexImg = 9;
    int flexDescription = 6;
    int maxLines = 3;

    if (isPhoneLandscape) {
      flexImg = 4;
      flexDescription = 6;
      maxLines = 1;
    }

    final List<Widget> children = [
      Flexible(
        flex: 3,
        child: AutoSizeText(
          character.name,
          maxLines: maxLines,
          wrapWords: false,
          style: const TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      const Spacer(flex: 1),
    ];

    final List<Widget> bottomChildren = [
      Expanded(
          flex: flexImg,
          child: Image.network(
            character.image,
            fit: BoxFit.contain,
          )),
      const Spacer(flex: 1),
      Flexible(
        flex: flexDescription,
        child: AutoSizeText(
          character.description,
          style: const TextStyle(fontSize: 18),
          textAlign: TextAlign.justify,
        ),
      ),
    ];

    if (isPhoneLandscape)
      children.add(Flexible(
          flex: 7,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              children: bottomChildren)));
    else
      children.addAll(bottomChildren);

    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: children,
        ),
      ),
    );
  }
}

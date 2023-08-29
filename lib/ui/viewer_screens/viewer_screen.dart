import 'dart:math';

import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'character_image_screen.dart';
import '../../models/character.dart';
import '../../providers.dart';
import '../widgets/character_card.dart';
import '../widgets/character_selector.dart';

class ViewerScreen extends ConsumerStatefulWidget {
  const ViewerScreen({super.key});

  @override
  ConsumerState<ViewerScreen> createState() => _ViewerScreenState();
}

class _ViewerScreenState extends ConsumerState<ViewerScreen> {
  int selectedCharacterIndex = 0;
  late List<Character> filteredCharacters;
  bool isTablet = false;

  @override
  initState() {
    filteredCharacters = ref.read(charactersProvider).value ?? [];

    super.initState();
  }

  _onSearchSubmitted(String inputText) {
    final characters = ref.read(charactersProvider).value;

    setState(() {
      filteredCharacters = characters!
          .where(
            (e) => [e.name, e.description].any(
              (a) => a.contains(RegExp(inputText, caseSensitive: false)),
            ),
          )
          .toList();
      if (isTablet && selectedCharacterIndex != 0) selectedCharacterIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    isTablet = min(size.height, size.width) > 600;

    final List<Widget> children = [
      Expanded(
        child: CharacterSelector(
            characters: filteredCharacters,
            onTap: (index) => isTablet
                ? setState(() {
                    selectedCharacterIndex = index;
                  })
                : context.push('/image-screen',
                    extra: filteredCharacters[index])),
      ),
    ];

    if (isTablet)
      children.add(
        Expanded(
          child: CharacterCard(
              character: filteredCharacters[selectedCharacterIndex]),
        ),
      );

    return Scaffold(
      appBar: EasySearchBar(
        title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('Character Viewer', style: TextStyle(color: Colors.white))
            ]),
        iconTheme: const IconThemeData(size: 30, color: Colors.white),
        onSearch: (inputText) => _onSearchSubmitted(inputText),
        searchHintText: 'Find a character',
        showClearSearchIcon: true,
      ),
      extendBody: true,

      // appBar: AppBar(
      //   // Here we take the value from the MyHomePage object that was created by
      //   // the App.build method, and use it to set our appbar title.
      //   title: Stack(alignment: Alignment.center, children: [
      //     Center(child: Text(widget.title)),
      //     Align(
      //       alignment: Alignment.centerRight,
      //       child: AnimSearchBar(
      //           autoFocus: true,
      //           width: MediaQuery.of(context).size.width,
      //           textController: _searchController,
      //           rtl: true,
      //           helpText: "Find a character",
      //           onSuffixTap: () {},
      //           onSubmitted: (inputText) => _onSearchSubmitted(inputText)),
      //     ),
      //   ]),
      // ),
      body: Row(children: children),
    );
  }
}

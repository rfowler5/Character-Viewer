// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:character_viewer/app.dart';
import 'package:character_viewer/configs/api_configs.dart';
import 'package:character_viewer/models/character.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'character_data.dart';

compareCharacters(Character char1, Character char2) =>
    char1.description == char2.description &&
    char1.name == char2.name &&
    char1.image == char2.image;

void main() {
  group("Test character mapping from Json", () {
    test('Common case without image', () {
      final test = Character.fromMap(commonCaseNoImage);
      expect(compareCharacters(test, commonCaseNoImageExpected), true);
    });
    test('Common case with image', () {
      final test = Character.fromMap(commonCaseWithImage);
      expect(compareCharacters(test, commonCaseWithImageExpected), true);
    });

    test('Common case with hyphens in name', () {
      final test = Character.fromMap(commonCaseHyphens);
      expect(compareCharacters(test, commonCaseHyphensExpected), true);
    });

    test('Edge case with hyphens and space in name', () {
      final test = Character.fromMap(wrongPlaceHyphens);
      expect(compareCharacters(test, wrongPlaceHyphensExpected), true);
    });

    test('Edge case no description supplied', () {
      final test = Character.fromMap(noDescription);
      expect(compareCharacters(test, noDescriptionExpected), true);
    });

    test('Edge case no name supplied', () {
      final test = Character.fromMap(noName);
      expect(compareCharacters(test, noNameExpected), true);
    });
  });
}

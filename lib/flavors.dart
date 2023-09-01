import 'package:flutter/material.dart';

enum Flavor {
  simpson,
  wire,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.simpson:
        return 'Simpsons Character Viewer';
      case Flavor.wire:
        return 'The Wire Viewer';
      default:
        return 'title';
    }
  }

  static String get baseURL {
    switch (appFlavor) {
      case Flavor.simpson:
        return 'http://api.duckduckgo.com/?q=simpsons+characters&format=json';
      case Flavor.wire:
        return 'http://api.duckduckgo.com/?q=the+wire+characters&format=json';
      default:
        return 'title';
    }
  }

  static ThemeData get themeData {
    switch (appFlavor) {
      case Flavor.simpson:
        return ThemeData(primarySwatch: Colors.amber);
      case Flavor.wire:
        return ThemeData(primarySwatch: Colors.red);
      default:
        return ThemeData(primarySwatch: Colors.blue);
    }
  }
}

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
        return 'Simpson Viewer';
      case Flavor.wire:
        return 'The Wire Viewer';
      default:
        return 'title';
    }
  }

}

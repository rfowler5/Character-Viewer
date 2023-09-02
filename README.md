This viewer uses flavorizr to make two versions (i.e., flavors. They are in this app: simpson, wire) of an app that shares the same codebase but with different ids and names. I do not like how flavorizr uses multiple main files, and I do not like the flavors.dart file: this just does not seem to scale as well as having one main file and multiple config files. I am thinking about possible solutions and may implement at some point.

I also do not like the layout of the current ui for phones in landscape. For my own purposes, I plan on using orientation builder and changing that in another branch at some point.

To run the different flavors, just need to execute flutter run --flavor flavor_name -t lib/main_flavor_name.dart. That is, flutter run --flavor simpson -t lib/main_simpson.dartfor the simpson version and flutter run --flavor wire -t lib/main_wire.dart for the wire version (See the documentation for the flavorizr package for more details: https://pub.dev/packages/flutter_flavorizr).

This branch was tested for ios in debug mode and android in both debug and release mode.

For sake of time, Android 12+ splash screen is the default one generated from the launcher icon. Could update to have properly sized icon for 12+.

See iosSplash branch for untested ios splash screen: it probably doesn't work cause needs additional configuration with xcode, as the flutter_native_splash documentation says.
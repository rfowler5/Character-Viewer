This viewer uses flavorizr to make two versions of an app that shares the same codebase but with different ids and names. I do not like how flavorizr uses multiple main files, and I do not like the flavors.dart file: this just does not seem to scale as well as having one main file and multiple config files. I am thinking about possible solutions and may implement at some point.

I also do not like the layout of the current ui for phones in landscape. For my own purposes, I plan on using orientation builder and changing that in another branch at some point.

This branch was tested for ios in debug mode and android in both debug and release mode.

For sake of time, Android 12+ splash screen is the default one generated from the launcher icon. Could update to have properly sized icon for 12+.

See iosSplash branch for untested ios splash screen: it probably doesn't work cause needs additional configuration with xcode, as the flutter_native_splash documentation says.
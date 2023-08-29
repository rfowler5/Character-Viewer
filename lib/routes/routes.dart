import 'package:go_router/go_router.dart';

import '../models/character.dart';
import '../ui/viewer_screens/character_image_screen.dart';
import '../ui/viewer_screens/viewer_screen.dart';

GoRouter router() {
  return GoRouter(initialLocation: '/', routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const ViewerScreen(),
    ),
    GoRoute(
      path: '/image-screen',
      builder: (context, state) => CharacterImageScreen(
        character: state.extra as Character,
      ),
    ),
  ]);
}

import 'package:go_router/go_router.dart';

import '../models/character.dart';
import '../ui/screens/character_detail_screen.dart';
import '../ui/screens/viewer_screen.dart';

GoRouter router() {
  return GoRouter(initialLocation: '/', routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const ViewerScreen(),
    ),
    GoRoute(
      path: '/detail-screen',
      builder: (context, state) => CharacterDetailScreen(
        character: state.extra as Character,
      ),
    ),
  ]);
}

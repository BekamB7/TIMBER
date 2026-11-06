import 'package:go_router/go_router.dart';
import '../../shared/screens/placeholder_screen.dart';
import 'route_names.dart';
import '../../features/dashboard/presentation/dashboard_screen.dart';

abstract class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: RouteNames.dashboard,
    routes: [
      GoRoute(
        path: RouteNames.dashboard,
        builder: (context, state) => const DashboardScreen(),
      ),
      GoRoute(
        path: RouteNames.mediaFeed,
        builder: (context, state) {
          final category =
              state.uri.queryParameters[RouteNames.categoryParam] ?? 'all';
          return PlaceholderScreen(title: 'Media Feed · $category');
        },
      ),
      GoRoute(
        path: RouteNames.viewer,
        builder: (context, state) {
          final id = state.uri.queryParameters[RouteNames.fileIdParam] ?? '—';
          return PlaceholderScreen(title: 'Viewer · $id');
        },
      ),
      GoRoute(
        path: RouteNames.albums,
        builder: (context, state) => const PlaceholderScreen(title: 'Albums'),
      ),
      GoRoute(
        path: RouteNames.trash,
        builder: (context, state) => const PlaceholderScreen(title: 'Trash'),
      ),
    ],
  );
}

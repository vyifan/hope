import 'package:fluent_ui/fluent_ui.dart';
import 'package:go_router/go_router.dart';

import '../../screens/index.dart';
import '../main_page.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();
final router = GoRouter(navigatorKey: rootNavigatorKey, routes: [
  ShellRoute(
    navigatorKey: _shellNavigatorKey,
    builder: (context, state, child) {
      return MainPage(
        shellContext: _shellNavigatorKey.currentContext,
        child: child,
      );
    },
    routes: [
      /// Home
      GoRoute(path: '/', builder: (context, state) => const HomePage()),
      GoRoute(path: '/chat', builder: (context, state) => const Settings()),
      GoRoute(path: '/app', builder: (context, state) => AppPage()),
      GoRoute(
          path: '/compress', builder: (context, state) => const CompressPage()),
      GoRoute(path: '/settings', builder: (context, state) => const Settings()),
    ],
  ),
]);

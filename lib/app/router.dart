import 'package:flutter/material.dart';
import 'package:flutter_application_1/libs/features/users/users.dart';
import 'package:go_router/go_router.dart';
import '../libs/features/home/home-details.dart';
import '../libs/features/home/home.dart';
import '../libs/features/settings/settings.dart';
import '../libs/features/user/user.dart';
import 'main.dart';
import 'not-found.dart';

class Routes {
  static const root = '/';
  static const homeNamedPage = '/home';
  static const homeDetailsNamedPage = 'details';
  static const user = ':id';
  static const profileDetailsNamedPage = 'details';
  static const settingsNamedPage = '/settings';
  static const users = '/users';
  //static profileNamedPage([String? name]) => '/${name ?? ':profile'}';
  static Widget errorWidget(BuildContext context, GoRouterState state) =>
      const NotFoundScreen();
}

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter _router = GoRouter(
    initialLocation: Routes.homeNamedPage,
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    routes: [
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return MainScreen(screen: child);
        },
        routes: [
          GoRoute(
            path: Routes.homeNamedPage,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: HomeScreen(),
            ),
            routes: [
              GoRoute(
                path: Routes.homeDetailsNamedPage,
                builder: (context, state) => const HomeDetailsScreen(),
              ),
            ],
          ),
          GoRoute(
            path: Routes.users,
            pageBuilder: (context, state) => NoTransitionPage(
              child: UsersContainer()..onRoute(),
            ),
            routes: [
              GoRoute(
                path: Routes.user,
                pageBuilder: (context, state) => NoTransitionPage(
                  child: UserContainer(id: state.pathParameters['id']!)
                    ..onRoute(),
                ),
              ),
            ],
          ),
          GoRoute(
            path: Routes.settingsNamedPage,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: SettingScreen(),
            ),
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => const NotFoundScreen(),
  );

  static GoRouter get router => _router;
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_app/core/routes/named_router.dart';
import 'package:restaurant_app/src/dashboard/presentation/bookmark/bookmark_screen.dart';
import 'package:restaurant_app/src/dashboard/presentation/home/home_page.dart';
import 'package:restaurant_app/src/dashboard/presentation/dashboard_screen.dart';
import 'package:restaurant_app/src/dashboard/presentation/profile/profile_screen.dart';
import 'package:restaurant_app/resources/screens/not_found_screen.dart';
import 'package:restaurant_app/src/dashboard/presentation/onboard_screen.dart';
import 'package:restaurant_app/resources/screens/splash_screen.dart';

class AppRouter {
  static final _rootNavigator = GlobalKey<NavigatorState>(debugLabel: 'root');
  static final _shellNavigator = GlobalKey<NavigatorState>(debugLabel: 'shell');

  static final router = GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigator,
    initialLocation: NamedRouter.splashPage,
    routes: [
      GoRoute(
        path: NamedRouter.splashPage,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: NamedRouter.onboardPage,
        builder: (context, state) => const OnboardScreen(),
      ),
      ShellRoute(
        navigatorKey: _shellNavigator,
        builder: (context, state, child) =>
            DashboardScreen(key: state.pageKey, child: child),
        routes: [
          GoRoute(
            path: NamedRouter.rootPage,
            pageBuilder: (context, state) {
              return NoTransitionPage(
                child: HomePage(
                  key: state.pageKey,
                ),
              );
            },
          ),
          GoRoute(
            path: NamedRouter.bookmarkPage,
            pageBuilder: (context, state) {
              return NoTransitionPage(
                child: BookmarkScreen(
                  key: state.pageKey,
                ),
              );
            },
          ),
          GoRoute(
            path: NamedRouter.profilePage,
            pageBuilder: (context, state) {
              return NoTransitionPage(
                child: ProfileScreen(
                  key: state.pageKey,
                ),
              );
            },
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => const NotFoundScreen(),
  );
}

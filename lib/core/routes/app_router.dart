import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_app/core/routes/named_router.dart';
import 'package:restaurant_app/src/dashboard/presentation/bookmark/dashboard_bookmark.dart';
import 'package:restaurant_app/src/dashboard/presentation/home/home_page.dart';
import 'package:restaurant_app/src/dashboard/presentation/dashboard_screen.dart';
import 'package:restaurant_app/src/dashboard/presentation/profile/dashboard_profile.dart';
import 'package:restaurant_app/resources/screens/not_found_screen.dart';
import 'package:restaurant_app/src/dashboard/presentation/onboard_screen.dart';
import 'package:restaurant_app/resources/screens/splash_screen.dart';
import 'package:restaurant_app/src/restaurant/presentation/screens/all_restaurant_screen.dart';
import 'package:restaurant_app/src/restaurant/presentation/screens/detail_restaurant_screen.dart';

class AppRouter {
  // static final _rootNavigator = GlobalKey<NavigatorState>(debugLabel: 'root');
  static final _shellNavigator = GlobalKey<NavigatorState>(debugLabel: 'shell');

  static final router = GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: Get.key,
    initialLocation: NamedRouter.splashPage,
    routes: <RouteBase>[
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
        builder: (context, state, child) => DashboardScreen(child: child),
        routes: [
          GoRoute(
            path: NamedRouter.homePage,
            builder: (context, state) => const HomePage(),
            routes: [
              GoRoute(
                parentNavigatorKey: Get.key,
                path: NamedRouter.initAllRestaurantPage,
                builder: (context, state) {
                  // RestaurantState states = state.extra! as RestaurantState;
                  // return AllRestaurantScreen(state: states);
                  return AllRestaurantScreen();
                },
                routes: [
                  GoRoute(
                    parentNavigatorKey: Get.key,
                    path: NamedRouter.initDetailRestaurantPage,
                    name: 'detail-fromlist',
                    builder: (context, state) {
                      return DetailRestaurantScreen(
                        id: state.pathParameters['id'],
                      );
                    },
                  ),
                ],
              ),
              GoRoute(
                parentNavigatorKey: Get.key,
                path: NamedRouter.initDetailRestaurantPage,
                name: 'detail',
                builder: (context, state) {
                  return DetailRestaurantScreen(
                    id: state.pathParameters['id'],
                  );
                },
              ),
            ],
          ),
          GoRoute(
            parentNavigatorKey: _shellNavigator,
            path: NamedRouter.bookmarkPage,
            builder: (context, state) => const DashboardBookmark(),
            routes: [
              GoRoute(
                parentNavigatorKey: Get.key,
                path: NamedRouter.initDetailRestaurantPage,
                name: 'bookmark',
                builder: (context, state) {
                  return DetailRestaurantScreen(
                    id: state.pathParameters['id'],
                  );
                },
              ),
            ],
          ),
          GoRoute(
            path: NamedRouter.profilePage,
            builder: (context, state) => const DashboardProfile(),
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => const NotFoundScreen(),
  );
}

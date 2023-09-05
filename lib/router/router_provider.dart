import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:neofit_app/router/utils.dart';
import 'package:neofit_app/view/settings/username_account_settings_page.dart';

import '../view/view.dart';

final _key0 = GlobalKey<NavigatorState>();
final _key1 = GlobalKey<NavigatorState>();

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: _key0,
    initialLocation: Screens.feed.path,
    routes: [
      ShellRoute(
          navigatorKey: _key1,
          builder: (context, state, child) =>
              DashboardScreen(key: state.pageKey, child: child),
          routes: [
            GoRoute(
              path: Screens.feed.path,
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: FeedPage()),
            ),
            GoRoute(
              path: Screens.workout.path,
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: WorkoutPage()),
            ),
            GoRoute(
              path: Screens.profile.path,
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: ProfilePage()),
              routes: [],
            ),
          ]),
      GoRoute(
        path: Screens.settings.path,
        builder: (context, state) => const SettingsScreen(),
        routes: [
          GoRoute(
            path: Screens.profileSettings.nestedPath,
            builder: (context, state) => const ProfileSettingsPage(),
          ),
          GoRoute(
            path: Screens.accountSettings.nestedPath,
            builder: (context, state) => const AccountSettingsPage(),
            routes: [
              GoRoute(
                  path: Screens.accountSettingsUsername.nestedPath,
                  builder: (context, state) =>
                      const UsernameAccountSettingsPage())
            ],
          )
        ],
      ),
    ],
  );
});

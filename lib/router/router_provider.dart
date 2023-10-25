import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:neofit_app/router/utils.dart';
import 'package:neofit_app/view/router_transition_factory.dart';
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
        // pageBuilder: (context, state) =>
        //     RouterTransitionFactory.getTransitionPage(
        //         context: context,
        //         state: state,
        //         child: const SettingsScreen(),
        //         type: Transitions.fade),
        routes: [
          GoRoute(
            path: Screens.profileSettings.nestedPath,
            builder: (context, state) => const ProfileSettingsPage(),
            // pageBuilder: (context, state) =>
            //     RouterTransitionFactory.getTransitionPage(
            //         context: context,
            //         state: state,
            //         child: const ProfileSettingsPage(),
            //         type: Transitions.slide),
          ),
          GoRoute(
              path: Screens.importExportDataSettings.nestedPath,
              builder: (context, state) =>
                  const ImportExportDataSettingsPage()),
          GoRoute(
              path: Screens.languageSettings.nestedPath,
              builder: (context, state) => const LanguageSettingsPage()),
          GoRoute(
              path: Screens.notificationsSettings.nestedPath,
              builder: (context, state) => const NotificationsSettingsPage()),
          GoRoute(
              path: Screens.themeSettings.nestedPath,
              builder: (context, state) => const ThemeSettingsPage()),
          GoRoute(
              path: Screens.unitsSettings.nestedPath,
              builder: (context, state) => const UnitsSettingsPage()),
          GoRoute(
              path: Screens.workoutsSettings.nestedPath,
              builder: (context, state) => const WorkoutsSettingsPage()),
          GoRoute(
            path: Screens.accountSettings.nestedPath,
            builder: (context, state) => const AccountSettingsPage(),
            // pageBuilder: (context, state) =>
            //     RouterTransitionFactory.getTransitionPage(
            //         context: context,
            //         state: state,
            //         child: const AccountSettingsPage(),
            //         type: Transitions.slide),
            routes: [
              GoRoute(
                path: Screens.accountSettingsUsername.nestedPath,
                builder: (context, state) =>
                    const UsernameAccountSettingsPage(),
                // pageBuilder: (context, state) =>
                //     RouterTransitionFactory.getTransitionPage(
                //         context: context,
                //         state: state,
                //         child: const UsernameAccountSettingsPage(),
                //         type: Transitions.slide),
              ),
              GoRoute(
                  path: Screens.accountSettingsPassword.nestedPath,
                  builder: (context, state) =>
                      const PasswordAccountSettingsPage()),
              GoRoute(
                  path: Screens.accountSettingsEmail.nestedPath,
                  builder: (context, state) => const EmailAccountSettingsPage())
            ],
          )
        ],
      ),
    ],
  );
});

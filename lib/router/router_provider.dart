import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:neofit_app/router/router_notifier.dart';
import 'package:neofit_app/router/utils.dart';
import 'package:neofit_app/view/onboarding.dart';
// import 'package:neofit_app/view/router_transition_factory.dart';
import '../view/view.dart';

final rootNavKey = GlobalKey<NavigatorState>();
final _key1 = GlobalKey<NavigatorState>(); // TODO: rename

final goRouterProvider = Provider<GoRouter>((ref) {
  final meh = RouterNotifier(ref);

  return GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: rootNavKey,
    initialLocation: Screens.signIn.path,
    refreshListenable: meh,
    redirect: (context, state) => meh.routeRedirect(state),
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
            ),
          ]),
      GoRoute(
          path: Screens.signIn.path,
          builder: (context, state) => const SignInScreen()),
      GoRoute(
          path: Screens.signUp.path,
          builder: (context, state) => const SignUpScreen()),
      GoRoute(
          path: Screens.onboarding.path,
          builder: (context, state) => OnboardingScreen()),
      GoRoute(
          path: Screens.followersFollowingProfile.path,
          builder: (context, state) => const FollowersFollowingProfilePage()),
      GoRoute(
          path: Screens.historyProfile.path,
          builder: (context, state) => const HistoryProfilePage()),
      GoRoute(
          path: Screens.statistics.path,
          builder: (context, state) => const StatisticsScreen(),
          routes: [
            GoRoute(
                path: Screens.measuresStatistics.nestedPath,
                builder: (context, state) => const MeasuresStatisticsPage(),
                routes: [
                  GoRoute(
                      path: Screens.bodyFatMeasure.nestedPath,
                      builder: (context, state) => const BodyFatMeasurePage()),
                  GoRoute(
                      path: Screens.chestMeasure.nestedPath,
                      builder: (context, state) => const ChestMeasurePage()),
                  GoRoute(
                      path: Screens.heightMeasure.nestedPath,
                      builder: (context, state) => const HeightMeasurePage()),
                  GoRoute(
                      path: Screens.neckMeasure.nestedPath,
                      builder: (context, state) => const NeckMeasurePage()),
                  GoRoute(
                      path: Screens.shoulderMeasure.nestedPath,
                      builder: (context, state) => const ShoulderMeasurePage()),
                  GoRoute(
                      path: Screens.waistMeasure.nestedPath,
                      builder: (context, state) => const WaistMeasurePage()),
                  GoRoute(
                      path: Screens.weightMeasure.nestedPath,
                      builder: (context, state) => const WeightMeasurePage()),
                ]),
            GoRoute(
                path: Screens.muscleDistributionStatistics.nestedPath,
                builder: (context, state) =>
                    const MuscleDistributionStatisticsPage())
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

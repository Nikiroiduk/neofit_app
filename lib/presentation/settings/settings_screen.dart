import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:neofit_app/domain/auth/auth_controller.dart';
import 'package:neofit_app/router/utils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../dashboard_screen/dashboard.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close_rounded),
          onPressed: () => context.go(Screens.profile.path),
        ),
        title: const Text('Settings'),
        actions: [
          Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              var isBtnActive =
                  ref.watch(authControllerProvider) is! AuthStateLoading;
              return IconButton(
                onPressed: isBtnActive
                    ? () => ref.read(authControllerProvider.notifier).logout()
                    : null,
                icon: const Icon(Icons.logout_rounded),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              onTap: () => context.push(Screens.profileSettings.path),
              title: const Text('Profile'),
            ),
            ListTile(
              onTap: () => context.push(Screens.accountSettings.path),
              title: const Text('Account'),
            ),
            ListTile(
              onTap: () => context.push(Screens.notificationsSettings.path),
              title: const Text('Notifications'),
            ),
            ListTile(
              onTap: () => context.push(Screens.languageSettings.path),
              title: Text(AppLocalizations.of(context).settingsLanguage),
            ),
            ListTile(
              onTap: () => context.push(Screens.unitsSettings.path),
              title: const Text('Units'),
            ),
            ListTile(
              onTap: () => context.push(Screens.themeSettings.path),
              title: const Text('Theme'),
            ),
            ListTile(
              onTap: () => context.push(Screens.importExportDataSettings.path),
              title: const Text('Import & Export data'),
            ),
            ListTile(
              onTap: () => context.push(Screens.workoutsSettings.path),
              title: const Text('Workouts'),
            ),
          ],
        ),
      ),
    );
  }
}

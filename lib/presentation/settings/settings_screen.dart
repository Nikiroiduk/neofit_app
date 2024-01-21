import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:neofit_app/domain/auth/auth_controller.dart';
import 'package:neofit_app/router/utils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
        title: Text(AppLocalizations.of(context).settings),
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
      body: ListView(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Text(
              AppLocalizations.of(context).account,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: Theme.of(context).colorScheme.primary),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person_outline_rounded),
            title: Text(AppLocalizations.of(context).profile),
            subtitle: Text(AppLocalizations.of(context).profileDescription),
            onTap: () => context.push(Screens.profileSettings.path),
          ),
          const Divider(
            height: 1,
          ),
          ListTile(
            leading: const Icon(Icons.lock_outline_rounded),
            title: Text(AppLocalizations.of(context).account),
            subtitle: Text(AppLocalizations.of(context).accountDescription),
            onTap: () => context.push(Screens.accountSettings.path),
          ),
          const Divider(
            height: 1,
          ),
          ListTile(
            leading: const Icon(Icons.notifications_none_rounded),
            title: Text(AppLocalizations.of(context).notifications),
            subtitle:
                Text(AppLocalizations.of(context).notificationsDescription),
            onTap: () => context.push(Screens.notificationsSettings.path),
          ),
          const Divider(
            height: 1,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: Text(
              AppLocalizations.of(context).preferences,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: Theme.of(context).colorScheme.primary),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.language_rounded),
            title: Text(AppLocalizations.of(context).language),
            subtitle: Text(AppLocalizations.of(context).languageDescription),
            onTap: () => context.push(Screens.languageSettings.path),
          ),
          const Divider(
            height: 1,
          ),
          ListTile(
            leading: const Icon(Icons.height_rounded),
            title: Text(AppLocalizations.of(context).units),
            subtitle: Text(AppLocalizations.of(context).unitsDescription),
            onTap: () => context.push(Screens.unitsSettings.path),
          ),
          const Divider(
            height: 1,
          ),
          ListTile(
            leading: const Icon(Icons.brush_rounded),
            title: Text(AppLocalizations.of(context).personalization),
            subtitle: Text(AppLocalizations.of(context).themeDescription),
            onTap: () => context.push(Screens.themeSettings.path),
          ),
          const Divider(
            height: 1,
          ),
          ListTile(
            leading: const Icon(Icons.open_in_new_rounded),
            title: Text(AppLocalizations.of(context).importExportData),
            subtitle:
                Text(AppLocalizations.of(context).importExportDataDescription),
            onTap: () => context.push(Screens.importExportDataSettings.path),
          ),
          const Divider(
            height: 1,
          ),
          ListTile(
            leading: const Icon(Icons.fitness_center_rounded),
            title: Text(AppLocalizations.of(context).workouts),
            subtitle: Text(AppLocalizations.of(context).workoutsDescription),
            onTap: () => context.push(Screens.workoutsSettings.path),
          ),
          const Divider(
            height: 1,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:neofit_app/view/themes/themes.dart';

class ThemeSettingsPage extends StatelessWidget {
  const ThemeSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Theme'),
        ),
        body: Center(
          child: Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              return Column(
                children: [
                  TextButton(
                      onPressed: () => ref
                          .read(themeMode.notifier)
                          .setTheme(ThemeMode.light),
                      child: const Text('Light theme')),
                  TextButton(
                      onPressed: () =>
                          ref.read(themeMode.notifier).setTheme(ThemeMode.dark),
                      child: const Text('Dark theme')),
                  TextButton(
                      onPressed: () => ref
                          .read(themeMode.notifier)
                          .setTheme(ThemeMode.system),
                      child: const Text('System theme')),
                  const SizedBox(
                    height: 50,
                  ),
                  TextButton(
                      onPressed: () =>
                          ref.read(selectedColorNotifier.notifier).red(),
                      child: const Text('Venetian Red')),
                  TextButton(
                      onPressed: () =>
                          ref.read(selectedColorNotifier.notifier).purple(),
                      child: const Text('Royal Purple')),
                  TextButton(
                      onPressed: () =>
                          ref.read(selectedColorNotifier.notifier).system(),
                      child: const Text('System scheme')),
                ],
              );
            },
          ),
        ));
  }
}

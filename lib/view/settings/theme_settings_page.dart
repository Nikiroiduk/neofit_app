import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
                      onPressed: () => ref.read(themeMode.notifier).toggle(),
                      child: const Text('Theme toggle')),
                ],
              );
            },
          ),
        ));
  }
}

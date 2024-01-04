import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:neofit_app/l10n/locale/locale_provider.dart';

class LanguageSettingsPage extends StatelessWidget {
  const LanguageSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).settingsLanguage),
      ),
      body: Center(
        child: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            return Column(
              children: [
                TextButton(
                    onPressed: () => ref
                        .read(localeNotifier.notifier)
                        .auto(ref.watch(platformLocaleProvider)),
                    child: const Text('Auto')),
                TextButton(
                    onPressed: () =>
                        ref.read(localeNotifier.notifier).english(),
                    child: const Text('English')),
                TextButton(
                    onPressed: () =>
                        ref.read(localeNotifier.notifier).russian(),
                    child: const Text('Русский')),
              ],
            );
          },
        ),
      ),
    );
  }
}

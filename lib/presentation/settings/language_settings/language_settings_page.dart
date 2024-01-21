import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:neofit_app/l10n/locale/locale_provider.dart';
import 'package:neofit_app/presentation/settings/language_settings/flags.dart';

extension LocalesX on Locales {
  String get img {
    switch (this) {
      case Locales.english:
        return Flags.english;
      case Locales.russian:
        return Flags.russian;
    }
  }
}

class LanguageSettingsPage extends StatelessWidget {
  const LanguageSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).language),
        ),
        body: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            onChanged(Locales value) {
              ref.read(localeNotifier.notifier).setLanguage(value);
            }

            return ListView.builder(
                itemCount: Locales.values.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(6.0)),
                          border: Border.all(
                              strokeAlign: BorderSide.strokeAlignOutside,
                              color: Theme.of(context)
                                  .colorScheme
                                  .outlineVariant)),
                      child: SvgPicture.string(
                        Locales.values[index].img,
                        width: 32,
                        height: 24,
                      ),
                    ),
                    title: Text(Locales.values[index]
                        .languageName(AppLocalizations.of(context))),
                    trailing: Radio<Locales>(
                      value: Locales.values[index],
                      groupValue: Locales.values.firstWhere((element) =>
                          element.locale == ref.read(localeProvider)),
                      onChanged: (_) => onChanged(Locales.values[index]),
                    ),
                    onTap: () => onChanged(Locales.values[index]),
                  );
                });
          },
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:neofit_app/presentation/themes/royal_purple.dart';
import 'package:neofit_app/presentation/themes/themes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ThemeSettingsPage extends StatelessWidget {
  const ThemeSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).personalization),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 4.0),
                  child: Text(
                    AppLocalizations.of(context).theme,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).colorScheme.primary),
                  ),
                ),
                Row(children: [
                  Expanded(
                      flex: 11,
                      child: Stack(alignment: Alignment.bottomRight, children: [
                        FilledButton(
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  ref
                                      .watch(selectedColorNotifier)
                                      .colorScheme
                                      .onSurface),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  ref
                                      .watch(selectedColorNotifier)
                                      .colorScheme
                                      .surface),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .outlineVariant)),
                              ),
                            ),
                            onPressed: () {
                              ref
                                  .read(themeMode.notifier)
                                  .setTheme(ThemeMode.light);
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 40.0),
                              child: Center(
                                child: Text(
                                  AppLocalizations.of(context).light,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(
                                          color: ref
                                              .watch(selectedColorNotifier)
                                              .colorScheme
                                              .onSurface),
                                ),
                              ),
                            )),
                        if (ref.watch(themeMode) == ThemeMode.light) ...[
                          const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(Icons.check_circle_rounded))
                        ]
                      ])),
                  const Spacer(
                    flex: 1,
                  ),
                  Expanded(
                      flex: 11,
                      child: Stack(alignment: Alignment.bottomRight, children: [
                        FilledButton(
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  ref
                                      .watch(selectedColorNotifier)
                                      .colorSchemeDark
                                      .onSurface),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  ref
                                      .watch(selectedColorNotifier)
                                      .colorSchemeDark
                                      .surface),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .outlineVariant)),
                              ),
                            ),
                            onPressed: () {
                              ref
                                  .read(themeMode.notifier)
                                  .setTheme(ThemeMode.dark);
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 40.0),
                              child: Center(
                                child: Text(
                                  AppLocalizations.of(context).dark,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(
                                          color: ref
                                              .watch(selectedColorNotifier)
                                              .colorSchemeDark
                                              .onSurface),
                                ),
                              ),
                            )),
                        if (ref.watch(themeMode) == ThemeMode.dark) ...[
                          const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(Icons.check_circle_rounded))
                        ]
                      ])),
                  const Spacer(
                    flex: 1,
                  ),
                  Expanded(
                      flex: 11,
                      child: Stack(alignment: Alignment.bottomRight, children: [
                        FilledButton(
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  MediaQuery.of(context).platformBrightness ==
                                          Brightness.light
                                      ? ref
                                          .watch(selectedColorNotifier)
                                          .colorScheme
                                          .onSurface
                                      : ref
                                          .watch(selectedColorNotifier)
                                          .colorSchemeDark
                                          .onSurface),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  MediaQuery.of(context).platformBrightness ==
                                          Brightness.light
                                      ? ref
                                          .watch(selectedColorNotifier)
                                          .colorScheme
                                          .surface
                                      : ref
                                          .watch(selectedColorNotifier)
                                          .colorSchemeDark
                                          .surface),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .outlineVariant)),
                              ),
                            ),
                            onPressed: () {
                              ref
                                  .read(themeMode.notifier)
                                  .setTheme(ThemeMode.system);
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 40.0),
                              child: Center(
                                child: Text(
                                  AppLocalizations.of(context).system,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(
                                          color: MediaQuery.of(context)
                                                      .platformBrightness ==
                                                  Brightness.light
                                              ? ref
                                                  .watch(selectedColorNotifier)
                                                  .colorScheme
                                                  .onSurface
                                              : ref
                                                  .watch(selectedColorNotifier)
                                                  .colorSchemeDark
                                                  .onSurface),
                                ),
                              ),
                            )),
                        if (ref.watch(themeMode) == ThemeMode.system) ...[
                          const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(Icons.check_circle_rounded))
                        ]
                      ])),
                ]),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 4.0),
                  child: Text(
                    AppLocalizations.of(context).colorScheme,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).colorScheme.primary),
                  ),
                ),
                if (ColorSchemeEnum.system.colorScheme !=
                        RoyalPurple.lightColorScheme ||
                    ColorSchemeEnum.system.colorSchemeDark !=
                        RoyalPurple.darkColorScheme) ...[
                  colorCard(
                      scheme: ColorSchemeEnum.system,
                      schemeName: 'System',
                      ref: ref,
                      borderColor: Theme.of(context).colorScheme.outlineVariant,
                      nameStyle: Theme.of(context).textTheme.titleMedium),
                ],
                colorCard(
                    scheme: ColorSchemeEnum.royalPurple,
                    schemeName: 'Royal Purple',
                    ref: ref,
                    borderColor: Theme.of(context).colorScheme.outlineVariant,
                    nameStyle: Theme.of(context).textTheme.titleMedium),
                colorCard(
                    scheme: ColorSchemeEnum.venetianRed,
                    schemeName: 'Venetian Red',
                    ref: ref,
                    borderColor: Theme.of(context).colorScheme.outlineVariant,
                    nameStyle: Theme.of(context).textTheme.titleMedium),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget colorCard(
      {required ColorSchemeEnum scheme,
      required String schemeName,
      required WidgetRef ref,
      double height = 100,
      Color borderColor = Colors.grey,
      TextStyle? nameStyle =
          const TextStyle(color: Colors.black, fontSize: 16.0)}) {
    var currentScheme = ref.watch(themeMode) == ThemeMode.light
        ? scheme.colorScheme
        : scheme.colorSchemeDark;
    return GestureDetector(
      onTap: () => ref.read(selectedColorNotifier.notifier).setTheme(scheme),
      child: Stack(alignment: Alignment.bottomRight, children: [
        Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: borderColor)),
            clipBehavior: Clip.hardEdge,
            child: Row(
              children: [
                Expanded(
                    flex: 5,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(left: 15),
                      height: height,
                      color: currentScheme.primary,
                      child: Text(
                        schemeName,
                        style:
                            nameStyle?.copyWith(color: currentScheme.onPrimary),
                      ),
                    )),
                Expanded(
                    flex: 1,
                    child: Container(
                      height: height,
                      color: currentScheme.onPrimaryContainer,
                    )),
                Expanded(
                    flex: 1,
                    child: Container(
                      height: height,
                      color: currentScheme.primaryContainer,
                    )),
                Expanded(
                    flex: 2,
                    child: Container(
                      height: height,
                      color: currentScheme.surface,
                    )),
              ],
            )),
        if (ref.watch(selectedColorNotifier) == scheme) ...[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.check_circle_rounded,
              color: currentScheme.onSurface,
            ),
          )
        ]
      ]),
    );
  }
}

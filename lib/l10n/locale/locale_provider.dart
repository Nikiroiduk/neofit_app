import 'dart:ui';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:neofit_app/l10n/platform_locale/platform_locale_interface.dart';
import 'package:neofit_app/preferences/preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final platformLocaleProvider =
    StateProvider<Locale>((ref) => PlatformLocale().getPlatformLocale());

final supportedLocalesProvider = Provider<List<Locale>>((ref) {
  return [
    Locales.english.locale,
    Locales.russian.locale,
  ];
});

enum Locales { english, russian }

extension LocalesX on Locales {
  Locale get locale {
    switch (this) {
      case Locales.english:
        return const Locale('en', '');
      case Locales.russian:
        return const Locale('ru', '');
    }
  }

  String languageName(AppLocalizations loc) {
    switch (this) {
      case Locales.english:
        return loc.english;
      case Locales.russian:
        return loc.russian;
    }
  }
}

final localeProvider = Provider<Locale>((ref) => ref.watch(localeNotifier));

final localeNotifier = StateNotifierProvider<LocaleNotifier, Locale>(
    (ref) => LocaleNotifier(preferences: ref.watch(preferencesProvider)));

class LocaleNotifier extends StateNotifier<Locale> {
  final Preferences preferences;

  LocaleNotifier({required this.preferences}) : super(preferences.locale);

  // void system(Locale locale) {
  //   state = locale;
  //   preferences.persistLocale(state);
  // }

  void setLanguage(Locales? locale) {
    switch (locale) {
      case Locales.english:
        state = Locales.english.locale;
        preferences.persistLocale(state);
      case Locales.russian:
        state = Locales.russian.locale;
        preferences.persistLocale(state);
      default:
        state = Locales.english.locale;
        preferences.persistLocale(state);
    }
  }
}

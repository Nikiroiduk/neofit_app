import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:neofit_app/l10n/platform_locale/platform_locale_interface.dart';
import 'package:neofit_app/preferences/preferences.dart';

final platformLocaleProvider =
    StateProvider<Locale>((ref) => PlatformLocale().getPlatformLocale());

final supportedLocalesProvider = Provider<List<Locale>>((ref) {
  return const [
    Locale('en', ''),
    Locale('ru', ''),
  ];
});

final localeProvider = Provider<Locale>((ref) => ref.watch(localeNotifier));

final localeNotifier = StateNotifierProvider<LocaleNotifier, Locale>(
    (ref) => LocaleNotifier(preferences: ref.watch(preferencesProvider)));

class LocaleNotifier extends StateNotifier<Locale> {
  final Preferences preferences;

  LocaleNotifier({required this.preferences}) : super(preferences.locale);

  void auto(Locale locale) {
    state = locale;
    preferences.persistLocale(state);
  }

  void russian() {
    state = const Locale('ru', '');
    debugPrint(state.toString());
    preferences.persistLocale(state);
  }

  void english() {
    state = const Locale('en', '');
    preferences.persistLocale(state);
  }
}

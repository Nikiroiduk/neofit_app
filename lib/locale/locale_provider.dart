import 'dart:ui';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:neofit_app/platform_locale/platform_locale_interface.dart';
import 'package:neofit_app/preferences.dart';

final platformLocaleProvider =
    Provider<Locale>((ref) => PlatformLocale().getPlatformLocale());

final supportedLocalesProvider = Provider<List<Locale>>((ref) {
  return const [
    Locale('en', ''),
    Locale('ru', ''),
  ];
});

final localeProvider = Provider<Locale>((ref) => ref.watch(localeNotifier));

final localeNotifier = StateNotifierProvider<LocaleNotifier, Locale>(
    (ref) => LocaleNotifier(preferences: ref.watch(preferences)));

class LocaleNotifier extends StateNotifier<Locale> {
  final Preferences preferences;

  LocaleNotifier({required this.preferences}) : super(preferences.locale);

  void russian() {
    state = const Locale('ru', '');
    preferences.persistLocale(state);
  }

  void english() {
    state = const Locale('en', '');
    preferences.persistLocale(state);
  }
}

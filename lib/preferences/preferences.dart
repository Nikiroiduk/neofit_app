import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:neofit_app/globals/global_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../presentation/themes/themes.dart';

final preferences = Provider(
    (ref) => Preferences(sharedPreferences: ref.watch(sharedPreferences)));

class Preferences {
  final SharedPreferences sharedPreferences;

  Preferences({required this.sharedPreferences});

  persistThemeMode(ThemeMode mode) =>
      sharedPreferences.setString('themeMode', mode.toString());

  persistColorScheme(ColorSchemeEnum colorScheme) =>
      sharedPreferences.setString('colorScheme', colorScheme.toString());

  persistLocale(Locale locale) =>
      sharedPreferences.setString('locale', locale.languageCode);

  ThemeMode get themeMode => ThemeMode.values.firstWhere(
        (element) =>
            element.toString() == sharedPreferences.getString('themeMode'),
        orElse: () => ThemeMode.system,
      );

  ColorSchemeEnum get colorScheme => ColorSchemeEnum.values.firstWhere(
      (element) =>
          element.toString() == sharedPreferences.getString('colorScheme'),
      orElse: () => ColorSchemeEnum.royalPurple);

  Locale get locale =>
      Locale(sharedPreferences.getString('locale') ?? 'en', '');
}

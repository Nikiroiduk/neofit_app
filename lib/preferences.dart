import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:neofit_app/global_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

final preferences = Provider(
    (ref) => Preferences(sharedPreferences: ref.watch(sharedPreferences)));

class Preferences {
  final SharedPreferences sharedPreferences;

  Preferences({required this.sharedPreferences});

  persistThemeMode(ThemeMode mode) =>
      sharedPreferences.setString('themeMode', mode.toString());

  ThemeMode get themeMode => ThemeMode.values.firstWhere(
        (element) =>
            element.toString() == sharedPreferences.getString('themeMode'),
        orElse: () => ThemeMode.system,
      );
}

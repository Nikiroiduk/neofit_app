import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:neofit_app/preferences.dart';
import 'package:neofit_app/view/themes/royal_purple.dart';
import 'package:neofit_app/view/themes/venetian_red.dart';

final theme = Provider((ref) => Brightness.light);
final darkTheme = Provider((ref) => Brightness.dark);
final themeMode = StateNotifierProvider<ThemeModeNotifier, ThemeMode>(
  (ref) => ThemeModeNotifier(preferences: ref.watch(preferences)),
);

enum ColorSchemeEnum {
  royalPurple,
  venetianRed,
}

extension ColorSchemeEnumX on ColorSchemeEnum {
  ColorScheme get colorScheme {
    switch (this) {
      case ColorSchemeEnum.royalPurple:
        return RoyalPurple.lightColorScheme;
      case ColorSchemeEnum.venetianRed:
        return VenetianRed.lightColorScheme;
    }
  }

  ColorScheme get colorSchemeDark {
    switch (this) {
      case ColorSchemeEnum.royalPurple:
        return RoyalPurple.darkColorScheme;
      case ColorSchemeEnum.venetianRed:
        return VenetianRed.darkColorScheme;
    }
  }
}

class ThemeModeNotifier extends StateNotifier<ThemeMode> {
  final Preferences preferences;

  ThemeModeNotifier({required this.preferences}) : super(preferences.themeMode);
  void setTheme(ThemeMode mode) {
    if (state == mode) return;
    state = mode;
    preferences.persistThemeMode(mode);
  }
}

// TODO: save colorScheme
final selectedColorScheme =
    StateProvider<ColorSchemeEnum>((ref) => ColorSchemeEnum.royalPurple);
final selectedColorNotifier =
    StateNotifierProvider<SelectedColorNotifier, ColorSchemeEnum>(
        (ref) => SelectedColorNotifier(preferences: ref.watch(preferences)));

class SelectedColorNotifier extends StateNotifier<ColorSchemeEnum> {
  final Preferences preferences;

  SelectedColorNotifier({required this.preferences})
      : super(preferences.colorScheme);
  void red() {
    state = ColorSchemeEnum.venetianRed;
    preferences.persistColorScheme(ColorSchemeEnum.venetianRed);
  }

  void purple() {
    state = ColorSchemeEnum.royalPurple;
    preferences.persistColorScheme(ColorSchemeEnum.royalPurple);
  }
}

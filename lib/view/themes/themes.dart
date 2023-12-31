import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:neofit_app/preferences.dart';
import 'package:neofit_app/view/themes/royal_purple.dart';
import 'package:neofit_app/view/themes/venetian_red.dart';

final themeMode = StateNotifierProvider<ThemeModeNotifier, ThemeMode>(
  (ref) => ThemeModeNotifier(preferences: ref.watch(preferences)),
);

enum ColorSchemeEnum { royalPurple, venetianRed, system }

extension ColorSchemeEnumX on ColorSchemeEnum {
  ColorScheme get colorScheme {
    switch (this) {
      case ColorSchemeEnum.royalPurple:
        return RoyalPurple.lightColorScheme;
      case ColorSchemeEnum.venetianRed:
        return VenetianRed.lightColorScheme;
      default:
        return RoyalPurple.lightColorScheme;
    }
  }

  ColorScheme get colorSchemeDark {
    switch (this) {
      case ColorSchemeEnum.royalPurple:
        return RoyalPurple.darkColorScheme;
      case ColorSchemeEnum.venetianRed:
        return VenetianRed.darkColorScheme;
      default:
        return RoyalPurple.darkColorScheme;
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

  void system() {
    state = ColorSchemeEnum.system;
    preferences.persistColorScheme(ColorSchemeEnum.system);
  }
}

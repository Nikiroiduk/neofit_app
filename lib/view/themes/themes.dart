import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:neofit_app/preferences.dart';
import 'package:neofit_app/view/themes/purple.dart';
import 'package:neofit_app/view/themes/red.dart';

final theme = Provider((ref) => _theme);
final darkTheme = Provider((ref) => _darkTheme);
final test = Provider((ref) => _colorScheme);
final themeMode = StateNotifierProvider<ThemeModeNotifier, ThemeMode>(
  (ref) => ThemeModeNotifier(preferences: ref.watch(preferences)),
);

final _theme = ThemeData(
  useMaterial3: true,
  colorScheme: _colorScheme.colorScheme,
);

final _darkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: _colorScheme.colorSchemeDark,
);

enum Theme {
  purple,
  red,
}

extension ThemeX on Theme {
  ColorScheme get colorScheme {
    switch (this) {
      case Theme.purple:
        return PurpleTheme.lightColorScheme;
      case Theme.red:
        return RedTheme.lightColorScheme;
    }
  }

  ColorScheme get colorSchemeDark {
    switch (this) {
      case Theme.purple:
        return PurpleTheme.darkColorScheme;
      case Theme.red:
        return RedTheme.darkColorScheme;
    }
  }
}

final _colorScheme = Theme.purple;
// final _customTheme = CustomThemeData(
//   imageSize: 150,
// );

// final _customDarkTheme = CustomThemeData();

// // EXTENSIONS AND CLASSES
// extension CustomTheme on ThemeData {
//   AssetImage imageForName(String name) {
//     final path = brightness == Brightness.dark ? 'assets/dark' : 'assets/';
//     return AssetImage('$path/$name');
//   }

//   CustomThemeData get custom =>
//       brightness == Brightness.dark ? _customDarkTheme : _customTheme;
// }

// class CustomThemeData {
//   final double imageSize;

//   CustomThemeData({
//     this.imageSize = 100,
//   });
// }

class ThemeModeNotifier extends StateNotifier<ThemeMode> {
  final Preferences preferences;

  ThemeModeNotifier({required this.preferences}) : super(preferences.themeMode);

  void toggle() {
    if (state == ThemeMode.dark) {
      preferences.persistThemeMode(ThemeMode.light);
      state = ThemeMode.light;
    } else {
      preferences.persistThemeMode(ThemeMode.dark);
      state = ThemeMode.dark;
    }
  }
}

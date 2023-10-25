enum Screens {
  feed,
  workout,
  profile,
  settings,
  profileSettings,
  importExportDataSettings,
  languageSettings,
  notificationsSettings,
  themeSettings,
  unitsSettings,
  workoutsSettings,
  accountSettings,
  accountSettingsUsername,
  accountSettingsPassword,
  accountSettingsEmail,
}

extension ScreensX on Screens {
  String get path {
    switch (this) {
      case Screens.feed:
        return '/feed';
      case Screens.workout:
        return '/workout';
      case Screens.profile:
        return '/profile';
      case Screens.settings:
        return '/settings';
      case Screens.profileSettings:
        return '/settings/profile';
      case Screens.importExportDataSettings:
        return '/settings/importExportDataSettings';
      case Screens.languageSettings:
        return '/settings/languageSettings';
      case Screens.notificationsSettings:
        return '/settings/notificationsSettings';
      case Screens.themeSettings:
        return '/settings/themeSettings';
      case Screens.unitsSettings:
        return '/settings/unitsSettings';
      case Screens.workoutsSettings:
        return '/settings/workoutSettings';
      case Screens.accountSettings:
        return '/settings/account';
      case Screens.accountSettingsUsername:
        return '/settings/account/username';
      case Screens.accountSettingsPassword:
        return '/settings/account/password';
      case Screens.accountSettingsEmail:
        return '/settings/account/email';
      default:
        return '/';
    }
  }

  String get nestedPath {
    switch (this) {
      case Screens.profileSettings:
        return 'profile';
      case Screens.importExportDataSettings:
        return 'importExportDataSettings';
      case Screens.languageSettings:
        return 'languageSettings';
      case Screens.notificationsSettings:
        return 'notificationsSettings';
      case Screens.themeSettings:
        return 'themeSettings';
      case Screens.unitsSettings:
        return 'unitsSettings';
      case Screens.workoutsSettings:
        return 'workoutSettings';
      case Screens.accountSettings:
        return 'account';
      case Screens.accountSettingsUsername:
        return 'username';
      case Screens.accountSettingsPassword:
        return 'password';
      case Screens.accountSettingsEmail:
        return 'email';
      default:
        return '';
    }
  }
}

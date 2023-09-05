enum Screens {
  feed,
  workout,
  profile,
  settings,
  profileSettings,
  accountSettings,
  accountSettingsUsername,
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
      case Screens.accountSettings:
        return '/settings/account';
      case Screens.accountSettingsUsername:
        return '/settings/account/username';
      default:
        return '/';
    }
  }

  String get nestedPath {
    switch (this) {
      case Screens.profileSettings:
        return 'profile';
      case Screens.accountSettings:
        return 'account';
      case Screens.accountSettingsUsername:
        return 'username';
      default:
        return '';
    }
  }
}

enum Screens {
  feed,
  workout,
  profile,
  signIn,
  signUp,
  onboarding,
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
  statistics,
  measuresStatistics,
  bodyFatMeasure,
  chestMeasure,
  heightMeasure,
  neckMeasure,
  shoulderMeasure,
  waistMeasure,
  weightMeasure,
  muscleDistributionStatistics,
  followersFollowingProfile,
  historyProfile
}

extension ScreensX on Screens {
  String get path {
    switch (this) {
      case Screens.signIn:
        return '/signin';
      case Screens.signUp:
        return '/signup';
      case Screens.onboarding:
        return '/onboarding';
      case Screens.feed:
        return '/feed';
      case Screens.workout:
        return '/workout';
      case Screens.profile:
        return '/profile';
      case Screens.statistics:
        return '/statistics';
      case Screens.measuresStatistics:
        return '/statistics/measures';
      case Screens.bodyFatMeasure:
        return '/statistics/measures/bodyFat';
      case Screens.chestMeasure:
        return '/statistics/measures/chest';
      case Screens.heightMeasure:
        return '/statistics/measures/height';
      case Screens.neckMeasure:
        return '/statistics/measures/neck';
      case Screens.shoulderMeasure:
        return '/statistics/measures/shoulder';
      case Screens.waistMeasure:
        return '/statistics/measures/waist';
      case Screens.weightMeasure:
        return '/statistics/measures/weight';
      case Screens.muscleDistributionStatistics:
        return '/statistics/muscleDistribution';
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
      case Screens.followersFollowingProfile:
        return '/followersFollowing';
      case Screens.historyProfile:
        return '/history';
      default:
        return '/';
    }
  }

  String get nestedPath {
    switch (this) {
      case Screens.measuresStatistics:
        return 'measures';
      case Screens.bodyFatMeasure:
        return 'bodyFat';
      case Screens.chestMeasure:
        return 'chest';
      case Screens.heightMeasure:
        return 'height';
      case Screens.neckMeasure:
        return 'neck';
      case Screens.shoulderMeasure:
        return 'shoulder';
      case Screens.waistMeasure:
        return 'waist';
      case Screens.weightMeasure:
        return 'weight';
      case Screens.muscleDistributionStatistics:
        return 'muscleDistribution';
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

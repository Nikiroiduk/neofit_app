import 'dart:ui';

import 'platform_locale_interface.dart';

class PlatformLocaleWeb implements PlatformLocale {
  @override
  Locale getPlatformLocale() {
    // Web locale is fucked up
    // TODO: Web locale

    // String platformLocaleName = Platform.localeName;
    // debugPrint("Platform Locale Name (Web): $platformLocaleName");

    // if (platformLocaleName.length == 2) {
    //   return Locale.fromSubtags(languageCode: platformLocaleName);
    // }

    // String languageCode =
    //     platformLocaleName.substring(0, platformLocaleName.indexOf('_'));
    // String countryCode =
    //     platformLocaleName.substring(platformLocaleName.indexOf('_') + 1);

    // return Locale.fromSubtags(
    //   languageCode: languageCode,
    //   countryCode: countryCode,
    // );
    return const Locale('en', '');
  }
}

PlatformLocale getImplementation() => PlatformLocaleWeb();

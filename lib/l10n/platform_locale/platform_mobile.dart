import 'dart:io';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'platform_locale_interface.dart';

class PlatformLocaleMobile implements PlatformLocale {
  @override
  Locale getPlatformLocale() {
    String platformLocaleName = Platform.localeName;
    debugPrint("Platform Locale Name (Mobile): $platformLocaleName");

    if (platformLocaleName.length == 2) {
      return Locale.fromSubtags(languageCode: platformLocaleName);
    }

    String languageCode =
        platformLocaleName.substring(0, platformLocaleName.indexOf('_'));
    String countryCode =
        platformLocaleName.substring(platformLocaleName.indexOf('_') + 1);

    return Locale.fromSubtags(
      languageCode: languageCode,
      countryCode: countryCode,
    );
  }
}

PlatformLocale getImplementation() => PlatformLocaleMobile();

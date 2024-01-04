import 'dart:ui';

import 'platform_locale_stud.dart'
    if (dart.library.io) 'platform_mobile.dart'
    if (dart.library.html) 'platform_web.dart';

abstract class PlatformLocale {
  Locale getPlatformLocale();

  factory PlatformLocale() => getImplementation();
}

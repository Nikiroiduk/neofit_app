import 'package:neofit_app/platform_locale/platform_locale_interface.dart';

PlatformLocale getImplementation() => throw UnsupportedError(
    'Cannot get Platform Locale without dart:html or package:shared_preferences');

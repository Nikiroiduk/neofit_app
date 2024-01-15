import 'dart:ui';

import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:neofit_app/domain/connectivity_status_provider.dart';
import 'package:neofit_app/globals/global_provider.dart';
import 'package:neofit_app/l10n/locale/locale_provider.dart';
import 'package:neofit_app/presentation/themes/themes.dart';
import 'router/router.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// TODO: fix onboarding images (adapt colors)

// TODO: Web locale isn't working (getPlatformLocale)
// TODO: animate skip/prev and next/done btns on onboarding page
// TODO: check internet connection on sign_in/up screen
// TODO: save authorized user token with shared preferences
// TODO: add remote(API) and local(Hive) data source providers
// TODO: exceptions during user registration (ex: if username already exist)
// TODO: handle login with incorrect data

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initGlobalProviders();
  runApp(const ProviderScope(
    child: MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
        return Consumer(builder: (widget, ref, child) {
          ref.read(connectivityStatusProvider);
          return MaterialApp.router(
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: ref.watch(supportedLocalesProvider),
            locale: ref.watch(localeProvider),
            routerConfig: ref.watch(goRouterProvider),
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              useMaterial3: true,
              colorScheme:
                  ref.watch(selectedColorNotifier) == ColorSchemeEnum.system
                      ? lightDynamic
                      : ref.watch(selectedColorNotifier).colorScheme,
              brightness: Brightness.light,
            ),
            darkTheme: ThemeData(
              useMaterial3: true,
              colorScheme:
                  ref.watch(selectedColorNotifier) == ColorSchemeEnum.system
                      ? darkDynamic
                      : ref.watch(selectedColorNotifier).colorSchemeDark,
              brightness: Brightness.dark,
            ),
            themeMode: ref.watch(themeMode),
            scrollBehavior: MyCustomScrollBehavior(),
          );
        });
      },
    );
  }
}

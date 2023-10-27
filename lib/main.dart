import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:neofit_app/global_provider.dart';
import 'package:neofit_app/view/themes/themes.dart';

import 'router/router.dart';

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
    return Consumer(
        builder: (widget, ref, child) => MaterialApp.router(
              routerConfig: ref.watch(goRouterProvider),
              debugShowCheckedModeBanner: false,
              theme: ref.watch(theme),
              darkTheme: ref.watch(darkTheme),
              themeMode: ref.watch(themeMode),
            ));
  }
}

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
              theme: ThemeData(
                useMaterial3: true,
                colorScheme: ref.watch(selectedColorNotifier).colorScheme,
                brightness: Brightness.light,
              ),
              darkTheme: ThemeData(
                useMaterial3: true,
                colorScheme: ref.watch(selectedColorNotifier).colorSchemeDark,
                brightness: Brightness.dark,
              ),
              themeMode: ref.watch(themeMode),
            ));
  }
}

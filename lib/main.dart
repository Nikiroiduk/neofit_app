import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
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
            ));
  }
}

final _key0 = GlobalKey<NavigatorState>();
final _key1 = GlobalKey<NavigatorState>();

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: _key0,
    initialLocation: '/0',
    routes: [
      ShellRoute(
          navigatorKey: _key1,
          builder: (context, state, child) =>
              DashboardScreen(key: state.pageKey, child: child),
          routes: [
            GoRoute(
              path: '/0',
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: Page1()),
            ),
            GoRoute(
              path: '/1',
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: Page2()),
            ),
            GoRoute(
              path: '/2',
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: Page3()),
              routes: [],
            ),
          ]),
      GoRoute(
        path: '/details',
        builder: (context, state) => const Page3Details(),
        // pageBuilder: (context, state) => const MaterialPage(
        //     fullscreenDialog: true, child: Page3Details())),
      ),
    ],
  );
});

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key, required this.child});

  final Widget child;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: ref.watch(dashboardNotifierProvider),
          onTap: (index) => _onTap(index),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.abc), label: 'Page 1'),
            BottomNavigationBarItem(
                icon: Icon(Icons.textsms_sharp), label: 'Page 2'),
            BottomNavigationBarItem(
                icon: Icon(Icons.media_bluetooth_off), label: 'Page 3'),
          ]),
    );
  }

  _onTap(int index) {
    ref.read(dashboardNotifierProvider.notifier).setValue(index);

    switch (index) {
      case 0:
        context.go('/0');
        break;
      case 1:
        context.go('/1');
        break;
      case 2:
        context.go('/2');
        break;
      default:
    }
  }
}

class DashboardNotifier extends StateNotifier<int> {
  DashboardNotifier(super.value);

  void setValue(int value) {
    state = value;
  }
}

const int _defaultPage = 0;

final dashboardNotifierProvider = StateNotifierProvider<DashboardNotifier, int>(
    (ref) => DashboardNotifier(_defaultPage));

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Page 1'),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Page 2'),
    );
  }
}

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Page 3'),
          TextButton(
              onPressed: () => context.go('/details'),
              child: const Text('Details'))
        ]);
  }
}

class Page3Details extends StatelessWidget {
  const Page3Details({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Consumer(
          builder: (context, ref, child) {
            return IconButton(
              icon: const Icon(Icons.close_rounded),
              onPressed: () =>
                  context.go('/${ref.watch(dashboardNotifierProvider)}'),
            );
          },
        ),
        title: const Text('Details'),
      ),
      body: const Center(
        child: Text('Page 3 Details'),
      ),
    );
  }
}

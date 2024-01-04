import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../router/router.dart';
import 'dashboard_provider.dart';

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
          currentIndex: ref.watch<Screens>(dashboardNotifierProvider).index,
          onTap: (index) => _onTap(Screens.values[index]),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.abc), label: 'Page 1'),
            BottomNavigationBarItem(
                icon: Icon(Icons.textsms_sharp), label: 'Page 2'),
            BottomNavigationBarItem(
                icon: Icon(Icons.media_bluetooth_off), label: 'Page 3'),
          ]),
    );
  }

  _onTap(Screens screen) {
    ref.read(dashboardNotifierProvider.notifier).setValue(screen);

    switch (screen) {
      case Screens.feed:
        context.go(Screens.feed.path);
        break;
      case Screens.workout:
        context.go(Screens.workout.path);
        break;
      case Screens.profile:
        context.go(Screens.profile.path);
        break;
      default:
    }
  }
}

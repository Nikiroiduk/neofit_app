import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
          iconSize: 24.0,
          selectedFontSize: 14.0,
          unselectedFontSize: 14.0,
          selectedLabelStyle: TextStyle(
              height: 2,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.onSurface),
          unselectedLabelStyle: const TextStyle(height: 2),
          useLegacyColorScheme: false,
          currentIndex: ref.watch<Screens>(dashboardNotifierProvider).index,
          onTap: (index) => _onTap(Screens.values[index]),
          items: [
            BottomNavigationBarItem(
                icon: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 4.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: const Icon(
                    Icons.explore_outlined,
                  ),
                ),
                activeIcon: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 4.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(.2)),
                  child: Icon(
                    Icons.explore_rounded,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                label: AppLocalizations.of(context).feed),
            BottomNavigationBarItem(
                icon: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 4.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: const Icon(
                    Icons.fitness_center_rounded,
                  ),
                ),
                activeIcon: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 4.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(.2)),
                  child: Icon(
                    Icons.fitness_center_rounded,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                label: AppLocalizations.of(context).workout),
            BottomNavigationBarItem(
                icon: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 4.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: const Icon(
                    Icons.person_outline_rounded,
                  ),
                ),
                activeIcon: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 4.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(.2)),
                  child: Icon(
                    Icons.person_rounded,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                label: AppLocalizations.of(context).profile),
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

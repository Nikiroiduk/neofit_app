import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:neofit_app/router/router.dart';

class DashboardNotifier extends StateNotifier<Screens> {
  DashboardNotifier(super.screen);

  void setValue(Screens screen) {
    state = screen;
  }
}

const Screens _defaultScreen = Screens.feed;

final dashboardNotifierProvider = StateNotifierProvider<DashboardNotifier, Screens>(
    (ref) => DashboardNotifier(_defaultScreen));
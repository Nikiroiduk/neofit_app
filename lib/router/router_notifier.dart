import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:neofit_app/domain/auth/auth.dart';
import 'package:neofit_app/domain/user/user_controller.dart';
import 'package:neofit_app/router/router.dart';

class RouterNotifier extends ChangeNotifier {
  final Ref _ref;

  RouterNotifier(this._ref) {
    _ref.listen<AuthState>(
        authControllerProvider, (_, __) => notifyListeners());
    _ref.listen<UserState>(userProvider, (_, __) => notifyListeners());
  }

  FutureOr<String?> routeRedirect(GoRouterState state) async {
    final authState = _ref.read(authControllerProvider);
    final userState = _ref.read(userProvider);

    if (authState is AuthStateSuccess &&
        state.matchedLocation == Screens.signIn.path) {
      return Screens.feed.path;
    }

    if (authState is AuthStateSignedUp &&
        state.matchedLocation == Screens.signUp.path) {
      return Screens.onboarding.path;
    }

    if (authState is AuthStateLoggedOut &&
        state.matchedLocation == Screens.settings.path) {
      return Screens.signIn.path;
    }

    if (userState is UserStateIsConfigured &&
        state.matchedLocation == Screens.personalInformation.path) {
      return Screens.feed.path;
    }

    return null;
  }
}

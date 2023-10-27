import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:neofit_app/auth/auth.dart';
import 'package:neofit_app/router/router.dart';

class RouterNotifier extends ChangeNotifier {
  final Ref _ref;

  RouterNotifier(this._ref) {
    _ref.listen<AuthState>(
        authControllerProvider, (_, __) => notifyListeners());
  }

  FutureOr<String?> routeRedirect(GoRouterState state) async {
    final authState = _ref.read(authControllerProvider);

    if (authState is AuthStateSuccess &&
        state.matchedLocation == Screens.signIn.path) {
      return Screens.feed.path;
    }

    if (authState is AuthStateSignedUp &&
        state.matchedLocation == Screens.signUp.path) {
      return Screens.onboarding.path;
    }

    if (authState is AuthStateLoggedOut &&
        state.matchedLocation == Screens.profile.path) {
      return Screens.signIn.path;
    }

    return null;
  }
}

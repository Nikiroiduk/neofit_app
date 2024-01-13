import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:neofit_app/domain/auth/auth.dart';
import 'package:neofit_app/preferences/preferences.dart';
import 'package:neofit_app/presentation/dashboard_screen/dashboard.dart';
import 'package:neofit_app/router/utils.dart';

class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class AuthStateInitial extends AuthState {
  const AuthStateInitial();

  @override
  List<Object?> get props => [];
}

class AuthStateLoading extends AuthState {
  const AuthStateLoading();

  @override
  List<Object?> get props => [];
}

class AuthStateSuccess extends AuthState {
  const AuthStateSuccess(this.token);

  final String token;

  @override
  List<Object?> get props => [token];
}

class AuthStateLoggedOut extends AuthState {
  const AuthStateLoggedOut();

  @override
  List<Object?> get props => [];
}

class AuthStateSignedUp extends AuthState {
  const AuthStateSignedUp({required this.token});

  final String token;

  @override
  List<Object?> get props => [token];
}

class AuthStateError extends AuthState {
  const AuthStateError(this.error);

  final String error;

  @override
  List<Object?> get props => [error];
}

class AuthController extends StateNotifier<AuthState> {
  AuthController({required this.ref}) : super(const AuthStateInitial()) {
    var pref = ref.watch(preferences);
    debugPrint('pref token: ${pref.token}');
    if (pref.token != '') state = AuthStateSuccess(pref.token);
  }

  final Ref ref;

  void login(String email, String password) async {
    state = const AuthStateLoading();
    debugPrint('$state with email: $email and password: $password');
    try {
      var token = await ref.read(authRepositoryProvider).login(email, password);
      state = AuthStateSuccess(token);

      ref.read(preferences).persistToken(token);

      debugPrint(state.toString());
    } catch (e) {
      debugPrint(e.toString());
      state = AuthStateError(e.toString());
    }
  }

  void logout() async {
    state = const AuthStateLoading();
    debugPrint(state.toString());
    try {
      await ref.read(authRepositoryProvider).logout();
      ref.read(dashboardNotifierProvider.notifier).setValue(Screens.feed);
      state = const AuthStateLoggedOut();

      ref.read(preferences).persistToken('');

      debugPrint(state.toString());
    } catch (e) {
      state = AuthStateError(e.toString());
    }
  }

  void signUp(String email, String tokenname, String password) async {
    state = const AuthStateLoading();
    debugPrint(state.toString());
    try {
      var token = await ref
          .read(authRepositoryProvider)
          .signUp(email, tokenname, password);
      state = AuthStateSignedUp(token: token);

      ref.read(preferences).persistToken(token);

      debugPrint(state.toString());
    } catch (e) {
      state = AuthStateError(e.toString());
    }
  }
}

final authControllerProvider = StateNotifierProvider<AuthController, AuthState>(
    (ref) => AuthController(ref: ref));

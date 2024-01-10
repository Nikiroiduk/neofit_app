import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:neofit_app/data/models/models.dart';
import 'package:neofit_app/domain/auth/auth.dart';
import 'package:neofit_app/globals/global_provider.dart';
import 'package:neofit_app/preferences/preferences.dart';

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
  const AuthStateSuccess(this.user);

  final User user;

  @override
  List<Object?> get props => [user];
}

class AuthStateLoggedOut extends AuthState {
  const AuthStateLoggedOut();

  @override
  List<Object?> get props => [];
}

class AuthStateSignedUp extends AuthState {
  const AuthStateSignedUp({required this.user});

  final User user;

  @override
  List<Object?> get props => [user];
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
    if (pref.token != '') state = AuthStateSuccess(User(token: pref.token));
  }
  // AuthController({required this.ref}) : super(const AuthStateInitial());

  final Ref ref;

  void login(String email, String password) async {
    state = const AuthStateLoading();
    debugPrint('$state with email: $email and password: $password');
    try {
      var user = await ref.read(authRepositoryProvider).login(email, password);
      state = AuthStateSuccess(user);

      ref.read(preferences).persistToken(user.token);

      debugPrint(state.toString());
    } catch (e) {
      state = AuthStateError(e.toString());
    }
  }

  void logout() async {
    state = const AuthStateLoading();
    debugPrint(state.toString());
    try {
      await ref.read(authRepositoryProvider).logout();

      state = const AuthStateLoggedOut();

      ref.read(preferences).persistToken('');

      debugPrint(state.toString());
    } catch (e) {
      state = AuthStateError(e.toString());
    }
  }

  void signUp(String username, String email, String password) async {
    state = const AuthStateLoading();
    debugPrint(state.toString());
    try {
      var user = await ref
          .read(authRepositoryProvider)
          .signUp(username, email, password);
      state = AuthStateSignedUp(user: user);

      ref.read(preferences).persistToken(user.token);

      debugPrint(state.toString());
    } catch (e) {
      state = AuthStateError(e.toString());
    }
  }
}

final authControllerProvider = StateNotifierProvider<AuthController, AuthState>(
    (ref) => AuthController(ref: ref));

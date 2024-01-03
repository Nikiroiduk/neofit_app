import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:neofit_app/auth/auth.dart';

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
  const AuthStateSuccess();

  @override
  List<Object?> get props => [];
}

class AuthStateLoggedOut extends AuthState {
  const AuthStateLoggedOut();

  @override
  List<Object?> get props => [];
}

class AuthStateSignedUp extends AuthState {
  const AuthStateSignedUp();

  @override
  List<Object?> get props => [];
}

class AuthStateError extends AuthState {
  const AuthStateError(this.error);

  final String error;

  @override
  List<Object?> get props => [error];
}

class AuthController extends StateNotifier<AuthState> {
  AuthController({required this.ref}) : super(const AuthStateInitial());

  final Ref ref;

  void login(String email, String password) async {
    state = const AuthStateLoading();
    debugPrint('$state with email: $email and password: $password');
    try {
      await ref.read(authServiceProvider).login(email, password);
      state = const AuthStateSuccess();
      debugPrint(state.toString());
    } catch (e) {
      state = AuthStateError(e.toString());
    }
  }

  void logout() async {
    state = const AuthStateLoading();
    debugPrint(state.toString());
    try {
      await ref.read(authServiceProvider).logout();
      state = const AuthStateLoggedOut();
      debugPrint(state.toString());
    } catch (e) {
      state = AuthStateError(e.toString());
    }
  }

  void signUp(String username, String email, String password) async {
    state = const AuthStateLoading();
    debugPrint(state.toString());
    try {
      await ref.read(authServiceProvider).signUp(username, email, password);
      state = const AuthStateSignedUp();
      debugPrint(state.toString());
    } catch (e) {
      state = AuthStateError(e.toString());
    }
  }
}

final authControllerProvider = StateNotifierProvider<AuthController, AuthState>(
    (ref) => AuthController(ref: ref));

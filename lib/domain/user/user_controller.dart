import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:neofit_app/data/api/api.dart';
import 'package:neofit_app/data/models/models.dart';
import 'package:neofit_app/domain/auth/auth.dart';
import 'package:neofit_app/domain/connectivity_status_provider.dart';
import 'package:neofit_app/preferences/preferences.dart';

class UserState extends Equatable {
  const UserState();

  @override
  List<Object?> get props => [];
}

class UserStateInitial extends UserState {
  const UserStateInitial();

  @override
  List<Object?> get props => [];
}

class UserStateIsSuccess extends UserState {
  const UserStateIsSuccess();

  @override
  List<Object?> get props => [];
}

class UserStateLoading extends UserState {
  const UserStateLoading();

  @override
  List<Object?> get props => [];
}

class UserStateIsConfigured extends UserState {
  const UserStateIsConfigured();

  @override
  List<Object?> get props => [];
}

class UserStateError extends UserState {
  const UserStateError(this.error);

  final String error;

  @override
  List<Object?> get props => [error];
}

class UserNotifier extends StateNotifier<UserState> {
  UserNotifier({required this.ref}) : super(const UserStateInitial());

  final Ref ref;

  Future<User> getUser() async {
    var authState = ref.watch(authControllerProvider);
    var network = ref.watch(connectivityStatusProvider);
    var apiController = ref.watch(apiControllerProvider.notifier);
    var token = ref.watch(preferencesProvider).token;

    if (authState is! AuthStateSuccess && authState is! AuthStateSignedUp) {
      return User.empty;
    }
    debugPrint(network.toString());
    if (network == ConnectivityStatus.connected) {
      var user = await apiController.getUser(token);
      debugPrint(user?.toJson().toString());
      return user ?? User.empty;
    }

    if (network == ConnectivityStatus.disconnected) {
      return User();
      // TODO: return user with given token from Hive
    }

    return User.empty;
  }

  Future<User> updateUser(User user) async {
    var apiController = ref.watch(apiControllerProvider.notifier);
    var network = ref.watch(connectivityStatusProvider);
    var token = ref.watch(preferencesProvider).token;

    state = const UserStateLoading();
    debugPrint(state.toString());

    // TODO: save user in localStorage

    if (network == ConnectivityStatus.connected) {
      debugPrint('Token: $token\nUser: ${user.toJson()}');
      user = await apiController.updateUser(token, user) ?? user;

      if (user.isConfigured) {
        state = const UserStateIsConfigured();
        debugPrint(state.toString());
      }
    }

    return user;
  }
}

final userProvider = StateNotifierProvider<UserNotifier, UserState>(
    (ref) => UserNotifier(ref: ref));

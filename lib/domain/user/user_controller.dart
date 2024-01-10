import 'package:equatable/equatable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:neofit_app/data/models/models.dart';
import 'package:neofit_app/domain/auth/auth.dart';
import 'package:neofit_app/domain/connectivity_status_provider.dart';

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

class UserStateLoading extends UserState {
  const UserStateLoading();

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

  User getUser() {
    var authState = ref.watch(authControllerProvider);
    var network = ref.watch(connectivityStatusProvider);
    if (authState is! AuthStateSuccess || authState is! AuthStateSignedUp) {
      return User.empty;
    }

    if (network == ConnectivityStatus.connected) {
      return const User(token: 'user from API');
      // TODO: return user with given token from API
    }

    if (network == ConnectivityStatus.disconnected) {
      return const User(token: 'user from Hive');
      // TODO: return user with given token from Hive
    }

    return User.empty;
  }
}

final userProvider = StateNotifierProvider<UserNotifier, UserState>(
    (ref) => UserNotifier(ref: ref));

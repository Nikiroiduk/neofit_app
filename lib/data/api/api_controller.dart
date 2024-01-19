import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:neofit_app/data/api/api_repository.dart';
import 'package:neofit_app/data/models/models.dart';

class ApiState extends Equatable {
  const ApiState();

  @override
  List<Object?> get props => [];
}

class ApiStateInitial extends ApiState {
  const ApiStateInitial();

  @override
  List<Object?> get props => [];
}

class ApiStateLoading extends ApiState {
  const ApiStateLoading();

  @override
  List<Object?> get props => [];
}

class ApiStateSuccess extends ApiState {
  const ApiStateSuccess();

  @override
  List<Object?> get props => [];
}

class ApiStateError extends ApiState {
  const ApiStateError(this.error);

  final String error;

  @override
  List<Object?> get props => [error];
}

class ApiController extends StateNotifier<ApiState> {
  ApiController({required this.ref}) : super(const ApiStateInitial());

  final Ref ref;

  Future<String> authUser(String email, String password) async {
    state = const ApiStateLoading();
    try {
      var token =
          await ref.read(apiRepositoryProvider).authUser(email, password);

      return token;
    } catch (e) {
      state = ApiStateError(e.toString());
    }
    return '';
  }

  Future<String> registerUser(
      String email, String username, String password) async {
    state = const ApiStateLoading();
    try {
      var token = await ref
          .read(apiRepositoryProvider)
          .registerUser(email, username, password);
      return token;
    } catch (e) {
      state = ApiStateError(e.toString());
    }
    return '';
  }

  Future<User?> updateUser(String token, User user) async {
    state = const ApiStateLoading();
    debugPrint(state.toString());
    try {
      var result =
          await ref.read(apiRepositoryProvider).updateUser(token, user);
      state = const ApiStateSuccess();
      debugPrint(state.toString());
      return result;
    } catch (e) {
      state = ApiStateError(e.toString());
      debugPrint(state.toString());
    }
    return null;
  }

  Future<User?> getUser(String token) async {
    state = const ApiStateLoading();
    debugPrint(state.toString());
    try {
      var result = await ref.read(apiRepositoryProvider).getUser(token);
      state = const ApiStateSuccess();
      return result;
    } catch (e) {
      state = ApiStateError(e.toString());
      debugPrint(state.toString());
    }
    return null;
  }
}

final apiControllerProvider = StateNotifierProvider<ApiController, ApiState>(
    (ref) => ApiController(ref: ref));

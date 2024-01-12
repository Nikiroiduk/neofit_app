import 'package:equatable/equatable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:neofit_app/data/api/api_repository.dart';

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
    var token = await ref.read(apiRepositoryProvider).authUser(email, password);
    return token;
  }

  Future<String> registerUser(
      String email, String username, String password) async {
    return ref
        .read(apiRepositoryProvider)
        .registerUser(email, username, password);
  }
}

final apiControllerProvider = StateNotifierProvider<ApiController, ApiState>(
    (ref) => ApiController(ref: ref));

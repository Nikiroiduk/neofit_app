import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:neofit_app/data/api/api_controller.dart';
import 'package:neofit_app/domain/auth/auth.dart';

class AuthService implements AuthRepository {
  AuthService({required this.ref});
  final Ref ref;

  @override
  Future<String> login(String email, String password) async {
    var token = await ref
        .read(apiControllerProvider.notifier)
        .authUser(email, password);
    return token;
  }

  @override
  Future<bool> logout() async {
    return Future.delayed(const Duration(milliseconds: 1000))
        .then((value) => true);
  }

  @override
  Future<String> signUp(String email, String username, String password) async {
    var token = await ref
        .read(apiControllerProvider.notifier)
        .registerUser(email, username, password);
    return token;
  }
}

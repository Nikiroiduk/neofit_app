import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:neofit_app/domain/auth/auth.dart';

abstract class AuthRepository {
  Future<String> login(String email, String password);

  Future<bool> logout();

  Future<String> signUp(String email, String username, String password);
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthService(ref: ref);
});

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:neofit_app/domain/auth/auth.dart';

class AuthRepository {
  final AuthService _authService;
  AuthRepository(this._authService);

  Future<String> login(String email, String password) async {
    return _authService.login(email, password);
  }

  Future<bool> logout() async {
    return _authService.logout();
  }

  Future<String> signUp(String username, String email, String password) async {
    return _authService.signUp(username, email, password);
  }
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(ref.read(authServiceProvider));
});

import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthService {
  Future<String> login(String email, String password) async {
    return Future.delayed(const Duration(milliseconds: 2000))
        .then((value) => 'token');
  }

  Future<bool> logout() async {
    return Future.delayed(const Duration(milliseconds: 1000))
        .then((value) => true);
  }

  Future<String> signUp(String username, String email, String password) async {
    return Future.delayed(const Duration(milliseconds: 2000))
        .then((value) => 'token');
  }
}

final authServiceProvider = Provider<AuthService>((ref) => AuthService());

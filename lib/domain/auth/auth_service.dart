import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:neofit_app/data/models/models.dart';

class AuthService {
  Future<User> login(String email, String password) async {
    return User(token: "$email $password");
  }

  Future<bool> logout() async {
    return Future.delayed(const Duration(milliseconds: 1000))
        .then((value) => true);
  }

  Future<User> signUp(String username, String email, String password) async {
    return User(token: "$email $password $username");
  }
}

final authServiceProvider = Provider<AuthService>((ref) => AuthService());

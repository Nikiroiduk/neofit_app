import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:neofit_app/utils/config.dart';
import 'package:neofit_app/data/api/api_repository.dart';
import 'package:neofit_app/data/models/models.dart';

class ApiService extends ApiRepository {
  @override
  Future<String> authUser(String email, String password) async {
    debugPrint('login($apiHost/user/auth)');
    var response = await dioClient.post('/user/auth',
        data: UserDTO(email: email, password: password).toJson());
    debugPrint('response($response)');
    if (response.statusCode == 200) {
      var token = response.data['token'];
      return token;
    }
    throw Exception();
  }

  @override
  Future<String> registerUser(
      String email, String username, String password) async {
    debugPrint('register($apiHost/user/register)');
    var response = await dioClient.post('/user/register',
        data: UserDTO(email: email, username: username, password: password)
            .toJson());
    debugPrint('response($response)');
    if (response.statusCode == 200) {
      var token = response.data['token'];
      return token;
    }
    throw Exception();
  }

  @override
  Future<User?> updateUser(String token, User user) async {
    debugPrint('update($apiHost/user/update)');
    var response = await dioClient.post('/user/update',
        data: user.toJson(),
        options: Options(headers: {"Authorization": "Bearer $token"}));
    debugPrint('response($response)');

    if (response.statusCode == 200) {
      return User.fromJson(response.data);
    }
    throw Exception();
  }

  @override
  Future<User?> getUser(String token) async {
    debugPrint('get($apiHost/user)');
    var response = await dioClient.get('/user',
        options: Options(headers: {"Authorization": "Bearer $token"}));
    debugPrint('response($response)');

    if (response.statusCode == 200) {
      return User.fromJson(response.data);
    }
    throw Exception();
  }
}

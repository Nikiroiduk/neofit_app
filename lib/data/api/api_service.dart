import 'package:flutter/foundation.dart';
import 'package:neofit_app/config.dart';
import 'package:neofit_app/data/api/api_repository.dart';
import 'package:neofit_app/data/models/models.dart';

class ApiService extends ApiRepository {
  @override
  Future<String> authUser(String email, String password) async {
    debugPrint('login($apiHost)');
    var response = await dioClient.post('$apiHost/user/auth',
        data: UserDTO(email: email, password: password).toJson());
    debugPrint('response($response)');
    return response.toString();
  }

  @override
  Future<String> registerUser(
      String email, String username, String password) async {
    debugPrint('register($apiHost)');
    var response = await dioClient.post('$apiHost/user/register',
        data: UserDTO(email: email, username: username, password: password)
            .toJson());
    debugPrint('response($response)');
    return response.toString();
  }
}

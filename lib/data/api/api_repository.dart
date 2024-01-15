import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:neofit_app/data/api/api_service.dart';
import 'package:neofit_app/data/models/models.dart';
import 'package:neofit_app/utils/config.dart';

abstract class ApiRepository {
  final Dio dioClient = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 10),
      baseUrl: apiHost,
      responseType: ResponseType.json,
      contentType: ContentType.json.toString(),
    ),
  );

  Future<String> authUser(String email, String password);

  Future<String> registerUser(String email, String username, String password);

  Future<User?> updateUser(String token, User user);

  Future<User?> getUser(String token);
}

final apiRepositoryProvider = Provider<ApiRepository>((ref) {
  return ApiService();
});

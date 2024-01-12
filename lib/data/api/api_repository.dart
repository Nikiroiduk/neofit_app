import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:neofit_app/data/api/api_service.dart';

abstract class ApiRepository {
  final Dio dioClient = Dio();

  Future<String> authUser(String email, String password);

  Future<String> registerUser(String email, String username, String password);
}

final apiRepositoryProvider = Provider<ApiRepository>((ref) {
  return ApiService();
});

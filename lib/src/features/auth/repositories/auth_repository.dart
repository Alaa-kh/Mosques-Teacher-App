
import '../../../core/constants/app_endpoints.dart';
import '../../../core/network/api_client.dart';
import '../../../core/storage/token_storage.dart';
import '../models/auth_response.dart';

class AuthRepository {
  final ApiClient api;
  final TokenStorage storage;

  AuthRepository({required this.api, required this.storage});

  Future<AuthResponse> login({
    required String phone,
    required String password,
    required String type,
  }) async {
    final res = await api.postJson(AppEndpoints.login, {
      'phone': phone,
      'password': password,
      'type': type,
    });

    final map = (res.data as Map).cast<String, dynamic>();
    final dataMap = (map['data'] as Map).cast<String, dynamic>();
    final token = (dataMap['token'] as String?) ?? '';
    await storage.saveAccessToken(token);

    final auth = AuthResponse.fromJson(map);
    return auth;
  }
}

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenStorage {
  final _storage = const FlutterSecureStorage();
  static const _kAccess = 'access_token';
  static const _kRefresh = 'refresh_token';
  Future<void> saveAccessToken(String token) =>
      _storage.write(key: _kAccess, value: token);
  Future<void> saveRefreshToken(String token) =>
      _storage.write(key: _kRefresh, value: token);
  Future<String?> loadAccessToken() => _storage.read(key: _kAccess);
  Future<String?> loadRefreshToken() => _storage.read(key: _kRefresh);
  Future<void> clear() async {
    await _storage.deleteAll();
  }

  Future<bool> hasValidAccessToken() async {
    final t = await loadAccessToken();
    return t != null && t.isNotEmpty;
  }
}

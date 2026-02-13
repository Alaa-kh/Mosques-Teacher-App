import 'user.dart';

class AuthResponse {
  final String accessToken;
  final String refreshToken;
  final User user;
  const AuthResponse({
    required this.accessToken,
    required this.refreshToken,
    required this.user,
  });
factory AuthResponse.fromJson(Map<String, dynamic> json) {
    final data = json['data'] ?? {};
    return AuthResponse(
      accessToken: data['token']?.toString() ?? '',
      refreshToken: data['refresh_token']?.toString() ?? '',
      user: User.fromJson(data),
    );
  }

}

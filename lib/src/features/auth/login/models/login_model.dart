import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  final String status;
  final String message;
  final Data? data;

  LoginModel({required this.status, required this.message, this.data});

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    status: json["status"]?.toString() ?? '',
    message: json["message"]?.toString() ?? '',
    data: json["data"] != null ? Data.fromJson(json["data"]) : null,
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  final String type;
  final User user;
  final String accessToken;
  final String refreshToken;
  final int expiresIn;

  Data({
    required this.type,
    required this.user,
    required this.accessToken,
    required this.refreshToken,
    required this.expiresIn,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    type: json["type"]?.toString() ?? '',
    user: User.fromJson(json["user"] as Map<String, dynamic>),
    accessToken: json["access_token"]?.toString() ?? '',
    refreshToken: json["refresh_token"]?.toString() ?? '',
    expiresIn: (json["expires_in"] as num?)?.toInt() ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "user": user.toJson(),
    "access_token": accessToken,
    "refresh_token": refreshToken,
    "expires_in": expiresIn,
  };
}

class User {
  final int id;
  final String providerName;
  final String marketName;
  final String phone;
  final DateTime? phoneVerifiedAt;
  final String city;
  final String vLocation;
  final String hLocation;
  final DateTime createdAt;
  final DateTime updatedAt;

  User({
    required this.id,
    required this.providerName,
    required this.marketName,
    required this.phone,
    this.phoneVerifiedAt,
    required this.city,
    required this.vLocation,
    required this.hLocation,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: (json["id"] as num).toInt(),
    providerName: json["provider_name"]?.toString() ?? '',
    marketName: json["market_name"]?.toString() ?? '',
    phone: json["phone"]?.toString() ?? '',
    phoneVerifiedAt: json["phone_verified_at"] != null
        ? DateTime.parse(json["phone_verified_at"])
        : null,
    city: json["city"]?.toString() ?? '',
    vLocation: json["v_location"]?.toString() ?? '',
    hLocation: json["h_location"]?.toString() ?? '',
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "provider_name": providerName,
    "market_name": marketName,
    "phone": phone,
    "phone_verified_at": phoneVerifiedAt?.toIso8601String(),
    "city": city,
    "v_location": vLocation,
    "h_location": hLocation,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

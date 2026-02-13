// import 'package:services_provider_app/src/core/constants/app_endpoints.dart';
// import 'package:services_provider_app/src/core/network/api_client.dart';
// import 'package:services_provider_app/src/core/storage/token_storage.dart';
// import 'package:services_provider_app/src/features/auth/login/models/login_model.dart';

// class LoginRepository {
//   final ApiClient api;
//   final TokenStorage storage;

//   LoginRepository({required this.api, required this.storage});

//   Future<LoginModel> login({
//     required String phone,
//     required String password,
//     required String type,
//   }) async {
//     final res = await api.postJson(AppEndpoints.login, {
//       'phone': phone,
//       'password': password,
//       'type': type,
//     });

//     final map = (res.data as Map).cast<String, dynamic>();
//     final login = LoginModel.fromJson(map);

//     if (login.data?.accessToken.isNotEmpty == true) {
//       await storage.saveAccessToken(login.data!.accessToken);
//     }
//     if (login.data?.refreshToken.isNotEmpty == true) {
//       await storage.saveRefreshToken(login.data!.refreshToken);
//     }

//     return login;
//   }

//   Future<void> registerProviderDevice({required String fcmToken}) async {
//     await api.postJson(AppEndpoints.providerDeviceRegister, {
//       'fcm_token': fcmToken,
//     }, auth: true);
//   }
// }

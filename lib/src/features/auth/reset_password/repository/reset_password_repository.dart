// import 'package:services_provider_app/src/core/constants/app_endpoints.dart';
// import 'package:services_provider_app/src/core/network/api_client.dart';
// import 'package:services_provider_app/src/core/storage/token_storage.dart';
// import 'package:services_provider_app/src/features/auth/reset_password/models/reset_password_model.dart';

// class ResetPasswordRepository {
//   final ApiClient api;
//   final TokenStorage storage;

//   ResetPasswordRepository({required this.api, required this.storage});

//   // Perform reset password API call and save token
//   Future<ResetPasswordModel> resetPassword({
//     required String phone,
//     required String type,
//   }) async {
//     final res = await api.postJson(AppEndpoints.forgotPassword, {
//       'phone': phone,
//       'type': type,
//     });

//     final map = (res.data as Map).cast<String, dynamic>();
//     final dataList = map['data'] as List?;

//     if (dataList != null && dataList.isNotEmpty && dataList.first is Map) {
//       final first = dataList.first as Map<String, dynamic>;
//       final token = first['token'] as String? ?? '';
//       await storage.saveAccessToken(token);
//     }
//     final auth = ResetPasswordModel.fromJson(map);
//     return auth;
//   }
// }

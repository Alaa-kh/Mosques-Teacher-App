// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:services_provider_app/src/core/constants/app_images.dart';
// import 'package:services_provider_app/src/core/hive/user_box.dart';
// import 'package:services_provider_app/src/core/network/safe_api.dart';
// import 'package:services_provider_app/src/core/widgets/app_snack_bar.dart';
// import 'package:services_provider_app/src/features/auth/models/user.dart';
// import 'package:services_provider_app/src/features/auth/reset_password/models/reset_password_model.dart';
// import 'package:services_provider_app/src/features/auth/reset_password/repository/reset_password_repository.dart';
// import 'package:services_provider_app/src/features/auth/reset_password/viewmodels/reset_password_state.dart';

// class ResetPasswordCubit extends Cubit<ResetPasswordState> {
//   final ResetPasswordRepository repo;

//   bool validPhone = true;

//   final TextEditingController phoneCtrl =
//       TextEditingController(); // Phone input
//   String fullPhone = "";
//   String phone = "";

//   String countryCode = '+963'; // Default country code
//   String countryFlag = AppImages.syria; // Default country flag
//   bool isImageFlag = true;

//   late FocusNode focusNode;
//   bool hasText = false;
//   bool isFocused = false;

//   ResetPasswordCubit(this.repo)
//     : super(
//         const ResetPasswordState(
//           countryCode: '+963',
//           countryFlag: AppImages.syria,
//           isImageFlag: true,
//         ),
//       ) {
//     _initFocusNode();
//     _initControllerListener();
//   }

//   // Initialize focus node listener
//   void _initFocusNode() {
//     focusNode = FocusNode();
//     focusNode.addListener(() {
//       isFocused = focusNode.hasFocus;
//     });
//   }

//   // Initialize phone controller listener
//   void _initControllerListener() {
//     phoneCtrl.addListener(() {
//       final filled = phoneCtrl.text.isNotEmpty;
//       if (filled != hasText) {
//         hasText = filled;
//       }
//     });
//   }

//   void setCountry(String code, String flag, {bool isImage = true}) {
//     countryCode = code;
//     countryFlag = flag;
//     isImageFlag = isImage;

//     emit(
//       state.copyWith(
//         countryCode: code,
//         countryFlag: flag,
//         isImageFlag: isImage,
//       ),
//     );
//   }

//   // Clean phone number: remove non-digit characters
//   String cleanPhoneNumber(String rawPhone) {
//     final digitsOnly = rawPhone.replaceAll(RegExp(r'[^0-9]'), '');
//     final code = state.countryCode.isNotEmpty ? state.countryCode : countryCode;
//     return '$code$digitsOnly';
//   }

//   // Call API to reset password
//   Future<void> resetPassword(
//     BuildContext context,
//     String phone,
//     String type,
//   ) async {
//     emit(
//       state.copyWith(loading: true, errorMessage: null, successMessage: null),
//     );

//     final cleanPhone = cleanPhoneNumber(phone);

//     final r = await safeApiCall<ResetPasswordModel>(context, () async {
//       final auth = await repo.resetPassword(phone: cleanPhone, type: type);

//       if (auth.data.isNotEmpty) {
//         await UserBox().saveUser(auth.data.first);
//       }
//       return auth;
//     });

//     r.fold(
//       (e) {
//         emit(
//           state.copyWith(
//             loading: false,
//             errorMessage: e.message,
//             successMessage: null,
//           ),
//         );
//       },
//       (resetPassword) async {
//         if (resetPassword.data.isNotEmpty) {
//           final firstItem = resetPassword.data.first;
//           if (firstItem is Map<String, dynamic>) {
//             final user = User.fromJson(firstItem);
//             await UserBox().saveUser(user);
//           }
//         }

//         if (resetPassword.message.isNotEmpty) {
//           AppSnackBar.success(context, resetPassword.message);
//         }
//         emit(
//           state.copyWith(
//             loading: false,
//             successMessage: resetPassword.message,
//             errorMessage: null,
//           ),
//         );
//       },
//     );
//   }
// }

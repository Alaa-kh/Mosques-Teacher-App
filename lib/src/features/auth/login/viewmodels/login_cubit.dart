// import 'dart:async';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:services_provider_app/src/core/constants/app_images.dart';
// import 'package:services_provider_app/src/core/hive/user_box.dart';
// import 'package:services_provider_app/src/core/network/safe_api.dart';
// import 'package:services_provider_app/src/core/widgets/app_snack_bar.dart';
// import 'package:services_provider_app/src/features/auth/login/models/login_model.dart';
// import 'package:services_provider_app/src/features/auth/login/repository/login_repository.dart';
// import 'package:services_provider_app/src/features/auth/login/viewmodels/login_state.dart';
// import 'package:services_provider_app/src/features/auth/models/user.dart'
//     as app_user;

// class LoginCubit extends Cubit<LoginState> {
//   final LoginRepository repo;

//   bool validPhone = true;

//   final TextEditingController phoneCtrl = TextEditingController();
//   final TextEditingController pass = TextEditingController();
//   String fullPhone = "";

//   late FocusNode focusNode;
//   bool hasText = false;
//   bool isFocused = false;

//   StreamSubscription<String>? _fcmRefreshSub;
//   String? _lastFcmToken;

//   LoginCubit(this.repo)
//     : super(
//         const LoginState(
//           countryCode: '+963',
//           countryFlag: AppImages.syria,
//           isImageFlag: true,
//         ),
//       ) {
//     _initFocusNode();
//     _initControllerListener();
//   }

//   void _initFocusNode() {
//     focusNode = FocusNode();
//     focusNode.addListener(() {
//       isFocused = focusNode.hasFocus;
//     });
//   }

//   void _initControllerListener() {
//     phoneCtrl.addListener(() {
//       final filled = phoneCtrl.text.isNotEmpty;
//       if (filled != hasText) {
//         hasText = filled;
//       }
//     });
//   }

//   void toggleHidePassword() {
//     emit(state.copyWith(hidePassword: !state.hidePassword));
//   }

//   void setCountry({
//     required String code,
//     required String flag,
//     required bool isImage,
//   }) {
//     emit(
//       state.copyWith(
//         countryCode: code,
//         countryFlag: flag,
//         isImageFlag: isImage,
//       ),
//     );
//   }

//   String cleanPhoneNumber(String rawPhone) {
//     final digitsOnly = rawPhone.replaceAll(RegExp(r'[^0-9]'), '');
//     return '${state.countryCode}$digitsOnly';
//   }

//   Future<void> login(
//     BuildContext context,
//     String phone,
//     String password,
//     String type,
//   ) async {
//     emit(state.copyWith(loading: true, error: null, loggedIn: false));

//     final cleanPhone = cleanPhoneNumber(phone);

//     final r = await safeApiCall<LoginModel>(context, () async {
//       final login = await repo.login(
//         phone: cleanPhone,
//         password: password,
//         type: type,
//       );

//       final storeUser = login.data!.user;

//       final appUser = app_user.User(
//         id: storeUser.id.toString(),
//         name: storeUser.providerName,
//         email: '',
//       );

//       await UserBox().saveUser(appUser);

//       if (login.message.isNotEmpty) {
//         AppSnackBar.success(context, login.message);
//       }

//       return login;
//     });

//     r.fold(
//       (e) => emit(
//         state.copyWith(loading: false, error: e.message, loggedIn: false),
//       ),
//       (_) async {
//         emit(state.copyWith(loading: false, error: null, loggedIn: true));
//         await _registerFcmTokenIfNeeded();
//         _listenForFcmTokenRefresh();
//       },
//     );
//   }

//   Future<void> _registerFcmTokenIfNeeded() async {
//     try {
//       final messaging = FirebaseMessaging.instance;

//       await messaging.requestPermission(alert: true, badge: true, sound: true);

//       final token = await messaging.getToken();
//       if (token == null || token.isEmpty) return;
//       if (token == _lastFcmToken) return;

//       _lastFcmToken = token;
//       await repo.registerProviderDevice(fcmToken: token);
//     } catch (_) {
//       // Intentionally ignored: device registration should not block login.
//     }
//   }

//   void _listenForFcmTokenRefresh() {
//     if (_fcmRefreshSub != null) return;

//     _fcmRefreshSub = FirebaseMessaging.instance.onTokenRefresh.listen((
//       token,
//     ) async {
//       if (token.isEmpty) return;
//       if (token == _lastFcmToken) return;

//       _lastFcmToken = token;

//       try {
//         await repo.registerProviderDevice(fcmToken: token);
//       } catch (_) {}
//     });
//   }

//   @override
//   Future<void> close() {
//     _fcmRefreshSub?.cancel();
//     focusNode.dispose();
//     phoneCtrl.dispose();
//     pass.dispose();
//     return super.close();
//   }
// }

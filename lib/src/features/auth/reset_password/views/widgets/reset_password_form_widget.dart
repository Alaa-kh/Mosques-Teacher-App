// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:services_provider_app/src/core/widgets/app_button.dart';
// import 'package:services_provider_app/src/core/animation/motions.dart';
// import 'package:services_provider_app/src/core/constants/app_colors.dart';
// import 'package:services_provider_app/src/features/auth/reset_password/viewmodels/reset_password_cubit.dart';
// import 'package:services_provider_app/src/features/auth/reset_password/viewmodels/reset_password_state.dart';
// import 'package:services_provider_app/src/features/auth/reset_password/views/widgets/reset_phone_field_widget.dart';

// class ResetPasswordFormWidget extends StatelessWidget {
//   const ResetPasswordFormWidget({super.key, required this.state});
//   final ResetPasswordState state;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const SizedBox(height: 30),
//         const Text(
//           'إعادة ضبط كلمة المرور',
//           style: TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.w700,
//             color: AppColors.dark,
//           ),
//         ).fadeUp(),
//         const SizedBox(height: 6),
//         const Text(
//           'أدخل رقم هاتفك لإعادة تعيين كلمة المرور الخاصة بك.',
//           style: TextStyle(fontSize: 16, color: AppColors.dark),
//         ).fadeUp(),
//         const SizedBox(height: 24),
//         ResetPhoneFieldWidget(
//           controller: context.read<ResetPasswordCubit>().phoneCtrl,
//           state: state,
//           onChanged: (val) =>
//               context.read<ResetPasswordCubit>().fullPhone = val,
//         ).fadeUp(),

//         const SizedBox(height: 13),
//         AppButton(
//           loading: state.loading,
//           title: state.loading ? '...' : 'التالي',
//           onPressed: () {
//             context.read<ResetPasswordCubit>().resetPassword(
//               context,
//               context.read<ResetPasswordCubit>().phoneCtrl.text,
//               'provider',
//             );
//           },
//         ).scaleIn(),
//         const SizedBox(height: 24),
//       ],
//     );
//   }
// }

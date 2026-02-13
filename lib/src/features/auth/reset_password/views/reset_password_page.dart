// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import 'package:svg_flutter/svg.dart';
// import 'package:services_provider_app/src/core/constants/app_icons.dart';
// import 'package:services_provider_app/src/features/auth/reset_password/viewmodels/reset_password_cubit.dart';
// import 'package:services_provider_app/src/features/auth/reset_password/viewmodels/reset_password_state.dart';
// import 'package:services_provider_app/src/features/auth/reset_password/views/widgets/reset_password_form_widget.dart';

// class ResetPasswordPage extends StatelessWidget {
//   const ResetPasswordPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         leading: IconButton(
//           onPressed: () {
//             context.pop();
//           },
//           icon: SvgPicture.asset(AppIcons.arrow),
//         ),
//       ),
//       backgroundColor: Colors.white,
//       body: BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
//         listenWhen: (previous, current) => previous.loading && !current.loading,
//         listener: (context, state) {
//           final isSuccess = state.errorMessage.isEmpty;

//           if (isSuccess) {
//             final resetCubit = context.read<ResetPasswordCubit>();
//             final fullPhone = resetCubit.cleanPhoneNumber(
//               resetCubit.phoneCtrl.text,
//             );
//             context.push('/verify', extra: fullPhone);
//           }
//         },
//         builder: (context, state) => SingleChildScrollView(
//           padding: const EdgeInsets.all(20),
//           child: ResetPasswordFormWidget(state: state),
//         ),
//       ),
//     );
//   }
// }

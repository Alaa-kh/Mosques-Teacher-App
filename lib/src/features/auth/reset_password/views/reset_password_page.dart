import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:mosques_teacher/src/core/constants/app_colors.dart';
import 'package:mosques_teacher/src/features/auth/reset_password/views/widgets/reset_password_form_widget.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(Icons.arrow_back, color: AppColors.maincClr),
        ),
      ),
      backgroundColor: Colors.white,

      // body: BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
      //   listenWhen: (previous, current) => previous.loading && !current.loading,
      //   listener: (context, state) {
      //     final isSuccess = state.errorMessage.isEmpty;

      //     if (isSuccess) {
      //       final resetCubit = context.read<ResetPasswordCubit>();
      //       final fullPhone = resetCubit.cleanPhoneNumber(
      //         resetCubit.phoneCtrl.text,
      //       );
      //       context.push('/verify', extra: fullPhone);
      //     }
      //   },
      //   builder: (context, state) =>
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: ResetPasswordFormWidget(),
      ),
      // ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mosques_teacher/src/core/animation/motions.dart';
import 'package:mosques_teacher/src/core/constants/app_colors.dart';
import 'package:mosques_teacher/src/core/widgets/app_button.dart';
import 'package:mosques_teacher/src/core/widgets/app_text_field.dart';

class ResetPasswordFormWidget extends StatelessWidget {
  const ResetPasswordFormWidget({super.key, });
  // final ResetPasswordState state;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 30),
        const Text(
          'إعادة ضبط كلمة المرور',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: AppColors.dark,
          ),
        ).fadeUp(),
        const SizedBox(height: 6),
        const Text(
          'أدخل الإيميل لإعادة تعيين كلمة المرور الخاصة بك.',
          style: TextStyle(fontSize: 16, color: AppColors.dark),
        ).fadeUp(),
       const SizedBox(height: 30),  AppTextField(
          hintTextDirection: TextDirection.rtl,
          label: 'البريد الإلكتروني',
          // controller: context.read<LoginCubit>().pass,
          // obscure: state.hidePassword,
         
        ).fadeUp(),
        AppButton(
          title: 'حفظ',
          // loading: state.loading,
          // title: state.loading ? '...' : 'التالي',
          onPressed: () {
            // context.read<ResetPasswordCubit>().resetPassword(
            //   context,
            //   context.read<ResetPasswordCubit>().phoneCtrl.text,
            //  
            // );
          },
        ).scaleIn(),
        const SizedBox(height: 24),
      ],
    );
  }
}

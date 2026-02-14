import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:mosques_teacher/src/core/animation/motions.dart';
import 'package:mosques_teacher/src/core/constants/app_colors.dart';
import 'package:mosques_teacher/src/core/constants/app_icons.dart';
import 'package:mosques_teacher/src/core/constants/app_images.dart';
import 'package:mosques_teacher/src/core/widgets/app_button.dart';
import 'package:mosques_teacher/src/core/widgets/app_text_field.dart';

class LoginFormWidget extends StatelessWidget {
  // final LoginState state;

  const LoginFormWidget({super.key,});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 30),
        Image.asset(AppImages.logo, height: 200).scaleIn(),
        const SizedBox(height: 12),
        Text(
          'مرحباً بك',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: AppColors.dark,
          ),
        ).fadeUp(),
        const SizedBox(height: 6),
        Text(
          'أدخل المعلومات لتسجيل الدخول',
          style: const TextStyle(fontSize: 16, color: AppColors.dark),
        ).fadeUp(),
        const SizedBox(height: 24),  AppTextField(
          hintTextDirection: TextDirection.rtl,
          label: 'البريد الإلكتروني',
          // controller: context.read<LoginCubit>().pass,
          // obscure: state.hidePassword,
         
        ).fadeUp(),
        AppTextField(
          hintTextDirection: TextDirection.rtl,
          label: 'كلمة المرور',
          // controller: context.read<LoginCubit>().pass,
          // obscure: state.hidePassword,
          suffix: IconButton(
            // onPressed: context.read<LoginCubit>().toggleHidePassword,
            onPressed: () {
              
            },
            icon: SvgPicture.asset(AppIcons.eye),
          ),
        ).fadeUp(),
        Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: () => context.push('/reset-password'),
            child: const Text(
              '  نسيت كلمة المرور؟',
              style: TextStyle(color: AppColors.maincClr),
            ).fadeUp(),
          ),
        ).fadeUp(),
        const SizedBox(height: 30),
        AppButton(
          title: 'تسجيل الدخول',
          // title: state.loading ? '...' : 'تسجيل الدخول',
          // loading: state.loading,
          onPressed: () {
            // final password = context.read<LoginCubit>().pass.text.trim();
            // final rawPhone = context.read<LoginCubit>().phoneCtrl.text;
            // context.read<LoginCubit>().login(
            //   context,
            //   rawPhone,
            //   password,
            // );
          },
        ).scaleIn(),
        const SizedBox(height: 24),
      ],
    );
  }
}

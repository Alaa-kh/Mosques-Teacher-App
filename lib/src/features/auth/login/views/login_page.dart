import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mosques_teacher/src/features/auth/login/views/widgets/login_form_widget.dart';
import '../viewmodels/login_state.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: 
      // BlocConsumer<LoginCubit, LoginState>(
      //   listenWhen: (previous, current) =>
      //       previous.loggedIn != current.loggedIn,
      //   listener: (context, state) {
      //     if (state.loggedIn) {
      //       final cubit = context.read<LoginCubit>();
      //       cubit.phoneCtrl.clear();
      //       cubit.pass.clear();
      //       FocusScope.of(context).unfocus();
      //       context.go('/');
      //     }
      //   },
      //   builder: (context, state) {
           SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: LoginFormWidget(),
          )
        // },
      // ),
    );
  }
}

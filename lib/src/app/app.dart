import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../core/theme/app_theme.dart';
import '../routing/app_router.dart';
import '../core/network/api_client.dart';
import '../core/storage/token_storage.dart';

class MosquesTeacherApp extends StatelessWidget {
  const MosquesTeacherApp({super.key});

  @override
  Widget build(BuildContext context) {
    final storage = TokenStorage();
    final api = ApiClient(storage: storage);
    // final loginRepo = LoginRepository(api: api, storage: storage);
    // final resetPasswordRepo = ResetPasswordRepository(
    //   api: api,
    //   storage: storage,
    // );
    // final verifyRepo = VerifyRepository(api: api, storage: storage);
    // final newPasswordRepo = NewPasswordRepository(api: api, storage: storage);
    // final homeRepo = HomeRepository(api: api, storage: storage);
    // final transactionsRepo = TransactionsRepository(api: api, storage: storage);

    final router = AppRouter(storage).router;

    // return MultiBlocProvider(
    //   providers: [
    //     // BlocProvider(create: (_) => LoginCubit(loginRepo)),
    //     // BlocProvider(create: (_) => ResetPasswordCubit(resetPasswordRepo)),
    //     // BlocProvider(create: (_) => VerifyCubit(verifyRepo)),
    //     // BlocProvider(create: (_) => NewPasswordCubit(newPasswordRepo)),
    //     // BlocProvider(create: (_) => HomeCubit(homeRepo)),
    //   ],
    //   child:
      
    return  MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'mosques_teacher_app',
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        locale: const Locale('ar'),
        builder: (context, child) =>
            Directionality(textDirection: TextDirection.rtl, child: child!),
        routerConfig: router,
      );
    // );
  }
}

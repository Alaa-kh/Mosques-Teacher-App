import 'package:go_router/go_router.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mosques_teacher/src/core/hive/user_box.dart';
import 'package:mosques_teacher/src/core/widgets/app_snack_bar.dart';
import 'package:mosques_teacher/src/features/auth/login/views/login_page.dart';
import 'package:mosques_teacher/src/features/auth/reset_password/views/reset_password_page.dart';
import '../core/storage/token_storage.dart';

class AppRouter {
  AppRouter(this.storage);
  final TokenStorage storage;

  late final GoRouter router = GoRouter(
    navigatorKey: AppOverlay.navigatorKey,
    initialLocation: '/login',
    routes: [
      GoRoute(
        path: '/login',
        name: 'login',
        pageBuilder: (_, __) => const NoTransitionPage(child: LoginPage()),
      ),

      GoRoute(
        path: '/reset-password',
        name: 'reset-password',
        pageBuilder: (_, __) =>
            const NoTransitionPage(child: ResetPasswordPage()),
      ),
    ],

    //     redirect: (context, state) {
    //   if (!Hive.isBoxOpen('user')) {
    //     return '/login';
    //   }

    //   final user = Hive.box('user').get('user');
    //   final logged = user != null;

    //   final location = state.matchedLocation;

    //   const publicRoutes = <String>{
    //     '/login',
    //     '/reset-password',
    //     '/verify',
    //     '/new-password',
    //   };

    //   final loggingIn = location == '/login';

    //   if (!logged && !publicRoutes.contains(location)) {
    //     return '/login';
    //   }

    //   if (logged && loggingIn) {
    //     return '/';
    //   }

    //   return null;
    // },
  );
}

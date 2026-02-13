import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:mosques_teacher/src/core/hive/user_box.dart';
import 'package:mosques_teacher/src/core/widgets/app_snack_bar.dart';
import '../constants/app_endpoints.dart';
import '../storage/token_storage.dart';

class RefreshTokenInterceptor extends Interceptor {
  RefreshTokenInterceptor(this._dio, this._storage);

  final Dio _dio;
  final TokenStorage _storage;

  bool _refreshing = false;
  bool _loggedOut = false;
  final _queue = <Completer<void>>[];

  static const _kRetried = '__retried__';

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final req = err.requestOptions;

    if (req.path.contains('login') || req.path.contains('logout') || req.path.contains('refresh')) {
      return handler.next(err);
    }

    final requiresAuth = req.extra['requiresAuth'] == true;
    if (!requiresAuth) return handler.next(err);

    if (req.extra[_kRetried] == true) {
      await _handleUnauthenticated();
      return handler.next(err);
    }

    final status = err.response?.statusCode;
    final data = err.response?.data;

    final is401 = status == 401;
    final unauthMessage = data is Map && data['message']?.toString() == 'Unauthenticated.';
    if (!is401 && !unauthMessage) return handler.next(err);

    if (_loggedOut) return handler.next(err);

    if (_refreshing) {
      final completer = Completer<void>();
      _queue.add(completer);
      await completer.future;

      try {
        final cloned = await _retry(req);
        return handler.resolve(cloned);
      } catch (_) {
        await _handleUnauthenticated();
        return handler.next(err);
      }
    }

    _refreshing = true;

    try {
      final refreshToken = await _storage.loadRefreshToken();
      if (refreshToken == null || refreshToken.isEmpty) {
        await _handleUnauthenticated();
        return handler.next(err);
      }

      // final refreshDio = Dio(
      //   BaseOptions(
      //     baseUrl: _dio.options.baseUrl,
      //     connectTimeout: _dio.options.connectTimeout,
      //     receiveTimeout: _dio.options.receiveTimeout,
      //     sendTimeout: _dio.options.sendTimeout,
      //     headers: {HttpHeaders.acceptHeader: 'application/json'},
      //     responseType: ResponseType.json,
      //   ),
      // );

      // final res = await refreshDio.post(
      //   AppEndpoints.refresh,
      //   data: {'refresh_token': refreshToken},
      //   options: Options(contentType: Headers.jsonContentType),
      // );

      // final root = (res.data is Map) ? (res.data as Map).cast<String, dynamic>() : <String, dynamic>{};
      // final dataMap = (root['data'] is Map) ? (root['data'] as Map).cast<String, dynamic>() : <String, dynamic>{};

      // final newAccess = (dataMap['access_token'] ?? '').toString();
      // final newRefresh = (dataMap['refresh_token'] ?? '').toString();

      // if (newAccess.isEmpty) {
      //   await _handleUnauthenticated();
      //   return handler.next(err);
      // }

      // await _storage.saveAccessToken(newAccess);
      // if (newRefresh.isNotEmpty) {
      //   await _storage.saveRefreshToken(newRefresh);
      // }

      for (final c in _queue) {
        c.complete();
      }
      _queue.clear();

      final cloned = await _retry(req);
      return handler.resolve(cloned);
    } catch (_) {
      for (final c in _queue) {
        c.complete();
      }
      _queue.clear();

      await _handleUnauthenticated();
      return handler.next(err);
    } finally {
      _refreshing = false;
    }
  }

  Future<Response<dynamic>> _retry(RequestOptions req) async {
    final extra = Map<String, dynamic>.from(req.extra);
    extra[_kRetried] = true;

    final options = Options(
      method: req.method,
      headers: req.headers,
      contentType: req.contentType,
      responseType: req.responseType,
      extra: extra,
      followRedirects: req.followRedirects,
      validateStatus: req.validateStatus,
      receiveDataWhenStatusError: req.receiveDataWhenStatusError,
      sendTimeout: req.sendTimeout,
      receiveTimeout: req.receiveTimeout,
    );

    return _dio.request(
      req.path,
      data: req.data,
      queryParameters: req.queryParameters,
      options: options,
      cancelToken: req.cancelToken,
      onReceiveProgress: req.onReceiveProgress,
      onSendProgress: req.onSendProgress,
    );
  }

  Future<void> _handleUnauthenticated() async {
    if (_loggedOut) return;
    _loggedOut = true;

    await _storage.clear();
    await UserBox().clearUser();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final ctx = AppOverlay.overlayContext;
      if (ctx == null) return;
      AppSnackBar.error(ctx, 'انتهت صلاحية الجلسة، قم بتسجيل الدخول من جديد');
      ctx.go('/login');
    });
  }
}

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../constants/app_endpoints.dart';
import 'auth_interceptor.dart';
import 'refresh_interceptor.dart';
import '../storage/token_storage.dart';

class ApiClient {
  ApiClient({TokenStorage? storage}) {
    final options = BaseOptions(
      baseUrl: AppEndpoints.base,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
      sendTimeout: const Duration(seconds: 20),
      headers: {HttpHeaders.acceptHeader: 'application/json'},
      responseType: ResponseType.json,
    );

    _dio = Dio(options);

    final s = storage ?? TokenStorage();

    _dio.interceptors.addAll([
      AuthInterceptor(s),
      RefreshTokenInterceptor(_dio, s),
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseBody: true,
      ),
    ]);
  }

  late final Dio _dio;

  Dio get raw => _dio;

  // -------------------------------------------------
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? query,
    bool auth = false,
    Map<String, dynamic>? headers,
  }) => _dio.get<T>(
    path,
    queryParameters: query,
    options: Options(extra: {'requiresAuth': auth}, headers: headers),
  );

  // -------------------------------------------------
  Future<Response<T>> delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? query,
    bool auth = false,
    Map<String, dynamic>? headers,
  }) => _dio.delete<T>(
    path,
    data: data,
    queryParameters: query,
    options: Options(extra: {'requiresAuth': auth}, headers: headers),
  );

  // -------------------------------------------------
  Future<Response<T>> postJson<T>(
    String path,
    Map<String, dynamic> body, {
    Map<String, dynamic>? query,
    bool auth = false,
    Map<String, dynamic>? headers,
  }) => _dio.post<T>(
    path,
    data: body,
    queryParameters: query,
    options: Options(
      contentType: Headers.jsonContentType,
      extra: {'requiresAuth': auth},
      headers: headers,
    ),
  );

  // -------------------------------------------------
  Future<Response<T>> postForm<T>(
    String path,
    FormData form, {
    Map<String, dynamic>? query,
    bool auth = false,
    Map<String, dynamic>? headers,
  }) => _dio.post<T>(
    path,
    data: form,
    queryParameters: query,
    options: Options(
      contentType: Headers.multipartFormDataContentType,
      extra: {'requiresAuth': auth},
      headers: headers,
    ),
  );

  // -------------------------------------------------
  Future<Response<T>> putJson<T>(
    String path,
    Map<String, dynamic> body, {
    Map<String, dynamic>? query,
    bool auth = false,
    Map<String, dynamic>? headers,
  }) => _dio.put<T>(
    path,
    data: body,
    queryParameters: query,
    options: Options(
      contentType: Headers.jsonContentType,
      extra: {'requiresAuth': auth},
      headers: headers,
    ),
  );

  // -------------------------------------------------
  Future<Response<T>> putForm<T>(
    String path,
    FormData form, {
    Map<String, dynamic>? query,
    bool auth = false,
    Map<String, dynamic>? headers,
  }) => _dio.put<T>(
    path,
    data: form,
    queryParameters: query,
    options: Options(
      contentType: Headers.multipartFormDataContentType,
      extra: {'requiresAuth': auth},
      headers: headers,
    ),
  );

  // -------------------------------------------------
  Future<Response<T>> patchJson<T>(
    String path,
    Map<String, dynamic> body, {
    Map<String, dynamic>? query,
    bool auth = false,
    Map<String, dynamic>? headers,
  }) => _dio.patch<T>(
    path,
    data: body,
    queryParameters: query,
    options: Options(
      contentType: Headers.jsonContentType,
      extra: {'requiresAuth': auth},
      headers: headers,
    ),
  );

  // -------------------------------------------------
  Future<Response<T>> patchForm<T>(
    String path,
    FormData form, {
    Map<String, dynamic>? query,
    bool auth = false,
    Map<String, dynamic>? headers,
  }) => _dio.patch<T>(
    path,
    data: form,
    queryParameters: query,
    options: Options(
      contentType: Headers.multipartFormDataContentType,
      extra: {'requiresAuth': auth},
      headers: headers,
    ),
  );
}

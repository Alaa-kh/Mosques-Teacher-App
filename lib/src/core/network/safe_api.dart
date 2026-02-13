import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mosques_teacher/src/core/constants/app_snack_bar.dart';
import 'package:mosques_teacher/src/core/network/error_mapper.dart';
import 'package:mosques_teacher/src/core/network/result.dart';

Future<Result<T>> safeApiCall<T>(
  BuildContext? context,
  Future<T> Function() work, {
  bool showErrorSnack = true,
}) async {
  try {
    final data = await work();
    return Result.ok(data);
  } on DioException catch (e) {
    final failure = mapDioError(e, context: context);

    String msg = failure.message;
    try {
      if (e.response?.data is Map &&
          e.response?.data['errors'] is Map<String, dynamic>) {
        final errorMap = e.response!.data['errors'] as Map<String, dynamic>;
        final buffer = StringBuffer();

        errorMap.forEach((key, value) {
          if (value is List) {
            for (var item in value) {
              buffer.writeln(item.toString());
            }
          }
        });

        final combined = buffer.toString().trim();
        if (combined.isNotEmpty) {
          msg = combined;
        }
      }
    } catch (_) {}

    print('safeApiCall DioException: $msg');

    if (showErrorSnack && context != null && context.mounted) {
      AppSnackBar.error(context, msg);
    }

    return Result.fail(failure);
  } catch (e) {
    final msg = e.toString();

    print('safeApiCall Exception: $msg');

    if (showErrorSnack && context != null && context.mounted) {
      AppSnackBar.error(context, msg);
    }

    return Result.fail(ApiFailure(msg));
  }
}

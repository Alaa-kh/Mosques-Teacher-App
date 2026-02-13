import 'package:dio/dio.dart';
import 'result.dart';
import 'package:flutter/widgets.dart';

ApiFailure mapDioError(DioException e, {BuildContext? context}) {
  try {
    if (e.response != null) {
      final data = e.response!.data;

      if (data is Map && data['message'] != null) {
        return ApiFailure(data['message'].toString());
      }

      if (data is Map &&
          data['errors'] != null &&
          data['errors'] is Map &&
          (data['errors'] as Map).values.isNotEmpty) {
        final first = (data['errors'] as Map).values.first;
        if (first is List && first.isNotEmpty) {
          return ApiFailure(first.first.toString());
        }
      }
    }

    return ApiFailure(e.message ?? "حدث خطأ");
  } catch (_) {
    return ApiFailure("خطأ غير متوقع");
  }
}

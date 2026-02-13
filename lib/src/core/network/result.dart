class ApiFailure {
  final String message;
  final int? statusCode;
  final bool isNetwork;

  const ApiFailure(this.message, {this.statusCode, this.isNetwork = false});
}

class Result<T> {
  final T? data;
  final ApiFailure? error;

  const Result._({this.data, this.error});

  bool get isOk => data != null;

  static Result<T> ok<T>(T d) => Result._(data: d);

  static Result<T> fail<T>(ApiFailure e) => Result._(error: e);

  R fold<R>(R Function(ApiFailure) onErr, R Function(T) onOk) {
    if (data != null) {
      return onOk(data as T);
    } else {
      return onErr(error ?? const ApiFailure("Unknown API error"));
    }
  }
}

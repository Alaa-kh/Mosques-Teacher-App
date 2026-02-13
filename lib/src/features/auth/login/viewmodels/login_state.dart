import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  final bool loading;
  final String? error;
  final bool loggedIn;
  final bool hidePassword;
  final String countryCode;
  final String countryFlag;
  final bool isImageFlag;

  const LoginState({
    this.loading = false,
    this.error,
    this.loggedIn = false,
    this.hidePassword = true,
    this.countryCode = '',
    this.countryFlag = '',
    this.isImageFlag = true,
  });

  LoginState copyWith({
    bool? loading,
    String? error,
    bool? loggedIn,
    bool? hidePassword,
    String? countryCode,
    String? countryFlag,
    bool? isImageFlag,
  }) {
    return LoginState(
      loading: loading ?? this.loading,
      error: error ?? this.error,
      loggedIn: loggedIn ?? this.loggedIn,
      hidePassword: hidePassword ?? this.hidePassword,
      countryCode: countryCode ?? this.countryCode,
      countryFlag: countryFlag ?? this.countryFlag,
      isImageFlag: isImageFlag ?? this.isImageFlag,
    );
  }

  @override
  List<Object?> get props => [
    loading,
    error,
    loggedIn,
    hidePassword,
    countryCode,
    countryFlag,
    isImageFlag,
  ];
}

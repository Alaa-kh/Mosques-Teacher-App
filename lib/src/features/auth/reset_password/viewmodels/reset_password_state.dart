// import 'package:equatable/equatable.dart';
// import 'package:services_provider_app/src/core/constants/app_images.dart';

// class ResetPasswordState extends Equatable {
//   final bool loading;
//   final String errorMessage;
//   final String successMessage;

//   final String countryCode;
//   final String countryFlag;
//   final bool isImageFlag;

//   const ResetPasswordState({
//     this.loading = false,
//     this.errorMessage = '',
//     this.successMessage = '',
//     this.countryCode = '+963',
//     this.countryFlag = AppImages.syria,
//     this.isImageFlag = true,
//   });

//   ResetPasswordState copyWith({
//     bool? loading,
//     String? errorMessage,
//     String? successMessage,
//     String? countryCode,
//     String? countryFlag,
//     bool? isImageFlag,
//   }) {
//     return ResetPasswordState(
//       loading: loading ?? this.loading,
//       errorMessage: errorMessage ?? this.errorMessage,
//       successMessage: successMessage ?? this.successMessage,
//       countryCode: countryCode ?? this.countryCode,
//       countryFlag: countryFlag ?? this.countryFlag,
//       isImageFlag: isImageFlag ?? this.isImageFlag,
//     );
//   }

//   @override
//   List<Object?> get props => [
//     loading,
//     errorMessage,
//     successMessage,
//     countryCode,
//     countryFlag,
//     isImageFlag,
//   ];
// }

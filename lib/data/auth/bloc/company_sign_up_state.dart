part of 'company_sign_up_bloc.dart';

@immutable
sealed class CompanySignUpState {}

final class CompanySignUpInitial extends CompanySignUpState {}

final class CompanySignUpLoading extends CompanySignUpState {}

final class CompanySignUpSuccess extends CompanySignUpState {
  final String message;

  CompanySignUpSuccess({required this.message});
}

final class CompanySignUpFailure extends CompanySignUpState {
  final String message;

  CompanySignUpFailure({required this.message});
}

final class CompanySignUpUserAlreadyExists extends CompanySignUpState {
  final String message;

  CompanySignUpUserAlreadyExists({required this.message});
}

final class CompanySignUpWrongInfo extends CompanySignUpState {
  final String message;

  CompanySignUpWrongInfo({required this.message});
}

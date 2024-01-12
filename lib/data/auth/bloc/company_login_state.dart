part of 'company_login_bloc.dart';

@immutable
sealed class CompanyLoginState {}

final class CompanyLoginInitial extends CompanyLoginState {}

final class CompanyLoginLoading extends CompanyLoginState {}

final class CompanyLoginSuccess extends CompanyLoginState {
  final CompanyDTO company;

  CompanyLoginSuccess({required this.company});
}

final class CompanyLoginUserNotfound extends CompanyLoginState {
  final String message;

  CompanyLoginUserNotfound({required this.message});
}

final class CompanyLoginWrongPassword extends CompanyLoginState {
  final String message;

  CompanyLoginWrongPassword({required this.message});
}

final class CompanyLoginFailure extends CompanyLoginState {
  final String message;

  CompanyLoginFailure({required this.message});
}

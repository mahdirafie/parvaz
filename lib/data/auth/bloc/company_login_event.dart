part of 'company_login_bloc.dart';

@immutable
sealed class LoginEvent {}

class CompanyLoginButtonClicked extends LoginEvent {
  final CompanyDTO companyDTO;

  CompanyLoginButtonClicked({required this.companyDTO});

}

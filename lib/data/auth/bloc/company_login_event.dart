part of 'company_login_bloc.dart';

@immutable
sealed class LoginEvent {}

class CompanyLoginButtonClicked extends LoginEvent {
  final int idMeli;
  final int sabt;

  CompanyLoginButtonClicked({required this.idMeli, required this.sabt});
}

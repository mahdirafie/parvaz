part of 'company_sign_up_bloc.dart';

@immutable
sealed class CompanySignUpEvent {}

class CompanySignUpButtonClicked extends CompanySignUpEvent {
  final int idMeli;
  final int sabt;

  CompanySignUpButtonClicked({required this.idMeli, required this.sabt});


}

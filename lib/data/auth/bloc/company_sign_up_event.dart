part of 'company_sign_up_bloc.dart';

@immutable
sealed class CompanySignUpEvent {}

class CompanySignUpButtonClicked extends CompanySignUpEvent {
  final CompanyDTO companyDTO;

  CompanySignUpButtonClicked({required this.companyDTO});


}

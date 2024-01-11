part of 'student_login_bloc.dart';

@immutable
sealed class StudentLoginEvent {}

class StudentLoginButtonClicked extends StudentLoginEvent {
  final int code_meli;
  final String password;

  StudentLoginButtonClicked({required this.code_meli, required this.password});


}

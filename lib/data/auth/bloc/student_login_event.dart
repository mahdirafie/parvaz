part of 'student_login_bloc.dart';

@immutable
sealed class StudentLoginEvent {}

class StudentLoginButtonClicked extends StudentLoginEvent {
  final String codeMeli;
  final String password;

  StudentLoginButtonClicked({required this.codeMeli, required this.password});


}

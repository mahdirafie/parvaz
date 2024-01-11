part of 'student_sign_up_bloc.dart';

@immutable
sealed class StudentSignUpEvent {}

class StudentSignUpButtonClicked extends StudentSignUpEvent {
  final int code_meli;
  final String daneshgah;
  final String password;

  StudentSignUpButtonClicked(
      {required this.code_meli,
      required this.daneshgah,
      required this.password});
}

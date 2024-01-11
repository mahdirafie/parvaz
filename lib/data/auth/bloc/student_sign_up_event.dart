part of 'student_sign_up_bloc.dart';

@immutable
sealed class StudentSignUpEvent {}

class StudentSignUpButtonClicked extends StudentSignUpEvent {
  final int codeMeli;
  final String daneshgah;
  final String password;

  StudentSignUpButtonClicked(
      {required this.codeMeli,
      required this.daneshgah,
      required this.password});
}

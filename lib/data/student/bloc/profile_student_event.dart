part of 'profile_student_bloc.dart';

@immutable
sealed class ProfileStudentEvent {}

class StudentProfileScreenStarted implements ProfileStudentEvent{
  final int meli;

  StudentProfileScreenStarted({required this.meli});
}

class StudentChangeResume implements ProfileStudentEvent{
  final String resume;

  StudentChangeResume({required this.resume});
}

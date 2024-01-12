part of 'profile_student_bloc.dart';

@immutable
sealed class ProfileStudentState {}

final class ProfileStudentInitial extends ProfileStudentState {}

final class ProfileStudentLoading extends ProfileStudentState{

}

final class ProfileStudentSuccess extends ProfileStudentState{
  final StudentDTO student;

  ProfileStudentSuccess({required this.student});
}

final class ProfileStudentFailed extends ProfileStudentState{
  final String message;

  ProfileStudentFailed({required this.message});
}
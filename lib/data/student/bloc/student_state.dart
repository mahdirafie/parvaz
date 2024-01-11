part of 'student_bloc.dart';

@immutable
sealed class StudentState {}

final class StudentInitial extends StudentState {}

final class StudentGetFailed extends StudentState{
final String message;

  StudentGetFailed({required this.message});
}

final class StudentGetSuccess extends StudentState{
  final List<StudentDTO> students;

  StudentGetSuccess({required this.students});

}

final class StudentGetLoading extends StudentState{}

final class StudentGetAllServer extends StudentState{
  final String message;

  StudentGetAllServer({required this.message});

}

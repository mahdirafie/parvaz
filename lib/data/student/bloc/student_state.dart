part of 'student_bloc.dart';

@immutable
sealed class StudentGetState {}

final class StudentInitial extends StudentGetState {}

final class StudentGetFailed extends StudentGetState{
final String message;

  StudentGetFailed({required this.message});
}

final class StudentGetSuccess extends StudentGetState{
  final List<StudentDTO> students;

  StudentGetSuccess({required this.students});

}

final class StudentGetLoading extends StudentGetState{}

final class StudentGetAllServer extends StudentGetState{
  final String message;

  StudentGetAllServer({required this.message});

}

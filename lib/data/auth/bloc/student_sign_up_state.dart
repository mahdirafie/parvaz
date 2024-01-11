part of 'student_sign_up_bloc.dart';

@immutable
sealed class StudentSignUpState {}

final class StudentSignUpInitial extends StudentSignUpState {}

final class StudentSignUpLoading extends StudentSignUpState {}

final class StudentSignUpSuccess extends StudentSignUpState {
  final String message;

  StudentSignUpSuccess({required this.message});
}

final class StudentSignUpFailure extends StudentSignUpState {
  final String message;

  StudentSignUpFailure({required this.message});
}

final class StudentSignUpWrongInfo extends StudentSignUpState {
  final String message;

  StudentSignUpWrongInfo({required this.message});
}

final class StudentSignUpUserAlreadyExists extends StudentSignUpState {
  final String message;

  StudentSignUpUserAlreadyExists({required this.message});
}

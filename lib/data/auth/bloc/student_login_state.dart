part of 'student_login_bloc.dart';

@immutable
sealed class StudentLoginState {}

final class StudentLoginInitial extends StudentLoginState {}

final class StudentLoginLoading extends StudentLoginState {}

final class StudentLoginSuccess extends StudentLoginState {
  final String message;

  StudentLoginSuccess({required this.message});
}

final class StudentLoginUserNotfound extends StudentLoginState {
  final String message;

  StudentLoginUserNotfound({required this.message});
}

final class StudentLoginWrongPassword extends StudentLoginState {
  final String message;

  StudentLoginWrongPassword({required this.message});
}

final class StudentLoginFailure extends StudentLoginState {
  final String message;

  StudentLoginFailure({required this.message});
}

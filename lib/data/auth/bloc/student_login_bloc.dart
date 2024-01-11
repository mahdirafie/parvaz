import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:parvaz_event/data/auth/repository/student_auth_repo.dart';
import 'package:parvaz_event/data/exception.dart';

part 'student_login_event.dart';
part 'student_login_state.dart';

class StudentLoginBloc extends Bloc<StudentLoginEvent, StudentLoginState> {
  final IStudentAuthRepository authRepository;
  StudentLoginBloc(this.authRepository) : super(StudentLoginInitial()) {
    on<StudentLoginEvent>((event, emit) async {
      if (event is StudentLoginButtonClicked) {
        try {
          emit(StudentLoginLoading());
          await authRepository.login(event.codeMeli, event.password);
        } on StudentLoginSuccess catch (_) {
          emit(StudentLoginSuccess(message: 'ورود با موفقیت انجام شد!'));
        } on LoginUserNotFoundException catch (_) {
          emit(StudentLoginUserNotfound(message: _.message));
        } on LoginWrongPasswordException catch (_) {
          emit(StudentLoginWrongPassword(message: _.message));
        } catch (_) {
          emit(StudentLoginFailure(message: 'خطا در ورود!'));
        }
      }
    });
  }
}

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:parvaz_event/data/auth/repository/student_auth_repo.dart';
import 'package:parvaz_event/data/exception.dart';

part 'student_sign_up_event.dart';
part 'student_sign_up_state.dart';

class StudentSignUpBloc extends Bloc<StudentSignUpEvent, StudentSignUpState> {
  final IStudentAuthRepository authRepository;
  StudentSignUpBloc(this.authRepository) : super(StudentSignUpInitial()) {
    on<StudentSignUpEvent>((event, emit) async {
      if (event is StudentSignUpButtonClicked) {
        try {
          emit(StudentSignUpLoading());
          await authRepository.signUp(event.codeMeli, event.daneshgah,
              event.password);
          emit(StudentSignUpSuccess(message: 'با موفقیت ثبت نام شدید!'));
        } on SignUpUserAlreadyExistsException catch (_) {
          emit(StudentSignUpUserAlreadyExists(message: _.message));
        } on SignUpWrongInfo catch (_) {
          emit(StudentSignUpWrongInfo(message: _.message));
        } catch (e) {
          emit(StudentSignUpFailure(message: 'ثبت نام با خطا مواجه شد!'));
        }
      }
    });
  }
}

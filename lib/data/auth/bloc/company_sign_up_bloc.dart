import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:parvaz_event/data/auth/repository/company_auth_repo.dart';
import 'package:parvaz_event/data/exception.dart';

part 'company_sign_up_event.dart';
part 'company_sign_up_state.dart';

class CompanySignUpBloc extends Bloc<CompanySignUpEvent, CompanySignUpState> {
  final ICompanyAuthRepository authRepository;
  CompanySignUpBloc(this.authRepository) : super(CompanySignUpInitial()) {
    on<CompanySignUpEvent>((event, emit) async {
      if (event is CompanySignUpButtonClicked) {
        try {
          emit(CompanySignUpLoading());
          await authRepository.signUp(event.idMeli, event.sabt);
        } on CompanySignUpSuccess catch (_) {
          emit(CompanySignUpSuccess(message: 'با موفقیت ثبت نام شدید!'));
        } on SignUpUserAlreadyExistsException catch (_) {
          emit(CompanySignUpUserAlreadyExists(message: _.message));
        } catch (e) {
          emit(CompanySignUpFailure(message: 'ثبت نام با خطا مواجه شد!'));
        }
      }
    });
  }
}

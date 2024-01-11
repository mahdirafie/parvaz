import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:parvaz_event/data/DTO/companyDTO.dart';
import 'package:parvaz_event/data/auth/repository/company_auth_repo.dart';
import 'package:parvaz_event/data/exception.dart';

part 'company_login_event.dart';
part 'company_login_state.dart';

class CompanyLoginBloc extends Bloc<LoginEvent, CompanyLoginState> {
  final ICompanyAuthRepository authRepository;
  CompanyLoginBloc(this.authRepository) : super(CompanyLoginInitial()) {
    on<LoginEvent>((event, emit) async {
      if (event is CompanyLoginButtonClicked) {
        try {
          emit(CompanyLoginLoading());
          await authRepository.login(event.companyDTO);
          emit(CompanyLoginSuccess(message: 'ورود با موفقیت انجام شد!'));
        } on LoginUserNotFoundException catch (_) {
          emit(CompanyLoginUserNotfound(message: _.message));
        } on LoginWrongPasswordException catch (_) {
          emit(CompanyLoginWrongPassword(message: _.message));
        } catch (_) {
          emit(CompanyLoginFailure(message: 'خطا در ورود!'));
        }
      }
    });
  }
}

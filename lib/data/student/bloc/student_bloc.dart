import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:parvaz_event/data/DTO/studentDTO.dart';
import 'package:parvaz_event/data/exception.dart';
import 'package:parvaz_event/data/student/student_repo.dart';

part 'student_event.dart';
part 'student_state.dart';

class GetStudentBloc extends Bloc<StudentGetEvent, StudentGetState> {
  final IStudentRepository getAllStudentRepository;
  GetStudentBloc(this.getAllStudentRepository) : super(StudentGetLoading()) {
    on<StudentGetEvent>((event, emit)async {
      if(event is CompanyLayoutScreenStarted){
        try{
          emit(StudentGetLoading());
          final result = await getAllStudentRepository.getAllStudent();
          emit(StudentGetSuccess(students: result));
        } on GetAllStudentNotFound catch(_){
          emit(StudentGetFailed(message: "داده ای یافت نشد"));
        }on GetAllStudentServer catch(_){
          emit(StudentGetAllServer(message: "سرور مشکل دارد"));
        } catch (_) {
          emit(StudentGetFailed(message: 'خطا'));
        }
      }
    });
  }
}

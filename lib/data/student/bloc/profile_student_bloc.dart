import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:parvaz_event/data/DTO/studentDTO.dart';
import 'package:parvaz_event/data/student/student_repo.dart';

part 'profile_student_event.dart';
part 'profile_student_state.dart';

class ProfileStudentBloc extends Bloc<ProfileStudentEvent, ProfileStudentState> {
  final IStudentRepository getProfile;
  ProfileStudentBloc(this.getProfile) : super(ProfileStudentLoading()) {
    on<ProfileStudentEvent>((event, emit) async{
      if (event is StudentProfileScreenStarted){
        try{
          final result = await getProfile.studentProfile(event.meli);
          emit(ProfileStudentSuccess(student: result));
        }on ProfileStudentFailed catch(_){
          emit(ProfileStudentFailed(message: 'مشکل نا مشخص'));
        }
      }else if(event is StudentChangeResume){
        /*try{
          await getProfile.;
        }*/
      }
    });
  }
}

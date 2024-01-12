import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:parvaz_event/data/exception.dart';
import 'package:parvaz_event/data/minor/minor_repo.dart';

part 'minor_event.dart';
part 'minor_state.dart';

class MinorBloc extends Bloc<MinorEvent, MinorState> {
  final IMinorRepository minor;
  MinorBloc(this.minor) : super(PopularSkillLoading()) {
    on<MinorEvent>((event, emit)async {
      if(event is GetPopularSkills){
        try{
          emit(PopularSkillLoading());
          final result = await minor.getPopular();
          emit(PopularSkillSuccess( list: result));
        }on NotFound catch (_){
          emit(PopularSkillFailed(message: "مشکلی وجود دارد"));
        }
      }
    });
  }
}

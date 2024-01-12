import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:parvaz_event/data/auth/repository/company_cooperate_repo.dart';
import 'package:parvaz_event/data/exception.dart';

part 'cooperation_event.dart';
part 'cooperation_state.dart';

class CooperationBloc extends Bloc<CooperationEvent, CooperationState> {
  final ICooperateRepository repository;
  CooperationBloc(this.repository) : super(CooperationInitial()) {
    on<CooperationEvent>((event, emit) async {
      if (event is CooperationButtonClicked) {
        try {
          emit(CooperationLoading());
          await repository.createCooperation(event.codeMeli, event.shenaseComp,
              event.explanation, event.isConfirmed);
          emit(CooperationSuccess(
              message: 'دعوت به همکاری با موفقیت انجام شد!'));
        } on CooperationRequestAlreadyMadeException catch (e) {
          emit(CooperationFailure(message: e.message));
        } catch (e) {
          emit(CooperationFailure(message: 'دعوت به همکاری با خطا مواجه شد!'));
        }
      } else if (event is SaveForCooperationButtonClicked) {
        try {
          emit(SaveForCooperationLoading());
          await repository.saveForCooperation(event.codeMeli, event.shenaseComp,
              event.explanation, event.isConfirmed);
          emit(SaveForCooperationSuccess(message: 'با موفقیت ذخیره شد!'));
        } on SaveForCooperationRequestAlreadyMadeException catch (e) {
          emit(CooperationFailure(message: e.message));
        }catch (e) {
          emit(SaveForCooperationFailure(
              message: 'ذخیره سازی با خطا مواجه شد!'));
        }
      }
    });
  }
}

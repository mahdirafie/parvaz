import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:parvaz_event/data/DTO/companyDTO.dart';
import 'package:parvaz_event/data/exception.dart';
import 'package:parvaz_event/data/notification/notification_repo.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final INotificationRepository getAllNotification;
  NotificationBloc(this.getAllNotification) : super(GetAllNotificationLoading()) {
    on<NotificationEvent>((event, emit)async {
      if(event is GetAllNotification){
        try{
          emit(GetAllNotificationLoading());
          final result = await getAllNotification.getAllNotification(event.meli);
          print(result);
          emit(GetAllNotificationSuccess(companys: result));
        }on GetAllStudentNotFound catch(_){
          emit(GetAllNotificationFailed(message: "پیامی یافت نشد"));
        }
      }
    });
  }
}

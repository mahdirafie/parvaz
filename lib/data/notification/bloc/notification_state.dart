part of 'notification_bloc.dart';

@immutable
sealed class NotificationState {}

final class NotificationInitial extends NotificationState {}

final class GetAllNotificationLoading implements NotificationState{}

final class GetAllNotificationSuccess implements NotificationState{
  final List<CompanyDTO> companys;

  GetAllNotificationSuccess({required this.companys});
}

final class GetAllNotificationFailed implements NotificationState{
  final String message;

  GetAllNotificationFailed({required this.message});
}
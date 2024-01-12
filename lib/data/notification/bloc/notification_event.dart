part of 'notification_bloc.dart';

@immutable
sealed class NotificationEvent {}

class GetAllNotification implements NotificationEvent{
  final int meli;

  GetAllNotification({required this.meli});
}

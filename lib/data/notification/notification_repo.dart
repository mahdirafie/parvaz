import 'package:parvaz_event/data/DTO/companyDTO.dart';
import 'package:parvaz_event/data/httpclient.dart';
import 'package:parvaz_event/data/notification/notification_data_source.dart';

final NotificationRemoteRepository getAllNotification =
    NotificationRemoteRepository(
        dataSource: NotificationRemoteDataSource(httpClient: httpClient));

abstract class INotificationRepository {
  Future<List<CompanyDTO>> getAllNotification(int meli);
}

class NotificationRemoteRepository implements INotificationRepository {
  final INotificationDataSource dataSource;

  NotificationRemoteRepository({required this.dataSource});

  @override
  Future<List<CompanyDTO>> getAllNotification(int meli) {
    return dataSource.getAllNotification(meli);
  }
}

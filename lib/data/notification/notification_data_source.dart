

import 'package:dio/dio.dart';
import 'package:parvaz_event/data/DTO/companyDTO.dart';

abstract class INotificationDataSource {
  Future<List<CompanyDTO>> getAllNotification(int meli);
}

class NotificationRemoteDataSource implements INotificationDataSource{
  final Dio httpClient;

  NotificationRemoteDataSource({required this.httpClient});

  @override
  Future<List<CompanyDTO>> getAllNotification(int meli) async {
    try {
      final response = await httpClient.post(
          '/Cooperation/notif', data: {'code_meli': meli.toString()});
      List<CompanyDTO> comapny = [];
      print(response);
      for (var item in response.data) {
        comapny.add(CompanyDTO.fromJson(item));
      }
      print(response);
      return comapny;
    } on DioException catch (dioException) {
      if (dioException.response != null) {
        throw();
      }
      List<CompanyDTO> comapny = [];
      return comapny;
    }
  }
}
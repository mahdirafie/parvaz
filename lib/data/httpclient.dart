import 'package:dio/dio.dart';
import 'package:parvaz_event/data/exception.dart';

final Dio httpClient =
    Dio(BaseOptions(baseUrl: ''));

mixin httpResponseValidator {
  validateResponse(Response<dynamic> response) {
    if (response.statusCode != 200) {
      throw AppException();
    }
  }
}

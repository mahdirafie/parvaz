

import 'package:dio/dio.dart';
import 'package:parvaz_event/data/exception.dart';

abstract class ICompanyAuthDataSource {
  Future<void> signUp(int idMeli, int sabt);
  Future<void> login(int idMeli, int sabt);
}

class CompanyAuthRemoteDataSource implements ICompanyAuthDataSource{
  final Dio httpClient;

  CompanyAuthRemoteDataSource({required this.httpClient});
  @override
  Future<void> login(int idMeli, int sabt)async {
    try{
      await httpClient.post('',data: {'' : idMeli, '':sabt});
    }on DioException catch (dioException) {
      if (dioException.response != null) {
        if (dioException.response!.statusCode == 403) {
          throw LoginWrongPasswordException();
        } else if (dioException.response!.statusCode == 404) {
          throw LoginUserNotFoundException();
        }
      }
    }catch (_) {
      throw AppException();
    }
  }

  @override
  Future<void> signUp(int idMeli, int sabt) async{
    try{
      await httpClient.post('', data:{'':idMeli, '':sabt});
    }on DioException catch (dioException) {
      if (dioException.response != null) {
        if (dioException.response!.statusCode == 403) {
          throw LoginWrongPasswordException();
        } else if (dioException.response!.statusCode == 404) {
          throw LoginUserNotFoundException();
        }
      }
    }catch (_) {
      throw AppException();
    }
  }

}
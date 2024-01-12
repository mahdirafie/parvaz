import 'package:dio/dio.dart';
import 'package:parvaz_event/data/exception.dart';

abstract class ICooperateDataSource {
  Future<void> createCooperation(String studentIdCode, String shenaseComp,
      String explanation, bool isConfirmed);
  Future<void> saveForCooperation(String studentIdCode, String shenaseComp,
      String explanation, bool isConfirmed);
}

class CooperateRemoteDataSource implements ICooperateDataSource {
  final Dio httpClient;

  CooperateRemoteDataSource({required this.httpClient});
  @override
  Future<void> createCooperation(String studentIdCode, String shenaseComp,
      String explanation, bool isConfirmed) async {
    try {
      await httpClient.post('/Cooperation/create', data: {
        "code_meli": studentIdCode,
        "shenase_meli": shenaseComp,
        "explanation": explanation,
        "taiid_shode": true
      });
    } on DioException catch (dioException) {
      if (dioException.response != null) {
        if (dioException.response!.statusCode == 403) {
          throw CooperationRequestAlreadyMadeException();
        } 
      }
    } catch (_) {
      throw AppException();
    }
  }

  @override
  Future<void> saveForCooperation(String studentIdCode, String shenaseComp,
      String explanation, bool isConfirmed) async {
    try {
      await httpClient.post('/Cooperation/create', data: {
        "code_meli": studentIdCode,
        "shenase_meli": shenaseComp,
        "explanation": explanation,
        "taiid_shode": false
      });
    } on DioException catch (dioException) {
      if (dioException.response != null) {
        if (dioException.response!.statusCode == 403) {
          throw SaveForCooperationRequestAlreadyMadeException();
        } 
      }
    } catch (_) {
      throw AppException();
    }
  }
}
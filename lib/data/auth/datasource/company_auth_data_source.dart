import 'package:dio/dio.dart';
import 'package:parvaz_event/data/DTO/companyDTO.dart';
import 'package:parvaz_event/data/exception.dart';

abstract class ICompanyAuthDataSource {
  Future<void> signUp(CompanyDTO companyDTO);

  Future<void> login(CompanyDTO companyDTO);
}

class CompanyAuthRemoteDataSource implements ICompanyAuthDataSource {
  final Dio httpClient;

  CompanyAuthRemoteDataSource({required this.httpClient});

  @override
  Future<void> login(CompanyDTO companyDTO) async {
    try {
      await httpClient.post('/company/login',
          data: {
            'shenase_meli': companyDTO.shenaseMeli,
            'shomare_sabt': companyDTO.shomareSabt,
          });
    } on DioException catch (dioException) {
      if (dioException.response != null) {
        if (dioException.response!.statusCode == 403) {
          throw LoginWrongPasswordException();
        } else if (dioException.response!.statusCode == 404) {
          throw LoginUserNotFoundException();
        }
      }
    } catch (_) {
      throw AppException();
    }
  }

  @override
  Future<void> signUp(CompanyDTO companyDTO) async {
    try {
      await httpClient.post('/company/signup', data: {
        'company_name': companyDTO.companyName,
        'shenase_meli': companyDTO.shenaseMeli,
        'shomare_sabt': companyDTO.shomareSabt,
        'address' : companyDTO.address
      });
    } on DioException catch (dioException) {
      if (dioException.response != null) {
        if (dioException.response!.statusCode == 403) {
          throw SignUpUserAlreadyExistsException();
        } else if (dioException.response!.statusCode == 404) {
          throw LoginUserNotFoundException();
        }
      }
    } catch (_) {
      throw AppException();
    }
  }
}

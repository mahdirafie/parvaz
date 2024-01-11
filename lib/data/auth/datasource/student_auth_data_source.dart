import 'package:dio/dio.dart';
import 'package:parvaz_event/data/exception.dart';

abstract class IStudentAuthDataSource {
  Future<void> signUp(String codeMeli, String daneshgah, String password);

  Future<void> login(String codeMeli, String password);
}

class StudentAuthRemoteDataSource implements IStudentAuthDataSource {
  final Dio httpClient;

  StudentAuthRemoteDataSource({required this.httpClient});

  @override
  Future<void> login(String codeMeli, String password) async {
    try {
      await httpClient
          .post('/login', data: {'code_meli': codeMeli, 'password': password});
    } on DioException catch (dioException) {
      if (dioException.response != null) {
        if (dioException.response!.statusCode == 403) {
          throw LoginWrongPasswordException();
        } else if (dioException.response!.statusCode == 404) {
          throw LoginUserNotFoundException();
        } else if (dioException.response!.statusCode == 400){
          throw LoginWrongInfo();
        }
      }
    } catch (_) {
      throw AppException();
    }
  }

  @override
  Future<void> signUp(
      String codeMeli, String daneshgah, String password) async {
    try {
      await httpClient.post('/signup', data: {
        'code_meli': codeMeli,
        'daneshgah': daneshgah,
        'password': password
      });
    } on DioException catch (dioException) {
      if (dioException.response != null) {
        if (dioException.response!.statusCode == 403) {
          throw SignUpUserAlreadyExistsException();
        } else if (dioException.response!.statusCode == 400) {
          throw SignUpWrongInfo();
        }
      }
    } catch (_) {
      throw AppException();
    }
  }
}

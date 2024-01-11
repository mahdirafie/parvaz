import 'package:dio/dio.dart';
import 'package:parvaz_event/data/exception.dart';

abstract class IStudentAuthDataSource {
  Future<void> signUp(int code_meli, String daneshgah, String password);
  Future<void> login(int code_meli, String password);
}

class StudentAuthRemoteDataSource implements IStudentAuthDataSource{
  final Dio httpClient;

  StudentAuthRemoteDataSource({required this.httpClient});
  @override
  Future<void> login(int code_meli, String password)async {
    try{
      await httpClient.post('login',data: {'code_meli':code_meli,'password':password});
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
  Future<void> signUp(int code_meli, String daneshgah, String password) async{
    try{
      await httpClient.post('signup', data: {'code_meli':code_meli, 'daneshgah':daneshgah, 'password':password});
    }on DioException catch (dioException) {
      if (dioException.response != null) {
        if (dioException.response!.statusCode == 403) {
          throw SignUpUserAlreadyExistsException();
        }
      }
    } catch (_) {
      throw AppException();
    }
  }

}
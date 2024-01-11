import 'package:dio/dio.dart';
import 'package:parvaz_event/data/datasource/student_auth_data_source.dart';
import 'package:parvaz_event/data/httpclient.dart';

final StudentAuthRemoteRepository authRepository = StudentAuthRemoteRepository(
    dataSource: StudentAuthRemoteDataSource(httpClient: httpClient));

abstract class IStudentAuthRepository {
  Future<void> signUp(int code_meli, String daneshgah, String password);
  Future<void> login(int code_meli, String password);
}

class StudentAuthRemoteRepository implements IStudentAuthRepository {
  final IStudentAuthDataSource dataSource;

  StudentAuthRemoteRepository({required this.dataSource});
  @override
  Future<void> login(int code_meli, String password) {
    return dataSource.login(code_meli, password);
  }

  @override
  Future<void> signUp(int code_meli, String daneshgah, String password) {
    return dataSource.signUp(code_meli, daneshgah, password);
  }
}

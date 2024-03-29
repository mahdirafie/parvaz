import 'package:parvaz_event/data/auth/datasource/student_auth_data_source.dart';
import 'package:parvaz_event/data/httpclient.dart';

final StudentAuthRemoteRepository studentAuthRepository = StudentAuthRemoteRepository(
    dataSource: StudentAuthRemoteDataSource(httpClient: httpClient));

abstract class IStudentAuthRepository {
  Future<void> signUp(String codeMeli, String daneshgah, String password);
  Future<void> login(String codeMeli, String password);
}

class StudentAuthRemoteRepository implements IStudentAuthRepository {
  final IStudentAuthDataSource dataSource;

  StudentAuthRemoteRepository({required this.dataSource});
  @override
  Future<void> login(String codeMeli, String password) {
    return dataSource.login(codeMeli, password);
  }

  @override
  Future<void> signUp(String codeMeli, String daneshgah, String password) {
    return dataSource.signUp(codeMeli, daneshgah, password);
  }
}

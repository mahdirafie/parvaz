import 'package:parvaz_event/data/auth/datasource/company_auth_data_source.dart';
import 'package:parvaz_event/data/httpclient.dart';


final CompanyAuthRemoteRepository companyAuthRepository = CompanyAuthRemoteRepository(
    dataSource: CompanyAuthRemoteDataSource(httpClient: httpClient));

abstract class ICompanyAuthRepository {
  Future<void> signUp(int idMeli, int sabt);
  Future<void> login(int idMeli, int sabt);
}

class CompanyAuthRemoteRepository implements ICompanyAuthRepository {
  final ICompanyAuthDataSource dataSource;

  CompanyAuthRemoteRepository({required this.dataSource});
  @override
  Future<void> login(int idMeli, int sabt) {
    return dataSource.login(idMeli, sabt);
  }

  @override
  Future<void> signUp(int idMeli, int sabt) {
    return dataSource.signUp(idMeli, sabt);
  }
}

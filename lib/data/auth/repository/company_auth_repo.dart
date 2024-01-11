import 'package:parvaz_event/data/DTO/companyDTO.dart';
import 'package:parvaz_event/data/auth/datasource/company_auth_data_source.dart';
import 'package:parvaz_event/data/httpclient.dart';


final CompanyAuthRemoteRepository companyAuthRepository = CompanyAuthRemoteRepository(
    dataSource: CompanyAuthRemoteDataSource(httpClient: httpClient));

abstract class ICompanyAuthRepository {
  Future<void> signUp(CompanyDTO companyDTO);
  Future<void> login(CompanyDTO companyDTO);
}

class CompanyAuthRemoteRepository implements ICompanyAuthRepository {
  final ICompanyAuthDataSource dataSource;

  CompanyAuthRemoteRepository({required this.dataSource});
  @override
  Future<void> login(CompanyDTO companyDTO) {
    return dataSource.login(companyDTO);
  }

  @override
  Future<void> signUp(CompanyDTO companyDTO) {
    return dataSource.signUp(companyDTO);
  }
}

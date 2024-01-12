import 'package:parvaz_event/data/auth/datasource/company_cooperate_data_source.dart';
import 'package:parvaz_event/data/httpclient.dart';

final CooperateRemoteRepository cooperateRepository = CooperateRemoteRepository(dataSource: CooperateRemoteDataSource(httpClient: httpClient));

abstract class ICooperateRepository {
    Future<void> createCooperation(String studentIdCode, String shenaseComp,
      String explanation, bool isConfirmed);
      Future<void> saveForCooperation(String studentIdCode, String shenaseComp,
      String explanation, bool isConfirmed);
}

class CooperateRemoteRepository implements ICooperateRepository {
  final ICooperateDataSource dataSource;

  CooperateRemoteRepository({required this.dataSource});
  @override
  Future<void> createCooperation(String studentIdCode, String shenaseComp, String explanation, bool isConfirmed) {
    return dataSource.createCooperation(studentIdCode, shenaseComp, explanation, isConfirmed);
  }
  
  @override
  Future<void> saveForCooperation(String studentIdCode, String shenaseComp, String explanation, bool isConfirmed) {
    return dataSource.saveForCooperation(studentIdCode, shenaseComp, explanation, isConfirmed);
  }

}
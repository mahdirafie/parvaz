

import 'package:parvaz_event/data/httpclient.dart';
import 'package:parvaz_event/data/minor/minor_data_source.dart';

final MinorRemoteRepository minorRepository = MinorRemoteRepository(
  dataSource:MinorRemoteDataSource(httpClient: httpClient)
);

abstract class IMinorRepository{
  Future<Map<String, int>>getPopular();
  Future<void> setSkill(String codeMeli, String skill);
}

class MinorRemoteRepository implements IMinorRepository{
  final IMinorDataSource dataSource;

  MinorRemoteRepository({required this.dataSource});

  @override
  Future<Map<String, int>> getPopular() {
    return dataSource.getPopular();
  }

  @override
  Future<void> setSkill(String codeMeli, String skill) {
    return dataSource.setSkill(codeMeli,skill);
  }

}
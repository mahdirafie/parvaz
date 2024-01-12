

import 'package:parvaz_event/data/httpclient.dart';
import 'package:parvaz_event/data/minor/minor_data_source.dart';

final MinorRemoteRepository minorRepository = MinorRemoteRepository(
  dataSource:MinorRemoteDataSource(httpClient: httpClient)
);

abstract class IMinorRepository{
  Future<Map<String, int>>getPopular();
}

class MinorRemoteRepository implements IMinorRepository{
  final IMinorDataSource dataSource;

  MinorRemoteRepository({required this.dataSource});

  @override
  Future<Map<String, int>> getPopular() {
    return dataSource.getPopular();
  }
}
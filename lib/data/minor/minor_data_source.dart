
import 'package:dio/dio.dart';

abstract class IMinorDataSource{
  Future<Map<String, int>>getPopular();
  Future<void> setSkill(String codeMeli, String skill);
}

class MinorRemoteDataSource implements IMinorDataSource{
  final Dio httpClient;

  MinorRemoteDataSource({required this.httpClient});

  @override
  Future<Map<String, int>> getPopular()async {
    try{
      Map<String, int> map = {};
      final response = await httpClient.get('/skill/popularskills');
      for(var item in response.data){
        map[item['maharat']] = int.parse("${item['maharat_count']}");
      }
      var sortedEntries = map.entries.toList()..sort((a, b) => b.value.compareTo(a.value));
      var sortedMap = Map.fromEntries(sortedEntries);

      return sortedMap;
    }on DioException catch (dioException){
      throw();
    }
    throw UnimplementedError();
  }

  @override
  Future<void> setSkill(String codeMeli, String skill)async {
    try{
      await httpClient.post('/skill/create',data: {'code_meli' : codeMeli, 'maharat':skill});
    }on DioException catch (dioException){
      throw();
    }
  }
}
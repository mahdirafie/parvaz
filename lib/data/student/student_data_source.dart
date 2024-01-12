import 'package:dio/dio.dart';
import 'package:parvaz_event/data/DTO/studentDTO.dart';
import 'package:parvaz_event/data/exception.dart';

abstract class IStudentDataSource {
  Future<List<StudentDTO>> getAllStudent();
  Future<void> studentChange(String resume);
  Future<StudentDTO> studentProfile(int meli);
}

class StudentRemoteDataSource implements IStudentDataSource {
  final Dio httpClient;

  StudentRemoteDataSource({required this.httpClient});

  @override
  Future<List<StudentDTO>> getAllStudent() async {
    try {
      final response = await httpClient.get('/user/all');
      List<StudentDTO> students = [];
      for (var item in response.data) {
        students.add(StudentDTO.fromJson(item));
      }
      return students;
    } on DioException catch (dioException) {
      if (dioException.response != null) {
        if (dioException.response!.statusCode == 404) {
          throw GetAllStudentNotFound();
        } else if (dioException.response!.statusCode == 500) {
          throw GetAllStudentServer();
        }
      }
    } catch (_) {
      throw AppException();
    }
    return [];
  }

  @override
  Future<StudentDTO> studentProfile(int meli) async{
    try{
      final response = await httpClient.post('/user/profile',data: {'code_meli':meli.toString()});
      print(StudentDTO.fromJson(response.data).daneshgah);
      return (StudentDTO.fromJson(response.data));
    }on DioException catch (dioException){
      if(dioException.response != null){
        if (dioException.response!.statusCode == 404){
          throw ProfileUserNotFound();
        } else if (dioException.response!.statusCode == 400){
          throw ProfileBadRequest();
        }else if (dioException.response!.statusCode == 500){
          throw GetAllStudentServer();
        }
      }
    }catch (_) {
      throw AppException();
    }
    throw UnimplementedError();
  }

  @override
  Future<void> studentChange(String resume) async{
    /*try{
      await httpClient.put('/user/complete',data: {'':resume});
    }*/
    throw UnimplementedError();
  }

  
}

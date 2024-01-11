

import 'package:dio/dio.dart';
import 'package:parvaz_event/data/DTO/studentDTO.dart';
import 'package:parvaz_event/data/exception.dart';

abstract class IStudentDataSource{
  Future<List<StudentDTO>> getAllStudent();
}

class StudentRemoteDataSource implements IStudentDataSource{
  final Dio httpClient;

  StudentRemoteDataSource({required this.httpClient});

  @override
  Future<List<StudentDTO>> getAllStudent()async {
    try {
      final response = await httpClient.get('/user/all');
      List<StudentDTO> students = [];
      for(var item in response.data) {
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
    }catch (_) {
      throw AppException();
    }
    List<StudentDTO> students = [];
    return students;
  }
}
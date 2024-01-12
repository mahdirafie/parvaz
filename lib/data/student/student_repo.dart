

import 'package:parvaz_event/data/DTO/studentDTO.dart';
import 'package:parvaz_event/data/httpclient.dart';
import 'package:parvaz_event/data/student/student_data_source.dart';

final StudentRemoteRepository studentRepository = StudentRemoteRepository(
  dataSource: StudentRemoteDataSource(httpClient: httpClient)
);

abstract class IStudentRepository{
  Future<List<StudentDTO>> getAllStudent();
  Future<StudentDTO> studentProfile(int meli);
}

class StudentRemoteRepository implements IStudentRepository{
  final IStudentDataSource dataSource;

  StudentRemoteRepository({required this.dataSource});

  @override
  Future<List<StudentDTO>> getAllStudent() {
    return dataSource.getAllStudent();
  }

  @override
  Future<StudentDTO> studentProfile(int meli) {
    return dataSource.studentProfile(meli);
  }

}

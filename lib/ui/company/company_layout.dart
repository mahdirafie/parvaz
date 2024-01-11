import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parvaz_event/data/DTO/studentDTO.dart';
import 'package:parvaz_event/data/student/bloc/student_bloc.dart';
import 'package:parvaz_event/data/student/student_repo.dart';
import 'package:parvaz_event/ui/company/filter_page.dart';
import 'package:parvaz_event/ui/company/student_card.dart';

class CompanyHome extends StatefulWidget {
  const CompanyHome({Key? key, required this.waiting, required this.confirmed}) : super(key: key);
  final bool waiting;
  final bool confirmed;

  @override
  State<CompanyHome> createState() => _CompanyHomeState();
}

class _CompanyHomeState extends State<CompanyHome> {
  final ValueNotifier<String> _univercity = ValueNotifier("");
  final ValueNotifier<String> _field = ValueNotifier("");

  @override
  Widget build(BuildContext context) {
    List<StudentDTO> students;
    //Student st = Student("آرمان کورشی");
    final theme = Theme.of(context);
    return BlocProvider(
      create: (BuildContext context) {
        final bloc = GetStudentBloc(allStudentRepository)..add(CompanyLayoutScreenStarted());
        return bloc;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("لیست دانشجویان"),
          centerTitle: true,
          leading: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FilterShow(university: (value) {
                      _field.value = value;
                    },field: (value) {
                      _univercity.value = value;
                    },avg: (value) {

                    },),
                  ));
            },
            child: const Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Icon(Icons.filter_list_alt),
                Text("فیلتر ها"),
              ],
            ),
          ),
          leadingWidth: 100,
        ),
        body: BlocBuilder<GetStudentBloc,StudentState>(
          builder: (BuildContext context, StudentState state) {
            if(state is StudentGetSuccess){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    final students = state.students;
                    return StudentCard(waiting: widget.waiting,confirmed: widget.confirmed,);
                  },
                  itemCount: state.students.length,
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
                ),
              );
            } else if (state is StudentGetLoading){
              return const Center(child: CircularProgressIndicator());
            }else if(state is StudentGetFailed) {
              return Center(child: Text(state.message),);
            }
            else{
              throw Exception();
            }
          }
        ),
      ),
    );
  }
}

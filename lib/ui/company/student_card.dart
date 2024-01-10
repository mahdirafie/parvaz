import 'package:flutter/material.dart';
import 'package:parvaz_event/data/student.dart';
import 'package:parvaz_event/ui/company/student_show.dart';

class StudentCard extends StatelessWidget {
  const StudentCard({Key? key, required this.student}) : super(key: key);
  final Student student;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => StudentShow(student: student),));
      },
      child: Container(
        decoration: BoxDecoration(
            //border: Border.all(color: Colors.black, width: 0.5),
            color: theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(12),
            ),
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15,5,15,5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width/1.8,
                child: const Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("نام و نام حانوادگی"),
                        Text("معدل : 17.32"),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("بوعلی سینا"),
                        Text("مهدنسی کامپیوتر")
                      ],
                    )
                  ],
                ),
              ),
              ElevatedButton( onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => StudentShow(student: student),)); },
              child:const Text("مشاهده"))
            ],
          ),
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:parvaz_event/ui/course/course_card.dart';

class CoursesShow extends StatelessWidget {
  const CoursesShow({Key? key, required this.name}) : super(key: key);
  final String name;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(name)),
      body: ListView(
        children: [
          CourseCard(name: name, company: "شرکت 1", price: "دو میلیون", time: "سه ماه"),
          CourseCard(name: "$name پیشرفته", company: "شرکت 2", price: "پنج میلیون", time: "شش ماه"),
          CourseCard(name: "$name مبدتی", company: "شرکت 1", price: "یک میلیون", time: "دو ماه"),
          CourseCard(name: name, company: "شرکت 3", price: "دو میلیون", time: "یک ماه")
        ],
      )
    );
  }
}

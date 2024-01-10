import 'package:flutter/material.dart';
import 'package:parvaz_event/data/student.dart';
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
    Student st = Student("آرمان کورشی");
    final theme = Theme.of(context);
    return Scaffold(
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          itemBuilder: (context, index) {
            return StudentCard(student: st,waiting: widget.waiting,confirmed: widget.confirmed,);
          },
          itemCount: 20,
          separatorBuilder: (context, index) => const SizedBox(
            height: 10,
          ),
        ),
      ),
    );
  }
}

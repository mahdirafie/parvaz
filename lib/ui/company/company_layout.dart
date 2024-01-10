import 'package:flutter/material.dart';
import 'package:parvaz_event/ui/company/student_card.dart';

class CompanyHome extends StatefulWidget {
  const CompanyHome({Key? key}) : super(key: key);

  @override
  State<CompanyHome> createState() => _CompanyHomeState();
}

class _CompanyHomeState extends State<CompanyHome> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("لیست دانشجویان"
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          itemBuilder: (context, index) {
            return const StudentCard();
          },
          itemCount: 20,
          separatorBuilder: (context, index) =>const SizedBox(height: 10,),
        ),
      ),
    );
  }
}

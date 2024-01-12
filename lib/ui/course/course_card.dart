import 'package:flutter/material.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({Key? key, required this.name, required this.company, required this.price, required this.time}) : super(key: key);
  final String name;
  final String company;
  final String price;
  final String time;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Text(name,style: theme.textTheme.headlineLarge),
            Text(company, style:  theme.textTheme.labelLarge,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              Text(price,style: theme.textTheme.bodyLarge,),
              Text(time, style: theme.textTheme.bodyLarge,)
            ],)
          ],
        ),
      ),
    );
  }
}

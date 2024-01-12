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
          color: Colors.white,
          //border: Border.all(),
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [BoxShadow(color: Colors.grey,
            offset: Offset(0.0, 2.0),
            blurRadius: 5.0,)]
        ),
        child: Column(
          children: [
            const SizedBox(height: 10,),
            Text(name,style: theme.textTheme.headlineSmall),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Text("•",style: TextStyle(
                        color:  Colors.green,
                        fontSize: 40
                      ),),
                      const SizedBox(width: 10,),
                      Text(company, style:  theme.textTheme.headlineSmall
                        ,),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.attach_money,color: Colors.green),
                      Text(price,style: theme.textTheme.bodyLarge,),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.watch,color: Colors.green,),
                      Text(time, style: theme.textTheme.bodyLarge,),
                      const SizedBox(width: 20,)
                    ],
                  ),
                ],
              ),
            ),
            const Row(
              children: [
                SizedBox(width: 15,),
                Text("تعداد افراد شرکت کرده در این دوره :"),
              ],
            ),
            const SizedBox(height: 10,)
          ],
        ),
      ),
    );
  }
}

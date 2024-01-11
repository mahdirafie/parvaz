import 'package:flutter/material.dart';

class FilterShow extends StatefulWidget {
  const FilterShow(
      {Key? key,
      required this.university,
      required this.field,
      required this.avg})
      : super(key: key);
  final ValueChanged<String> university;
  final ValueChanged<String> field;
  final ValueChanged<double> avg;

  @override
  State<FilterShow> createState() => _FilterShowState();
}

class _FilterShowState extends State<FilterShow> {
  double average = 15;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("فیلتر کردن"),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: SingleChildScrollView(
            child: ListBody(
              children: [
                Text(
                  "معدل بیشتر از : ",
                  style: theme.textTheme.titleLarge,
                ),
                Slider(
                  value: average,
                  onChanged: (value) {
                    widget.avg(value);
                    setState(() {
                      average = value;
                    });
                  },
                  max: 20,
                  min: 10,
                  divisions: 20,
                  label: "$average",
                  activeColor: Colors.black,
                  inactiveColor: theme.primaryColor,
                  thumbColor: theme.primaryColor,
                ),
                SizedBox(
                  height: 20,
                ),

                // DropdownSearch<String>(
                //   items: const ["بوعلی", "صنعتی" , "آزاد"],
                //   onChanged: (value) {
                //     _field = value;
                //   },
                //   dropdownDecoratorProps: const DropDownDecoratorProps(
                //     dropdownSearchDecoration: InputDecoration(labelText: "دانشگاه"),
                //   ),
                // ),
                // const SizedBox(height: 20,),
                // DropdownSearch<String>(
                //   items: const ["مهندسی کامپیوتر", "مهندسی مکانیک" , "شیمی" , "فیزیک"],
                //   onChanged: (value) {
                //     _field = value;
                //   },
                //   dropdownDecoratorProps: const DropDownDecoratorProps(
                //     dropdownSearchDecoration: InputDecoration(labelText: "رشته"),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

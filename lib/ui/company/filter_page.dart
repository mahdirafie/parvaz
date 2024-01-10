import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class FilterShow extends StatefulWidget {
  const FilterShow({Key? key, required this.university, required this.field, required this.avg}) : super(key: key);
  final ValueChanged<String> university;
  final ValueChanged<String> field;
  final ValueChanged<double> avg;

  @override
  State<FilterShow> createState() => _FilterShowState();
}

class _FilterShowState extends State<FilterShow> {
  String? _chosenValue;
  String? _field;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("فیلتر کردن"),
      ),
      body:Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: SingleChildScrollView(
            child: ListBody(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("معدل بیشتر از : ",style: theme.textTheme.titleLarge,),
                    const SizedBox(width: 200, child: TextField(keyboardType: TextInputType.number,)),
                  ],
                ),
                SizedBox(height: 20,),
                DropdownSearch<String>(
                  items: const ["بوعلی", "صنعتی" , "آزاد"],
                  onChanged: (value) {
                    _field = value;
                  },
                  dropdownDecoratorProps: const DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(labelText: "دانشگاه"),
                  ),
                ),
                const SizedBox(height: 20,),
                DropdownSearch<String>(
                  items: const ["مهندسی کامپیوتر", "مهندسی مکانیک" , "شیمی" , "فیزیک"],
                  onChanged: (value) {
                    _field = value;
                  },
                  dropdownDecoratorProps: const DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(labelText: "رشته"),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

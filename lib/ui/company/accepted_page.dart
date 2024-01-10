import 'package:flutter/material.dart';

class AcceptedPage extends StatelessWidget {
  const AcceptedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("دعوت به همکاری"),
      ),
      body:ListView.separated(itemBuilder: (context, index) {

      }, separatorBuilder: (context, index) => SizedBox(height: 10,), itemCount: 20),
    );
  }
}

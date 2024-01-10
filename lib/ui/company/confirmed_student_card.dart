import 'package:flutter/material.dart';

class ConfirmedStudentCard extends StatelessWidget {
  const ConfirmedStudentCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: () {

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
              ElevatedButton( onPressed: () {  },
                  child:const Text("مشاهده"))
            ],
          ),
        ),
      ),
    );
  }
}

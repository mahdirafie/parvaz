import 'package:flutter/material.dart';
import 'package:parvaz_event/data/student.dart';
import 'package:parvaz_event/theme.dart';

class StudentShow extends StatelessWidget {
  const StudentShow({Key? key, required this.student}) : super(key: key);
  final Student student;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final List<String> skils = ["کد زنی", "طراحی", "انیمیشن"];
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("مشخصات دانشجو"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListBody(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: MediaQuery
                          .of(context)
                          .size
                          .width / 2,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width / 2,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              MediaQuery
                                  .of(context)
                                  .size
                                  .width)),
                      child: const CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://collegeboardingpass.org/wp-content/uploads/2019/12/CBP-blog-female-student-on-campus-1-scaled.jpg"),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width / 2.5,
                            child: Center(
                              child: Text(
                                student.name,
                                style: theme.textTheme.titleLarge,
                                overflow: TextOverflow.clip,
                                maxLines: 3,
                              ),
                            )),
                        Text("مهندسی کامپیوتر"),
                        Text("بوعلی سینا"),
                        Text("کارشناسی"),
                        Text("16.23"),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(),
                const SizedBox(
                  height: 10,
                ),
                Card(
                  child: Column(
                    children: [
                      Padding(
                        padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                        child: Row(
                          children: [
                            Text("سابقه کار : ", style: theme.textTheme.bodyLarge),
                            Text("2 ماه", style: theme.textTheme.bodyLarge),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                  const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                  child: Text("مهارت ها :", style: theme.textTheme.bodyLarge),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 40),
                  child: Container(
                    height: skils.length * 25,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Text(skils[index]);
                      },
                      itemCount: skils.length,
                    ),
                  ),
                ),
                Padding(
                  padding:
                  const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                  child: Text(
                      "توضیحات اضافی : ", style: theme.textTheme.bodyLarge),
                ),
                Padding(padding: const EdgeInsets.only(
                    left: 20, right: 20, bottom: 10),
                  child:SizedBox(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width / 1.5,
                      child: Center(
                        child: Text(
                          "توضیحات \n توضیحات زیاد",
                          style: theme.textTheme.titleLarge,
                          overflow: TextOverflow.clip,
                        ),
                      )),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(onPressed: () {
                      showDialog(context: context, builder: (context) {
                        return Directionality(
                          textDirection: TextDirection.rtl,
                          child: AlertDialog(
                            title: const Text("پیام به کاربر"),
                            content: SingleChildScrollView(
                              child: ListBody(
                                children: [
                                  TextFormField(
                                    keyboardType: TextInputType.multiline,
                                    maxLines: 6,
                                  ),
                                  SizedBox(height: 10,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      ElevatedButton(onPressed: () {
                                        Navigator.pop(context);
                                      }, child: const Text("ارسال")),
                                      ElevatedButton(onPressed: () {
                                        Navigator.pop(context);
                                      }, child: const Text("لغو"),style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty.resolveWith((states) {
                                          return Colors.white;
                                        }),
                                        foregroundColor: MaterialStateProperty.resolveWith((states) {
                                          return LightTheme.primaryColor;
                                        }),
                                      )),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },);
                    }, child: const Text("دعوت به همکاری"),style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith((states) {
                        return Colors.green;
                      }),
                    ),),
                    ElevatedButton(onPressed: () {

                    }, child: const Text("افزودن به لیست ذخیره"),),
                  ],
                )
              ],
            ),
          ),
        ),
        bottomSheet: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(onPressed: () {
              showDialog(context: context, builder: (context) {
                return Directionality(
                  textDirection: TextDirection.rtl,
                  child: AlertDialog(
                    title: const Text("پیام به کاربر"),
                    content: SingleChildScrollView(
                      child: ListBody(
                        children: [
                          TextFormField(
                            keyboardType: TextInputType.multiline,
                            maxLines: 6,
                          ),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(onPressed: () {
                                Navigator.pop(context);
                              }, child: const Text("ارسال")),
                              ElevatedButton(onPressed: () {
                                Navigator.pop(context);
                              }, child: const Text("لغو"),style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.resolveWith((states) {
                                  return Colors.white;
                                }),
                                foregroundColor: MaterialStateProperty.resolveWith((states) {
                                  return LightTheme.primaryColor;
                                }),
                              )),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },);
            }, child: const Text("دعوت به همکاری"),style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith((states) {
                return Colors.green;
              }),
            ),),
            ElevatedButton(onPressed: () {

            }, child: const Text("افزودن به لیست ذخیره"),),
          ],
        ),
      ),
    );
  }
}

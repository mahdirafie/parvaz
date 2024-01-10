import 'package:flutter/material.dart';
import 'package:parvaz_event/ui/auth/login_student.dart';
import 'package:parvaz_event/ui/auth/signup_student.dart';
import 'package:parvaz_event/ui/company/login_company.dart';
import 'package:parvaz_event/ui/company/signup_company.dart';

class LoginChoice extends StatefulWidget {
  LoginChoice({Key? key, required this.loginBool}) : super(key: key);
  bool loginBool;

  @override
  State<LoginChoice> createState() => _LoginChoiceState();
}

class _LoginChoiceState extends State<LoginChoice> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2, child: Scaffold(
      appBar: AppBar(
        bottom: const TabBar(
          tabs: [
            Tab(text: "دانشجو",icon: Icon(Icons.menu_book_rounded),),
            Tab(text: "شرکت",icon: Icon(Icons.work_outlined),),
          ],
        ),
      ),
      body: TabBarView(
        children: [
          widget.loginBool? LoginStudentScreen(loginPage: (value) {
            setState(() {
              widget.loginBool = value;
            });
          },):SignUpStudentScreen(loginPage: (value) {
            setState(() {
              widget.loginBool = value;
            });
          },),
          widget.loginBool?LoginCompany(loginPage: (value) {
            setState(() {
              widget.loginBool = value;
            });
          },):SignupCompany(loginPage: (value) {
            setState(() {
              widget.loginBool = value;
            });
          },)
        ],
      )
    ));
  }
}

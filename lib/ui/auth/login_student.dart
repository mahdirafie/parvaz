import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:parvaz_event/ui/auth/signup_student.dart';

class LoginStudentScreen extends StatefulWidget {
  const LoginStudentScreen({super.key, required this.loginPage});
  final ValueChanged<bool> loginPage;

  @override
  State<LoginStudentScreen> createState() => _LoginStudentScreenState();
}

class _LoginStudentScreenState extends State<LoginStudentScreen> {
  final TextEditingController _idcode = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  void dispose() {
    _idcode.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/icon.png',
                width: 100,
              ),
              const SizedBox(
                height: 24,
              ),
              TextFormField(
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                keyboardType: TextInputType.number,
                controller: _idcode,
                decoration: const InputDecoration(hintText: 'کدملی'),
              ),
              const SizedBox(
                height: 12,
              ),
              TextFormField(
                controller: _password,
                decoration: const InputDecoration(hintText: 'رمز عبور'),
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(onPressed: () {


              }, child: const Text('ورود')),
              const SizedBox(
                height: 2,
              ),
              TextButton(
                  onPressed: () {
                    widget.loginPage(false);
                  },
                  child: const Text('آیا حسابی ندارید؟'))
            ],
          ),
        ),
      )),
    );
  }
}

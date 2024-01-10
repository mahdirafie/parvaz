import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignupCompany extends StatefulWidget {
  const SignupCompany({Key? key, required this.loginPage}) : super(key: key);
  final ValueChanged<bool> loginPage;

  @override
  State<SignupCompany> createState() => _SignupCompanyState();
}

class _SignupCompanyState extends State<SignupCompany> {
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
                    decoration: const InputDecoration(hintText: 'شناسه ملی'),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    controller: _password,
                    decoration: const InputDecoration(hintText: 'کد ثبت'),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(onPressed: () {


                  }, child: const Text('ثبت نام')),
                  const SizedBox(
                    height: 2,
                  ),
                  TextButton(
                      onPressed: () {
                        widget.loginPage(true);
                      },
                      child: const Text('آیا در حال حاضر حسابی دارید؟'))
                ],
              ),
            ),
          )),
    );
  }
}

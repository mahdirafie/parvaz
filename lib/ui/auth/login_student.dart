import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parvaz_event/data/auth/bloc/student_login_bloc.dart';
import 'package:parvaz_event/data/auth/repository/student_auth_repo.dart';
import 'package:parvaz_event/theme.dart';
import 'package:parvaz_event/ui/root/student_root.dart';

class LoginStudentScreen extends StatefulWidget {
  const LoginStudentScreen({super.key, required this.loginPage});
  final ValueChanged<bool> loginPage;

  @override
  State<LoginStudentScreen> createState() => _LoginStudentScreenState();
}

class _LoginStudentScreenState extends State<LoginStudentScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _idcode = TextEditingController();
  final TextEditingController _password = TextEditingController();
  StreamSubscription<StudentLoginState>? subscription;

  @override
  void dispose() {
    subscription?.cancel();
    _idcode.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocProvider<StudentLoginBloc>(
      create: (BuildContext context) {
        final bloc = StudentLoginBloc(studentAuthRepository);
        subscription = bloc.stream.listen((state) {
          if (state is StudentLoginSuccess) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => RootScreen(meli: int.parse(_idcode.text)),
            ));
          } else if (state is StudentLoginFailure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
            ));
          } else if (state is StudentLoginUserNotfound) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
            ));
          } else if (state is StudentLoginWrongPassword) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
            ));
          }else if (state is StudentLoginWrongInfo) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.message),
            backgroundColor: Colors.red,
          ));
        }
        });
        return bloc;
      },
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: Center(
              child: SingleChildScrollView(
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
                    Container(
                      decoration: BoxDecoration(
                          color: theme.colorScheme.background,
                          boxShadow: [
                            BoxShadow(
                              color: LightTheme.shadowColor,
                              blurRadius: LightTheme.blurRadius,
                            )
                          ],
                          borderRadius: BorderRadius.circular(12)),
                      child: TextFormField(
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        keyboardType: TextInputType.number,
                        controller: _idcode,
                        decoration: const InputDecoration(hintText: 'کدملی'),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'کدملی نمیتواند خالی باشد!';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: theme.colorScheme.background,
                          boxShadow: [
                            BoxShadow(
                              color: LightTheme.shadowColor,
                              blurRadius: LightTheme.blurRadius,
                            )
                          ],
                          borderRadius: BorderRadius.circular(12)),
                      child: TextFormField(
                        controller: _password,
                        decoration: const InputDecoration(hintText: 'رمز عبور'),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'لطفا رمز عبور را وارد کنید!';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    BlocBuilder<StudentLoginBloc, StudentLoginState>(
                      builder: (BuildContext context, StudentLoginState state) {
                        return ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                BlocProvider.of<StudentLoginBloc>(context).add(
                                    StudentLoginButtonClicked(
                                        codeMeli: _idcode.text,
                                        password: _password.text));
                              }
                            },
                            child: state is! StudentLoginLoading
                                ? const Text('ورود')
                                : CircularProgressIndicator(
                                    color: theme.colorScheme.onPrimary,
                                  ));
                      },
                    ),
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
            ),
          )),
        ),
      ),
    );
  }
}

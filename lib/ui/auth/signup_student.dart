import 'dart:async';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parvaz_event/data/auth/bloc/student_sign_up_bloc.dart';
import 'package:parvaz_event/data/auth/repository/student_auth_repo.dart';
import 'package:parvaz_event/ui/root/student_root.dart';

class SignUpStudentScreen extends StatefulWidget {
  const SignUpStudentScreen({super.key, required this.loginPage});
  final ValueChanged<bool> loginPage;

  @override
  State<SignUpStudentScreen> createState() => _SignUpStudentScreenState();
}

class _SignUpStudentScreenState extends State<SignUpStudentScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _idCode = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  StreamSubscription<StudentSignUpState>? subscription;

  @override
  void dispose() {
    _idCode.dispose();
    _password.dispose();
    _confirmPassword.dispose();
    subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocProvider<StudentSignUpBloc>(
      create: (BuildContext context) {
        final bloc = StudentSignUpBloc(studentAuthRepository);
        subscription = bloc.stream.listen((state) {
          if (state is StudentSignUpSuccess) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const RootScreen(),
            ));
          } else if (state is StudentSignUpUserAlreadyExists) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
            ));
          } else if (state is StudentSignUpFailure) {
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
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _idCode,
                      decoration: const InputDecoration(hintText: 'کد ملی'),
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      validator: (value) {
                        if (value != null && value.trim().isEmpty) {
                          return 'کد ملی نمیتواند خالی باشد!';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextFormField(
                      controller: _password,
                      decoration: const InputDecoration(hintText: 'رمز عبور'),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'رمز عبور را وارد کنید!';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextFormField(
                      controller: _confirmPassword,
                      decoration:
                          const InputDecoration(hintText: 'تایید رمز عبور'),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'تایید رمز عبور را وارد کنید!';
                        } else if (_password.text != _confirmPassword.text) {
                          return 'با رمز عبور وارد شده همخوانی ندارد!';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: dropDown(context)),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    BlocBuilder<StudentSignUpBloc, StudentSignUpState>(
                      builder:
                          (BuildContext context, StudentSignUpState state) {
                        return ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RootScreen(),));
                              // if (_formKey.currentState!.validate()) {
                              //   BlocProvider.of<StudentSignUpBloc>(context).add(
                              //       StudentSignUpButtonClicked(
                              //           codeMeli: int.parse(_idCode.text),
                              //           daneshgah: selectedUniversity,
                              //           password: _password.text));
                              // }
                            },
                            child: state is! StudentSignUpLoading
                                ? const Text('ثبت نام')
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
                          widget.loginPage(true);
                        },
                        child: const Text('آیا در حال حاضر حسابی دارید؟'))
                  ],
                ),
              ),
            ),
          )),
        ),
      ),
    );
  }

  List<String> universities = ['دانشگاه بوعلی سینا', 'دانشگاه صنعتی همدان'];

  String selectedUniversity = 'دانشگاه بوعلی سینا';

  Widget dropDown(BuildContext context) {
    final theme = Theme.of(context);
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        hint: const Text('select'),
        value: selectedUniversity,
        items: universities.map((String item) {
          return DropdownMenuItem<String>(
            alignment: Alignment.center,
            value: item,
            child: Text(item),
          );
        }).toList(),
        onChanged: (value) {
          if (value != selectedUniversity && value != null) {
            setState(() {
              selectedUniversity = value;
            });
          }
        },
        buttonStyleData: ButtonStyleData(
          height: 50,
          width: 160,
          padding: const EdgeInsets.only(left: 14, right: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: Colors.black26,
            ),
            color: theme.colorScheme.background,
          ),
          elevation: 2,
        ),
        iconStyleData: const IconStyleData(
          icon: Icon(
            Icons.arrow_downward_outlined,
          ),
          iconSize: 15,
          iconEnabledColor: Colors.black,
          iconDisabledColor: Colors.black,
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: 250,
          width: MediaQuery.of(context).size.width * 0.6,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: theme.colorScheme.background,
          ),
          offset: const Offset(0, -5),
          padding: const EdgeInsets.fromLTRB(10, 5, 5, 5),
          scrollbarTheme: ScrollbarThemeData(
            interactive: true,
            radius: const Radius.circular(40),
            thickness: MaterialStateProperty.all<double>(8),
            thumbVisibility: MaterialStateProperty.all<bool>(true),
          ),
        ),
        menuItemStyleData: MenuItemStyleData(
          height: 50,
          selectedMenuItemBuilder: (context, child) {
            return Container(
              decoration: BoxDecoration(
                  color: theme.colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(15),
                  border:
                      Border.all(color: theme.colorScheme.primary, width: 2)),
              child: child,
            );
          },
          padding: const EdgeInsets.only(left: 14, right: 14),
        ),
      ),
    );
  }
}

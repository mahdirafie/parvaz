import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parvaz_event/data/auth/bloc/company_sign_up_bloc.dart';
import 'package:parvaz_event/data/auth/repository/company_auth_repo.dart';
import 'package:parvaz_event/ui/root/company_root.dart';

class SignupCompany extends StatefulWidget {
  const SignupCompany({Key? key, required this.loginPage}) : super(key: key);
  final ValueChanged<bool> loginPage;

  @override
  State<SignupCompany> createState() => _SignupCompanyState();
}

class _SignupCompanyState extends State<SignupCompany> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _idcode = TextEditingController();
  final TextEditingController _password = TextEditingController();

  StreamSubscription<CompanySignUpState>? streamSubscription;

  @override
  void dispose() {
    _idcode.dispose();
    _password.dispose();
    streamSubscription?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocProvider<CompanySignUpBloc>(
      create: (context) {
        final bloc = CompanySignUpBloc(companyAuthRepository);
        streamSubscription = bloc.stream.listen((state) {
          if (state is CompanySignUpSuccess) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CompanyRootScreen(),
                ));
          } else if (state is CompanySignUpFailure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
            ));
          } else if (state is CompanySignUpUserAlreadyExists) {
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
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      keyboardType: TextInputType.number,
                      controller: _idcode,
                      decoration: const InputDecoration(hintText: 'شناسه ملی'),
                      validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'شناسه ملی نمیتواند خالی باشد!';
                          }
                          return null;
                        },
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextFormField(
                      controller: _password,
                      decoration: const InputDecoration(hintText: 'کد ثبت'),
                      validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'کد ثبت را وارد کنید!';
                          }
                          return null;
                        },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    BlocBuilder<CompanySignUpBloc, CompanySignUpState>(builder:
                        (BuildContext context, CompanySignUpState state) {
                      return ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => CompanyRootScreen(),));
                          // if(_formKey.currentState!.validate()) {
                          //   BlocProvider.of<CompanySignUpBloc>(context).add(
                          //     CompanySignUpButtonClicked(
                          //         idMeli: int.parse(_idcode.text),
                          //         sabt: int.parse(_password.text)));
                          // }
                        },
                        child: state is! CompanySignUpLoading
                            ? const Text('ثبت نام')
                            : CircularProgressIndicator(
                                color: theme.colorScheme.onPrimary,
                              ),
                      );
                    }),
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
}
